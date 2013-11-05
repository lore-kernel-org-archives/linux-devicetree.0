From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 2/2] of: irq: Check for reg property presence only when parsing
 interrupt-map
Date: Tue, 05 Nov 2013 16:21:36 +0100
Message-ID: <11085147.qYFvaZYATK@amdc1227>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
 <20131104050455.GA3651@quad.lixom.net> <2177804.l4VGDTRFDu@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <2177804.l4VGDTRFDu@amdc1227>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

This patch fixes the of_irq_parse_raw() function to check for reg
property only when really parsing interrupt map property, as it is not
required otherwise and breaks existing device trees.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 drivers/of/irq.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 717eed4..72e9c51 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -147,17 +147,8 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
 
 	pr_debug(" -> addrsize=%d\n", addrsize);
 
-	/* If we were passed no "reg" property and we attempt to parse
-	 * an interrupt-map, then #address-cells must be 0.
-	 * Fail if it's not.
-	 */
-	if (addr == NULL && addrsize != 0) {
-		pr_debug(" -> no reg passed in when needed !\n");
-		return -EINVAL;
-	}
-
 	/* Precalculate the match array - this simplifies match loop */
-	for (i = 0; i < addrsize; i++)
+	for (i = 0; i < addrsize && addr; i++)
 		initial_match_array[i] = addr[i];
 	for (i = 0; i < intsize; i++)
 		initial_match_array[addrsize + i] = cpu_to_be32(out_irq->args[i]);
@@ -184,6 +175,16 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
 		}
 		imaplen /= sizeof(u32);
 
+		/*
+		 * If we were passed no "reg" property and we attempt to parse
+		 * an interrupt-map, then #address-cells must be 0.
+		 * Fail if it's not.
+		 */
+		if (addr == NULL && addrsize != 0) {
+			pr_debug(" -> no reg passed in when needed !\n");
+			return -EINVAL;
+		}
+
 		/* Look for a mask */
 		imask = of_get_property(ipar, "interrupt-map-mask", NULL);
 		if (!imask)
-- 
1.8.4.2
