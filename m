From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 00/23] mtd: nand: denali: Denali NAND IP patch bomb
Date: Thu, 8 Jun 2017 09:18:33 +0200
Message-ID: <20170608091833.5dfd091b@bbrezillon>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
        <CAK7LNAQMCCxZAJc=7EwEPmpxD+-VsgOvMxwk5ySLfxLVsarqhw@mail.gmail.com>
        <CAK7LNASu=cmQo+gCmfY=MFLoGtm0oeZQ036Nst63bZOEwFxR4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNASu=cmQo+gCmfY=MFLoGtm0oeZQ036Nst63bZOEwFxR4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Enrico Jorns <ejo-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuanxiao Dong <chuanxiao.dong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le Thu, 8 Jun 2017 16:12:49 +0900,
Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> a écrit :

> 2017-06-08 15:16 GMT+09:00 Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>:
> > Hi Boris,
> >
> > 2017-06-07 20:52 GMT+09:00 Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>:  
> >> This patch series intends to solve various problems.
> >>
> >> [1] The driver just retrieves the OOB area as-is
> >>     whereas the controller uses syndrome page layout.
> >> [2] Many NAND chip specific parameters are hard-coded in the driver.
> >> [3] ONFi devices are not working
> >> [4] It can not read Bad Block Marker
> >>
> >> Outstanding changes are:
> >> - Fix raw/oob callbacks for syndrome page layout
> >> - Implement setup_data_interface() callback
> >> - Fix/implement more commands for ONFi devices
> >> - Allow to skip the driver internal bounce buffer
> >> - Support PIO in case DMA is not supported
> >> - Switch from ->cmdfunc over to ->cmd_ctrl  
> >
> >
> > I am planning v6, but
> > how many can you pick-up from this series?
> >
> > I did not see your comments for 01-05, so are they applicable?
> >
> > Could you add
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > for 05  (http://patchwork.ozlabs.org/patch/772388/)
> >
> > He had already acked it, but I just missed it.
> >  
> 
> BTW, this series can not apply to Boris's tree
> because of the following commit.
> 
> commit 4a78cc644eed3cf2dae00c3a959910a86c140fd6
> Author: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Date:   Fri May 26 17:10:15 2017 +0200
> 
>     mtd: nand: Make sure drivers not supporting SET/GET_FEATURES
> return -ENOTSUPP
> 
> 
> 
> I will send v6 rebased on nand/next branch.
> 

Please wait a bit before spamming the ML again. I'd like to finish
reviewing patches and apply uncontroversial ones.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
