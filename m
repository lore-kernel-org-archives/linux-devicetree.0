From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 5/5 v5] arc: axs10x - add support of ARC PGU
Date: Mon, 28 Mar 2016 14:36:39 +0300
Message-ID: <1459164999-11850-6-git-send-email-abrodkin@synopsys.com>
References: <1459164999-11850-1-git-send-email-abrodkin@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459164999-11850-1-git-send-email-abrodkin@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Synopsys DesignWare ARC SDP boards sport ARC SDP display
controller attached to ADV7511 HDMI encoder.

That change adds desctiption of both ARC PGU and ADV7511 in
ARC SDP'd base-board Device Tree.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: devicetree@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
---

No changes v4 -> v5.

Changes v3 -> v4:
 * Removed "0x" from node names (as suggested by Rob)

No changes v2 -> v3.

Changes v1 -> v2:
 * Added missing "pxlclk" clock in axs10x_mb.dtsi

 arch/arc/boot/dts/axs10x_mb.dtsi | 61 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 44a578c..8fee596 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -34,6 +34,12 @@
 				clock-frequency = <50000000>;
 				#clock-cells = <0>;
 			};
+
+			pguclk: pguclk {
+				#clock-cells = <0>;
+				compatible = "fixed-clock";
+				clock-frequency = <74440000>;
+			};
 		};
 
 		ethernet@0x18000 {
@@ -147,6 +153,37 @@
 			clocks = <&i2cclk>;
 			interrupts = <16>;
 
+			adv7511:adv7511@39{
+				compatible="adi,adv7511";
+				reg = <0x39>;
+				interrupts = <23>;
+				adi,input-depth = <8>;
+				adi,input-colorspace = "rgb";
+				adi,input-clock = "1x";
+				adi,clock-delay = <0x03>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					/* RGB/YUV input */
+					port@0 {
+						reg = <0>;
+						adv7511_input:endpoint {
+						remote-endpoint = <&pgu_output>;
+						};
+					};
+
+					/* HDMI output */
+					port@1 {
+						reg = <1>;
+						adv7511_output: endpoint {
+							remote-endpoint = <&hdmi_connector_in>;
+						};
+					};
+				};
+			};
+
 			eeprom@0x54{
 				compatible = "24c01";
 				reg = <0x54>;
@@ -160,6 +197,16 @@
 			};
 		};
 
+		hdmi0: connector {
+			compatible = "hdmi-connector";
+			type = "a";
+			port {
+				hdmi_connector_in: endpoint {
+					remote-endpoint = <&adv7511_output>;
+				};
+			};
+		};
+
 		gpio0:gpio@13000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x13000 0x1000>;
@@ -221,5 +268,19 @@
 				reg = <2>;
 			};
 		};
+
+		pgu@17000 {
+			compatible = "snps,arcpgu";
+			reg = <0x17000 0x400>;
+			encoder-slave = <&adv7511>;
+			clocks = <&pguclk>;
+			clock-names = "pxlclk";
+
+			port {
+				pgu_output: endpoint {
+					remote-endpoint = <&adv7511_input>;
+				};
+			};
+		};
 	};
 };
-- 
2.5.0
