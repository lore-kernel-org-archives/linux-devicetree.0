Return-Path: <SRS0=gYPT=OI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:42970 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbeK2WBV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 29 Nov 2018 17:01:21 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/6] soc: renesas: r8a77980-sysc: Correct A3VIP[012] power domain hierarchy
Date: Thu, 29 Nov 2018 11:56:18 +0100
Message-Id: <20181129105619.10695-6-geert+renesas@glider.be>
In-Reply-To: <20181129105619.10695-1-geert+renesas@glider.be>
References: <20181129105619.10695-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
renamed the A3VIP power domain on R-Car V3H to A3VIP0, and clarified the
power domain hierarchy for the A3VIP[012] power domains.

As the definition for the A3VIP0 domain is not yet used from DT, it can
just be renamed.

Fixes: 7755b40d07a8dba7 ("dt-bindings: power: add R8A77980 SYSC power domain definitions")
Fixes: 41d6d8bd8ae94ca9 ("soc: renesas: rcar-sysc: add R8A77980 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/r8a77980-sysc.c       | 6 +++---
 include/dt-bindings/power/r8a77980-sysc.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/renesas/r8a77980-sysc.c b/drivers/soc/renesas/r8a77980-sysc.c
index dbb2621ce4e3ea18..a8dbe55e8ba82d7e 100644
--- a/drivers/soc/renesas/r8a77980-sysc.c
+++ b/drivers/soc/renesas/r8a77980-sysc.c
@@ -41,9 +41,9 @@ static const struct rcar_sysc_area r8a77980_areas[] __initconst = {
 	{ "a2dp0",	0x400, 11, R8A77980_PD_A2DP0,	R8A77980_PD_A3IR },
 	{ "a2dp1",	0x400, 12, R8A77980_PD_A2DP1,	R8A77980_PD_A3IR },
 	{ "a2cn",	0x400, 13, R8A77980_PD_A2CN,	R8A77980_PD_A3IR },
-	{ "a3vip",	0x2c0, 0, R8A77980_PD_A3VIP,	R8A77980_PD_ALWAYS_ON },
-	{ "a3vip1",	0x300, 0, R8A77980_PD_A3VIP1,	R8A77980_PD_A3VIP },
-	{ "a3vip2",	0x280, 0, R8A77980_PD_A3VIP2,	R8A77980_PD_A3VIP },
+	{ "a3vip0",	0x2c0, 0, R8A77980_PD_A3VIP0,	R8A77980_PD_ALWAYS_ON },
+	{ "a3vip1",	0x300, 0, R8A77980_PD_A3VIP1,	R8A77980_PD_ALWAYS_ON },
+	{ "a3vip2",	0x280, 0, R8A77980_PD_A3VIP2,	R8A77980_PD_ALWAYS_ON },
 };
 
 const struct rcar_sysc_info r8a77980_sysc_info __initconst = {
diff --git a/include/dt-bindings/power/r8a77980-sysc.h b/include/dt-bindings/power/r8a77980-sysc.h
index 7bebe7e8dbdbb68e..e12c8587b87ec8d5 100644
--- a/include/dt-bindings/power/r8a77980-sysc.h
+++ b/include/dt-bindings/power/r8a77980-sysc.h
@@ -22,7 +22,7 @@
 #define R8A77980_PD_CA53_CPU2		7
 #define R8A77980_PD_CA53_CPU3		8
 #define R8A77980_PD_A2CN		10
-#define R8A77980_PD_A3VIP		11
+#define R8A77980_PD_A3VIP0		11
 #define R8A77980_PD_A2IR5		12
 #define R8A77980_PD_CR7			13
 #define R8A77980_PD_A2IR4		15
-- 
2.17.1
