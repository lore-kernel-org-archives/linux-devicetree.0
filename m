From: Jacob Chen <jacob-chen@iotwrt.com>
Subject: [PATCH 5/5] arm64: dts: rockchip: add rk3399 hdmi nodes
Date: Thu, 13 Jul 2017 00:03:55 +0800
Message-ID: <1499875435-23944-6-git-send-email-jacob-chen@iotwrt.com>
References: <1499875435-23944-1-git-send-email-jacob-chen@iotwrt.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499875435-23944-1-git-send-email-jacob-chen@iotwrt.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, heiko@sntech.de, kever.yang@rock-chips.com, mark.yao@rock-chips.com, wxt@rock-chips.com, Jacob Chen <jacob-chen@iotwrt.com>
List-Id: devicetree@vger.kernel.org

Add an hdmi node, and also add hdmi endpoints to vopb and vopl
output port nodes.

Signed-off-by: Jacob Chen <jacob-chen@iotwrt.com>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 4965163..c398eb0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1485,6 +1485,11 @@
 				remote-endpoint = <&edp_in_vopl>;
 			};
 
+			vopl_out_hdmi: endpoint@2 {
+				reg = <2>;
+				remote-endpoint = <&hdmi_in_vopl>;
+			};
+
 		};
 	};
 
@@ -1526,6 +1531,11 @@
 				remote-endpoint = <&mipi_in_vopb>;
 			};
 
+			vopb_out_hdmi: endpoint@2 {
+				reg = <2>;
+				remote-endpoint = <&hdmi_in_vopb>;
+			};
+
 		};
 	};
 
@@ -1541,6 +1551,33 @@
 		status = "disabled";
 	};
 
+	hdmi: hdmi@ff940000 {
+		compatible = "rockchip,rk3399-dw-hdmi";
+		reg = <0x0 0xff940000 0x0 0x20000>;
+		reg-io-width = <4>;
+		rockchip,grf = <&grf>;
+		power-domains = <&power RK3399_PD_HDCP>;
+		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_SFR>, <&cru PLL_VPLL>, <&cru PCLK_VIO_GRF>;
+		clock-names = "iahb", "isfr", "vpll", "grf";
+		status = "disabled";
+
+		ports {
+			hdmi_in: port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				hdmi_in_vopb: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&vopb_out_hdmi>;
+				};
+				hdmi_in_vopl: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&vopl_out_hdmi>;
+				};
+			};
+		};
+	};
+
 	mipi_dsi: mipi@ff960000 {
 		compatible = "rockchip,rk3399-mipi-dsi", "snps,dw-mipi-dsi";
 		reg = <0x0 0xff960000 0x0 0x8000>;
-- 
2.7.4
