From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH] fsi: Add Self Boot Engine FIFO FSI client
Date: Fri,  1 Dec 2017 23:37:44 +1030
Message-ID: <20171201130744.17659-1-andrew@aj.id.au>
References: <1510947274-7519-5-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510947274-7519-5-git-send-email-eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, bradleyb-r5pk2Da7Bxt8sGd51Jp2sdBPR1lH4CV8@public.gmane.org, cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The POWER Self Boot Engine (SBE) is an on-chip micro-controller that cranks
POWER processors into action and provides support for some runtime services.
One such runtime service is mediation of communication between the service
processor (that initiated the boot process) and the POWER chip at large. This
is handled using message passing over a pair of FIFOs on top of an FSI bus
between the service processor and the POWER chip.

This driver implements support for management of the SBE FIFO interface to the
POWER chip.

The FIFO semantics are fairly straight forward:

1. A command message is enqueued from the service processor to the upstream
   FIFO, followed by queuing an End-of-Transfer (EOT) marker
2. The message on the upstream FIFO is consumed by the SBE and acted on as
   required
3. The SBE responds on the downstream FIFO, terminating its response with an
   EOT marker

Additionally, the following rules apply:

1. Only one command is accepted on the upstream FIFO until the EOT marker on
   the downstream FIFO is dequeued.
2. A response will not be enqueued on the downstream FIFO until a complete
   command with EOT has been dequeued from the upstream FIFO

A significant pain point in the design is an interrupt is not available to the
service processor to know when data is available for dequeuing from the
downstream FIFO. As a consequence the driver sets up a timer as required to
poll the hardware state and drive consumption of a response when enqueued.

If the FIFOs become corrupt via either parity or logic faults, they can be
reset. With respect to resets the SBE will always act as a slave and will never
initiate a FIFO reset, rather the service processor must request the reset and
receive an acknowledgement from the SBE that the reset has been performed.

Both FIFOs are implemented in hardware as a ring of eight 32-bit data slots,
where each slot has associated EOT and validity bits.

The implementation provides mutual exclusion over access to the FIFO to enforce
integrity whilst supporting multiple open clients. An in-kernel API is exposed
that maps nicely onto character device semantics, making way for a
straight-forward patch to expose the FIFO to userspace e.g. via a misc-device.

Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
---
Hello,

I'm reviewing the patch by way of offering an alternative implementation. My
concerns with Eddie and Brad's implementation are:

1. Transfers are entirely handled by the timer callback, driving complexity
   with enqueuing and dequeuing jobs from the "xfers" list (which are consumed
   by the callback). This enqueuing/dequeuing is necessary even if the transfer
   is started immediately, as this is done by tripping the timer using a zero
   offset from jiffies. In the past we ran into a number of instances of memory
   corruption with mishandling of the list.
2. Delegation of transfers to the timer callback leads to complexity of
   reference counting for the FIFO and clients as everything is done
   asynchronously, increasing the cleanup complexity
3. Complexity of the transfer state machine, represented by properties that are
   not mutually exclusive (i.e. a state is built from a set of independent bit
   states).
4. Unergonomic interfaces for handling in-kernel vs userspace consumers: For
   instance sbefifo_read_common() takes both userspace and kernel buffer
   pointers as arguments, one of which is expected to be NULL, and the
   userspace pointer takes preference. I think a better design would be to
   separate the userspace interface from the driver, and make the userspace
   implementation call through the in-kernel APIs.
5. The sbefifo_buf struct mirrors the hardware ringbuffers with in-memory ring
   buffers, adding a layer of indirection that feels odd
6. Unclear locking semantics combined with {READ,WRITE}_ONCE() makes it more
   difficult to verify correct behaviour

So, I thought I'd have a crack at implementing something more direct. It may
still have disadvantages - for instance I haven't thought about how to
implement non-blocking IO with my approach, which is something that Eddie's
patch has. It may prove to be an Achilles heal.

The two approaches roughly break even in size when the chardev interface is
implemented (not included here).

Something that I hoped would turn out simpler than it did was state management
of the FIFO, clients and the polling thread. But I think there are still
benefits to having explicit states.

So the approach I've taken is:

1. Reduce the timer callback to something approximating an interrupt: When it
   detects the FIFO is ready it simply issues a wake_up() to the waiter on the
   poll waitqueue.
2. The consequence of this is we no-longer need the xfer lists and intermediate
   buffers, as the FIFO is directly accessed the calling process
3. We wind up with a system of three waitqueues, reflecting the three concepts
   required for use of the FIFO: One to mediate access to the FIFO, woken on
   FIFO state changes; one for each client, woken when it's the client's turn
   to access the FIFO, and one for the timer, woken when the hardware becomes
   ready for reading or writing.
4. With the waitqueues we use two locks: The FIFO waitqueue lock covers FIFO
   and client state changes, whilst the timer waitqueue lock covers changes to
   the polling state.
5. Between the waitqueues and state machines we mostly only have to hold the
   locks on state transitions. The exception is on enqueuing and dequeuing data
   from the FIFO, where we need to first check if the client has been
   release()ed or the driver remove()ed

I've tested the patch by reworking the OCC/hwmon patches on top of the
in-kernel interface implemented here. It's survived light testing with probing
and reading values via the hwmon sysfs interface. It survives reboots of the
host, then killing the host to exercise the cleanup on remove. The final test
was booting with the host "half-on" (power applied but nothing further), where
we can talk to the FIFO but the SBE is not active. This exercises the timeout
paths in the driver on probe. It survived these tests, but this still falls far
short of the testing that Eddie's driver has seen internally, which is another
feather in its cap.

