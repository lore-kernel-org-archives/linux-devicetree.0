From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/9] soc: brcmstb: biuctrl: Wire-up new registers
Date: Wed, 29 Nov 2017 12:18:46 -0800
Message-ID: <20171129201849.17522-7-f.fainelli@gmail.com>
References: <20171129201849.17522-1-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171129201849.17522-1-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add definitions for B53 systems register: CPU_MCP_FLOW_REG and
CPU_WRITEBACK_CTRL_REG. These register will be saved and restored
accordingly.

Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/soc/bcm/brcmstb/biuctrl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/bcm/brcmstb/biuctrl.c b/drivers/soc/bcm/brcmstb/biuctrl.c
index 16cbfc2e953a..d498f9db01ab 100644
--- a/drivers/soc/bcm/brcmstb/biuctrl.c
+++ b/drivers/soc/bcm/brcmstb/biuctrl.c
@@ -49,17 +49,23 @@ static inline void cbc_writel(u32 val, int reg)
 
 enum cpubiuctrl_regs {
 	CPU_CREDIT_REG = 0,
+	CPU_MCP_FLOW_REG,
+	CPU_WRITEBACK_CTRL_REG
 };
 
 static const int b15_cpubiuctrl_regs[] = {
 	[CPU_CREDIT_REG] = 0x184,
+	[CPU_MCP_FLOW_REG] = -1,
+	[CPU_WRITEBACK_CTRL_REG] = -1,
 };
 
 static const int b53_cpubiuctrl_regs[] = {
 	[CPU_CREDIT_REG] = 0x0b0,
+	[CPU_MCP_FLOW_REG] = 0x0b4,
+	[CPU_WRITEBACK_CTRL_REG] = 0x22c,
 };
 
-#define NUM_CPU_BIUCTRL_REGS	1
+#define NUM_CPU_BIUCTRL_REGS	3
 
 static int __init mcp_write_pairing_set(void)
 {
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
