From: houlong wei <houlong.wei@mediatek.com>
Subject: Re: FW: [PATCH v20 2/4] mailbox: mediatek: Add Mediatek CMDQ driver
Date: Mon, 8 Jan 2018 16:38:55 +0800
Message-ID: <1515400735.21044.35.camel@mhfsdcap03>
References: <1483499169-16329-1-git-send-email-hs.liao@mediatek.com>
         <1483499169-16329-3-git-send-email-hs.liao@mediatek.com>
         <CABb+yY23TUB8NpmpiO=cCmVFAVJMqKPfGgX14j+_Yj7tJvMOuQ@mail.gmail.com>
         <1485419833.990.1.camel@mtksdaap41>
         <CABb+yY13VaFpYz6EExvAXLpAqEWDJ4R50WG0DYbXO6iCESbA5A@mail.gmail.com>
         <1486359476.11424.33.camel@mtksdaap41>
         <CABb+yY0jCGqnrMLkkTNoEmLX4jDstWh7-UYhDyKjV-gFOnxpsg@mail.gmail.com>
         <1487733150.15869.11.camel@mtksdaap41>
         <CABb+yY2dzcR4fYvrSQK5jemwUSkYVJ8aWEmiE6wstw-Yyqy7bw@mail.gmail.com>
         <1487854104.17813.1.camel@mtksdaap41>
         <497f8e4ef7ae4c8a9b7b4ab259801306@mtkmbs01n1.mediatek.inc>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <497f8e4ef7ae4c8a9b7b4ab259801306@mtkmbs01n1.mediatek.inc>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, "; Matthias Brugger" <matthias.bgg@gmail.com>, "; Daniel Kurtz" <djkurtz@chromium.org>, "; Sascha Hauer" <s.hauer@pengutronix.de>, "; Devicetree List" <devicetree@vger.kernel.org>, "; Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "; linux-arm-kernel@lists.infradead.org;
        linux-mediatek@lists.infradead.org; srv_heupstream" <srv_heupstream@mediatek.com>, "; Sascha Hauer" <kernel@pengutronix.de>, "; Philipp Zabel" <p.zabel@pengutronix.de>, "; Nicolas Boichat" <drinkcat@chromium.org>, "; CK Hu" <ck.hu@mediatek.com>, "; Cawa Cheng" <cawa.cheng@mediatek.com>, "; Bibby Hsieh" <Bibby.Hsieh@mediatek.com>, "; YT Shen" <yt.shen@mediatek.com>, "; Daoyuan Huang" <Daoyuan.Huang@mediatek.com>, "; Damon Chu" <damon.chu@>
List-Id: devicetree@vger.kernel.org

Hi Jassi,

Sorry for reply so late.
According to previous discussion, there are two methods to move
dma_map_single() outside of spin_lock.
(1) put in mtk-cmdq-helper.c, as described by HS on 2017-02-09.
  > I think a trade-off solution is to put in mtk-cmdq-helper.c.
  > Although it is a mailbox client, it is not a CMDQ client.
  > We can include mailbox_controller.h in mtk-cmdq-helper.c (instead of
mtk-cmdq.h), and then map dma at cmdq_pkt_flush_async before
mbox_send_message.

  > pkt->pa_base = dma_map_single(client->chan->mbox->dev, pkt->va_base,
  >                              pkt->cmd_buf_size, DMA_TO_DEVICE);
(2) schedule a tasklet in send_data().

After internal discussion with HS and other experts, now we prefer
method (1).
How do you think about it?

Thanks
Houlong


> -----Original Message-----
> From: Horng-Shyang Liao [mailto:hs.liao@mediatek.com] 
> Sent: Thursday, February 23, 2017 8:48 PM
> To: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Matthias Brugger <matthias.bgg@gmail.com>; Daniel Kurtz <djkurtz@chromium.org>; Sascha Hauer <s.hauer@pengutronix.de>; Devicetree List <devicetree@vger.kernel.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; linux-arm-kernel@lists.infradead.org; linux-mediatek@lists.infradead.org; srv_heupstream <srv_heupstream@mediatek.com>; Sascha Hauer <kernel@pengutronix.de>; Philipp Zabel <p.zabel@pengutronix.de>; Nicolas Boichat <drinkcat@chromium.org>; CK Hu (胡俊光) <ck.hu@mediatek.com>; Cawa Cheng (鄭曄禧) <cawa.cheng@mediatek.com>; Bibby Hsieh (謝濟遠) <Bibby.Hsieh@mediatek.com>; YT Shen (沈岳霆) <yt.shen@mediatek.com>; Daoyuan Huang (黃道原) <Daoyuan.Huang@mediatek.com>; Damon Chu (朱峻賢) <damon.chu@mediatek.com>; Josh-YC 
 Liu (劉育誠) <Josh-YC.Liu@mediatek.com>; Glory Hung (洪智瑋) <glory.hung@mediatek.com>; Jiaguang Zhang (张加广) <Jiaguang.Zhang@mediatek.com>; Dennis-YC Hsieh (謝宇哲) <Dennis-YC.Hsieh@mediatek.com>; Monica Wang (王孟婷) <monica.wang@mediatek.com>; Houlong Wei (魏厚龙) <houlong.wei@mediatek.com>; Hs Liao (廖宏祥) <hs.liao@mediatek.com>
