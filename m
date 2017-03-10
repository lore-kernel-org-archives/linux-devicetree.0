From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] soc: renesas: Identify RZ/G1H
Date: Fri, 10 Mar 2017 14:48:29 +0100
Message-ID: <1489153710-8159-4-git-send-email-geert+renesas@glider.be>
References: <1489153710-8159-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1489153710-8159-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add support for identifying the RZ/G1H (r8a7742) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/renesas-soc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 330960312296f603..f0172e59c0402d10 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -80,6 +80,11 @@ static const struct renesas_soc soc_rmobile_a1 __initconst __maybe_unused = {
 	.id	= 0x40,
 };
 
+static const struct renesas_soc soc_rz_g1h __initconst __maybe_unused = {
+	.family	= &fam_rzg,
+	.id	= 0x45,
+};
+
 static const struct renesas_soc soc_rz_g1m __initconst __maybe_unused = {
 	.family	= &fam_rzg,
 	.id	= 0x47,
@@ -150,6 +155,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R8A7740
 	{ .compatible = "renesas,r8a7740",	.data = &soc_rmobile_a1 },
 #endif
+#ifdef CONFIG_ARCH_R8A7742
+	{ .compatible = "renesas,r8a7742",	.data = &soc_rz_g1h },
+#endif
 #ifdef CONFIG_ARCH_R8A7743
 	{ .compatible = "renesas,r8a7743",	.data = &soc_rz_g1m },
 #endif
-- 
2.7.4
