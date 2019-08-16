From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V6 1/4] clocksource: imx-sysctr: Add internal clock divider handle
Date: Thu, 15 Aug 2019 20:38:42 -0400
Message-ID: <1565915925-21009-1-git-send-email-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, daniel.lezcano@linaro.org, tglx@linutronix.de, leonard.crestez@nxp.com, daniel.baluta@nxp.com, ping.bai@nxp.com, jun.li@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, ccaione@baylibre.com, andrew.smirnov@gmail.com, angus@akkea.ca, agx@sigxcpu.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

The system counter block guide states that the base clock is
internally divided by 3 before use, that means the clock input of
system counter defined in DT should be base clock which is normally
from OSC, and then internally divided by 3 before use.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No changes.
---
 drivers/clocksource/timer-imx-sysctr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clocksource/timer-imx-sysctr.c b/drivers/clocksource/timer-imx-sysctr.c
index fd7d680..b7c80a3 100644
--- a/drivers/clocksource/timer-imx-sysctr.c
+++ b/drivers/clocksource/timer-imx-sysctr.c
@@ -20,6 +20,8 @@
 #define SYS_CTR_EN		0x1
 #define SYS_CTR_IRQ_MASK	0x2
 
+#define SYS_CTR_CLK_DIV		0x3
+
 static void __iomem *sys_ctr_base;
 static u32 cmpcr;
 
@@ -134,6 +136,9 @@ static int __init sysctr_timer_init(struct device_node *np)
 	if (ret)
 		return ret;
 
+	/* system counter clock is divided by 3 internally */
+	to_sysctr.of_clk.rate /= SYS_CTR_CLK_DIV;
+
 	sys_ctr_base = timer_of_base(&to_sysctr);
 	cmpcr = readl(sys_ctr_base + CMPCR);
 	cmpcr &= ~SYS_CTR_EN;
-- 
2.7.4
