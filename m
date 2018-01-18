From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: FW: [PATCH v20 2/4] mailbox: mediatek: Add Mediatek CMDQ driver
Date: Thu, 18 Jan 2018 13:31:24 +0530
Message-ID: <CABb+yY02S=+00mY-NTkJUBPiVruYdf0xuovKomehUxLNOQPLuA@mail.gmail.com>
References: <1483499169-16329-1-git-send-email-hs.liao@mediatek.com>
 <1483499169-16329-3-git-send-email-hs.liao@mediatek.com> <CABb+yY23TUB8NpmpiO=cCmVFAVJMqKPfGgX14j+_Yj7tJvMOuQ@mail.gmail.com>
 <1485419833.990.1.camel@mtksdaap41> <CABb+yY13VaFpYz6EExvAXLpAqEWDJ4R50WG0DYbXO6iCESbA5A@mail.gmail.com>
 <1486359476.11424.33.camel@mtksdaap41> <CABb+yY0jCGqnrMLkkTNoEmLX4jDstWh7-UYhDyKjV-gFOnxpsg@mail.gmail.com>
 <1487733150.15869.11.camel@mtksdaap41> <CABb+yY2dzcR4fYvrSQK5jemwUSkYVJ8aWEmiE6wstw-Yyqy7bw@mail.gmail.com>
 <1487854104.17813.1.camel@mtksdaap41> <497f8e4ef7ae4c8a9b7b4ab259801306@mtkmbs01n1.mediatek.inc>
 <1515400735.21044.35.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515400735.21044.35.camel@mhfsdcap03>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: houlong wei <houlong.wei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, ", Matthias Brugger" <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ", Daniel Kurtz" <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, ", Sascha Hauer" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, ", Devicetree List" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ", Linux Kernel Mailing List" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ", linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
        linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream" <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, ", Sascha Hauer" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, ", Philipp Zabel" <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, ", Nicolas Boichat" <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, ", CK Hu" <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, ", Cawa Cheng" <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, ", Bibby Hsieh" <Bibby.Hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, ", YT Shen" <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, ", Daoyuan Huang" <Daoyuan.Huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, ", Damon Chu" <damon.chu@>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 8, 2018 at 2:08 PM, houlong wei <houlong.wei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Hi Jassi,
>
> Sorry for reply so late.
> According to previous discussion, there are two methods to move
> dma_map_single() outside of spin_lock.
> (1) put in mtk-cmdq-helper.c, as described by HS on 2017-02-09.
>   > I think a trade-off solution is to put in mtk-cmdq-helper.c.
>   > Although it is a mailbox client, it is not a CMDQ client.
>   > We can include mailbox_controller.h in mtk-cmdq-helper.c (instead of
> mtk-cmdq.h), and then map dma at cmdq_pkt_flush_async before
> mbox_send_message.
>
>   > pkt->pa_base = dma_map_single(client->chan->mbox->dev, pkt->va_base,
>   >                              pkt->cmd_buf_size, DMA_TO_DEVICE);
> (2) schedule a tasklet in send_data().
>
> After internal discussion with HS and other experts, now we prefer
> method (1).
> How do you think about it?
>
I don't exactly see how you mean but please remember send_data()
callback is supposed to be atomic ... it is protected by
spin_lock_irqsave/restore in drivers/mailbox/mailbox.c:msg_submit()

BTW, how many requests max can be queued in the GCE h/w buffer?
And since it's been over a year now, could you please resubmit after
checking for checkpatch with the --strict option?

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
