From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v3, 2/9] ptp_qoriq: make ptp operations global
Date: Tue, 12 Feb 2019 12:23:57 +0800
Message-ID: <20190212042404.15575-3-yangbo.lu@nxp.com>
References: <20190212042404.15575-1-yangbo.lu@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190212042404.15575-1-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch is to make functions of ptp operations global,
so that ENETC PTP driver which is a PCI driver for same
1588 timer IP block could reuse them.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
Changes for v2:
	- None.
Changes for v3:
	- None.
---
 drivers/ptp/ptp_qoriq.c       |   27 ++++++++++++++++-----------
 include/linux/fsl/ptp_qoriq.h |    9 +++++++++
 2 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/ptp/ptp_qoriq.c b/drivers/ptp/ptp_qoriq.c
index 8c10d0f..1f3e73e 100644
--- a/drivers/ptp/ptp_qoriq.c
+++ b/drivers/ptp/ptp_qoriq.c
@@ -22,7 +22,6 @@
 
 #include <linux/device.h>
 #include <linux/hrtimer.h>
-#include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -135,7 +134,7 @@ static int extts_clean_up(struct ptp_qoriq *ptp_qoriq, int index,
  * Interrupt service routine
  */
 
-static irqreturn_t isr(int irq, void *priv)
+irqreturn_t ptp_qoriq_isr(int irq, void *priv)
 {
 	struct ptp_qoriq *ptp_qoriq = priv;
 	struct ptp_qoriq_registers *regs = &ptp_qoriq->regs;
@@ -200,12 +199,13 @@ static irqreturn_t isr(int irq, void *priv)
 	} else
 		return IRQ_NONE;
 }
+EXPORT_SYMBOL_GPL(ptp_qoriq_isr);
 
 /*
  * PTP clock operations
  */
 
-static int ptp_qoriq_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
+int ptp_qoriq_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
 {
 	u64 adj, diff;
 	u32 tmr_add;
@@ -233,8 +233,9 @@ static int ptp_qoriq_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ptp_qoriq_adjfine);
 
-static int ptp_qoriq_adjtime(struct ptp_clock_info *ptp, s64 delta)
+int ptp_qoriq_adjtime(struct ptp_clock_info *ptp, s64 delta)
 {
 	s64 now;
 	unsigned long flags;
@@ -251,9 +252,9 @@ static int ptp_qoriq_adjtime(struct ptp_clock_info *ptp, s64 delta)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ptp_qoriq_adjtime);
 
-static int ptp_qoriq_gettime(struct ptp_clock_info *ptp,
-			       struct timespec64 *ts)
+int ptp_qoriq_gettime(struct ptp_clock_info *ptp, struct timespec64 *ts)
 {
 	u64 ns;
 	unsigned long flags;
@@ -269,9 +270,10 @@ static int ptp_qoriq_gettime(struct ptp_clock_info *ptp,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ptp_qoriq_gettime);
 
-static int ptp_qoriq_settime(struct ptp_clock_info *ptp,
-			       const struct timespec64 *ts)
+int ptp_qoriq_settime(struct ptp_clock_info *ptp,
+		      const struct timespec64 *ts)
 {
 	u64 ns;
 	unsigned long flags;
@@ -288,9 +290,10 @@ static int ptp_qoriq_settime(struct ptp_clock_info *ptp,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ptp_qoriq_settime);
 
-static int ptp_qoriq_enable(struct ptp_clock_info *ptp,
-			      struct ptp_clock_request *rq, int on)
+int ptp_qoriq_enable(struct ptp_clock_info *ptp,
+		     struct ptp_clock_request *rq, int on)
 {
 	struct ptp_qoriq *ptp_qoriq = container_of(ptp, struct ptp_qoriq, caps);
 	struct ptp_qoriq_registers *regs = &ptp_qoriq->regs;
@@ -336,6 +339,7 @@ static int ptp_qoriq_enable(struct ptp_clock_info *ptp,
 	spin_unlock_irqrestore(&ptp_qoriq->lock, flags);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ptp_qoriq_enable);
 
 static const struct ptp_clock_info ptp_qoriq_caps = {
 	.owner		= THIS_MODULE,
@@ -508,7 +512,8 @@ static int ptp_qoriq_probe(struct platform_device *dev)
 		pr_err("irq not in device tree\n");
 		goto no_node;
 	}
-	if (request_irq(ptp_qoriq->irq, isr, IRQF_SHARED, DRIVER, ptp_qoriq)) {
+	if (request_irq(ptp_qoriq->irq, ptp_qoriq_isr, IRQF_SHARED,
+			DRIVER, ptp_qoriq)) {
 		pr_err("request_irq failed\n");
 		goto no_node;
 	}
diff --git a/include/linux/fsl/ptp_qoriq.h b/include/linux/fsl/ptp_qoriq.h
index c2a32d9..75e6f05 100644
--- a/include/linux/fsl/ptp_qoriq.h
+++ b/include/linux/fsl/ptp_qoriq.h
@@ -7,6 +7,7 @@
 #define __PTP_QORIQ_H__
 
 #include <linux/io.h>
+#include <linux/interrupt.h>
 #include <linux/ptp_clock_kernel.h>
 
 /*
@@ -171,6 +172,14 @@ static inline void qoriq_write(unsigned __iomem *addr, u32 val)
 	iowrite32be(val, addr);
 }
 
+irqreturn_t ptp_qoriq_isr(int irq, void *priv);
+int ptp_qoriq_adjfine(struct ptp_clock_info *ptp, long scaled_ppm);
+int ptp_qoriq_adjtime(struct ptp_clock_info *ptp, s64 delta);
+int ptp_qoriq_gettime(struct ptp_clock_info *ptp, struct timespec64 *ts);
+int ptp_qoriq_settime(struct ptp_clock_info *ptp,
+		      const struct timespec64 *ts);
+int ptp_qoriq_enable(struct ptp_clock_info *ptp,
+		     struct ptp_clock_request *rq, int on);
 #ifdef CONFIG_DEBUG_FS
 void ptp_qoriq_create_debugfs(struct ptp_qoriq *ptp_qoriq);
 void ptp_qoriq_remove_debugfs(struct ptp_qoriq *ptp_qoriq);
-- 
1.7.1
