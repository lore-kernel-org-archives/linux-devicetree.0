From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH] usb: xhci: add support for performing fake doorbell
Date: Sat,  1 Oct 2016 23:58:10 +0200
Message-ID: <20161001215817.25384-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Broadcom's Northstar XHCI controllers seem to need a special start
procedure to work correctly. There isn't any official documentation on
this, the problem is that controller doesn't detect any connected
devices with default setup. Moreover connecting USB device to controller
that doesn't run properly can cause SoC's watchdog issues.

A workaround that was successfully tested on multiple devices is to
perform a fake doorbell. This patch adds code for doing that and a DT
binding enabling it.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt |  2 +
 drivers/usb/host/xhci-plat.c                       |  6 +++
 drivers/usb/host/xhci.c                            | 63 ++++++++++++++++++++--
 drivers/usb/host/xhci.h                            |  1 +
 4 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index 966885c..ce01b7f 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -26,6 +26,8 @@ Required properties:
 Optional properties:
   - clocks: reference to a clock
   - usb3-lpm-capable: determines if platform is USB3 LPM capable
+  - usb3-fake-doorbell: determines if controller requires a fake doorbell when
+			starting it
 
 Example:
 	usb@f0931000 {
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index ed56bf9..c26dc77 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -56,12 +56,18 @@ static int xhci_priv_init_quirk(struct usb_hcd *hcd)
 
 static void xhci_plat_quirks(struct device *dev, struct xhci_hcd *xhci)
 {
+	struct platform_device	*pdev = to_platform_device(dev);
+	struct device_node	*node = pdev->dev.of_node;
+
 	/*
 	 * As of now platform drivers don't provide MSI support so we ensure
 	 * here that the generic code does not try to make a pci_dev from our
 	 * dev struct in order to setup MSI
 	 */
 	xhci->quirks |= XHCI_PLAT;
+
+	if (node && of_property_read_bool(node, "usb3-fake-doorbell"))
+		xhci->quirks |= XHCI_FAKE_DOORBELL;
 }
 
 /* called during probe() after chip reset completes */
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 1a4ca02..c77035e9b 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -153,6 +153,49 @@ static int xhci_start(struct xhci_hcd *xhci)
 	return ret;
 }
 
+/**
+ * xhci_fake_doorbell - Perform a fake doorbell on a specified slot
+ *
+ * Some controllers require a fake doorbell to start correctly. Without that
+ * they simply don't detect any devices.
+ */
+static int xhci_fake_doorbell(struct xhci_hcd *xhci, int slot_id)
+{
+	u32 temp;
+
+	/* Alloc a virt device for that slot */
+	if (!xhci_alloc_virt_device(xhci, slot_id, NULL, GFP_NOIO)) {
+		xhci_warn(xhci, "Could not allocate xHCI USB device data structures\n");
+		return -ENOMEM;
+	}
+
+	/* Ring fake doorbell for slot_id ep 0 */
+	xhci_ring_ep_doorbell(xhci, slot_id, 0, 0);
+	usleep_range(1000, 1500);
+
+	/* Read the status to check if HSE is set or not */
+	temp = readl(&xhci->op_regs->status);
+
+	/* Clear HSE if set */
+	if (temp & STS_FATAL) {
+		xhci_dbg(xhci, "HSE problem detected, status: 0x%08x\n", temp);
+		temp &= ~0x1fff;
+		temp |= STS_FATAL;
+		writel(temp, &xhci->op_regs->status);
+		usleep_range(1000, 1500);
+		readl(&xhci->op_regs->status);
+	}
+
+	/* Free virt device */
+	xhci_free_virt_device(xhci, slot_id);
+
+	/* We're done if controller is already running */
+	if (readl(&xhci->op_regs->command) & CMD_RUN)
+		return 0;
+
+	return xhci_start(xhci);
+}
+
 /*
  * Reset a halted HC.
  *
@@ -565,10 +608,20 @@ int xhci_init(struct usb_hcd *hcd)
 
 static int xhci_run_finished(struct xhci_hcd *xhci)
 {
-	if (xhci_start(xhci)) {
-		xhci_halt(xhci);
-		return -ENODEV;
+	int err;
+
+	err = xhci_start(xhci);
+	if (err) {
+		err = -ENODEV;
+		goto err_halt;
+	}
+
+	if (xhci->quirks & XHCI_FAKE_DOORBELL) {
+		err = xhci_fake_doorbell(xhci, 1);
+		if (err)
+			goto err_halt;
 	}
+
 	xhci->shared_hcd->state = HC_STATE_RUNNING;
 	xhci->cmd_ring_state = CMD_RING_STATE_RUNNING;
 
@@ -578,6 +631,10 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Finished xhci_run for USB3 roothub");
 	return 0;
+
+err_halt:
+	xhci_halt(xhci);
+	return err;
 }
 
 /*
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index b2c1dc5..52d7498 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1653,6 +1653,7 @@ struct xhci_hcd {
 #define XHCI_MTK_HOST		(1 << 21)
 #define XHCI_SSIC_PORT_UNUSED	(1 << 22)
 #define XHCI_NO_64BIT_SUPPORT	(1 << 23)
+#define XHCI_FAKE_DOORBELL	(1 << 24)
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
 	/* There are two roothubs to keep track of bus suspend info for */
-- 
2.9.3
