From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 2/4] phy: phy-stih407-usb: Add dt documentation for USB picophy found on stih407 SoC family
Date: Thu, 11 Sep 2014 18:02:45 +0100
Message-ID: <1410454967-21500-3-git-send-email-peter.griffin@linaro.org>
References: <1410454967-21500-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410454967-21500-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peppe.cavallaro-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the dt documentation for the usb picophy found on stih407 SoC family
available from STMicroelectronics.

Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/phy/phy-stih407-usb.txt    | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-stih407-usb.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-stih407-usb.txt b/Documentation/devicetree/bindings/phy/phy-stih407-usb.txt
new file mode 100644
index 0000000..1ef8228
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-stih407-usb.txt
@@ -0,0 +1,30 @@
+ST STiH407 USB PHY controller
+
+This file documents the dt bindings for the usb picoPHY driver which is the PHY for both USB2 and USB3
+host controllers (when controlling usb2/1.1 devices) available on STiH407 SoC family from STMicroelectronics.
+
+Required properties:
+- compatible		: should be "st,stih407-usb2-phy"
+- reg			: contain the offset and length of the system configuration registers
+			  used as glue logic to control & parameter phy
+- reg-names		: the names of the system configuration registers in "reg", should be "param" and "reg"
+- st,syscfg		: sysconfig register to manage phy parameter at driver level
+- resets		: list of phandle and reset specifier pairs. There should be two entries, one
+			  for the whole phy and one for the port
+- reset-names		: list of reset signal names. Should be "global" and "port"
+See: Documentation/devicetree/bindings/reset/st,sti-powerdown.txt
+See: Documentation/devicetree/bindings/reset/reset.txt
+
+Example:
+
+usb2_picophy0: usbpicophy@f8 {
+	compatible	= "st,stih407-usb2-phy";
+	reg		= <0xf8 0x04>,	/* syscfg 5062 */
+			  <0xf4 0x04>;	/* syscfg 5061 */
+	reg-names	= "param", "ctrl";
+	#phy-cells	= <0>;
+	st,syscfg	= <&syscfg_core>;
+	resets		= <&softreset STIH407_PICOPHY_SOFTRESET>,
+			  <&picophyreset STIH407_PICOPHY0_RESET>;
+	reset-names	= "global", "port";
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
