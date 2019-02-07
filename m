Return-Path: <SRS0=USrl=QO=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: cat875: Enable PCIe support
Date: Thu,  7 Feb 2019 08:31:50 +0000
Message-Id: <1549528310-54436-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1549528310-54436-1-git-send-email-biju.das@bp.renesas.com>
References: <1549528310-54436-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch enables PCIEC0 PCI express controller on the sub board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch is tested against renesas-dev
---
 arch/arm64/boot/dts/renesas/cat875.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/dts/renesas/cat875.dtsi
index 805ffa7..14db667 100644
--- a/arch/arm64/boot/dts/renesas/cat875.dtsi
+++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
@@ -30,6 +30,10 @@
 	};
 };
 
+&pciec0 {
+	status = "okay";
+};
+
 &pfc {
 	avb_pins: avb {
 		mux {
-- 
2.7.4
