From: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] usb: phy: msm: Manual PHY and LINK controller VBUS change notification
Date: Thu,  9 Apr 2015 11:34:33 +0300
Message-ID: <1428568473-2145-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vamsi Krishna <vskrishn-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mayank Rana <mrana-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

VBUS is not routed to USB PHY on recent Qualcomm platforms. USB controller
must see VBUS in order to pull-up DP when setting RS bit. Henc configure
USB PHY and LINK registers sense VBUS and enable manual pullup on D+ line.

Cc: Vamsi Krishna <vskrishn-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mayank Rana <mrana-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Ivan T. Ivanov <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/usb/msm-hsusb.txt          |  4 ++++
 drivers/usb/phy/phy-msm-usb.c                      | 26 ++++++++++++++++++++++
 include/linux/usb/msm_hsusb.h                      |  5 +++++
 include/linux/usb/msm_hsusb_hw.h                   |  9 ++++++++
 4 files changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/msm-hsusb.txt b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
index f26bcfa..bd8d9e7 100644
--- a/Documentation/devicetree/bindings/usb/msm-hsusb.txt
+++ b/Documentation/devicetree/bindings/usb/msm-hsusb.txt
@@ -69,6 +69,10 @@ Optional properties:
                 (no, min, max) where each value represents either a voltage
                 in microvolts or a value corresponding to voltage corner.

+- qcom,manual-pullup: If present, vbus is not routed to USB controller/phy
+                and controller driver therefore enables pull-up explicitly
+                before starting controller using usbcmd run/stop bit.
+
 - extcon:       phandles to external connector devices. First phandle
                 should point to external connector, which provide "USB"
                 cable events, the second should point to external connector
diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
index d47c3eb..4a928f7 100644
--- a/drivers/usb/phy/phy-msm-usb.c
+++ b/drivers/usb/phy/phy-msm-usb.c
@@ -245,8 +245,14 @@ static void ulpi_init(struct msm_otg *motg)
 static int msm_phy_notify_disconnect(struct usb_phy *phy,
 				   enum usb_device_speed speed)
 {
+	struct msm_otg *motg = container_of(phy, struct msm_otg, phy);
 	int val;

+	if (motg->manual_pullup) {
+		val = ULPI_MISC_A_VBUSVLDEXT | ULPI_MISC_A_VBUSVLDEXTSEL;
+		usb_phy_io_write(phy, val, ULPI_CLR(ULPI_MISC_A));
+	}
+
 	/*
 	 * Put the transceiver in non-driving mode. Otherwise host
 	 * may not detect soft-disconnection.
@@ -431,6 +437,24 @@ static int msm_phy_init(struct usb_phy *phy)
 		ulpi_write(phy, ulpi_val, ULPI_USB_INT_EN_FALL);
 	}

+	if (motg->manual_pullup) {
+		val = ULPI_MISC_A_VBUSVLDEXTSEL | ULPI_MISC_A_VBUSVLDEXT;
+		ulpi_write(phy, val, ULPI_SET(ULPI_MISC_A));
+
+		val = readl(USB_GENCONFIG_2);
+		val |= GENCONFIG_2_SESS_VLD_CTRL_EN;
+		writel(val, USB_GENCONFIG_2);
+
+		val = readl(USB_USBCMD);
+		val |= USBCMD_SESS_VLD_CTRL;
+		writel(val, USB_USBCMD);
+
+		val = ulpi_read(phy, ULPI_FUNC_CTRL);
+		val &= ~ULPI_FUNC_CTRL_OPMODE_MASK;
+		val |= ULPI_FUNC_CTRL_OPMODE_NORMAL;
+		ulpi_write(phy, val, ULPI_FUNC_CTRL);
+	}
+
 	if (motg->phy_number)
 		writel(readl(USB_PHY_CTRL2) | BIT(16), USB_PHY_CTRL2);

@@ -1529,6 +1553,8 @@ static int msm_otg_read_dt(struct platform_device *pdev, struct msm_otg *motg)
 		motg->vdd_levels[VDD_LEVEL_MAX] = tmp[VDD_LEVEL_MAX];
 	}

+	motg->manual_pullup = of_property_read_bool(node, "qcom,manual-pullup");
+
 	ext_id = ERR_PTR(-ENODEV);
 	ext_vbus = ERR_PTR(-ENODEV);
 	if (of_property_read_bool(node, "extcon")) {
diff --git a/include/linux/usb/msm_hsusb.h b/include/linux/usb/msm_hsusb.h
index 9a38e77..a5edc8d 100644
--- a/include/linux/usb/msm_hsusb.h
+++ b/include/linux/usb/msm_hsusb.h
@@ -153,6 +153,9 @@ struct msm_usb_cable {
  * @chg_type: The type of charger attached.
  * @dcd_retires: The retry count used to track Data contact
  *               detection process.
+ * @manual_pullup: true if VBUS is not routed to USB controller/phy
+ *	and controller driver therefore enables pull-up explicitly before
+ *	starting controller using usbcmd run/stop bit.
  * @vbus: VBUS signal state trakining, using extcon framework
  * @id: ID signal state trakining, using extcon framework
  */
@@ -185,6 +188,8 @@ struct msm_otg {
 	struct reset_control *link_rst;
 	int vdd_levels[3];

+	bool manual_pullup;
+
 	struct msm_usb_cable vbus;
 	struct msm_usb_cable id;
 };
diff --git a/include/linux/usb/msm_hsusb_hw.h b/include/linux/usb/msm_hsusb_hw.h
index a29f603..e159b39 100644
--- a/include/linux/usb/msm_hsusb_hw.h
+++ b/include/linux/usb/msm_hsusb_hw.h
@@ -21,6 +21,8 @@

 #define USB_AHBBURST         (MSM_USB_BASE + 0x0090)
 #define USB_AHBMODE          (MSM_USB_BASE + 0x0098)
+#define USB_GENCONFIG_2      (MSM_USB_BASE + 0x00a0)
+
 #define USB_CAPLENGTH        (MSM_USB_BASE + 0x0100) /* 8 bit */

 #define USB_USBCMD           (MSM_USB_BASE + 0x0140)
@@ -30,6 +32,9 @@
 #define USB_PHY_CTRL         (MSM_USB_BASE + 0x0240)
 #define USB_PHY_CTRL2        (MSM_USB_BASE + 0x0278)

+#define GENCONFIG_2_SESS_VLD_CTRL_EN	BIT(7)
+#define USBCMD_SESS_VLD_CTRL		BIT(25)
+
 #define USBCMD_RESET   2
 #define USB_USBINTR          (MSM_USB_BASE + 0x0148)

@@ -50,6 +55,10 @@
 #define ULPI_PWR_CLK_MNG_REG	0x88
 #define OTG_COMP_DISABLE	BIT(0)

+#define ULPI_MISC_A			0x96
+#define ULPI_MISC_A_VBUSVLDEXTSEL	BIT(1)
+#define ULPI_MISC_A_VBUSVLDEXT		BIT(0)
+
 #define ASYNC_INTR_CTRL         (1 << 29) /* Enable async interrupt */
 #define ULPI_STP_CTRL           (1 << 30) /* Block communication with PHY */
 #define PHY_RETEN               (1 << 1) /* PHY retention enable/disable */
--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
