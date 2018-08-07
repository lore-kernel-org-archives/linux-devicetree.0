Return-Path: <SRS0=Wv3U=KW=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v3 5/5] ARM: dts: iwg23s-sbc: Add pinctl support for EtherAVB
Date: Tue,  7 Aug 2018 08:57:06 +0100
Message-Id: <1533628626-26503-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com>
References: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Adding pinctrl support for EtherAVB interface.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1-->V2 
     * No change
V2-->V3
     * No change
     Depend onthe below patch
       https://patchwork.kernel.org/patch/10546801/

---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index a3d92d9..2bfba93 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -52,6 +52,9 @@
 };
 
 &avb {
+	pinctrl-0 = <&avb_pins>;
+	pinctrl-names = "default";
+
 	phy-handle = <&phy3>;
 	phy-mode = "gmii";
 	renesas,no-ether-link;
@@ -70,6 +73,11 @@
 };
 
 &pfc {
+	avb_pins: avb {
+		groups = "avb_mdio", "avb_gmii_tx_rx";
+		function = "avb";
+	};
+
 	scif1_pins: scif1 {
 		groups = "scif1_data_b";
 		function = "scif1";
-- 
2.7.4
