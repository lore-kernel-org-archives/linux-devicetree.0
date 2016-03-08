From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v13 05/14] dt-bindings: drm/mediatek: Add Mediatek HDMI dts binding
Date: Tue,  8 Mar 2016 14:27:20 +0100
Message-ID: <1457443649-12133-6-git-send-email-p.zabel@pengutronix.de>
References: <1457443649-12133-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457443649-12133-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel@>
List-Id: devicetree@vger.kernel.org

Add the device tree binding documentation for Mediatek HDMI,
HDMI PHY and HDMI DDC devices.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../bindings/display/mediatek/mediatek,hdmi.txt    | 148 +++++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
new file mode 100644
index 0000000..7b12424
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
@@ -0,0 +1,148 @@
+Mediatek HDMI Encoder
+=====================
+
+The Mediatek HDMI encoder can generate HDMI 1.4a or MHL 2.0 signals from
+its parallel input.
+
+Required properties:
+- compatible: Should be "mediatek,<chip>-hdmi".
+- reg: Physical base address and length of the controller's registers
+- interrupts: The interrupt signal from the function block.
+- clocks: device clocks
+  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
+- clock-names: must contain "pixel", "pll", "bclk", and "spdif".
+- phys: phandle link to the HDMI PHY node.
+  See Documentation/devicetree/bindings/phy/phy-bindings.txt for details.
+- phy-names: must contain "hdmi"
+- mediatek,syscon-hdmi: phandle link and register offset to the system
+  configuration registers. For mt8173 this must be offset 0x900 into the
+  MMSYS_CONFIG region: <&mmsys 0x900>.
+- ports: A node containing input and output port nodes with endpoint
+  definitions as documented in Documentation/devicetree/bindings/graph.txt.
+- port@0: The input port in the ports node should be connected to a DPI output
+  port.
+- port@1: The output port in the ports node should be connected to the input
+  port of a connector node that contains a ddc-i2c-bus property, or to the
+  input port of an attached bridge chip, such as a SlimPort transmitter.
+
+HDMI CEC
+========
+
+The HDMI CEC controller handles hotplug detection and CEC communication.
+
+Required properties:
+- compatible: Should be "mediatek,<chip>-cec"
+- reg: Physical base address and length of the controller's registers
+- interrupts: The interrupt signal from the function block.
+- clocks: device clock
+
+HDMI DDC
+========
+
+The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
+The Mediatek's I2C controller is used to interface with I2C devices.
+
+Required properties:
+- compatible: Should be "mediatek,<chip>-hdmi-ddc"
+- reg: Physical base address and length of the controller's registers
+- clocks: device clock
+- clock-names: Should be "ddc-i2c".
+
+HDMI PHY
+========
+
+The HDMI PHY serializes the HDMI encoder's three channel 10-bit parallel
+output and drives the HDMI pads.
+
+Required properties:
+- compatible: "mediatek,<chip>-hdmi-phy"
+- reg: Physical base address and length of the module's registers
+- clocks: PLL reference clock
+- clock-names: must contain "pll_ref"
+- clock-output-names: must be "hdmitx_dig_cts" on mt8173
+- #phy-cells: must be <0>
+- #clock-cells: must be <0>
+
+Optional properties:
+- mediatek,ibias: TX DRV bias current for <1.65Gbps, defaults to 0xa
+- mediatek,ibias_up: TX DRV bias current for >1.65Gbps, defaults to 0x1c
+
+Example:
+
+cec: cec@10013000 {
+	compatible = "mediatek,mt8173-cec";
+	reg = <0 0x10013000 0 0xbc>;
+	interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
+	clocks = <&infracfg CLK_INFRA_CEC>;
+};
+
+hdmi_phy: hdmi-phy@10209100 {
+	compatible = "mediatek,mt8173-hdmi-phy";
+	reg = <0 0x10209100 0 0x24>;
+	clocks = <&apmixedsys CLK_APMIXED_HDMI_REF>;
+	clock-names = "pll_ref";
+	clock-output-names = "hdmitx_dig_cts";
+	mediatek,ibias = <0xa>;
+	mediatek,ibias_up = <0x1c>;
+	#clock-cells = <0>;
+	#phy-cells = <0>;
+};
+
+hdmi_ddc0: i2c@11012000 {
+	compatible = "mediatek,mt8173-hdmi-ddc";
+	reg = <0 0x11012000 0 0x1c>;
+	interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
+	clocks = <&pericfg CLK_PERI_I2C5>;
+	clock-names = "ddc-i2c";
+};
+
+hdmi0: hdmi@14025000 {
+	compatible = "mediatek,mt8173-hdmi";
+	reg = <0 0x14025000 0 0x400>;
+	interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_LOW>;
+	clocks = <&mmsys CLK_MM_HDMI_PIXEL>,
+		 <&mmsys CLK_MM_HDMI_PLLCK>,
+		 <&mmsys CLK_MM_HDMI_AUDIO>,
+		 <&mmsys CLK_MM_HDMI_SPDIF>;
+	clock-names = "pixel", "pll", "bclk", "spdif";
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_pin>;
+	phys = <&hdmi_phy>;
+	phy-names = "hdmi";
+	mediatek,syscon-hdmi = <&mmsys 0x900>;
+	assigned-clocks = <&topckgen CLK_TOP_HDMI_SEL>;
+	assigned-clock-parents = <&hdmi_phy>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			hdmi0_in: endpoint {
+				remote-endpoint = <&dpi0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			hdmi0_out: endpoint {
+				remote-endpoint = <&hdmi_con_in>;
+			};
+		};
+	};
+};
+
+connector {
+	compatible = "hdmi-connector";
+	type = "a";
+	ddc-i2c-bus = <&hdmiddc0>;
+
+	port {
+		hdmi_con_in: endpoint {
+			remote-endpoint = <&hdmi0_out>;
+		};
+	};
+};
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