> Subject: Re: [PATCH v20 2/4] mailbox: mediatek: Add Mediatek CMDQ driver
> 
> On Thu, 2017-02-23 at 09:40 +0530, Jassi Brar wrote:
> > On Wed, Feb 22, 2017 at 8:42 AM, Horng-Shyang Liao <hs.liao@mediatek.com> wrote:
> > > On Thu, 2017-02-16 at 21:02 +0530, Jassi Brar wrote:
> > >> On Mon, Feb 6, 2017 at 11:07 AM, Horng-Shyang Liao <hs.liao@mediatek.com> wrote:
> > >> > Hi Jassi,
> > >> >
> > >> > On Wed, 2017-02-01 at 10:52 +0530, Jassi Brar wrote:
> > >> >> On Thu, Jan 26, 2017 at 2:07 PM, Horng-Shyang Liao <hs.liao@mediatek.com> wrote:
> > >> >> > Hi Jassi,
> > >> >> >
> > >> >> > On Thu, 2017-01-26 at 10:08 +0530, Jassi Brar wrote:
> > >> >> >> On Wed, Jan 4, 2017 at 8:36 AM, HS Liao <hs.liao@mediatek.com> wrote:
> > >> >> >>
> > >> >> >> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c 
> > >> >> >> > b/drivers/mailbox/mtk-cmdq-mailbox.c
> > >> >> >> > new file mode 100644
> > >> >> >> > index 0000000..747bcd3
> > >> >> >> > --- /dev/null
> > >> >> >> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > >> >> >>
> > >> >> >> ...
> > >> >> >>
> > >> >> >> > +static void cmdq_task_exec(struct cmdq_pkt *pkt, struct 
> > >> >> >> > +cmdq_thread *thread) {
> > >> >> >> > +       struct cmdq *cmdq;
> > >> >> >> > +       struct cmdq_task *task;
> > >> >> >> > +       unsigned long curr_pa, end_pa;
> > >> >> >> > +
> > >> >> >> > +       cmdq = dev_get_drvdata(thread->chan->mbox->dev);
> > >> >> >> > +
> > >> >> >> > +       /* Client should not flush new tasks if suspended. */
> > >> >> >> > +       WARN_ON(cmdq->suspended);
> > >> >> >> > +
> > >> >> >> > +       task = kzalloc(sizeof(*task), GFP_ATOMIC);
> > >> >> >> > +       task->cmdq = cmdq;
> > >> >> >> > +       INIT_LIST_HEAD(&task->list_entry);
> > >> >> >> > +       task->pa_base = dma_map_single(cmdq->mbox.dev, pkt->va_base,
> > >> >> >> > +                                      pkt->cmd_buf_size, 
> > >> >> >> > + DMA_TO_DEVICE);
> > >> >> >> >
> > >> >> >> You seem to parse the requests and responses, that should 
> > >> >> >> ideally be done in client driver.
> > >> >> >> Also, we are here in atomic context, can you move it in 
> > >> >> >> client driver (before the spin_lock)?
> > >> >> >> Maybe by adding a new 'pa_base' member as well in 'cmdq_pkt'.
> > >> >> >
> > >> >> > will do
> > >> >
> > >> > I agree with moving dma_map_single out from spin_lock.
> > >> >
> > >> > However, mailbox clients cannot map virtual memory to mailbox 
> > >> > controller's device for DMA.
> > >> >
> > >> If DMA is a resource used by MBox to transfer data, then yes the 
> > >> mapping needs to be done in the Mbox controller driver. To map 
> > >> memory outside of spinlock, you could schedule a tasklet in send_data() ?
> > >
> > > Hi Jassi,
> > >
> > > For CMDQ, the order of CMDQ tasks should be guaranteed.
> > > However, it seems tasklet cannot ensure this requirement.
> > >
> > > Quote from Linux Device Drivers 3rd edition ch7.
> > > "void tasklet_schedule(struct tasklet_struct *t);
> > >   Schedule the tasklet for execution. If a tasklet is scheduled 
> > > again before it has a chance to run, it runs only once...."
> > >
> > Not sure what bothers you.
> > If you only add requests to a list, protected by some spinlock, during 
> > send_datam you could always iterate over (submit) requests in the 
> > order you queued them.
> 
> Hi Jassi,
> 
> OK. I will do it.
> 
> Thanks,
> HS
> 
> 
> 
