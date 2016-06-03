From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 2/3] CMDQ: Mediatek CMDQ driver
Date: Fri, 3 Jun 2016 18:41:52 +0530
Message-ID: <CABb+yY2aOncqM-fOiq_ZBink0Fth6Drd30ZMe3-bXNkodW2dVA@mail.gmail.com>
References: <1464578397-29743-1-git-send-email-hs.liao@mediatek.com>
 <1464578397-29743-3-git-send-email-hs.liao@mediatek.com> <574C5CBF.7060002@gmail.com>
 <1464683762.14604.59.camel@mtksdaap41> <574DEE40.9010008@gmail.com>
 <1464775020.11122.40.camel@mtksdaap41> <574FF264.7050209@gmail.com>
 <1464934356.15175.31.camel@mtksdaap41> <57516774.5080008@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57516774.5080008-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK HU <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Josh-YC Liu <josh-yc.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Glory Hung <glory.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jiaguang Zhang <jiaguang.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Dennis-YC
List-Id: devicetree@vger.kernel.org

On Fri, Jun 3, 2016 at 4:48 PM, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 03/06/16 08:12, Horng-Shyang Liao wrote:
>> On Thu, 2016-06-02 at 10:46 +0200, Matthias Brugger wrote:

>>> I keep thinking about how to get rid of the two data structures,
>>> task_busy_list and the task_release_wq. We need the latter for the only
>>> sake of getting a timeout.
>>>
>>> Did you have a look on how the mailbox framework handles this?
>>> By the way, what is the reason to not implement the whole driver as a
>>> mailbox controller? For me, this driver looks like a good fit.
>>
>>
>> CMDQ needs to encode commands for GCE hardware. We think this behavior
>> should be put in CMDQ driver, and client just call CMDQ functions.
>> Therefore, if we want to use mailbox framework, cmdq_rec must be
>> mailbox client, and the others must be mailbox controller.
>>
>
> You mean the functions to fill the cmdq_rec and execute it?
> I think this should be part of the driver.
>
> Jassi, can you have a look on the interface this driver exports [0].
> They are needed to actually create the message which will be send.
> Could something like this be part of a mailbox driver?
>
> [0] https://patchwork.kernel.org/patch/9140221/
>
Packet creating/parsing should not be a part of controller driver. As
the log of this patch says, today it is used for only display but in
future it could work with other h/w as well, so it makes sense to have
mailbox api do the message queuing, the controller driver do the
send/receive and client drivers implement display and other h/w
specific packaging of data (protocol handling).

So yes, I think this could use mailbox api.

Cheers.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
