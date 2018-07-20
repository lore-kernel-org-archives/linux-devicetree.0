Return-Path: <SRS0=J41Z=KE=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] ARM: dts: iwg23s-sbc: Add pinctl support for scif1
Date: Fri, 20 Jul 2018 14:13:31 +0100
Message-Id: <1532092411-7723-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Adding pinctrl support for scif1 interface.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index e3585da..56182ee 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -43,6 +43,16 @@
 	clock-frequency = <20000000>;
 };
 
+&pfc {
+	scif1_pins: scif1 {
+		groups = "scif1_data_b";
+		function = "scif1";
+	};
+};
+
 &scif1 {
+	pinctrl-0 = <&scif1_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
-- 
2.7.4
