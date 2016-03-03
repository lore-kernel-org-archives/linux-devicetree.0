From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 3/4 v2] arc: axs10x - add support of ARC PGU
Date: Thu,  3 Mar 2016 17:39:15 +0300
Message-ID: <1457015956-30708-4-git-send-email-abrodkin@synopsys.com>
References: <1457015956-30708-1-git-send-email-abrodkin@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1457015956-30708-1-git-send-email-abrodkin@synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-snps-arc@lists.infradead.org
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

Changes v1 -> v2:
 * Added missing "pxlclk" clock in axs10x_mb.dtsi

 arch/arc/boot/dts/axs10x_mb.dtsi | 61 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 44a578c..6e639c9 100644
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
 
+			adv7511:adv7511@0x39{
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
+		pgu@0x17000 {
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
