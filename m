Return-Path: <SRS0=gYPT=OI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:42986 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727608AbeK2WBU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 29 Nov 2018 17:01:20 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/6] soc: renesas: r8a77970-sysc: Correct names of A2DP/A2CN power domains
Date: Thu, 29 Nov 2018 11:56:16 +0100
Message-Id: <20181129105619.10695-4-geert+renesas@glider.be>
In-Reply-To: <20181129105619.10695-1-geert+renesas@glider.be>
References: <20181129105619.10695-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
renamed the A2IR2 and A2IR3 power domains on R-Car V3M to A2DP resp.
A2CN.

As these definitions are not yet used from DT, they can just be renamed.

While at it, fix the indentation of the A3IR definition.

Fixes: 833bdb47c826a1a6 ("dt-bindings: power: add R8A77970 SYSC power domain definitions")
Fixes: bab9b2a74fe9da96 ("soc: renesas: rcar-sysc: add R8A77970 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/r8a77970-sysc.c       | 4 ++--
 include/dt-bindings/power/r8a77970-sysc.h | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/renesas/r8a77970-sysc.c b/drivers/soc/renesas/r8a77970-sysc.c
index 2c6d76490ca096ca..280c48b80f240424 100644
--- a/drivers/soc/renesas/r8a77970-sysc.c
+++ b/drivers/soc/renesas/r8a77970-sysc.c
@@ -23,8 +23,8 @@ static const struct rcar_sysc_area r8a77970_areas[] __initconst = {
 	{ "a3ir",	0x180, 0, R8A77970_PD_A3IR,	R8A77970_PD_ALWAYS_ON },
 	{ "a2ir0",	0x400, 0, R8A77970_PD_A2IR0,	R8A77970_PD_A3IR },
 	{ "a2ir1",	0x400, 1, R8A77970_PD_A2IR1,	R8A77970_PD_A3IR },
-	{ "a2ir2",	0x400, 2, R8A77970_PD_A2IR2,	R8A77970_PD_A3IR },
-	{ "a2ir3",	0x400, 3, R8A77970_PD_A2IR3,	R8A77970_PD_A3IR },
+	{ "a2dp",	0x400, 2, R8A77970_PD_A2DP,	R8A77970_PD_A3IR },
+	{ "a2cn",	0x400, 3, R8A77970_PD_A2CN,	R8A77970_PD_A3IR },
 	{ "a2sc0",	0x400, 4, R8A77970_PD_A2SC0,	R8A77970_PD_A3IR },
 	{ "a2sc1",	0x400, 5, R8A77970_PD_A2SC1,	R8A77970_PD_A3IR },
 };
diff --git a/include/dt-bindings/power/r8a77970-sysc.h b/include/dt-bindings/power/r8a77970-sysc.h
index 5c1ef1398b704ab5..85cc5f23cf9f8e72 100644
--- a/include/dt-bindings/power/r8a77970-sysc.h
+++ b/include/dt-bindings/power/r8a77970-sysc.h
@@ -18,10 +18,10 @@
 #define R8A77970_PD_CA53_CPU1		 6
 #define R8A77970_PD_CA53_SCU		21
 #define R8A77970_PD_A2IR0		23
-#define R8A77970_PD_A3IR			24
+#define R8A77970_PD_A3IR		24
 #define R8A77970_PD_A2IR1		27
-#define R8A77970_PD_A2IR2		28
-#define R8A77970_PD_A2IR3		29
+#define R8A77970_PD_A2DP		28
+#define R8A77970_PD_A2CN		29
 #define R8A77970_PD_A2SC0		30
 #define R8A77970_PD_A2SC1		31
 
-- 
2.17.1
