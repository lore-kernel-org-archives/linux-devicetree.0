From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 20/23] drivers/fsi/gpio: Add tracepoints for GPIO master
Date: Tue,  4 Apr 2017 21:06:04 -0500
Message-ID: <20170405020607.79939-21-cbostic@linux.vnet.ibm.com>
References: <20170405020607.79939-1-cbostic@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170405020607.79939-1-cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>

Add trace points for key GPIO operations of the GPIO based FSI
master.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Signed-off-by: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 drivers/fsi/fsi-master-gpio.c          |  9 +++++
 include/trace/events/fsi_master_gpio.h | 68 ++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 include/trace/events/fsi_master_gpio.h

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 9fedfaf..5d9e0b0 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -61,6 +61,9 @@ struct fsi_master_gpio {
 	struct gpio_desc	*gpio_mux;	/* Mux control */
 };
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/fsi_master_gpio.h>
+
 #define to_fsi_master_gpio(m) container_of(m, struct fsi_master_gpio, master)
 
 struct fsi_gpio_msg {
@@ -128,6 +131,8 @@ static void serial_in(struct fsi_master_gpio *master, struct fsi_gpio_msg *msg,
 		msg->msg |= ~in_bit & 0x1;	/* Data is negative active */
 	}
 	msg->bits += num_bits;
+
+	trace_fsi_master_gpio_in(master, num_bits, msg->msg);
 }
 
 static void serial_out(struct fsi_master_gpio *master,
@@ -139,6 +144,8 @@ static void serial_out(struct fsi_master_gpio *master,
 	uint64_t last_bit = ~0;
 	int next_bit;
 
+	trace_fsi_master_gpio_out(master, cmd->bits, cmd->msg);
+
 	if (!cmd->bits) {
 		dev_warn(master->dev, "trying to output 0 bits\n");
 		return;
@@ -464,6 +471,8 @@ static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 	if (link != 0)
 		return -ENODEV;
 
+	trace_fsi_master_gpio_break(master);
+
 	set_sda_output(master, 1);
 	sda_out(master, 1);
 	clock_toggle(master, FSI_PRE_BREAK_CLOCKS);
diff --git a/include/trace/events/fsi_master_gpio.h b/include/trace/events/fsi_master_gpio.h
new file mode 100644
index 0000000..11b36c1
--- /dev/null
+++ b/include/trace/events/fsi_master_gpio.h
@@ -0,0 +1,68 @@
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM fsi_master_gpio
+
+#if !defined(_TRACE_FSI_MASTER_GPIO_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_FSI_MASTER_GPIO_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(fsi_master_gpio_in,
+	TP_PROTO(const struct fsi_master_gpio *master, int bits, uint64_t msg),
+	TP_ARGS(master, bits, msg),
+	TP_STRUCT__entry(
+		__field(int,	master_idx)
+		__field(int,	bits)
+		__field(uint64_t, msg)
+	),
+	TP_fast_assign(
+		__entry->master_idx = master->master.idx;
+		__entry->bits = bits;
+		__entry->msg  = msg & ((1ull<<bits) - 1);
+	),
+	TP_printk("fsi-gpio%d => %0*llx[%d]",
+		__entry->master_idx,
+		(__entry->bits + 3) / 4,
+		__entry->msg,
+		__entry->bits
+	)
+);
+
+TRACE_EVENT(fsi_master_gpio_out,
+	TP_PROTO(const struct fsi_master_gpio *master, int bits, uint64_t msg),
+	TP_ARGS(master, bits, msg),
+	TP_STRUCT__entry(
+		__field(int,	master_idx)
+		__field(int,	bits)
+		__field(uint64_t, msg)
+	),
+	TP_fast_assign(
+		__entry->master_idx = master->master.idx;
+		__entry->bits = bits;
+		__entry->msg  = msg & ((1ull<<bits) - 1);
+	),
+	TP_printk("fsi-gpio%d <= %0*llx[%d]",
+		__entry->master_idx,
+		(__entry->bits + 3) / 4,
+		__entry->msg,
+		__entry->bits
+	)
+);
+
+TRACE_EVENT(fsi_master_gpio_break,
+	TP_PROTO(const struct fsi_master_gpio *master),
+	TP_ARGS(master),
+	TP_STRUCT__entry(
+		__field(int,	master_idx)
+	),
+	TP_fast_assign(
+		__entry->master_idx = master->master.idx;
+	),
+	TP_printk("fsi-gpio%d ----break---",
+		__entry->master_idx
+	)
+);
+
+#endif /* _TRACE_FSI_MASTER_GPIO_H */
+
+#include <trace/define_trace.h>
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
