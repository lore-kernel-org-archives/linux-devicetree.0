Return-Path: <SRS0=UBGr=S3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:23752 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfDYBZ0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 24 Apr 2019 21:25:26 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH v2 1/5] clk: renesas: r8a779{5|6|65}: Add TPU clock
Date: Thu, 25 Apr 2019 10:25:13 +0900
Message-Id: <1556155517-5054-2-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au, geert+renesas@glider.be, broonie@kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

This patch adds TPU clock to R-car r8a7795/r8a7796/r8a77965 Socs.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 1 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 9e9a6f2..28522c1 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -138,6 +138,7 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("cmt2",			 301,	R8A7795_CLK_R),
 	DEF_MOD("cmt1",			 302,	R8A7795_CLK_R),
 	DEF_MOD("cmt0",			 303,	R8A7795_CLK_R),
+	DEF_MOD("tpu0",			 304,	R8A7795_CLK_S3D4),
 	DEF_MOD("scif2",		 310,	R8A7795_CLK_S3D4),
 	DEF_MOD("sdif3",		 311,	R8A7795_CLK_SD3),
 	DEF_MOD("sdif2",		 312,	R8A7795_CLK_SD2),
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index d8e9af5..e4f5db4 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -134,6 +134,7 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("cmt2",			 301,	R8A7796_CLK_R),
 	DEF_MOD("cmt1",			 302,	R8A7796_CLK_R),
 	DEF_MOD("cmt0",			 303,	R8A7796_CLK_R),
+	DEF_MOD("tpu0",			 304,	R8A7796_CLK_S3D4),
 	DEF_MOD("scif2",		 310,	R8A7796_CLK_S3D4),
 	DEF_MOD("sdif3",		 311,	R8A7796_CLK_SD3),
 	DEF_MOD("sdif2",		 312,	R8A7796_CLK_SD2),
diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index 8f87e31..46d5a50 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -132,6 +132,7 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 	DEF_MOD("cmt2",			301,	R8A77965_CLK_R),
 	DEF_MOD("cmt1",			302,	R8A77965_CLK_R),
 	DEF_MOD("cmt0",			303,	R8A77965_CLK_R),
+	DEF_MOD("tpu0",			304,	R8A77965_CLK_S3D4),
 	DEF_MOD("scif2",		310,	R8A77965_CLK_S3D4),
 	DEF_MOD("sdif3",		311,	R8A77965_CLK_SD3),
 	DEF_MOD("sdif2",		312,	R8A77965_CLK_SD2),
-- 
2.7.4