I'm interested in everyone's thoughts on the pros and cons of each approach.

Cheers,

Andrew

 drivers/fsi/Kconfig               |   2 +
 drivers/fsi/Makefile              |   9 +-
 drivers/fsi/clients/Kconfig       |   5 +
 drivers/fsi/clients/Makefile      |   1 +
 drivers/fsi/clients/fsi-sbefifo.c | 892 ++++++++++++++++++++++++++++++++++++++
 drivers/fsi/clients/fsi-sbefifo.h |  82 ++++
 6 files changed, 987 insertions(+), 4 deletions(-)
 create mode 100644 drivers/fsi/clients/Kconfig
 create mode 100644 drivers/fsi/clients/Makefile
 create mode 100644 drivers/fsi/clients/fsi-sbefifo.c
 create mode 100644 drivers/fsi/clients/fsi-sbefifo.h

diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index 6821ed0cd5e8..1a6548e3be92 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -33,6 +33,8 @@ config FSI_SCOM
 	---help---
 	This option enables an FSI based SCOM device driver.
 
+source "drivers/fsi/clients/Kconfig"
+
 endif
 
 endmenu
diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
index 65eb99dfafdb..8e158a299701 100644
--- a/drivers/fsi/Makefile
+++ b/drivers/fsi/Makefile
@@ -1,5 +1,6 @@
+obj-$(CONFIG_FSI)		+= fsi-core.o
+obj-$(CONFIG_FSI_MASTER_HUB)	+= fsi-master-hub.o
+obj-$(CONFIG_FSI_MASTER_GPIO)	+= fsi-master-gpio.o
+obj-$(CONFIG_FSI_SCOM)		+= fsi-scom.o
 
