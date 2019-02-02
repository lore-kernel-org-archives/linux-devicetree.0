From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v2, 4/9] ptp_qoriq: add little enadian support
Date: Sat,  2 Feb 2019 10:57:02 +0800
Message-ID: <20190202025707.10794-5-yangbo.lu@nxp.com>
References: <20190202025707.10794-1-yangbo.lu@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190202025707.10794-1-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

There is QorIQ 1588 timer IP block on the new ENETC Ethernet
controller. However it uses little endian mode which is different
with before. This patch is to add little endian support for the
driver by using "little-endian" dts node property.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
Changes for v2:
	- None.
---
 drivers/ptp/ptp_qoriq.c         |   69 ++++++++++++++++++++++-----------------
 drivers/ptp/ptp_qoriq_debugfs.c |   12 +++---
 include/linux/fsl/ptp_qoriq.h   |   21 ++++++++---
 3 files changed, 60 insertions(+), 42 deletions(-)

diff --git a/drivers/ptp/ptp_qoriq.c b/drivers/ptp/ptp_qoriq.c
index 63896b5..4308e25 100644
--- a/drivers/ptp/ptp_qoriq.c
+++ b/drivers/ptp/ptp_qoriq.c
@@ -43,8 +43,8 @@ static u64 tmr_cnt_read(struct ptp_qoriq *ptp_qoriq)
 	u64 ns;
 	u32 lo, hi;
 
-	lo = qoriq_read(&regs->ctrl_regs->tmr_cnt_l);
-	hi = qoriq_read(&regs->ctrl_regs->tmr_cnt_h);
+	lo = ptp_qoriq->read(&regs->ctrl_regs->tmr_cnt_l);
+	hi = ptp_qoriq->read(&regs->ctrl_regs->tmr_cnt_h);
 	ns = ((u64) hi) << 32;
 	ns |= lo;
 	return ns;
@@ -57,8 +57,8 @@ static void tmr_cnt_write(struct ptp_qoriq *ptp_qoriq, u64 ns)
 	u32 hi = ns >> 32;
 	u32 lo = ns & 0xffffffff;
 
-	qoriq_write(&regs->ctrl_regs->tmr_cnt_l, lo);
-	qoriq_write(&regs->ctrl_regs->tmr_cnt_h, hi);
+	ptp_qoriq->write(&regs->ctrl_regs->tmr_cnt_l, lo);
+	ptp_qoriq->write(&regs->ctrl_regs->tmr_cnt_h, hi);
 }
 
 /* Caller must hold ptp_qoriq->lock. */
@@ -73,8 +73,8 @@ static void set_alarm(struct ptp_qoriq *ptp_qoriq)
 	ns -= ptp_qoriq->tclk_period;
 	hi = ns >> 32;
 	lo = ns & 0xffffffff;
-	qoriq_write(&regs->alarm_regs->tmr_alarm1_l, lo);
-	qoriq_write(&regs->alarm_regs->tmr_alarm1_h, hi);
+	ptp_qoriq->write(&regs->alarm_regs->tmr_alarm1_l, lo);
+	ptp_qoriq->write(&regs->alarm_regs->tmr_alarm1_h, hi);
 }
 
 /* Caller must hold ptp_qoriq->lock. */
@@ -83,8 +83,8 @@ static void set_fipers(struct ptp_qoriq *ptp_qoriq)
 	struct ptp_qoriq_registers *regs = &ptp_qoriq->regs;
 
 	set_alarm(ptp_qoriq);
