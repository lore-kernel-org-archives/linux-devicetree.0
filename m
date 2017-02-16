From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v20 2/4] mailbox: mediatek: Add Mediatek CMDQ driver
Date: Thu, 16 Feb 2017 21:02:32 +0530
Message-ID: <CABb+yY0jCGqnrMLkkTNoEmLX4jDstWh7-UYhDyKjV-gFOnxpsg@mail.gmail.com>
References: <1483499169-16329-1-git-send-email-hs.liao@mediatek.com>
 <1483499169-16329-3-git-send-email-hs.liao@mediatek.com> <CABb+yY23TUB8NpmpiO=cCmVFAVJMqKPfGgX14j+_Yj7tJvMOuQ@mail.gmail.com>
 <1485419833.990.1.camel@mtksdaap41> <CABb+yY13VaFpYz6EExvAXLpAqEWDJ4R50WG0DYbXO6iCESbA5A@mail.gmail.com>
 <1486359476.11424.33.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486359476.11424.33.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: Horng-Shyang Liao <hs.liao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, CK HU <ck.hu@mediatek.com>, cawa cheng <cawa.cheng@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Damon Chu <damon.chu@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 6, 2017 at 11:07 AM, Horng-Shyang Liao <hs.liao@mediatek.com> wrote:
> Hi Jassi,
>
> On Wed, 2017-02-01 at 10:52 +0530, Jassi Brar wrote:
>> On Thu, Jan 26, 2017 at 2:07 PM, Horng-Shyang Liao <hs.liao@mediatek.com> wrote:
>> > Hi Jassi,
>> >
>> > On Thu, 2017-01-26 at 10:08 +0530, Jassi Brar wrote:
>> >> On Wed, Jan 4, 2017 at 8:36 AM, HS Liao <hs.liao@mediatek.com> wrote:
>> >>
>> >> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
>> >> > new file mode 100644
>> >> > index 0000000..747bcd3
>> >> > --- /dev/null
>> >> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
>> >>
>> >> ...
>> >>
>> >> > +static void cmdq_task_exec(struct cmdq_pkt *pkt, struct cmdq_thread *thread)
>> >> > +{
>> >> > +       struct cmdq *cmdq;
>> >> > +       struct cmdq_task *task;
>> >> > +       unsigned long curr_pa, end_pa;
>> >> > +
>> >> > +       cmdq = dev_get_drvdata(thread->chan->mbox->dev);
>> >> > +
>> >> > +       /* Client should not flush new tasks if suspended. */
>> >> > +       WARN_ON(cmdq->suspended);
>> >> > +
>> >> > +       task = kzalloc(sizeof(*task), GFP_ATOMIC);
>> >> > +       task->cmdq = cmdq;
>> >> > +       INIT_LIST_HEAD(&task->list_entry);
>> >> > +       task->pa_base = dma_map_single(cmdq->mbox.dev, pkt->va_base,
>> >> > +                                      pkt->cmd_buf_size, DMA_TO_DEVICE);
>> >> >
>> >> You seem to parse the requests and responses, that should ideally be
>> >> done in client driver.
>> >> Also, we are here in atomic context, can you move it in client driver
>> >> (before the spin_lock)?
>> >> Maybe by adding a new 'pa_base' member as well in 'cmdq_pkt'.
>> >
>> > will do
>
> I agree with moving dma_map_single out from spin_lock.
>
> However, mailbox clients cannot map virtual memory to mailbox
> controller's device for DMA.
>
If DMA is a resource used by MBox to transfer data, then yes the
mapping needs to be done in the Mbox controller driver. To map memory
outside of spinlock, you could schedule a tasklet in send_data() ?