-obj-$(CONFIG_FSI) += fsi-core.o
-obj-$(CONFIG_FSI_MASTER_HUB) += fsi-master-hub.o
-obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
-obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
+obj-$(CONFIG_FSI)		+= clients/
diff --git a/drivers/fsi/clients/Kconfig b/drivers/fsi/clients/Kconfig
new file mode 100644
index 000000000000..3cb3feba84bb
--- /dev/null
+++ b/drivers/fsi/clients/Kconfig
@@ -0,0 +1,5 @@
+config FSI_SBEFIFO
+	tristate "Self Boot Engine FIFO"
+	---help---
+	The Self Boot Engine FIFO manages communication between a service
+	processor and the Self Boot Engine on POWER processors.
diff --git a/drivers/fsi/clients/Makefile b/drivers/fsi/clients/Makefile
new file mode 100644
index 000000000000..d71a4de7aa0f
--- /dev/null
+++ b/drivers/fsi/clients/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_FSI_SBEFIFO)	+= fsi-sbefifo.o
diff --git a/drivers/fsi/clients/fsi-sbefifo.c b/drivers/fsi/clients/fsi-sbefifo.c
new file mode 100644
index 000000000000..c93c2d577f6d
--- /dev/null
+++ b/drivers/fsi/clients/fsi-sbefifo.c
@@ -0,0 +1,892 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright (C) IBM Corporation 2017 */
+
+#include <linux/bitops.h>
+#include <linux/fsi.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+
+#include "fsi-sbefifo.h"
+
+#define FSI_ENGINE_ID_SBE		0x22
+
+#define SBEFIFO_FIFO_DEPTH		8
+
+#define SBEFIFO_UP_FIFO			0x0
+#define SBEFIFO_UP_STS			0x4
+#define   SBEFIFO_STS_PARITY		BIT(29)
+#define   SBEFIFO_STS_RESET		BIT(25)
+#define   SBEFIFO_STS_FULL		BIT(21)
+#define   SBEFIFO_STS_EMPTY		BIT(20)
+#define   SBEFIFO_STS_ENTRIES_SHIFT	16
+#define   SBEFIFO_STS_ENTRIES_MASK	GENMASK(19, 16)
+#define   SBEFIFO_STS_VALID_SHIFT	8
+#define   SBEFIFO_STS_VALID_MASK	GENMASK(15, 8)
+#define   SBEFIFO_STS_EOT_MASK		GENMASK(7, 0)
+#define SBEFIFO_UP_EOT			0x8
+#define SBEFIFO_UP_RESET_REQ		0xC
+
+#define SBEFIFO_DOWN_FIFO		0x40
+#define SBEFIFO_DOWN_STS		0x44
+#define SBEFIFO_DOWN_RESET		0x48
+#define SBEFIFO_DOWN_EOT_ACK		0x54
+
+#define SBEFIFO_POLL_INTERVAL		msecs_to_jiffies(50)
+#define SBEFIFO_LONG_TIMEOUT		msecs_to_jiffies(30 * 1000)
+
+LIST_HEAD(sbefifos);
+
+static DEFINE_IDA(sbefifo_ida);
+
+static int sbefifo_readl(struct sbefifo *fifo, u32 addr, u32 *word)
+{
+	__be32 raw;
+	int rv;
+
+	rv = fsi_device_read(fifo->fsi, addr, &raw, sizeof(raw));
+	if (rv < 0)
+		return rv;
+
+	*word = be32_to_cpu(raw);
+
+	return 0;
+}
+
+static int sbefifo_writel(struct sbefifo *fifo, u32 addr, u32 word)
+{
+	__be32 cooked = cpu_to_be32(word);
+
+	return fsi_device_write(fifo->fsi, addr, &cooked, sizeof(cooked));
+}
+
+#define sbefifo_up_sts(f, dp)	sbefifo_readl(f, SBEFIFO_UP_STS, dp)
+#define sbefifo_down_sts(f, dp)	sbefifo_readl(f, SBEFIFO_DOWN_STS, dp);
+
+#define sbefifo_parity(sts)	((sts) & SBEFIFO_STS_PARITY)
+#define sbefifo_populated(sts)	\
+	(((sts) & SBEFIFO_STS_ENTRIES_MASK) >> SBEFIFO_STS_ENTRIES_SHIFT)
+#define sbefifo_vacant(sts)	(SBEFIFO_FIFO_DEPTH - sbefifo_populated(sts))
+#define sbefifo_empty(sts)	((sts) & SBEFIFO_STS_EMPTY)
+#define sbefifo_full(sts)	((sts) & SBEFIFO_STS_FULL)
+#define sbefifo_eot_set(sts)	((sts) & SBEFIFO_STS_EOT_MASK)
+#define sbefifo_valid_set(sts)	\
+	(((sts) & SBEFIFO_STS_VALID_MASK) >> SBEFIFO_STS_VALID_SHIFT)
+
+#define sbefifo_reset_req(sts)	(!!((sts) & SBEFIFO_STS_RESET))
+#define sbefifo_do_reset(f)	sbefifo_writel(f, SBEFIFO_DOWN_RESET, 0)
+#define sbefifo_req_reset(f)	sbefifo_writel(f, SBEFIFO_UP_RESET_REQ, 0)
+
+static int sbefifo_wait_reset(struct sbefifo *fifo, unsigned long expire)
+{
+	u32 sts;
+	int rv;
+
+	do {
+		rv = sbefifo_up_sts(fifo, &sts);
+		if (rv < 0)
+			return rv;
+	} while (sbefifo_reset_req(sts) && time_before(jiffies, expire));
+
+	if (sbefifo_reset_req(sts)) {
+		dev_warn(fifo->dev, "FIFO reset request timed out\n");
+		return -ETIMEDOUT;
+	}
+
+	dev_info(fifo->dev, "SBE acknowleged reset request, FIFO is reset\n");
+
+	return 0;
+}
+
+static int sbefifo_reset(struct sbefifo *fifo)
+{
+	int rv;
+
+	rv = sbefifo_req_reset(fifo);
+	if (!rv)
+		rv = sbefifo_wait_reset(fifo, jiffies + SBEFIFO_POLL_INTERVAL);
+
+	if (rv < 0)
+		dev_err(fifo->dev, "FIFO reset failed: %d\n", rv);
+
+	return rv;
+}
+
+static int sbefifo_wait(struct sbefifo *fifo, enum sbefifo_direction dir,
+			unsigned long period)
+{
+	struct sbefifo_poll *poll = &fifo->poll;
+	unsigned long flags;
+	bool ready;
+	u32 addr;
+	bool up;
+	u32 sts;
+	int rv;
+
+	up = (dir == sbefifo_up);
+	addr = up ? SBEFIFO_UP_STS : SBEFIFO_DOWN_STS;
+	rv = sbefifo_readl(fifo, addr, &sts);
+	if (rv < 0)
+		return rv;
+
+	ready = !(up ? sbefifo_full(sts) : sbefifo_empty(sts));
+	if (ready)
+		return 0;
+
+	dev_info(fifo->dev, "Polling for FIFO response every %ld jiffies (%s)",
+		SBEFIFO_POLL_INTERVAL, period ? "bounded" : "unbounded");
+
+	spin_lock_irqsave(&poll->wait.lock, flags);
+	poll->interval = SBEFIFO_POLL_INTERVAL;
+	poll->expire = period;
+	poll->expire_at = period ? jiffies + period : 0;
+	poll->state = sbefifo_poll_wait;
+	poll->dir = dir;
+	poll->rv = 0;
+
+	mod_timer(&poll->timer, jiffies + poll->interval);
+
+	if (period) {
+		rv = wait_event_interruptible_locked_irq(poll->wait,
+			(poll->state != sbefifo_poll_wait || poll->rv ||
+			 time_after(jiffies, poll->expire_at)));
+	} else {
+		rv = wait_event_interruptible_locked_irq(poll->wait,
+			(poll->state != sbefifo_poll_wait || poll->rv));
+	}
+
+	if (rv < 0) {
+		spin_unlock_irqrestore(&poll->wait.lock, flags);
+		return rv;
+	}
+
+	if (poll->state == sbefifo_poll_wait && !poll->rv) {
+		spin_unlock_irqrestore(&poll->wait.lock, flags);
+		return -ETIMEDOUT;
+	}
+
+	if (poll->state == sbefifo_poll_ready || poll->rv) {
+		rv = poll->rv;
+		spin_unlock_irqrestore(&poll->wait.lock, flags);
+		return rv;
+	}
+
+	WARN_ON(poll->state != sbefifo_poll_reset);
+	spin_unlock_irqrestore(&poll->wait.lock, flags);
+
+	return -EIO;
+}
+
+#define sbefifo_wait_vacant(f, p)	sbefifo_wait(f, sbefifo_up, p);
+#define sbefifo_wait_primed(f, p)	sbefifo_wait(f, sbefifo_down, p);
+
+static void sbefifo_poll_device(unsigned long context)
+{
+	struct sbefifo *fifo = (struct sbefifo *) context;
+	struct sbefifo_poll *poll = &fifo->poll;
+	unsigned long flags;
+	u32 addr;
+	bool up;
+	u32 sts;
+	int rv;
+
+	/* Sanity check poll settings */
+	spin_lock_irqsave(&poll->wait.lock, flags);
+	up = (poll->dir == sbefifo_up);
+	spin_unlock_irqrestore(&poll->wait.lock, flags);
+
+	/* Read status */
+	addr = up ? SBEFIFO_UP_STS : SBEFIFO_DOWN_STS;
+	rv = sbefifo_readl(fifo, addr, &sts);
+	if (rv < 0) {
+		poll->rv = rv;
+		wake_up(&poll->wait);
+		return;
+	}
+
+	/* Update poll state */
+	spin_lock_irqsave(&poll->wait.lock, flags);
+	if (sbefifo_parity(sts))
+		poll->state = sbefifo_poll_reset;
+	else if (!(up ? sbefifo_full(sts) : sbefifo_empty(sts)))
+		poll->state = sbefifo_poll_ready;
+
+	if (poll->state != sbefifo_poll_wait) {
+		wake_up_locked(&poll->wait);
+	} else if (poll->expire && time_after(jiffies, poll->expire_at)) {
+		wake_up_locked(&poll->wait);
+	} else {
+		dev_dbg(fifo->dev, "Not ready, waiting another %lu jiffies\n",
+				poll->interval);
+		mod_timer(&fifo->poll.timer, jiffies + poll->interval);
+	}
+	spin_unlock_irqrestore(&poll->wait.lock, flags);
+}
+
+/* Precondition: Upstream FIFO is not full */
+static int sbefifo_enqueue(struct sbefifo *fifo, u32 data)
+{
+	unsigned long flags;
+	int rv;
+
+	/* Detect if we need to bail due to release() or remove() */
+	spin_lock_irqsave(&fifo->wait.lock, flags);
+	if (likely(fifo->state == sbefifo_tx))
+		rv = fsi_device_write(fifo->fsi, SBEFIFO_UP_FIFO, &data,
+				      sizeof(data));
+	else
+		rv = -EIO;
+	spin_unlock_irqrestore(&fifo->wait.lock, flags);
+
+	return rv;
+}
+
+/* Precondition: Downstream FIFO is not empty */
+static int sbefifo_dequeue(struct sbefifo *fifo, u32 *data)
+{
+	unsigned long flags;
+	int rv;
+
+	/* Detect if we need to bail due to release() or remove() */
+	spin_lock_irqsave(&fifo->wait.lock, flags);
+	if (likely(fifo->state == sbefifo_rx))
+		rv = fsi_device_read(fifo->fsi, SBEFIFO_DOWN_FIFO, data,
+				     sizeof(*data));
+	else
+		rv = -EIO;
+	spin_unlock_irqrestore(&fifo->wait.lock, flags);
+
+	return rv;
+}
+
+static int sbefifo_fill(struct sbefifo *fifo, const u32 *buf, ssize_t len)
+{
+	ssize_t vacant, remaining;
+	u32 sts;
+	int rv;
+
+	rv = sbefifo_up_sts(fifo, &sts);
+	if (rv < 0)
+		return rv;
+
+	vacant = sbefifo_vacant(sts);
+
+	vacant = min(vacant, len);
+	remaining = vacant;
+	while (remaining--) {
+		rv = sbefifo_enqueue(fifo, *buf++);
+		if (rv < 0)
+			return rv;
+	}
+
+	return vacant;
+}
+
+static int sbefifo_signal_eot(struct sbefifo *fifo)
+{
+	int rv;
+
+	rv = sbefifo_wait_vacant(fifo, SBEFIFO_LONG_TIMEOUT);
+	if (rv < 0)
+		return rv;
+
+	rv = sbefifo_writel(fifo, SBEFIFO_UP_EOT, 0);
+	return rv;
+}
+
+static ssize_t sbefifo_up_write(struct sbefifo *fifo, const u32 *buf,
+				ssize_t len)
+{
+	ssize_t remaining = len;
+	int wrote;
+	int rv;
+
+	while (remaining) {
+		rv = sbefifo_wait_vacant(fifo, SBEFIFO_LONG_TIMEOUT);
+		if (rv < 0)
+			return rv;
+
+		wrote = sbefifo_fill(fifo, buf, len);
+		if (wrote < 0)
+			return wrote;
+
+		buf += wrote;
+		remaining -= wrote;
+	}
+
+	rv = sbefifo_signal_eot(fifo);
+	if (rv < 0)
+		return rv;
+
+	return len;
+}
+
+#define TEST_SET(s)	((s) & BIT(7))
+#define IS_EOT(s)	TEST_SET(s)
+#define IS_VALID(s)	TEST_SET(s)
+
+static int sbefifo_drain(struct sbefifo *fifo, u32 *buf, ssize_t len)
+{
+	ssize_t nr_valid;
+	u8 valid_set;
+	int nr_xfer;
+	ssize_t rem;
+	u8 eot_set;
+	u32 sts;
+	u32 val;
+	int rv;
+
+	rv = sbefifo_down_sts(fifo, &sts);
+	if (rv < 0)
+		return rv;
+
+	/* Determine tranfer characteristics */
+	nr_xfer = sbefifo_populated(sts);
+	valid_set = sbefifo_valid_set(sts);
+	eot_set = sbefifo_eot_set(sts);
+
+	if (hweight8(eot_set) > 1) {
+		dev_err(fifo->dev, "More than one EOT in the pipe!\n");
+		return -EIO;
+	}
+
+	/* Number of data words in the transfer */
+	nr_valid = hweight8(valid_set);
+	len = min(len, nr_valid);
+	rem = len;
+
+	dev_dbg(fifo->dev, "%s: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
+		__func__, valid_set, eot_set, nr_valid, nr_xfer, rem);
+
+	/* Dequeue data */
+	while (nr_xfer && rem && !IS_EOT(eot_set)) {
+		rv = sbefifo_dequeue(fifo, &val);
+		if (rv < 0)
+			return rv;
+
+		if (IS_VALID(valid_set)) {
+			*buf++ = val;
+			rem--;
+		}
+
+		valid_set <<= 1;
+		eot_set <<= 1;
+		nr_xfer--;
+	}
+
+	dev_dbg(fifo->dev, "%s: Data phase complete: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
+		__func__, valid_set, eot_set, nr_valid, nr_xfer, rem);
+
+	/*
+	 * To allow the upper layers to manage state transitions, don't dequeue
+	 * EOT yet. Leave that for the subsequent, terminating read.
+	 */
+	if (nr_valid > 0)
+		return len;
+
+	/* Dequeue and ACK EOT word */
+	while (nr_xfer && IS_EOT(eot_set) && !IS_VALID(valid_set)) {
+		rv = sbefifo_dequeue(fifo, &val);
+		if (rv < 0)
+			return rv;
+
+		rv = sbefifo_writel(fifo, SBEFIFO_DOWN_EOT_ACK, val);
+		if (rv < 0)
+			return rv;
+
+		valid_set <<= 1;
+		eot_set <<= 1;
+		nr_xfer--;
+	}
+
+	dev_dbg(fifo->dev, "%s: EOT phase complete: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d\n, nr_xfer: %d, rem: %d\n",
+		__func__, valid_set, eot_set, nr_valid, nr_xfer, rem);
+
+	/* Dequeue any remaining dummy values */
+	while (nr_xfer && !IS_EOT(eot_set) && !IS_VALID(valid_set)) {
+		rv = sbefifo_dequeue(fifo, &val);
+		if (rv < 0)
+			return rv;
+
+		valid_set <<= 1;
+		eot_set <<= 1;
+		nr_xfer--;
+	}
+
+	dev_dbg(fifo->dev, "%s: Drain phase complete: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
+		__func__, valid_set, eot_set, nr_valid, nr_xfer, rem);
+
+	/* Test for parity failures */
+	rv = sbefifo_down_sts(fifo, &sts);
+	if (rv < 0)
+		return rv;
+
+	if (sbefifo_parity(sts)) {
+		dev_warn(fifo->dev, "Downstream FIFO parity failure\n");
+		return -EIO;
+	}
+
+	return len;
+}
+
+static ssize_t sbefifo_down_read(struct sbefifo *fifo, u32 *buf, ssize_t len)
+{
+	ssize_t rem = len;
+	int read;
+	int rv;
+
+	if (!rem)
+		return 0;
+
+	do {
+		rv = sbefifo_wait_primed(fifo, SBEFIFO_LONG_TIMEOUT);
+		if (rv < 0)
+			return rv;
+
+		read = sbefifo_drain(fifo, buf, rem);
+		if (read < 0)
+			return read;
+
+		buf += read;
+		rem -= read;
+	} while (rem && read && read == min((rem + read), SBEFIFO_FIFO_DEPTH));
+
+	return len - rem;
+}
+
+/* In-kernel API */
+
+/**
+ * sbefifo_open()
+ *
+ * @client	The client context for the SBEFIFO
+ * @flags	Flags controlling how to open the client.
+ *
+ * Returns 0 on success or negative values on failure.
+ */
+int sbefifo_open(struct sbefifo *fifo, struct sbefifo_client *client,
+		 unsigned long oflags)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&fifo->wait.lock, flags);
+	if (fifo->state == sbefifo_dead) {
+		spin_unlock_irqrestore(&fifo->wait.lock, flags);
+		return -ENODEV;
+	}
+	if (WARN(client->state != sbefifo_client_closed, "Already open\n")) {
+		spin_unlock_irqrestore(&fifo->wait.lock, flags);
+		return -EINVAL;
+	}
+
+	/* No flags at the moment, probably O_NONBLOCK in the future */
+	if (oflags) {
+		spin_unlock_irqrestore(&fifo->wait.lock, flags);
+		return -EINVAL;
+	}
+
+	init_waitqueue_head(&client->wait);
+	client->fifo = fifo;
+	client->flags = oflags;
+	client->state = sbefifo_client_idle;
+	spin_unlock_irqrestore(&fifo->wait.lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(sbefifo_open);
+
+/**
+ * sbefifo_write()
+ *
+ * @client	The client context for the SBEFIFO
+ * @buf		The buffer of data to write, at least @len elements
+ * @len		The number elements in @buffer
+ *
+ * The buffer must represent a complete chip-op: EOT is signalled after the
+ * last element is written to the upstream FIFO.
+ *
+ * Returns the number of elements written on success and negative values on
+ * failure. If the call is successful a subsequent call to sbefifo_read() MUST
+ * be made.
+ */
+ssize_t sbefifo_write(struct sbefifo_client *client, const u32 *buf,
+		      ssize_t len)
+{
+	struct sbefifo *fifo = client->fifo;
+	unsigned long flags;
+	ssize_t rv;
+
+	spin_lock_irqsave(&fifo->wait.lock, flags);
+
+	if (client->state == sbefifo_client_active) {
+		dev_warn(fifo->dev, "Transfer already in progress\n");
+		spin_unlock_irqrestore(&fifo->wait.lock, flags);
+		return -EBUSY;
+	}
+
+	rv = wait_event_interruptible_locked_irq(fifo->wait,
+						fifo->state == sbefifo_ready ||
+						fifo->state == sbefifo_dead);
+	if (rv < 0) {
+		spin_unlock_irqrestore(&fifo->wait.lock, flags);
+		return rv;
+	}
+
+	if (fifo->state == sbefifo_dead) {
+		client->state = sbefifo_client_closed;
+		wake_up(&client->wait);
+		spin_unlock_irqrestore(&fifo->wait.lock, flags);
+		return -ENODEV;
+	}
+
+	WARN_ON(fifo->state != sbefifo_ready);
+
+	fifo->curr = client;
+	fifo->state = sbefifo_tx;
+
+	/* Move a threaded read() onto waiting for FIFO read readiness */
+	client->state = sbefifo_client_active;
+	wake_up(&client->wait);
+
+	spin_unlock_irqrestore(&fifo->wait.lock, flags);
+
+	/* FIFO Tx, reset the FIFO on error */
+	rv = sbefifo_up_write(fifo, buf, len);
+	if (rv < len) {
+		dev_err(fifo->dev, "FIFO write failed: %d\n", rv);
+		rv = sbefifo_reset(fifo);
+		if (rv < 0)
+			return rv;
+
+		spin_lock_irqsave(&fifo->wait.lock, flags);
+		fifo->state = sbefifo_ready;
+		client->state = sbefifo_client_idle;
+		wake_up(&client->wait);
+		wake_up_locked(&fifo->wait);
+		spin_unlock_irqrestore(&fifo->wait.lock, flags);
+
+		return -EIO;
+	}
+
+	WARN(rv > len, "Unreachable state: len: %d, rv: %d\n", len, rv);
+
+	/* Write completed successfully */
+	spin_lock_irqsave(&fifo->wait.lock, flags);
+	fifo->state = sbefifo_interval;
+	wake_up(&client->wait);
+	spin_unlock_irqrestore(&fifo->wait.lock, flags);
+
+	return rv;
+}
+EXPORT_SYMBOL_GPL(sbefifo_write);
+
+/**
+ * sbefifo_read()
+ *
+ * @client	The client context for the SBEFIFO
+ * @data	The buffer of data to write, at least @len elements
+ * @len		The number elements in @buffer
+ *
+ * Returns the number of elements read on success and negative values on
+ * failure. A return value of 0 indicates EOT.
+ */
+ssize_t sbefifo_read(struct sbefifo_client *client, u32 *buf, ssize_t len)
+{
+	struct sbefifo *fifo = client->fifo;
+	unsigned long flags;
+	ssize_t rv;
+
+	rv = wait_event_interruptible(client->wait,
+				      (client->state == sbefifo_client_active ||
+				       client->state == sbefifo_client_closed));
+	if (rv < 0)
+		return rv;
+
+	spin_lock_irqsave(&fifo->wait.lock, flags);
+	if (client->state == sbefifo_client_closed) {
+		spin_unlock_irqrestore(&fifo->wait.lock, flags);
+		return -EBADFD;
+	}
+
+	if (client->state == sbefifo_client_idle) {
+		spin_unlock_irqrestore(&fifo->wait.lock, flags);
+		return -EIO;
+	}
+
+	rv = wait_event_interruptible_locked_irq(fifo->wait,
+					fifo->state == sbefifo_interval ||
+					fifo->state == sbefifo_rx ||
+					fifo->state == sbefifo_ready ||
+					fifo->state == sbefifo_dead);
+	if (rv < 0) {
+		spin_unlock_irqrestore(&fifo->wait.lock, flags);
+		return rv;
+	}
+
+	if (fifo->state == sbefifo_ready) {
+		/* We've reset FIFO, whatever we were waiting for has gone */
+		client->state = sbefifo_client_idle;
+		/* We're done, wake another task up as the FIFO is ready */
+		wake_up_locked(&fifo->wait);
+		spin_unlock_irqrestore(&fifo->wait.lock, flags);
+		return -EIO;
+	}
+
+	if (fifo->state == sbefifo_dead) {
+		spin_unlock_irqrestore(&fifo->wait.lock, flags);
+		return -ENODEV;
+	}
+
+	fifo->state = sbefifo_rx;
+	spin_unlock_irqrestore(&fifo->wait.lock, flags);
+
+	rv = sbefifo_down_read(fifo, buf, len);
+	if (rv > 0)
+		return rv;
+
+	/* Reset the FIFO on error */
+	if (rv < 0) {
+		dev_err(fifo->dev, "FIFO read failed: %d\n", rv);
+		rv = sbefifo_reset(fifo);
+		if (rv < 0)
+			return rv;
+
+		rv = -EIO;
+	}
+
+	/* Read is complete one way or the other (0 length read or error) */
+	spin_lock_irqsave(&fifo->wait.lock, flags);
+	client->state = sbefifo_client_idle;
+
+	/* Queue next FIFO transfer */
+	fifo->curr = NULL;
+	fifo->state = sbefifo_ready;
+	wake_up_locked(&fifo->wait);
+
+	spin_unlock_irqrestore(&fifo->wait.lock, flags);
+
+	return rv;
+}
+EXPORT_SYMBOL_GPL(sbefifo_read);
+
+/**
+ * sbefifo_release()
+ *
+ * @client	The client context for the SBEFIFO
+ *
+ */
+int sbefifo_release(struct sbefifo_client *client)
+{
+	struct sbefifo *fifo = client->fifo;
+	enum sbefifo_client_state old;
+	unsigned long flags;
+	int rv;
+
+	/* Determine if we need to clean up */
+	spin_lock_irqsave(&client->fifo->wait.lock, flags);
+	old = client->state;
+	client->state = sbefifo_client_closed;
+
+	if (old == sbefifo_client_closed) {
+		spin_unlock_irqrestore(&fifo->wait.lock, flags);
+		return -EBADFD;
+	}
+
+	if (old == sbefifo_client_idle) {
+		spin_unlock_irqrestore(&fifo->wait.lock, flags);
+		return 0;
+	}
+
+	/* We need to clean up, get noisy about inconsistencies */
+	dev_warn(fifo->dev, "Releasing client with transfer in progress!\n");
+	WARN_ON(old != sbefifo_client_active);
+	WARN_ON(fifo->state == sbefifo_ready);
+
+	/* Mark ourselves as broken for cleanup */
+	fifo->state = sbefifo_broken;
+	fifo->curr = NULL;
+
+	wake_up(&client->wait);
+	spin_unlock_irqrestore(&client->fifo->wait.lock, flags);
+
+	/* Clean up poll waiter */
+	spin_lock_irqsave(&fifo->poll.wait.lock, flags);
+	del_timer_sync(&fifo->poll.timer);
+	fifo->poll.rv = -EBADFD;
+	wake_up_all_locked(&fifo->poll.wait);
+	spin_unlock_irqrestore(&fifo->poll.wait.lock, flags);
+
+	/* Reset the FIFO */
+	rv = sbefifo_reset(fifo);
+	if (rv < 0)
+		return rv;
+
+	/* Mark the FIFO as ready and wake pending transfer */
+	spin_lock_irqsave(&client->fifo->wait.lock, flags);
+	fifo->state = sbefifo_ready;
+	wake_up_locked(&fifo->wait);
+	spin_unlock_irqrestore(&client->fifo->wait.lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(sbefifo_release);
+
+static int sbefifo_unregister_child(struct device *dev, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+
+	of_device_unregister(pdev);
+	if (dev->of_node)
+		of_node_clear_flag(dev->of_node, OF_POPULATED);
+
+	return 0;
+}
+
+static int sbefifo_probe(struct device *dev)
+{
+	struct device_node *np;
+	struct sbefifo *fifo;
+	int child_idx;
+	u32 up, down;
+	int rv;
+
+	fifo = devm_kzalloc(dev, sizeof(*fifo), GFP_KERNEL);
+	if (!fifo)
+		return -ENOMEM;
+
+	fifo->dev = dev;
+	fifo->state = sbefifo_ready;
+	fifo->fsi = to_fsi_dev(dev);
+
+	fifo->id = ida_simple_get(&sbefifo_ida, 0, 0, GFP_KERNEL);
+	if (fifo->id < 0)
+		return fifo->id;
+
+	init_waitqueue_head(&fifo->wait);
+
+	/* No interrupts, need to poll the controller */
+	setup_timer(&fifo->poll.timer, sbefifo_poll_device,
+		    (unsigned long)fifo);
+	init_waitqueue_head(&fifo->poll.wait);
+
+	rv = sbefifo_up_sts(fifo, &up);
+	if (rv < 0)
+		return rv;
+
+	rv = sbefifo_down_sts(fifo, &down);
+	if (rv < 0)
+		return rv;
+
+	if (!(sbefifo_empty(up) && sbefifo_empty(down)))  {
+		dev_warn(fifo->dev, "FIFOs were not empty, requesting reset from SBE\n");
+		/* Request the SBE reset the FIFOs */
+		rv = sbefifo_reset(fifo);
+		if (rv == -ETIMEDOUT) {
+			dev_warn(fifo->dev, "SBE unresponsive, probing FIFO clients may fail. Performing hard FIFO reset\n");
+			rv = sbefifo_do_reset(fifo);
+			if (rv < 0)
+				return rv;
+		} else if (rv < 0) {
+			return rv;
+		}
+	}
+
+	dev_set_drvdata(dev, fifo);
+	list_add(&fifo->entry, &sbefifos);
+
+	child_idx = 0;
+	for_each_available_child_of_node(dev->of_node, np) {
+		struct platform_device *child;
+		char name[32];
+
+		snprintf(name, sizeof(name), "sbefifo%d-dev%d", fifo->id,
+			 child_idx++);
+		child = of_platform_device_create(np, name, dev);
+		if (!child)
+			dev_warn(dev, "Failed to create platform device %s\n",
+				 name);
+	}
+
+	return 0;
+}
+
+static int sbefifo_remove(struct device *dev)
+{
+	struct sbefifo *fifo = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	/*
+	 * Don't wait to reach sbefifo_ready, we may deadlock through power
+	 * being removed to the host without the FIFO driver being unbound,
+	 * which can stall the in-progress transfers. We don't really care as
+	 * the driver is now going away, and the reset in the probe() path
+	 * should recover it.
+	 */
+
+	device_for_each_child(dev, NULL, sbefifo_unregister_child);
+
+	list_del(&fifo->entry);
+
+	/* Kick out the waiting clients */
+	spin_lock_irqsave(&fifo->wait.lock, flags);
+	fifo->state = sbefifo_dead;
+
+	if (fifo->curr) {
+		fifo->curr->state = sbefifo_client_closed;
+		wake_up_all(&fifo->curr->wait);
+	}
+
+	wake_up_all_locked(&fifo->wait);
+	spin_unlock_irqrestore(&fifo->wait.lock, flags);
+
+	/* Kick out any in-progress job */
+	spin_lock_irqsave(&fifo->poll.wait.lock, flags);
+	del_timer_sync(&fifo->poll.timer);
+	fifo->poll.rv = -ENODEV;
+	wake_up_all_locked(&fifo->poll.wait);
+	spin_unlock_irqrestore(&fifo->poll.wait.lock, flags);
+
+	while (wq_has_sleeper(&fifo->wait) || wq_has_sleeper(&fifo->poll.wait))
+		schedule();
+
+	ida_simple_remove(&sbefifo_ida, fifo->id);
+
+	return 0;
+}
+
+static const struct fsi_device_id sbefifo_ids[] = {
+	{ .engine_type = FSI_ENGINE_ID_SBE, .version = FSI_VERSION_ANY, },
+	{ 0 },
+};
+
+static struct fsi_driver sbefifo_drv = {
+	.id_table = sbefifo_ids,
+	.drv = {
+		.name = "sbefifo",
+		.bus = &fsi_bus_type,
+		.probe = sbefifo_probe,
+		.remove = sbefifo_remove,
+	},
+};
+
+static __init int sbefifo_init(void)
+{
+	ida_init(&sbefifo_ida);
+	fsi_driver_register(&sbefifo_drv);
+
+	return 0;
+}
+
+static __exit void sbefifo_exit(void)
+{
+	fsi_driver_unregister(&sbefifo_drv);
+	ida_destroy(&sbefifo_ida);
+}
+
+module_init(sbefifo_init);
+module_exit(sbefifo_exit);
+
+MODULE_AUTHOR("Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>");
+MODULE_DESCRIPTION("POWER9 Self Boot Engine FIFO driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/fsi/clients/fsi-sbefifo.h b/drivers/fsi/clients/fsi-sbefifo.h
new file mode 100644
index 000000000000..323fabfa7fce
--- /dev/null
+++ b/drivers/fsi/clients/fsi-sbefifo.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef DRIVERS_FSI_SBEFIFO_H
+
+#include <linux/timer.h>
+#include <linux/types.h>
+#include <linux/wait.h>
+
+enum sbefifo_direction {
+	sbefifo_up = 0,
+	sbefifo_down,
+};
+
+enum sbefifo_poll_state {
+	sbefifo_poll_wait,
+	sbefifo_poll_ready,
+	sbefifo_poll_reset,
+};
+
+/* Readiness Polling */
+struct sbefifo_poll {
+	struct timer_list timer;
+	wait_queue_head_t wait;
+	enum sbefifo_direction dir;
+	unsigned long interval;
+	bool expire;
+	unsigned long expire_at;
+	enum sbefifo_poll_state state;
+	int rv;
+};
+
+struct sbefifo_client;
+
+enum sbefifo_state {
+	sbefifo_ready = 0,
+	sbefifo_tx,
+	sbefifo_interval,
+	sbefifo_rx,
+	sbefifo_broken,
+	sbefifo_dead,
+};
+
+/**
+ * @eot True when read() dequeues and ACKs an EOT. Set false in the write() path
+ */
+struct sbefifo {
+	struct device *dev;
+	struct fsi_device *fsi;
+	int id;
+	enum sbefifo_state state;
+	struct sbefifo_poll poll;
+	struct sbefifo_client *curr;
+	wait_queue_head_t wait;
+
+	struct list_head entry;
+};
+
+enum sbefifo_client_state {
+	sbefifo_client_closed = 0,
+	sbefifo_client_idle,
+	sbefifo_client_active,
+};
+
+struct sbefifo_client {
+	struct sbefifo *fifo;
+
+	wait_queue_head_t wait;
+	enum sbefifo_client_state state;
+	unsigned int flags;
+};
+
+int sbefifo_open(struct sbefifo *fifo, struct sbefifo_client *client,
+		 unsigned long flags);
+ssize_t sbefifo_write(struct sbefifo_client *client, const u32 *buf, ssize_t len);
+ssize_t sbefifo_read(struct sbefifo_client *client, u32 *buf, ssize_t len);
+int sbefifo_release(struct sbefifo_client *client);
+
+extern struct list_head sbefifos;
+
+#define sbefifo_for_each_dev(pos) \
+	list_for_each_entry(pos, &sbefifos, entry)
+
+#endif /* DRIVERS_FSI_SBEFIFO_H */
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
