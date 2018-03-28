From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V2 3/4] clocksource/drivers/imx-tpm: correct some registers operation flow
Date: Wed, 28 Mar 2018 11:22:37 +0800
Message-ID: <1522207358-8388-3-git-send-email-Anson.Huang@nxp.com>
References: <1522207358-8388-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522207358-8388-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Linux-imx@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

According to i.MX7ULP reference manual, TPM_SC_CPWMS can ONLY be
written when counter is disabled, TPM_SC_TOF is write-1-clear,
TPM_C0SC_CHF is also write-1-clear, correct these registers
initialization flow;

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
changes since V1:
	use separate patch to fix the clock name typo.
 drivers/clocksource/timer-imx-tpm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-imx-tpm.c b/drivers/clocksource/timer-imx-tpm.c
index 3f97d49..7403e49 100644
--- a/drivers/clocksource/timer-imx-tpm.c
+++ b/drivers/clocksource/timer-imx-tpm.c
@@ -20,6 +20,7 @@
 #define TPM_SC				0x10
 #define TPM_SC_CMOD_INC_PER_CNT		(0x1 << 3)
 #define TPM_SC_CMOD_DIV_DEFAULT		0x3
+#define TPM_SC_TOF_MASK			(0x1 << 7)
 #define TPM_CNT				0x14
 #define TPM_MOD				0x18
 #define TPM_STATUS			0x1c
@@ -29,6 +30,7 @@
 #define TPM_C0SC_MODE_SHIFT		2
 #define TPM_C0SC_MODE_MASK		0x3c
 #define TPM_C0SC_MODE_SW_COMPARE	0x4
+#define TPM_C0SC_CHF_MASK		(0x1 << 7)
 #define TPM_C0V				0x24
 
 static void __iomem *timer_base;
@@ -205,9 +207,13 @@ static int __init tpm_timer_init(struct device_node *np)
 	 * 4) Channel0 disabled
 	 * 5) DMA transfers disabled
 	 */
+	/* make sure counter is disabled */
 	writel(0, timer_base + TPM_SC);
+	/* TOF is W1C */
+	writel(TPM_SC_TOF_MASK, timer_base + TPM_SC);
 	writel(0, timer_base + TPM_CNT);
-	writel(0, timer_base + TPM_C0SC);
+	/* CHF is W1C */
+	writel(TPM_C0SC_CHF_MASK, timer_base + TPM_C0SC);
 
 	/* increase per cnt, div 8 by default */
 	writel(TPM_SC_CMOD_INC_PER_CNT | TPM_SC_CMOD_DIV_DEFAULT,
-- 
2.7.4
