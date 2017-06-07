From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 00/23] mtd: nand: denali: Denali NAND IP patch bomb
Date: Wed, 7 Jun 2017 09:24:40 +0200
Message-ID: <20170607092440.2b630e16@bbrezillon>
References: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
        <20170607000911.521d559d@bbrezillon>
        <CAK7LNAScATQDDaas_sgJ-+2-nbF5PSoVdpF+f27Vpat1+cexgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNAScATQDDaas_sgJ-+2-nbF5PSoVdpF+f27Vpat1+cexgg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Enrico Jorns <ejo-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuanxiao Dong <chuanxiao.dong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 7 Jun 2017 10:21:07 +0900
Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:

> Hi Boris,
> 
> 
> 2017-06-07 7:09 GMT+09:00 Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> > Hi Masahiro,
> >
> > On Tue,  6 Jun 2017 08:21:39 +0900
> > Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> >  
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
> >>
> >> 18 patches were merged at v2.
> >> 11 patches were merged at v3.
> >> Here is the rest of the series.
> >>
> >> v1: https://lkml.org/lkml/2016/11/26/144
> >> v2: https://lkml.org/lkml/2017/3/22/804
> >> v3: https://lkml.org/lkml/2017/3/30/90
> >>
> >>
> >> Masahiro Yamada (23):
> >>   mtd: nand: denali_dt: clean up resource ioremap
> >>   mtd: nand: denali: use BIT() and GENMASK() for register macros
> >>   mtd: nand: add generic helpers to check, match, maximize ECC settings
> >>   mtd: nand: denali: avoid hard-coding ECC step, strength, bytes
> >>   mtd: nand: denali: remove Toshiba and Hynix specific fixup code
> >>   mtd: nand: denali_dt: add compatible strings for UniPhier SoC variants
> >>   mtd: nand: denali: set NAND_ECC_CUSTOM_PAGE_ACCESS
> >>   mtd: nand: denali: do not propagate NAND_STATUS_FAIL to waitfunc()
> >>   mtd: nand: denali: remove unneeded find_valid_banks()
> >>   mtd: nand: denali: handle timing parameters by setup_data_interface()
> >>   mtd: nand: denali: rework interrupt handling
> >>   mtd: nand: denali: fix NAND_CMD_STATUS handling
> >>   mtd: nand: denali: fix NAND_CMD_PARAM handling
> >>   mtd: nand: denali: switch over to cmd_ctrl instead of cmdfunc
> >>   mtd: nand: denali: fix bank reset function to detect the number of
> >>     chips
> >>   mtd: nand: denali: use interrupt instead of polling for bank reset
> >>   mtd: nand: denali: propagate page to helpers via function argument
> >>   mtd: nand: denali: merge struct nand_buf into struct denali_nand_info
> >>   mtd: nand: denali: use flag instead of register macro for direction
> >>   mtd: nand: denali: fix raw and oob accessors for syndrome page layout
> >>   mtd: nand: denali: skip driver internal bounce buffer when possible
> >>   mtd: nand: denali: use non-managed kmalloc() for DMA buffer
> >>   mtd: nand: denali: enable bad block table scan  
> >
> > I'd like to apply as much patches as possible from this series (already
> > applied patches 1 and 2). Can you point patches that actually depend on
> > patches 3 and 4?
> >  
> 
> 
> I think
> 09 "mtd: nand: denali: remove unneeded find_valid_banks()"
> is applicable independently.
> 
> I will try my best to work on v5 quickly.

Applied patches 1 and 2. Can you send only patches 3 and 4 in your v5
or re-order patches to avoid the dependency on these patches.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
