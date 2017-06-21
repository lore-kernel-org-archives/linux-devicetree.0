From: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH 2/5] dt-bindings: phy-hisi-inno-usb2: add support for hisi-inno-usb2 phy
Date: Wed, 21 Jun 2017 17:00:42 +0800
Message-ID: <1498035645-22804-3-git-send-email-xuejiancheng@hisilicon.com>
References: <1498035645-22804-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498035645-22804-1-git-send-email-xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, project-aspen-dev-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for hisi-inno-usb2 phy.

Signed-off-by: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 .../devicetree/bindings/phy/phy-hisi-inno-usb2.txt | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
new file mode 100644
index 0000000..21f8208
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
@@ -0,0 +1,36 @@
+HiSilicon INNO USB2 PHY
+-----------------------
+Required properties:
+- compatible: Should be one of the following strings:
+		"hisilicon,inno-usb2-phy",
+		"hisilicon,hi3798cv200-usb2-phy",
+- #phy-cells: Must be 0
+- hisilicon,peripheral-syscon: Phandle of syscon used to control phy.
+- clocks: Phandle and clock specifier pair for reference clock utmi_refclk.
+- resets: List of phandle and reset specifier pairs for each reset signal in
+reset-names.
+- reset-names: Should be "por_rst" and "test_rst". The test_rst only
+exists in some of SOCs, so it is optional.
+
+Phy node can include up to four subnodes. Each subnode represents one port.
+The required properties of port node are as follows:
+- clocks: Phandle and clock specifier pair for utmi_clock.
+- resets: List of phandle and reset specifier pairs for port reset and utmi reset.
+- reset-names: List of reset signal names. Should be "port_rst" and "utmi_rst"
+
+Refer to phy/phy-bindings.txt for the generic PHY binding properties
+
+Example:
+usb_phy: phy {
+		 compatible = "hisilicon,inno_usb2_phy";
+		 #phy-cells = <0>;
+		 hisilicon,peripheral-syscon = <&peri_ctrl>;
+		 clocks = <&crg USB2_REF_CLK>;
+		 resets = <&crg 0xb4 2>;
+		 reset-names = "por_rst";
+		 port0 {
+			 clocks = <&crg USB2_UTMI0_CLK>;
+			 resets = <&crg 0xb4 5>, <&crg 0xb4 1>;
+			 reset-names = "port_rst", "utmi_rst";
+		 };
+	 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
