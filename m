Return-Path: <SRS0=gYPT=OI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:42950 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727402AbeK2WBU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 29 Nov 2018 17:01:20 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/6] soc: renesas: r8a77965-sysc: Remove non-existent A3IR power domain
Date: Thu, 29 Nov 2018 11:56:14 +0100
Message-Id: <20181129105619.10695-2-geert+renesas@glider.be>
In-Reply-To: <20181129105619.10695-1-geert+renesas@glider.be>
References: <20181129105619.10695-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
removed the A3IR power domain on R-Car M3-N, as this SoC does not have
an Image Processing Unit (IMP-X5).

The definition in the DT bindings header cannot be removed yet, until
its (incorrect) user has been removed.

Fixes: a527709b78b3c997 ("soc: renesas: rcar-sysc: Add R-Car M3-N support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/r8a77965-sysc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/renesas/r8a77965-sysc.c b/drivers/soc/renesas/r8a77965-sysc.c
index d7f7928e3c071b45..e0533beb50fd7063 100644
--- a/drivers/soc/renesas/r8a77965-sysc.c
+++ b/drivers/soc/renesas/r8a77965-sysc.c
@@ -28,7 +28,6 @@ static const struct rcar_sysc_area r8a77965_areas[] __initconst = {
 	{ "a2vc1",	0x3c0, 1, R8A77965_PD_A2VC1,	R8A77965_PD_A3VC },
 	{ "3dg-a",	0x100, 0, R8A77965_PD_3DG_A,	R8A77965_PD_ALWAYS_ON },
 	{ "3dg-b",	0x100, 1, R8A77965_PD_3DG_B,	R8A77965_PD_3DG_A },
-	{ "a3ir",	0x180, 0, R8A77965_PD_A3IR,	R8A77965_PD_ALWAYS_ON },
 };
 
 const struct rcar_sysc_info r8a77965_sysc_info __initconst = {
-- 
2.17.1
