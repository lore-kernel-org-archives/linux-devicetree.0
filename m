From: Markus Mayer <code-7CzEARzsJhSsTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/2] memory: brcmstb: dpfe: introduce is_dcpu_enabled()
Date: Mon,  2 Oct 2017 16:13:46 -0700
Message-ID: <20171002231347.8671-2-code@mmayer.net>
References: <20171002231347.8671-1-code@mmayer.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171002231347.8671-1-code-7CzEARzsJhSsTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Broadcom Kernel List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

In order to check whether or not the DCPU is running, we introduce
a function called is_dcpu_enabled().

Signed-off-by: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 drivers/memory/brcmstb_dpfe.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/brcmstb_dpfe.c b/drivers/memory/brcmstb_dpfe.c
index 21242c4..3516ee8 100644
--- a/drivers/memory/brcmstb_dpfe.c
+++ b/drivers/memory/brcmstb_dpfe.c
@@ -202,17 +202,26 @@ static const u32 dpfe_commands[DPFE_CMD_MAX][MSG_FIELD_MAX] = {
 	},
 };
 
+static bool is_dcpu_enabled(void __iomem *regs)
+{
+	u32 val;
+
+	val = readl_relaxed(regs + REG_DCPU_RESET);
+
+	return !(val & DCPU_RESET_MASK);
+}
+
 static void __disable_dcpu(void __iomem *regs)
 {
 	u32 val;
 
-	/* Check if DCPU is running */
+	if (!is_dcpu_enabled(regs))
+		return;
+
+	/* Put DCPU in reset if it's running. */
 	val = readl_relaxed(regs + REG_DCPU_RESET);
-	if (!(val & DCPU_RESET_MASK)) {
-		/* Put DCPU in reset */
-		val |= (1 << DCPU_RESET_SHIFT);
-		writel_relaxed(val, regs + REG_DCPU_RESET);
-	}
+	val |= (1 << DCPU_RESET_SHIFT);
+	writel_relaxed(val, regs + REG_DCPU_RESET);
 }
 
 static void __enable_dcpu(void __iomem *regs)
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
