From: Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v20 2/4] mailbox: mediatek: Add Mediatek CMDQ driver
Date: Wed, 22 Feb 2017 11:12:30 +0800
Message-ID: <1487733150.15869.11.camel@mtksdaap41>
References: <1483499169-16329-1-git-send-email-hs.liao@mediatek.com>
         <1483499169-16329-3-git-send-email-hs.liao@mediatek.com>
         <CABb+yY23TUB8NpmpiO=cCmVFAVJMqKPfGgX14j+_Yj7tJvMOuQ@mail.gmail.com>
         <1485419833.990.1.camel@mtksdaap41>
         <CABb+yY13VaFpYz6EExvAXLpAqEWDJ4R50WG0DYbXO6iCESbA5A@mail.gmail.com>
         <1486359476.11424.33.camel@mtksdaap41>
         <CABb+yY0jCGqnrMLkkTNoEmLX4jDstWh7-UYhDyKjV-gFOnxpsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY0jCGqnrMLkkTNoEmLX4jDstWh7-UYhDyKjV-gFOnxpsg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jo
List-Id: devicetree@vger.kernel.org

On Thu, 2017-02-16 at 21:02 +0530, Jassi Brar wrote:
> On Mon, Feb 6, 2017 at 11:07 AM, Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > Hi Jassi,
> >
> > On Wed, 2017-02-01 at 10:52 +0530, Jassi Brar wrote:
> >> On Thu, Jan 26, 2017 at 2:07 PM, Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> >> > Hi Jassi,
> >> >
> >> > On Thu, 2017-01-26 at 10:08 +0530, Jassi Brar wrote:
> >> >> On Wed, Jan 4, 2017 at 8:36 AM, HS Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> >> >>
> >> >> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> >> >> > new file mode 100644
> >> >> > index 0000000..747bcd3
> >> >> > --- /dev/null
> >> >> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> >> >>
> >> >> ...
> >> >>
> >> >> > +static void cmdq_task_exec(struct cmdq_pkt *pkt, struct cmdq_thread *thread)
> >> >> > +{
> >> >> > +       struct cmdq *cmdq;
> >> >> > +       struct cmdq_task *task;
> >> >> > +       unsigned long curr_pa, end_pa;
> >> >> > +
> >> >> > +       cmdq = dev_get_drvdata(thread->chan->mbox->dev);
> >> >> > +
> >> >> > +       /* Client should not flush new tasks if suspended. */
> >> >> > +       WARN_ON(cmdq->suspended);
> >> >> > +
> >> >> > +       task = kzalloc(sizeof(*task), GFP_ATOMIC);
> >> >> > +       task->cmdq = cmdq;
> >> >> > +       INIT_LIST_HEAD(&task->list_entry);
> >> >> > +       task->pa_base = dma_map_single(cmdq->mbox.dev, pkt->va_base,
> >> >> > +                                      pkt->cmd_buf_size, DMA_TO_DEVICE);
> >> >> >
> >> >> You seem to parse the requests and responses, that should ideally be
> >> >> done in client driver.
> >> >> Also, we are here in atomic context, can you move it in client driver
> >> >> (before the spin_lock)?
> >> >> Maybe by adding a new 'pa_base' member as well in 'cmdq_pkt'.
> >> >
> >> > will do
> >
> > I agree with moving dma_map_single out from spin_lock.
> >
> > However, mailbox clients cannot map virtual memory to mailbox
> > controller's device for DMA.
> >
> If DMA is a resource used by MBox to transfer data, then yes the
> mapping needs to be done in the Mbox controller driver. To map memory
> outside of spinlock, you could schedule a tasklet in send_data() ?

Hi Jassi,

For CMDQ, the order of CMDQ tasks should be guaranteed.
However, it seems tasklet cannot ensure this requirement.

Quote from Linux Device Drivers 3rd edition ch7.
"void tasklet_schedule(struct tasklet_struct *t);
  Schedule the tasklet for execution. If a tasklet is scheduled again
before it has a chance to run, it runs only once...."

May I use workqueue instead of tasklet?

Thanks,
HS

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
