Return-Path: <SRS0=4SCW=MD=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] ARM: dts: iwg20d-q7-common: Move pciec node out of common dtsi
Date: Fri, 21 Sep 2018 15:07:55 +0100
Message-Id: <1537538875-62836-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

PCIe is not populated by default on iWave RZ/G1N board. RZ/G1N board
is almost identical to RZ/G1M. In order to reuse the common dtsi for
both the boards, it is required to move pcie node from common dtsi
to board specific dts.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/boot/dts/iwg20d-q7-common.dtsi         | 4 ----
 arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts | 4 ++++
 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts         | 4 ++++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index 5cae74e..ca9154dd 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -160,10 +160,6 @@
 	clock-frequency = <100000000>;
 };
 
-&pciec {
-	status = "okay";
-};
-
 &pfc {
 	can0_pins: can0 {
 		groups = "can0_data_d";
diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
index 3275451..0d006ae 100644
--- a/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
@@ -14,3 +14,7 @@
 	model = "iW-RainboW-G20D-Q7 RZ/G1M based plus camera daughter board";
 	compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7743";
 };
+
+&pciec {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
index b683db4..498e223 100644
--- a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
+++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
@@ -13,3 +13,7 @@
 	model = "iWave Systems RainboW-G20D-Qseven board based on RZ/G1M";
 	compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7743";
 };
+
+&pciec {
+	status = "okay";
+};
-- 
2.7.4
