Return-Path: <SRS0=SDjf=NF=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 6/7] ARM: dts: iwg23s-sbc: Enable USB USB2.0 Host
Date: Thu, 25 Oct 2018 14:56:58 +0100
Message-Id: <1540475819-47950-7-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
References: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Enable USB2.0 host on USB port1 of the iwg23s sbc.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch is tested against renesas-devel.
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index 157af7c..7aa7993e 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -73,10 +73,18 @@
 	};
 };
 
+&ehci1 {
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <20000000>;
 };
 
+&ohci1 {
+	status = "okay";
+};
+
 &pfc {
 	mmc_pins_uhs: mmc_uhs {
 		groups = "mmc_data8", "mmc_ctrl";
-- 
2.7.4
