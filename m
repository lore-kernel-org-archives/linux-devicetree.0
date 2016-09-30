From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v14 2/4] CMDQ: Mediatek CMDQ driver
Date: Fri, 30 Sep 2016 11:06:18 +0800
Message-ID: <1475204778.13398.28.camel@mtksdaap41>
References: <1473039885-24009-1-git-send-email-hs.liao@mediatek.com>
         <1473039885-24009-3-git-send-email-hs.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473039885-24009-3-git-send-email-hs.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: HS Liao <hs.liao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, cawa cheng <cawa.cheng@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Damon Chu <damon.chu@mediatek.com>, Josh-YC Liu <josh-yc.liu@mediatek.com>, Glory Hung <glory.hung@mediatek.co>
List-Id: devicetree@vger.kernel.org

Hi, HS:

On Mon, 2016-09-05 at 09:44 +0800, HS Liao wrote:
> This patch is first version of Mediatek Command Queue(CMDQ) driver. The
> CMDQ is used to help write registers with critical time limitation,
> such as updating display configuration during the vblank. It controls
> Global Command Engine (GCE) hardware to achieve this requirement.
> Currently, CMDQ only supports display related hardwares, but we expect
> it can be extended to other hardwares for future requirements.
> 
> Signed-off-by: HS Liao <hs.liao@mediatek.com>
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> ---

[snip...]

> +
> +struct cmdq_task {
> +	struct cmdq		*cmdq;
> +	struct list_head	list_entry;
> +	void			*va_base;
> +	dma_addr_t		pa_base;
> +	size_t			cmd_buf_size; /* command occupied size */
> +	size_t			buf_size; /* real buffer size */
> +	bool			finalized;
> +	struct cmdq_thread	*thread;

I think thread info could be removed from cmdq_task. Only
cmdq_task_handle_error() and cmdq_task_insert_into_thread() use
task->thread and caller of both function has the thread info. So you
could just pass thread info into these two function and remove thread
info in cmdq_task.

> +	struct cmdq_task_cb	cb;

I think this callback function is equal to mailbox client tx_done
callback. It's better to use already-defined interface rather than
creating your own.

> +};
> +

[snip...]

> +
> +static int cmdq_suspend(struct device *dev)
> +{
> +	struct cmdq *cmdq = dev_get_drvdata(dev);
> +	struct cmdq_thread *thread;
> +	int i;
> +	bool task_running = false;
> +
> +	mutex_lock(&cmdq->task_mutex);
> +	cmdq->suspended = true;
> +	mutex_unlock(&cmdq->task_mutex);
> +
> +	for (i = 0; i < ARRAY_SIZE(cmdq->thread); i++) {
> +		thread = &cmdq->thread[i];
> +		if (!list_empty(&thread->task_busy_list)) {
> +			mod_timer(&thread->timeout, jiffies + 1);
> +			task_running = true;
> +		}
> +	}
> +
> +	if (task_running) {
> +		dev_warn(dev, "exist running task(s) in suspend\n");
> +		msleep(20);

Why sleep here? It looks like a recovery but could 20ms recovery
something? I think warning message is enough because you see the warning
message, and you fix the bug, so no need to recovery anything.

> +	}
> +
> +	clk_unprepare(cmdq->clock);
> +	return 0;
> +}
> +

Regards,
CK
