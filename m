Return-Path: <SRS0=NOhz=NG=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/2] ARM: dts: iwg23s-sbc: Enable cmt0
Date: Fri, 26 Oct 2018 09:48:29 +0100
Message-Id: <1540543709-35959-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540543709-35959-1-git-send-email-biju.das@bp.renesas.com>
References: <1540543709-35959-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch enables cmt0 support on the iWave iwg23s sbc.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index 518b0c0..6277571 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -73,6 +73,10 @@
 	};
 };
 
+&cmt0 {
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
-- 
2.7.4
