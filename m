From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] soc: renesas: Identify R-Car M3-W ES1.1
Date: Mon, 30 Oct 2017 18:29:58 +0100
Message-ID: <1509384599-28953-3-git-send-email-geert+renesas@glider.be>
References: <1509384599-28953-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1509384599-28953-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The Product Register of R-Car M3-W ES1.1 incorrectly identifies the SoC
revision as ES2.0.  Add a workaround to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Is it already known how future revisions will be identified?
---
 drivers/soc/renesas/renesas-soc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index f8389ed2249f9816..5c7f920ff060957a 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -293,6 +293,9 @@ static int __init renesas_soc_init(void)
 	if (chipid) {
 		product = readl(chipid);
 		iounmap(chipid);
+		/* R-Car M3-W ES1.1 incorrectly identifies as ES2.0 */
+		if ((product & 0x7fff) == 0x5210)
+			product ^= 0x11;
 		if (soc->id && ((product >> 8) & 0xff) != soc->id) {
 			pr_warn("SoC mismatch (product = 0x%x)\n", product);
 			return -ENODEV;
-- 
2.7.4
