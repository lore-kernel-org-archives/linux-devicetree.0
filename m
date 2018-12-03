Return-Path: <SRS0=so6l=OM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:43132 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbeLCPMw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Dec 2018 10:12:52 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a7796: salvator-xs: Convert to new LVDS DT bindings
Date: Mon,  3 Dec 2018 16:12:42 +0100
Message-Id: <20181203151242.25875-3-geert+renesas@glider.be>
In-Reply-To: <20181203151242.25875-1-geert+renesas@glider.be>
References: <20181203151242.25875-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

As of commit 6d2ca85279becdff ("dt-bindings: display: renesas: Deprecate
LVDS support in the DU bindings"), the internal LVDS encoder has DT
bindings separate from the DU.  The device trees for all R-Car H3 and
M3-W development boards were ported over to the new model, but
Salvator-XS boards equipped with an R-Car M3-W SoC were forgotten.

Fixes: 58e8ed2ee9abe718 ("arm64: dts: renesas: Convert to new LVDS DT bindings")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
index 8860be65342e4f38..31f12059355ee02b 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
@@ -29,11 +29,10 @@
 	clocks = <&cpg CPG_MOD 724>,
 		 <&cpg CPG_MOD 723>,
 		 <&cpg CPG_MOD 722>,
-		 <&cpg CPG_MOD 727>,
 		 <&versaclock6 1>,
 		 <&x21_clk>,
 		 <&versaclock6 2>;
-	clock-names = "du.0", "du.1", "du.2", "lvds.0",
+	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
 
-- 
2.17.1
