Return-Path: <SRS0=kCE6=KL=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 3/4] ARM: dts: iwg23s-sbc: specify EtherAVB PHY IRQ
Date: Fri, 27 Jul 2018 10:51:28 +0100
Message-Id: <1532685089-35645-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1532685089-35645-1-git-send-email-biju.das@bp.renesas.com>
References: <1532685089-35645-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Specify  EtherAVB PHY IRQ  in the board specific device tree, now that we
have GPIO support.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index 56182ee..22da819 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -35,6 +35,8 @@
 
 	phy3: ethernet-phy@3 {
 		reg = <3>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 	};
 };
-- 
2.7.4
