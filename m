From: Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v8 2/3] CMDQ: Mediatek CMDQ driver
Date: Wed, 8 Jun 2016 13:09:39 +0800
Message-ID: <1465362579.9963.2.camel@mtksdaap41>
References: <1464578397-29743-1-git-send-email-hs.liao@mediatek.com>
	 <1464578397-29743-3-git-send-email-hs.liao@mediatek.com>
	 <5756FE9B.6020107@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5756FE9B.6020107-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Josh-YC Liu <josh-yc.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Glory Hung <glory.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jiaguang Zhang <jiaguang.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Monica Wang <monica.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Matthias,

On Tue, 2016-06-07 at 19:04 +0200, Matthias Brugger wrote:
> 
> On 30/05/16 05:19, HS Liao wrote:
> > This patch is first version of Mediatek Command Queue(CMDQ) driver. The
> > CMDQ is used to help read/write registers with critical time limitation,
> > such as updating display configuration during the vblank. It controls
> > Global Command Engine (GCE) hardware to achieve this requirement.
> > Currently, CMDQ only supports display related hardwares, but we expect
> > it can be extended to other hardwares for future requirements.
> >
> > Signed-off-by: HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> 
> [...]
> 
> > +static void cmdq_handle_error_done(struct cmdq *cmdq,
> > +				   struct cmdq_thread *thread, u32 irq_flag)
> > +{
> > +	struct cmdq_task *task, *tmp, *curr_task = NULL;
> > +	u32 curr_pa;
> > +	struct cmdq_cb_data cmdq_cb_data;
> > +	bool err;
> > +
> > +	if (irq_flag & CMDQ_THR_IRQ_ERROR)
> > +		err = true;
> > +	else if (irq_flag & CMDQ_THR_IRQ_DONE)
> > +		err = false;
> > +	else
> > +		return;
> > +
> > +	curr_pa = cmdq_thread_readl(thread, CMDQ_THR_CURR_ADDR);
> > +
> > +	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
> > +				 list_entry) {
> > +		if (curr_pa >= task->pa_base &&
> > +		    curr_pa < (task->pa_base + task->command_size))
> > +			curr_task = task;
> > +		if (task->cb.cb) {
> > +			cmdq_cb_data.err = curr_task ? err : false;
> > +			cmdq_cb_data.data = task->cb.data;
> > +			task->cb.cb(cmdq_cb_data);
> > +		}
> 
> I think this is not right. If we got an IRQ_DONE, then the current task 
> is in execution, we should not call the callback until it has finished.

Thanks for your finding. This is a bug from CMDQ v6.
I will fix it in next version (CMDQ v9).

> 
> Regards,
> Matthias

Thanks,
HS

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
