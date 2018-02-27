Return-Path: <>
From: Gaku Inami <gaku.inami.xh@renesas.com>
Subject: [PATCH 2/5] arm64: dts: renesas: r8a7796: Add multi-cluster definition
Date: Tue, 27 Feb 2018 11:19:52 +0900
Message-Id: <1519697995-6061-3-git-send-email-gaku.inami.xh@renesas.com>
In-Reply-To: <1519697995-6061-1-git-send-email-gaku.inami.xh@renesas.com>
References: <1519697995-6061-1-git-send-email-gaku.inami.xh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Gaku Inami <gaku.inami.xh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds the "cpu-map" for multi-cluster into r8a7796
device-tree. This definition is used to parse the cpu topology.

Signed-off-by: Gaku Inami <gaku.inami.xh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index f8e9313..154df9b 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -64,6 +64,32 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&a57_0>;
+				};
+				core1 {
+					cpu = <&a57_1>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&a53_0>;
+				};
+				core1 {
+					cpu = <&a53_1>;
+				};
+				core2 {
+					cpu = <&a53_2>;
+				};
+				core3 {
+					cpu = <&a53_3>;
+				};
+			};
+		};
+
 		a57_0: cpu@0 {
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0x0>;
-- 
2.7.4
