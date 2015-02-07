From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/4] Documentation: dt-bindings: add dt binding info for hi6220
Date: Sat,  7 Feb 2015 12:56:04 +0800
Message-ID: <1423284966-3485-3-git-send-email-zhangfei.gao@linaro.org>
References: <1423284966-3485-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423284966-3485-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/usb/hi6220-usb.txt         | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/hi6220-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/hi6220-usb.txt b/Documentation/devicetree/bindings/usb/hi6220-usb.txt
new file mode 100644
index 0000000..b8278de
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/hi6220-usb.txt
@@ -0,0 +1,49 @@
+Hisilicon hi6220 SoC USB controller
+-----------------------------
+
+usb controller is inherited from dwc2, refer dwc2.txt
+-----
+
+Required properties:
+- compatible: "hisilicon,hi6220-usb"
+Refer to dwc2.txt for dwc2 usb properties
+
+
+PHY:
+-----
+
+Required properties:
+- compatible: "hisilicon,hi6220-usb-phy"
+- vcc-supply: phandle to the regulator that provides power to the PHY.
+- clocks: phandle and clock specifier of the PHY clock.
+- hisilicon,peripheral-syscon: phandle of syscon used to control peripheral.
+- hisilicon,gpio-vbus: gpio of detecting vbus.
+- hisilicon,gpio-id: gpio of detecting id.
+
+Example:
+
+	peripheral_ctrl: syscon@f7030000 {
+	        compatible = "syscon";
+	        reg = <0x0 0xf7030000 0x0 0x1000>;
+	};
+
+	usb2_phy: usbphy {
+		compatible = "hisilicon,hi6220-usb-phy";
+		vcc-supply = <&fixed_5v_hub>;
+		hisilicon,gpio-vbus = <&gpio2 6 0>;
+		hisilicon,gpio-id = <&gpio2 5 0>;
+		hisilicon,peripheral-syscon = <&peripheral_ctrl>;
+		clocks = <&clock_sys HI6220_USBOTG_HCLK>;
+	};
+
+	usb: usb@f72c0000 {
+		compatible = "hisilicon,hi6220-usb";
+		reg = <0x0 0xf72c0000 0x0 0x40000>;
+		phys = <&usb2_phy>;
+		dr_mode = "otg";
+		g-use-dma;
+		g-rx-fifo-size = <512>;
+		g-np-tx-fifo-size = <128>;
+		g-tx-fifo-size = <128>;
+		interrupts = <0 77 0x4>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
