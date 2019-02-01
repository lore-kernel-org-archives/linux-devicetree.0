From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH] dt-bindings: display: rockchip: add document for rk3066 hdmi
Date: Fri,  1 Feb 2019 13:32:35 +0100
Message-ID: <20190201123235.1693-1-jbx6244@gmail.com>
References: <20181229133318.18128-1-jbx6244@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181229133318.18128-1-jbx6244@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: hjc@rock-chips.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds a binding that describes the HDMI controller for
rk3066.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../display/rockchip/rk3066_hdmi-rockchip.txt      | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rk3066_hdmi-rockchip.txt

diff --git a/Documentation/devicetree/bindings/display/rockchip/rk3066_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/rk3066_hdmi-rockchip.txt
new file mode 100644
index 000000000..6a8f3754f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rk3066_hdmi-rockchip.txt
@@ -0,0 +1,60 @@
+Rockchip specific extensions for rk3066 HDMI
+============================================
+
+Required properties:
+- compatible:
+	"rockchip,rk3066-hdmi";
+- reg:
+	Physical base address and length of the controller's registers.
+- clocks, clock-names:
+	Phandle to HDMI controller clock, name should be "hclk".
+- interrupts:
+	HDMI interrupt number.
+- power-domains:
+	Phandle to the RK3066_PD_VIO power domain.
+- rockchip,grf:
+	This soc uses GRF regs to switch the HDMI TX input between vop0 and vop1.
+- ports:
+	Contains one port node with two endpoints, numbered 0 and 1,
+	connected respectively to vop0 and vop1.
+- pinctrl-0, pinctrl-name:
+	Switch the iomux for the HPD/I2C pins to HDMI function.
+
+Example:
+	hdmi: hdmi@10116000 {
+		compatible = "rockchip,rk3066-hdmi";
+		reg = <0x10116000 0x2000>;
+		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_HDMI>;
+		clock-names = "hclk";
+		power-domains = <&power RK3066_PD_VIO>;
+		rockchip,grf = <&grf>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmii2c_xfer>, <&hdmi_hpd>;
+		status = "disabled";
+
+		hdmi_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			hdmi_in_vop0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&vop0_out_hdmi>;
+			};
+			hdmi_in_vop1: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&vop1_out_hdmi>;
+			};
+		};
+	};
+
+&pinctrl {
+		hdmi {
+			hdmi_hpd: hdmi-hpd {
+				rockchip,pins = <0 RK_PA0 1 &pcfg_pull_default>;
+			};
+			hdmii2c_xfer: hdmii2c-xfer {
+				rockchip,pins = <0 RK_PA1 1 &pcfg_pull_none>,
+						<0 RK_PA2 1 &pcfg_pull_none>;
+			};
+		};
+};
-- 
2.11.0
