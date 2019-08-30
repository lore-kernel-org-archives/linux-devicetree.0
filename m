Return-Path: <SRS0=BZiw=W2=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: hihope-common: Fix eMMC status
Date: Fri, 30 Aug 2019 14:15:35 +0100
Message-Id: <1567170935-19186-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, xu_shunji@hoperun.com
List-ID: <devicetree@vger.kernel.org>

SDHI3 got accidentally disabled while adding USB 2.0 support,
this patch fixes it.

Fixes: 734d277f412a ("arm64: dts: renesas: hihope-common: Add USB 2.0 support")
Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index e1b95c3..3e376d2 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -404,6 +404,7 @@
 	mmc-hs200-1_8v;
 	non-removable;
 	fixed-emmc-driver-type = <1>;
+	status = "okay";
 };
 
 &usb_extal_clk {
-- 
2.7.4
