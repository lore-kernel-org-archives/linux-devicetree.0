From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] soc: renesas: Identify RZ/G1N
Date: Fri, 10 Mar 2017 14:48:30 +0100
Message-ID: <1489153710-8159-5-git-send-email-geert+renesas@glider.be>
References: <1489153710-8159-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1489153710-8159-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add support for identifying the RZ/G1N (r8a7744) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/renesas-soc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index f0172e59c0402d10..b894cf64225b31ac 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -90,6 +90,11 @@ static const struct renesas_soc soc_rz_g1m __initconst __maybe_unused = {
 	.id	= 0x47,
 };
 
+static const struct renesas_soc soc_rz_g1n __initconst __maybe_unused = {
+	.family	= &fam_rzg,
+	.id	= 0x4b,
+};
+
 static const struct renesas_soc soc_rz_g1e __initconst __maybe_unused = {
 	.family	= &fam_rzg,
 	.id	= 0x4c,
@@ -161,6 +166,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R8A7743
 	{ .compatible = "renesas,r8a7743",	.data = &soc_rz_g1m },
 #endif
+#ifdef CONFIG_ARCH_R8A7744
+	{ .compatible = "renesas,r8a7744",	.data = &soc_rz_g1n },
+#endif
 #ifdef CONFIG_ARCH_R8A7745
 	{ .compatible = "renesas,r8a7745",	.data = &soc_rz_g1e },
 #endif
-- 
2.7.4