-	qoriq_write(&regs->fiper_regs->tmr_fiper1, ptp_qoriq->tmr_fiper1);
-	qoriq_write(&regs->fiper_regs->tmr_fiper2, ptp_qoriq->tmr_fiper2);
+	ptp_qoriq->write(&regs->fiper_regs->tmr_fiper1, ptp_qoriq->tmr_fiper1);
+	ptp_qoriq->write(&regs->fiper_regs->tmr_fiper2, ptp_qoriq->tmr_fiper2);
 }
 
 static int extts_clean_up(struct ptp_qoriq *ptp_qoriq, int index,
@@ -115,8 +115,8 @@ static int extts_clean_up(struct ptp_qoriq *ptp_qoriq, int index,
 	event.index = index;
 
 	do {
-		lo = qoriq_read(reg_etts_l);
-		hi = qoriq_read(reg_etts_h);
+		lo = ptp_qoriq->read(reg_etts_l);
+		hi = ptp_qoriq->read(reg_etts_h);
 
 		if (update_event) {
 			event.timestamp = ((u64) hi) << 32;
@@ -124,7 +124,7 @@ static int extts_clean_up(struct ptp_qoriq *ptp_qoriq, int index,
 			ptp_clock_event(ptp_qoriq->clock, &event);
 		}
 
-		stat = qoriq_read(&regs->ctrl_regs->tmr_stat);
+		stat = ptp_qoriq->read(&regs->ctrl_regs->tmr_stat);
 	} while (ptp_qoriq->extts_fifo_support && (stat & valid));
 
 	return 0;
@@ -144,8 +144,8 @@ irqreturn_t ptp_qoriq_isr(int irq, void *priv)
 
 	spin_lock(&ptp_qoriq->lock);
 
-	val = qoriq_read(&regs->ctrl_regs->tmr_tevent);
-	mask = qoriq_read(&regs->ctrl_regs->tmr_temask);
+	val = ptp_qoriq->read(&regs->ctrl_regs->tmr_tevent);
+	mask = ptp_qoriq->read(&regs->ctrl_regs->tmr_temask);
 
 	spin_unlock(&ptp_qoriq->lock);
 
@@ -173,14 +173,14 @@ irqreturn_t ptp_qoriq_isr(int irq, void *priv)
 			ns = ptp_qoriq->alarm_value + ptp_qoriq->alarm_interval;
 			hi = ns >> 32;
 			lo = ns & 0xffffffff;
-			qoriq_write(&regs->alarm_regs->tmr_alarm2_l, lo);
-			qoriq_write(&regs->alarm_regs->tmr_alarm2_h, hi);
+			ptp_qoriq->write(&regs->alarm_regs->tmr_alarm2_l, lo);
+			ptp_qoriq->write(&regs->alarm_regs->tmr_alarm2_h, hi);
 			ptp_qoriq->alarm_value = ns;
 		} else {
 			spin_lock(&ptp_qoriq->lock);
-			mask = qoriq_read(&regs->ctrl_regs->tmr_temask);
+			mask = ptp_qoriq->read(&regs->ctrl_regs->tmr_temask);
 			mask &= ~ALM2EN;
-			qoriq_write(&regs->ctrl_regs->tmr_temask, mask);
+			ptp_qoriq->write(&regs->ctrl_regs->tmr_temask, mask);
 			spin_unlock(&ptp_qoriq->lock);
 			ptp_qoriq->alarm_value = 0;
 			ptp_qoriq->alarm_interval = 0;
@@ -194,7 +194,7 @@ irqreturn_t ptp_qoriq_isr(int irq, void *priv)
 	}
 
 	if (ack) {
-		qoriq_write(&regs->ctrl_regs->tmr_tevent, ack);
+		ptp_qoriq->write(&regs->ctrl_regs->tmr_tevent, ack);
 		return IRQ_HANDLED;
 	} else
 		return IRQ_NONE;
@@ -229,7 +229,7 @@ int ptp_qoriq_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
 
 	tmr_add = neg_adj ? tmr_add - diff : tmr_add + diff;
 
-	qoriq_write(&regs->ctrl_regs->tmr_add, tmr_add);
+	ptp_qoriq->write(&regs->ctrl_regs->tmr_add, tmr_add);
 
 	return 0;
 }
@@ -326,15 +326,15 @@ int ptp_qoriq_enable(struct ptp_clock_info *ptp,
 
 	spin_lock_irqsave(&ptp_qoriq->lock, flags);
 
-	mask = qoriq_read(&regs->ctrl_regs->tmr_temask);
+	mask = ptp_qoriq->read(&regs->ctrl_regs->tmr_temask);
 	if (on) {
 		mask |= bit;
-		qoriq_write(&regs->ctrl_regs->tmr_tevent, bit);
+		ptp_qoriq->write(&regs->ctrl_regs->tmr_tevent, bit);
 	} else {
 		mask &= ~bit;
 	}
 
-	qoriq_write(&regs->ctrl_regs->tmr_temask, mask);
+	ptp_qoriq->write(&regs->ctrl_regs->tmr_temask, mask);
 
 	spin_unlock_irqrestore(&ptp_qoriq->lock, flags);
 	return 0;
@@ -496,6 +496,14 @@ int ptp_qoriq_init(struct ptp_qoriq *ptp_qoriq, void __iomem *base,
 			return -ENODEV;
 	}
 
+	if (of_property_read_bool(node, "little-endian")) {
+		ptp_qoriq->read = qoriq_read_le;
+		ptp_qoriq->write = qoriq_write_le;
+	} else {
+		ptp_qoriq->read = qoriq_read_be;
+		ptp_qoriq->write = qoriq_write_be;
+	}
+
 	if (of_device_is_compatible(node, "fsl,fman-ptp-timer")) {
 		ptp_qoriq->regs.ctrl_regs = base + FMAN_CTRL_REGS_OFFSET;
 		ptp_qoriq->regs.alarm_regs = base + FMAN_ALARM_REGS_OFFSET;
@@ -519,13 +527,14 @@ int ptp_qoriq_init(struct ptp_qoriq *ptp_qoriq, void __iomem *base,
 	spin_lock_irqsave(&ptp_qoriq->lock, flags);
 
 	regs = &ptp_qoriq->regs;
-	qoriq_write(&regs->ctrl_regs->tmr_ctrl,   tmr_ctrl);
-	qoriq_write(&regs->ctrl_regs->tmr_add,    ptp_qoriq->tmr_add);
-	qoriq_write(&regs->ctrl_regs->tmr_prsc,   ptp_qoriq->tmr_prsc);
-	qoriq_write(&regs->fiper_regs->tmr_fiper1, ptp_qoriq->tmr_fiper1);
-	qoriq_write(&regs->fiper_regs->tmr_fiper2, ptp_qoriq->tmr_fiper2);
+	ptp_qoriq->write(&regs->ctrl_regs->tmr_ctrl, tmr_ctrl);
+	ptp_qoriq->write(&regs->ctrl_regs->tmr_add, ptp_qoriq->tmr_add);
+	ptp_qoriq->write(&regs->ctrl_regs->tmr_prsc, ptp_qoriq->tmr_prsc);
+	ptp_qoriq->write(&regs->fiper_regs->tmr_fiper1, ptp_qoriq->tmr_fiper1);
+	ptp_qoriq->write(&regs->fiper_regs->tmr_fiper2, ptp_qoriq->tmr_fiper2);
 	set_alarm(ptp_qoriq);
-	qoriq_write(&regs->ctrl_regs->tmr_ctrl,   tmr_ctrl|FIPERST|RTPE|TE|FRD);
+	ptp_qoriq->write(&regs->ctrl_regs->tmr_ctrl,
+			 tmr_ctrl|FIPERST|RTPE|TE|FRD);
 
 	spin_unlock_irqrestore(&ptp_qoriq->lock, flags);
 
@@ -605,8 +614,8 @@ static int ptp_qoriq_remove(struct platform_device *dev)
 	struct ptp_qoriq *ptp_qoriq = platform_get_drvdata(dev);
 	struct ptp_qoriq_registers *regs = &ptp_qoriq->regs;
 
-	qoriq_write(&regs->ctrl_regs->tmr_temask, 0);
-	qoriq_write(&regs->ctrl_regs->tmr_ctrl,   0);
+	ptp_qoriq->write(&regs->ctrl_regs->tmr_temask, 0);
+	ptp_qoriq->write(&regs->ctrl_regs->tmr_ctrl,   0);
 
 	ptp_qoriq_remove_debugfs(ptp_qoriq);
 	ptp_clock_unregister(ptp_qoriq->clock);
diff --git a/drivers/ptp/ptp_qoriq_debugfs.c b/drivers/ptp/ptp_qoriq_debugfs.c
index 3a70daf..e8dddce 100644
--- a/drivers/ptp/ptp_qoriq_debugfs.c
+++ b/drivers/ptp/ptp_qoriq_debugfs.c
@@ -11,7 +11,7 @@ static int ptp_qoriq_fiper1_lpbk_get(void *data, u64 *val)
 	struct ptp_qoriq_registers *regs = &ptp_qoriq->regs;
 	u32 ctrl;
 
-	ctrl = qoriq_read(&regs->ctrl_regs->tmr_ctrl);
+	ctrl = ptp_qoriq->read(&regs->ctrl_regs->tmr_ctrl);
 	*val = ctrl & PP1L ? 1 : 0;
 
 	return 0;
@@ -23,13 +23,13 @@ static int ptp_qoriq_fiper1_lpbk_set(void *data, u64 val)
 	struct ptp_qoriq_registers *regs = &ptp_qoriq->regs;
 	u32 ctrl;
 
-	ctrl = qoriq_read(&regs->ctrl_regs->tmr_ctrl);
+	ctrl = ptp_qoriq->read(&regs->ctrl_regs->tmr_ctrl);
 	if (val == 0)
 		ctrl &= ~PP1L;
 	else
 		ctrl |= PP1L;
 
-	qoriq_write(&regs->ctrl_regs->tmr_ctrl, ctrl);
+	ptp_qoriq->write(&regs->ctrl_regs->tmr_ctrl, ctrl);
 	return 0;
 }
 
@@ -42,7 +42,7 @@ static int ptp_qoriq_fiper2_lpbk_get(void *data, u64 *val)
 	struct ptp_qoriq_registers *regs = &ptp_qoriq->regs;
 	u32 ctrl;
 
-	ctrl = qoriq_read(&regs->ctrl_regs->tmr_ctrl);
+	ctrl = ptp_qoriq->read(&regs->ctrl_regs->tmr_ctrl);
 	*val = ctrl & PP2L ? 1 : 0;
 
 	return 0;
@@ -54,13 +54,13 @@ static int ptp_qoriq_fiper2_lpbk_set(void *data, u64 val)
 	struct ptp_qoriq_registers *regs = &ptp_qoriq->regs;
 	u32 ctrl;
 
-	ctrl = qoriq_read(&regs->ctrl_regs->tmr_ctrl);
+	ctrl = ptp_qoriq->read(&regs->ctrl_regs->tmr_ctrl);
 	if (val == 0)
 		ctrl &= ~PP2L;
 	else
 		ctrl |= PP2L;
 
-	qoriq_write(&regs->ctrl_regs->tmr_ctrl, ctrl);
+	ptp_qoriq->write(&regs->ctrl_regs->tmr_ctrl, ctrl);
 	return 0;
 }
 
diff --git a/include/linux/fsl/ptp_qoriq.h b/include/linux/fsl/ptp_qoriq.h
index d0c1e42..b44b466 100644
--- a/include/linux/fsl/ptp_qoriq.h
+++ b/include/linux/fsl/ptp_qoriq.h
@@ -157,21 +157,30 @@ struct ptp_qoriq {
 	u32 cksel;
 	u32 tmr_fiper1;
 	u32 tmr_fiper2;
+	u32 (*read)(unsigned __iomem *addr);
+	void (*write)(unsigned __iomem *addr, u32 val);
 };
 
-static inline u32 qoriq_read(unsigned __iomem *addr)
+static inline u32 qoriq_read_be(unsigned __iomem *addr)
 {
-	u32 val;
-
-	val = ioread32be(addr);
-	return val;
+	return ioread32be(addr);
 }
 
-static inline void qoriq_write(unsigned __iomem *addr, u32 val)
+static inline void qoriq_write_be(unsigned __iomem *addr, u32 val)
 {
 	iowrite32be(val, addr);
 }
 
+static inline u32 qoriq_read_le(unsigned __iomem *addr)
+{
+	return ioread32(addr);
+}
+
+static inline void qoriq_write_le(unsigned __iomem *addr, u32 val)
+{
+	iowrite32(val, addr);
+}
+
 irqreturn_t ptp_qoriq_isr(int irq, void *priv);
 int ptp_qoriq_init(struct ptp_qoriq *ptp_qoriq, void __iomem *base,
 		   const struct ptp_clock_info caps);
-- 
1.7.1
