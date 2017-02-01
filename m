From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v20 2/4] mailbox: mediatek: Add Mediatek CMDQ driver
Date: Wed, 1 Feb 2017 10:52:12 +0530
Message-ID: <CABb+yY13VaFpYz6EExvAXLpAqEWDJ4R50WG0DYbXO6iCESbA5A@mail.gmail.com>
References: <1483499169-16329-1-git-send-email-hs.liao@mediatek.com>
 <1483499169-16329-3-git-send-email-hs.liao@mediatek.com> <CABb+yY23TUB8NpmpiO=cCmVFAVJMqKPfGgX14j+_Yj7tJvMOuQ@mail.gmail.com>
 <1485419833.990.1.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485419833.990.1.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 26, 2017 at 2:07 PM, Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Hi Jassi,
>
> On Thu, 2017-01-26 at 10:08 +0530, Jassi Brar wrote:
>> On Wed, Jan 4, 2017 at 8:36 AM, HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>>
>> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
>> > new file mode 100644
>> > index 0000000..747bcd3
>> > --- /dev/null
>> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
>>
>> ...
>>
>> > +static void cmdq_task_exec(struct cmdq_pkt *pkt, struct cmdq_thread *thread)
>> > +{
>> > +       struct cmdq *cmdq;
>> > +       struct cmdq_task *task;
>> > +       unsigned long curr_pa, end_pa;
>> > +
>> > +       cmdq = dev_get_drvdata(thread->chan->mbox->dev);
>> > +
>> > +       /* Client should not flush new tasks if suspended. */
>> > +       WARN_ON(cmdq->suspended);
>> > +
>> > +       task = kzalloc(sizeof(*task), GFP_ATOMIC);
>> > +       task->cmdq = cmdq;
>> > +       INIT_LIST_HEAD(&task->list_entry);
>> > +       task->pa_base = dma_map_single(cmdq->mbox.dev, pkt->va_base,
>> > +                                      pkt->cmd_buf_size, DMA_TO_DEVICE);
>> >
>> You seem to parse the requests and responses, that should ideally be
>> done in client driver.
>> Also, we are here in atomic context, can you move it in client driver
>> (before the spin_lock)?
>> Maybe by adding a new 'pa_base' member as well in 'cmdq_pkt'.
>
> will do
>
>> ....
>> > +
>> > +       cmdq->mbox.num_chans = CMDQ_THR_MAX_COUNT;
>> > +       cmdq->mbox.ops = &cmdq_mbox_chan_ops;
>> > +       cmdq->mbox.of_xlate = cmdq_xlate;
>> > +
>> > +       /* make use of TXDONE_BY_ACK */
>> > +       cmdq->mbox.txdone_irq = false;
>> > +       cmdq->mbox.txdone_poll = false;
>> > +
>> > +       for (i = 0; i < ARRAY_SIZE(cmdq->thread); i++) {
>> >
>> You mean  i < CMDQ_THR_MAX_COUNT
>
> will do
>
>> > +               cmdq->thread[i].base = cmdq->base + CMDQ_THR_BASE +
>> > +                               CMDQ_THR_SIZE * i;
>> > +               INIT_LIST_HEAD(&cmdq->thread[i].task_busy_list);
>> >
>> You seem the queue mailbox requests in this controller driver? why not
>> use the mailbox api for that?
>>
>> > +               init_timer(&cmdq->thread[i].timeout);
>> > +               cmdq->thread[i].timeout.function = cmdq_thread_handle_timeout;
>> > +               cmdq->thread[i].timeout.data = (unsigned long)&cmdq->thread[i];
>> >
>> Here again... you seem to ignore the polling mechanism provided by the
>> mailbox api, and implement your own.
>
> The queue is used to record the tasks which are flushed into CMDQ
> hardware (GCE). We are handling time critical tasks, so we have to
> queue them in GCE rather than a software queue (e.g. mailbox buffer).
> Let me use display as an example. Many display tasks are flushed into
> CMDQ to wait next vsync event. When vsync event is triggered by display
> hardware, GCE needs to process all flushed tasks "within vblank" to
> prevent garbage on screen. This is all done by GCE (without CPU)
> to fulfill time critical requirement. After GCE finish its work,
> it will generate interrupts, and then CMDQ driver will let clients know
> which tasks are done.
>
Does the GCE provide any 'lock' to prevent modifying (by adding tasks
to) the GCE h/w buffer when it is processing it at vsync?  Otherwise
there maybe race/error. If there is such a 'lock' flag/irq, that could
help here. However, you are supposed to know your h/w better, so I
will accept this implementation assuming it can't be done any better.

Please address other comments and resubmit.

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
