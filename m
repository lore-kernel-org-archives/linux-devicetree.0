Return-Path: <SRS0=gYPT=OI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:34552 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727221AbeK2WBU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 29 Nov 2018 17:01:20 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/6] soc: renesas: r8a77980-sysc: Correct names of A2DP[01] power domains
Date: Thu, 29 Nov 2018 11:56:17 +0100
Message-Id: <20181129105619.10695-5-geert+renesas@glider.be>
In-Reply-To: <20181129105619.10695-1-geert+renesas@glider.be>
References: <20181129105619.10695-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
renamed the A2PD0 and A2DP0 power domains on R-Car V3H to A2DP0 resp.
A2DP1.

As these definitions are not yet used from DT, they can just be renamed.

Fixes: 7755b40d07a8dba7 ("dt-bindings: power: add R8A77980 SYSC power domain definitions")
Fixes: 41d6d8bd8ae94ca9 ("soc: renesas: rcar-sysc: add R8A77980 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/r8a77980-sysc.c       | 4 ++--
 include/dt-bindings/power/r8a77980-sysc.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/renesas/r8a77980-sysc.c b/drivers/soc/renesas/r8a77980-sysc.c
index 9265fb525ef34228..dbb2621ce4e3ea18 100644
--- a/drivers/soc/renesas/r8a77980-sysc.c
+++ b/drivers/soc/renesas/r8a77980-sysc.c
@@ -38,8 +38,8 @@ static const struct rcar_sysc_area r8a77980_areas[] __initconst = {
 	{ "a2sc2",	0x400, 8, R8A77980_PD_A2SC2,	R8A77980_PD_A3IR },
 	{ "a2sc3",	0x400, 9, R8A77980_PD_A2SC3,	R8A77980_PD_A3IR },
 	{ "a2sc4",	0x400, 10, R8A77980_PD_A2SC4,	R8A77980_PD_A3IR },
-	{ "a2pd0",	0x400, 11, R8A77980_PD_A2PD0,	R8A77980_PD_A3IR },
-	{ "a2pd1",	0x400, 12, R8A77980_PD_A2PD1,	R8A77980_PD_A3IR },
+	{ "a2dp0",	0x400, 11, R8A77980_PD_A2DP0,	R8A77980_PD_A3IR },
+	{ "a2dp1",	0x400, 12, R8A77980_PD_A2DP1,	R8A77980_PD_A3IR },
 	{ "a2cn",	0x400, 13, R8A77980_PD_A2CN,	R8A77980_PD_A3IR },
 	{ "a3vip",	0x2c0, 0, R8A77980_PD_A3VIP,	R8A77980_PD_ALWAYS_ON },
 	{ "a3vip1",	0x300, 0, R8A77980_PD_A3VIP1,	R8A77980_PD_A3VIP },
diff --git a/include/dt-bindings/power/r8a77980-sysc.h b/include/dt-bindings/power/r8a77980-sysc.h
index 2c90c12377253e5f..7bebe7e8dbdbb68e 100644
--- a/include/dt-bindings/power/r8a77980-sysc.h
+++ b/include/dt-bindings/power/r8a77980-sysc.h
@@ -15,8 +15,8 @@
 #define R8A77980_PD_A2SC2		0
 #define R8A77980_PD_A2SC3		1
 #define R8A77980_PD_A2SC4		2
-#define R8A77980_PD_A2PD0		3
-#define R8A77980_PD_A2PD1		4
+#define R8A77980_PD_A2DP0		3
+#define R8A77980_PD_A2DP1		4
 #define R8A77980_PD_CA53_CPU0		5
 #define R8A77980_PD_CA53_CPU1		6
 #define R8A77980_PD_CA53_CPU2		7
-- 
2.17.1
