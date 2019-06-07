Return-Path: <SRS0=l81v=UG=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: hihope-common: Declare pcie bus clock
Date: Fri,  7 Jun 2019 08:13:58 +0100
Message-Id: <1559891639-62529-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com>
References: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Declare pcie bus clock, since it is generated on the HiHope RZ/G2M main
board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 4cc924d..95ac6fa 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -26,6 +26,10 @@
 	clock-frequency = <32768>;
 };
 
+&pcie_bus_clk {
+	clock-frequency = <100000000>;
+};
+
 &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
-- 
2.7.4
