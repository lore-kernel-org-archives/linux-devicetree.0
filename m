From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/2] of: irq: Fix interrupt-map entry matching
Date: Tue, 05 Nov 2013 16:21:18 +0100
Message-ID: <2713030.RoDxNQo0oz@amdc1227>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
 <20131104050455.GA3651@quad.lixom.net> <2177804.l4VGDTRFDu@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <2177804.l4VGDTRFDu@amdc1227>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch fixes interrupt-map entry matching code to properly match all
specifier cells with interrupt map entries.

Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/of/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 0ed5ed4..717eed4 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -195,7 +195,7 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
 			/* Compare specifiers */
 			match = 1;
 			for (i = 0; i < (addrsize + intsize); i++, imaplen--)
-				match = !((match_array[i] ^ *imap++) & imask[i]);
+				match &= !((match_array[i] ^ *imap++) & imask[i]);
 
 			pr_debug(" -> match=%d (imaplen=%d)\n", match, imaplen);
 
-- 
1.8.4.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
