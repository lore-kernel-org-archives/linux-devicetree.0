Return-Path: <SRS0=USrl=QO=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a774c0-cat874: Add pciec0 support
Date: Thu,  7 Feb 2019 08:31:49 +0000
Message-Id: <1549528310-54436-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Silicon Linux CAT 874 board has 2GB DDR memory. Update the dma-ranges
mapping for pciec0 node. Also declare pcie bus clock, since it is
generated on the CAT874 main board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch is tested against renesas-dev
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 477a56b..96ee0d2c 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -56,6 +56,15 @@
 	clock-frequency = <48000000>;
 };
 
+&pcie_bus_clk {
+	clock-frequency = <100000000>;
+};
+
+&pciec0 {
+	/* Map all possible DDR as inbound ranges */
+	dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
+};
+
 &pfc {
 	scif2_pins: scif2 {
 		groups = "scif2_data_a";
-- 
2.7.4
