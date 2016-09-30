From: Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v14 2/4] CMDQ: Mediatek CMDQ driver
Date: Fri, 30 Sep 2016 16:56:18 +0800
Message-ID: <1475225778.25044.35.camel@mtksdaap41>
References: <1473039885-24009-1-git-send-email-hs.liao@mediatek.com>
 <1473039885-24009-3-git-send-email-hs.liao@mediatek.com>
 <1475204778.13398.28.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1475204778.13398.28.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Monica Wang <monica.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jiaguang Zhang <jiaguang.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Glory Hung <glory.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Josh-YC Liu <josh-yc.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dennis-YC Hsieh <dennis-yc.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi CK,

Please see my inline reply.

On Fri, 2016-09-30 at 11:06 +0800, CK Hu wrote:
> Hi, HS:
> 
> On Mon, 2016-09-05 at 09:44 +0800, HS Liao wrote:
> > This patch is first version of Mediatek Command Queue(CMDQ) driver. The
> > CMDQ is used to help write registers with critical time limitation,
> > such as updating display configuration during the vblank. It controls
> > Global Command Engine (GCE) hardware to achieve this requirement.
> > Currently, CMDQ only supports display related hardwares, but we expect
> > it can be extended to other hardwares for future requirements.
> > 
> > Signed-off-by: HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> 
> [snip...]
> 
> > +
> > +struct cmdq_task {
> > +	struct cmdq		*cmdq;
> > +	struct list_head	list_entry;
> > +	void			*va_base;
> > +	dma_addr_t		pa_base;
> > +	size_t			cmd_buf_size; /* command occupied size */
> > +	size_t			buf_size; /* real buffer size */
> > +	bool			finalized;
> > +	struct cmdq_thread	*thread;
> 
> I think thread info could be removed from cmdq_task. Only
> cmdq_task_handle_error() and cmdq_task_insert_into_thread() use
> task->thread and caller of both function has the thread info. So you
> could just pass thread info into these two function and remove thread
> info in cmdq_task.

This modification will remove 1 pointer but add 2 pointers. Moreover,
more pointers will need to be delivered between functions for future
extension. IMHO, it would be better to keep thread pointer inside
cmdq_task.

> > +	struct cmdq_task_cb	cb;
> 
> I think this callback function is equal to mailbox client tx_done
> callback. It's better to use already-defined interface rather than
> creating your own.

This is because CMDQ driver allows different callback functions for
different tasks, but mailbox only allows one callback function per
channel. But, I think I can add a wrapper for tx_done to call CMDQ
callback functions. So, I will use tx_done in CMDQ v15.

> > +};
> > +
> 
> [snip...]
> 
> > +
> > +static int cmdq_suspend(struct device *dev)
> > +{
> > +	struct cmdq *cmdq = dev_get_drvdata(dev);
> > +	struct cmdq_thread *thread;
> > +	int i;
> > +	bool task_running = false;
> > +
> > +	mutex_lock(&cmdq->task_mutex);
> > +	cmdq->suspended = true;
> > +	mutex_unlock(&cmdq->task_mutex);
> > +
> > +	for (i = 0; i < ARRAY_SIZE(cmdq->thread); i++) {
> > +		thread = &cmdq->thread[i];
> > +		if (!list_empty(&thread->task_busy_list)) {
> > +			mod_timer(&thread->timeout, jiffies + 1);
> > +			task_running = true;
> > +		}
> > +	}
> > +
> > +	if (task_running) {
> > +		dev_warn(dev, "exist running task(s) in suspend\n");
> > +		msleep(20);
> 
> Why sleep here? It looks like a recovery but could 20ms recovery
> something? I think warning message is enough because you see the warning
> message, and you fix the bug, so no need to recovery anything.

My purpose is context switch to finish timer's work.
I will replace it by schedule().

> > +	}
> > +
> > +	clk_unprepare(cmdq->clock);
> > +	return 0;
> > +}
> > +
> 
> Regards,
> CK

Thanks,
HS
