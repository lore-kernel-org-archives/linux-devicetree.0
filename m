From: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Subject: [PATCH] usb: dwc3: core: Add quirk for enabling AutoRetry feature in the controller
Date: Sat, 21 Jul 2018 15:58:40 +0530
Message-ID: <1532168920-3269-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, balbi@kernel.org
Cc: v.anuragkumar@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
List-Id: devicetree@vger.kernel.org

By default when core sees any transaction error(CRC or overflow)
it replies with terminating retry ACK (Retry=1 and Nump == 0).
Enabling this Auto Retry feature in controller, on seeing any
transaction errors makes the core to send an non-terminating ACK
transaction packet (that is, ACK TP with Retry=1 and Nump != 0).
Doing so will give controller a chance to recover from the error
condition.

Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt |  5 +++++
 drivers/usb/dwc3/core.c                        | 16 ++++++++++++++++
 drivers/usb/dwc3/core.h                        |  6 ++++++
 3 files changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 7f13ebe..2ba2bc2 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -94,6 +94,11 @@ Optional properties:
 			this and tx-thr-num-pkt-prd to a valid, non-zero value
 			1-16 (DWC_usb31 programming guide section 1.2.3) to
 			enable periodic ESS TX threshold.
+ - snps,enable_auto_retry: Set to enable Auto retry Feature to make the
+			controller operating in Host mode on seeing transaction
+			errors(CRC errors or internal overrun scenerios) on IN
+			transfers to reply to the device with a non-terminating
+			retry ACK (i.e, an ACK TP with Retry=1 & Nump != 0)
 
  - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
 
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 1038075..1c1ab93 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -883,6 +883,20 @@ static int dwc3_core_init(struct dwc3 *dwc)
 		dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
 	}
 
+	if (dwc->autoretry_enable) {
+		reg = dwc3_readl(dwc->regs, DWC3_GUCTL);
+
+		/* Enable Auto retry Feature to make the controller operating in
+		 * Host mode on seeing transaction errors(CRC errors or internal
+		 * overrun scenerios) on IN transfers to reply to the device
+		 * with a non-terminating retry ACK (i.e, an ACK transcation
+		 * packet with Retry=1 & Nump != 0)
+		 */
+		reg |= DWC3_GUCTL_HSTINAUTORETRY;
+
+		dwc3_writel(dwc->regs, DWC3_GUCTL, reg);
+	}
+
 	/*
 	 * Must config both number of packets and max burst settings to enable
 	 * RX and/or TX threshold.
@@ -1179,6 +1193,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 
 	dwc->dis_metastability_quirk = device_property_read_bool(dev,
 				"snps,dis_metastability_quirk");
+	dwc->autoretry_enable = device_property_read_bool(dev,
+				"snps,enable_auto_retry");
 
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
 	dwc->tx_de_emphasis = tx_de_emphasis;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 285ce0e..558dfda 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -227,6 +227,9 @@
 #define DWC3_GCTL_GBLHIBERNATIONEN	BIT(1)
 #define DWC3_GCTL_DSBLCLKGTNG		BIT(0)
 
+/* Global User Control Register */
+#define DWC3_GUCTL_HSTINAUTORETRY	BIT(14)
+
 /* Global User Control 1 Register */
 #define DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS	BIT(28)
 #define DWC3_GUCTL1_DEV_L1_EXIT_BY_HW	BIT(24)
@@ -984,6 +987,8 @@ struct dwc3_scratchpad_array {
  * 	2	- No de-emphasis
  * 	3	- Reserved
  * @dis_metastability_quirk: set to disable metastability quirk.
+ * @autoretry_enable: set to enable AutoRetry feature in controller to
+ *		      give an non terminating retry ACK (Retry=1 & Nump != 0)
  * @imod_interval: set the interrupt moderation interval in 250ns
  *                 increments or 0 to disable.
  */
@@ -1153,6 +1158,7 @@ struct dwc3 {
 	unsigned		tx_de_emphasis:2;
 
 	unsigned		dis_metastability_quirk:1;
+	unsigned		autoretry_enable:1;
 
 	u16			imod_interval;
 };
-- 
2.1.1
