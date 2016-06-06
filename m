From: Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v8 2/3] CMDQ: Mediatek CMDQ driver
Date: Mon, 6 Jun 2016 17:33:53 +0800
Message-ID: <1465205633.25607.33.camel@mtksdaap41>
References: <1464578397-29743-1-git-send-email-hs.liao@mediatek.com>
	 <1464578397-29743-3-git-send-email-hs.liao@mediatek.com>
	 <574C5CBF.7060002@gmail.com> <1464683762.14604.59.camel@mtksdaap41>
	 <574DEE40.9010008@gmail.com> <1464775020.11122.40.camel@mtksdaap41>
	 <574FF264.7050209@gmail.com> <1464934356.15175.31.camel@mtksdaap41>
	 <57516774.5080008@gmail.com>
	 <CABb+yY2aOncqM-fOiq_ZBink0Fth6Drd30ZMe3-bXNkodW2dVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY2aOncqM-fOiq_ZBink0Fth6Drd30ZMe3-bXNkodW2dVA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Josh-YC Liu <josh-yc.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Glory Hung <glory.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jiaguang Zhang <jiaguang.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>De
List-Id: devicetree@vger.kernel.org

Hi Matthias, Jassi,

On Fri, 2016-06-03 at 18:41 +0530, Jassi Brar wrote:
> On Fri, Jun 3, 2016 at 4:48 PM, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On 03/06/16 08:12, Horng-Shyang Liao wrote:
> >> On Thu, 2016-06-02 at 10:46 +0200, Matthias Brugger wrote:
> 
> >>> I keep thinking about how to get rid of the two data structures,
> >>> task_busy_list and the task_release_wq. We need the latter for the only
> >>> sake of getting a timeout.
> >>>
> >>> Did you have a look on how the mailbox framework handles this?
> >>> By the way, what is the reason to not implement the whole driver as a
> >>> mailbox controller? For me, this driver looks like a good fit.
> >>
> >>
> >> CMDQ needs to encode commands for GCE hardware. We think this behavior
> >> should be put in CMDQ driver, and client just call CMDQ functions.
> >> Therefore, if we want to use mailbox framework, cmdq_rec must be
> >> mailbox client, and the others must be mailbox controller.
> >>
> >
> > You mean the functions to fill the cmdq_rec and execute it?
> > I think this should be part of the driver.
> >
> > Jassi, can you have a look on the interface this driver exports [0].
> > They are needed to actually create the message which will be send.
> > Could something like this be part of a mailbox driver?
> >
> > [0] https://patchwork.kernel.org/patch/9140221/
> >
> Packet creating/parsing should not be a part of controller driver. As
> the log of this patch says, today it is used for only display but in
> future it could work with other h/w as well, so it makes sense to have
> mailbox api do the message queuing, the controller driver do the
> send/receive and client drivers implement display and other h/w
> specific packaging of data (protocol handling).
> 
> So yes, I think this could use mailbox api.
> 
> Cheers.


Let me use display as an example to do some further explanation
about CMDQ in advance. You can think CMDQ is a shadow register
replacement. Therefore, we use cmdq_rec_write(_mask), cmdq_rec_wfe, and
cmdq_rec_clear_event instead of accessing registers, and use
cmdq_rec_flush(_async) instead of atomic swap.

If we use mailbox to do the message queue, we can use mailbox framework
to implement flush and callback. However, I don't think mailbox is
suitable for cmdq_rec_write(_mask), cmdq_rec_wfe, and
cmdq_rec_clear_event since they are just record some commands. Is this
the same as your comment "Packet creating/parsing should not be a part
of controller driver."?

Therefore, do you mean we use mailbox framework to implement flush and
callback and keep other interfaces? Just want to confirm that I get the
correct idea from you. Many thanks for your kindly reply.

Thanks,
HS


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
