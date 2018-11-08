Return-Path: <SRS0=ytGm=NT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-os2jpn01on0120.outbound.protection.outlook.com ([104.47.92.120]:62345
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726143AbeKHQ7S (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 8 Nov 2018 11:59:18 -0500
From: Gaku Inami <gaku.inami.xh@renesas.com>
Subject: [PATCH v2 1/2] arm64: dts: renesas: Add CPU topology on R-Car Gen3 SoCs
Date: Thu,  8 Nov 2018 16:24:54 +0900
Message-Id: <1541661895-7064-2-git-send-email-gaku.inami.xh@renesas.com>
In-Reply-To: <1541661895-7064-1-git-send-email-gaku.inami.xh@renesas.com>
References: <1541661895-7064-1-git-send-email-gaku.inami.xh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Gaku Inami <gaku.inami.xh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds the "cpu-map" into r8a7795/r8a7796 composed of
multi-cluster. This definition is used to parse the cpu topology.

Signed-off-by: Gaku Inami <gaku.inami.xh@renesas.com>
---
v1 -> v2:
 - Consolidate two patches for r8a7795 and r8a7796 into one patch
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 32 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 26 ++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 0b54c53..63d5b61 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -116,6 +116,38 @@
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
+				core2 {
+					cpu = <&a57_2>;
+				};
+				core3 {
+					cpu = <&a57_3>;
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
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 3baee26..b12bf73 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -127,6 +127,32 @@
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
