From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 2/3] dt-bindings: add bindings doc for hi3798cv200 combphy
Date: Mon, 30 Oct 2017 23:15:56 +0800
Message-ID: <1509376557-7187-3-git-send-email-shawnguo@kernel.org>
References: <1509376557-7187-1-git-send-email-shawnguo@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509376557-7187-1-git-send-email-shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

It adds the device tree bindings for PCIE/SATA/USB3 combo PHY found on
HiSilicon STB SoCs.

Signed-off-by: Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../bindings/phy/phy-hi3798cv200-combphy.txt       | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt b/Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt
new file mode 100644
index 000000000000..17b0c761370a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-hi3798cv200-combphy.txt
@@ -0,0 +1,59 @@
+HiSilicon STB PCIE/SATA/USB3 PHY
+
+Required properties:
+- compatible: Should be "hisilicon,hi3798cv200-combphy"
+- reg: Should be the address space for COMBPHY configuration and state
+  registers in peripheral controller, e.g. PERI_COMBPHY0_CFG and
+  PERI_COMBPHY0_STATE for COMBPHY0 Hi3798CV200 SoC.
+- #phy-cells: Should be 1.  The cell number is used to select the phy mode
+  as defined in <dt-bindings/phy/phy.h>.
+- clocks: The phandle to clock provider and clock specifier pair.
+- resets: The phandle to reset controller and reset specifier pair.
+
+Refer to phy/phy-bindings.txt for the generic PHY binding properties.
+
+Optional properties:
+- hisilicon,fixed-mode: If the phy device doesn't support mode select
+  but a fixed mode setting, the property should be present to specify
+  the particular mode.
+- hisilicon,mode-select-bits: If the phy device support mode select,
+  this property should be present to specify the register bits in
+  peripheral controller, as a 3 integers tuple:
+  <register_offset bit_shift bit_mask>.
+
+Notes:
+- Between hisilicon,fixed-mode and hisilicon,mode-select-bits, one and only
+  one of them should be present.
+- The device node should be a child of peripheral controller that contains
+  COMBPHY configuration/state and PERI_CTRL register used to select PHY mode.
+  Refer to arm/hisilicon/hisilicon.txt for the parent peripheral controller
+  bindings.
+
+Examples:
+
+perictrl: peripheral-controller@8a20000 {
+	compatible = "hisilicon,hi3798cv200-perictrl", "syscon",
+		     "simple-mfd";
+	reg = <0x8a20000 0x1000>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0x0 0x8a20000 0x1000>;
+
+	combphy0: phy@850 {
+		compatible = "hisilicon,hi3798cv200-combphy";
+		reg = <0x850 0x8>;
+		#phy-cells = <1>;
+		clocks = <&crg HISTB_COMBPHY0_CLK>;
+		resets = <&crg 0x188 4>;
+		hisilicon,fixed-mode = <PHY_TYPE_USB3>;
+	};
+
+	combphy1: phy@858 {
+		compatible = "hisilicon,hi3798cv200-combphy";
+		reg = <0x858 0x8>;
+		#phy-cells = <1>;
+		clocks = <&crg HISTB_COMBPHY1_CLK>;
+		resets = <&crg 0x188 12>;
+		hisilicon,mode-select-bits = <0x0008 11 (0x3 << 11)>;
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
