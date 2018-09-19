Return-Path: <SRS0=bz4g=MB=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] arm64: dts: renesas: r8a779{7|8}0: add TPU support
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
Message-ID: <009bf131-c98e-df15-9c17-fb03c7bb09e2@cogentembedded.com>
Date: Wed, 19 Sep 2018 23:02:25 +0300
MIME-Version: 1.0
In-Reply-To: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Describe TPU in the R8A779{7|8}0 device trees.

Based on the original (and large) patches by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20180919-v4.19-rc4' branch of
Simon Horman's 'renesas.git' repo.

 arch/arm64/boot/dts/renesas/r8a77970.dtsi |    8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |    9 +++++++++
 2 files changed, 17 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -614,6 +614,14 @@
 			status = "disabled";
 		};
 
+		tpu: pwm@e6e80000 {
+			compatible = "renesas,tpu-r8a77970", "renesas,tpu";
+			reg = <0 0xe6e80000 0 0x100>;
+			clocks = <&cpg CPG_MOD 304>;
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			#pwm-cells = <4>;
+			status = "disabled";
+		};
 
 		vin0: video@e6ef0000 {
 			compatible = "renesas,vin-r8a77970";
Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -666,6 +666,15 @@
 			status = "disabled";
 		};
 
+		tpu: pwm@e6e80000 {
+			compatible = "renesas,tpu-r8a7798", "renesas,tpu";
+			reg = <0 0xe6e80000 0 0x100>;
+			clocks = <&cpg CPG_MOD 304>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			#pwm-cells = <4>;
+			status = "disabled";
+		};
+
 		vin0: video@e6ef0000 {
 			compatible = "renesas,vin-r8a77980";
 			reg = <0 0xe6ef0000 0 0x1000>;
