From: HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v16 5/5] CMDQ: save energy
Date: Tue, 1 Nov 2016 19:28:18 +0800
Message-ID: <1477999698-6288-6-git-send-email-hs.liao@mediatek.com>
References: <1477999698-6288-1-git-send-email-hs.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477999698-6288-1-git-send-email-hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Josh-YC Liu <josh-yc.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Glory Hung <glory.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jiaguang Zhang <jiaguang.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Dennis-YC Hsieh <dennis-yc.hsieh-NuS5LvNUpcLQFizaE/u3fw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

use clk_disable_unprepare instead of clk_disable to save more energy
when CMDQ is idle.

Signed-off-by: HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 52 ++++++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 747bcd3..8771e57 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -22,6 +22,7 @@
 #include <linux/mailbox_controller.h>
 #include <linux/mailbox/mtk-cmdq-mailbox.h>
 #include <linux/timer.h>
+#include <linux/workqueue.h>
 
 #define CMDQ_THR_MAX_COUNT		3 /* main, sub, general(misc) */
 #define CMDQ_OP_CODE_MASK		(0xff << CMDQ_OP_CODE_SHIFT)
@@ -75,10 +76,16 @@ struct cmdq_task {
 	struct cmdq_pkt		*pkt; /* the packet sent from mailbox client */
 };
 
+struct cmdq_clk_release {
+	struct cmdq		*cmdq;
+	struct work_struct	release_work;
+};
+
 struct cmdq {
 	struct mbox_controller	mbox;
 	void __iomem		*base;
 	u32			irq;
+	struct workqueue_struct	*clk_release_wq;
 	struct cmdq_thread	thread[CMDQ_THR_MAX_COUNT];
 	struct clk		*clock;
 	bool			suspended;
@@ -203,7 +210,7 @@ static void cmdq_task_exec(struct cmdq_pkt *pkt, struct cmdq_thread *thread)
 {
 	struct cmdq *cmdq;
 	struct cmdq_task *task;
-	unsigned long curr_pa, end_pa;
+	unsigned long curr_pa, end_pa, flags;
 
 	cmdq = dev_get_drvdata(thread->chan->mbox->dev);
 
@@ -219,7 +226,14 @@ static void cmdq_task_exec(struct cmdq_pkt *pkt, struct cmdq_thread *thread)
 	task->pkt = pkt;
 
 	if (list_empty(&thread->task_busy_list)) {
-		WARN_ON(clk_enable(cmdq->clock) < 0);
+		/*
+		 * Unlock for clk prepare (sleeping function).
+		 * This is safe since clk_prepare_enable has internal locks.
+		 */
+		spin_unlock_irqrestore(&thread->chan->lock, flags);
+		WARN_ON(clk_prepare_enable(cmdq->clock) < 0);
+		spin_lock_irqsave(&thread->chan->lock, flags);
+
 		WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
 
 		writel(task->pa_base, thread->base + CMDQ_THR_CURR_ADDR);
@@ -301,6 +315,26 @@ static void cmdq_task_handle_error(struct cmdq_task *task)
 	cmdq_thread_resume(thread);
 }
 
+static void cmdq_clk_release_work(struct work_struct *work_item)
+{
+	struct cmdq_clk_release *clk_release = container_of(work_item,
+			struct cmdq_clk_release, release_work);
+	struct cmdq *cmdq = clk_release->cmdq;
+
+	clk_disable_unprepare(cmdq->clock);
+	kfree(clk_release);
+}
+
+static void cmdq_clk_release_schedule(struct cmdq *cmdq)
+{
+	struct cmdq_clk_release *clk_release;
+
+	clk_release = kmalloc(sizeof(*clk_release), GFP_ATOMIC);
+	clk_release->cmdq = cmdq;
+	INIT_WORK(&clk_release->release_work, cmdq_clk_release_work);
+	queue_work(cmdq->clk_release_wq, &clk_release->release_work);
+}
+
 static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 				    struct cmdq_thread *thread)
 {
@@ -350,7 +384,7 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 
 	if (list_empty(&thread->task_busy_list)) {
 		cmdq_thread_disable(cmdq, thread);
-		clk_disable(cmdq->clock);
+		cmdq_clk_release_schedule(cmdq);
 	} else {
 		mod_timer(&thread->timeout,
 			  jiffies + msecs_to_jiffies(CMDQ_TIMEOUT_MS));
@@ -409,7 +443,7 @@ static void cmdq_thread_handle_timeout(unsigned long data)
 
 	cmdq_thread_resume(thread);
 	cmdq_thread_disable(cmdq, thread);
-	clk_disable(cmdq->clock);
+	cmdq_clk_release_schedule(cmdq);
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
 }
 
@@ -433,7 +467,7 @@ static int cmdq_suspend(struct device *dev)
 	if (task_running)
 		dev_warn(dev, "exist running task(s) in suspend\n");
 
-	clk_unprepare(cmdq->clock);
+	flush_workqueue(cmdq->clk_release_wq);
 	return 0;
 }
 
@@ -441,7 +475,6 @@ static int cmdq_resume(struct device *dev)
 {
 	struct cmdq *cmdq = dev_get_drvdata(dev);
 
-	WARN_ON(clk_prepare(cmdq->clock) < 0);
 	cmdq->suspended = false;
 	return 0;
 }
@@ -450,8 +483,8 @@ static int cmdq_remove(struct platform_device *pdev)
 {
 	struct cmdq *cmdq = platform_get_drvdata(pdev);
 
+	destroy_workqueue(cmdq->clk_release_wq);
 	mbox_controller_unregister(&cmdq->mbox);
-	clk_unprepare(cmdq->clock);
 	return 0;
 }
 
@@ -567,8 +600,11 @@ static int cmdq_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	cmdq->clk_release_wq = alloc_ordered_workqueue(
+			"%s", WQ_MEM_RECLAIM | WQ_HIGHPRI,
+			"cmdq_clk_release");
+
 	platform_set_drvdata(pdev, cmdq);
-	WARN_ON(clk_prepare(cmdq->clock) < 0);
 
 	return 0;
 }
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
