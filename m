From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCHv3 1/6] ARM: dts: Add SoC level device tree support for
 LS1021A
Date: Thu, 11 Sep 2014 13:12:02 +0200
Message-ID: <20140911111202.GA4958@pengutronix.de>
References: <1410253952-15631-1-git-send-email-jingchang.lu@freescale.com>
 <62651744.c71MLsL3Q5@wuerfel>
 <cd69af536cd248b8add94a468fa97095@BL2PR03MB467.namprd03.prod.outlook.com>
 <2944183.HzFlEzpKtu@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2944183.HzFlEzpKtu@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Shawn Guo <Shawn.Guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "shaveta-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <shaveta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "suresh.gupta-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <suresh.gupta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Ruchika Gupta <ruchika.gupta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 11, 2014 at 12:36:50PM +0200, Arnd Bergmann wrote:
> On Thursday 11 September 2014 08:21:58 Jingchang Lu wrote:
> > >One more thing: these should all go into the board specific files.
> > >
> > >The installed memory is almost always a property of the board, not the SoC,
> > >and a lot of boards only connect a subset of the serial ports, or they may
> > >have them in a different order.
> > >
> > >In particular, you only provide aliases for the six out of the ten
> > >available uarts, which seems arbitrary.
> > >
> > 
> > The memory size info will be fixed up in u-boot before booting the kernel image,
> > so I add the memory node in the SoC level device tree and keep only one copy. 
> 
> Right. I wonder if it would make sense to just leave a placeholder in there
> that does not look like a plausible memory size.

The placeholder is already in skeleton.dtsi, no need to add it at SoC
level.

> I believe the common case today
> is that we actually want to have the correct memory size in the board-level
> dts file because the boot loader does not change that value. If your boot loader
> does it, we probably don't want any default that may confuse users at all,
> in particular in the per-soc file.
> 
> > The lpuart derives the line number from the node's alias id, 8250 serial driver
> > doesn't rely on it, so only aliases for the lpuart are added, not arbitrary.
> 
> This is really bad though, for two reasons:
> 
> a) you are relying on current behavior of two kernel drivers that we may want to
> change in the future. Unfortunately the two drivers don't do this consistently
> today, but that's something we should fix in the kernel, not work around in
> the hardware description.
> 
> b) for the lpuart case, you put a fixed device order in the soc-specific file,
> without any guarantee that the board uses just the first x devices rather than
> another random subset. The alias values are really meant to to correspond to
> how the machine calls things, not how the SoC sees it.

All i.MX SoCs have the aliases defined how the SoC sees the devices and
i.MX is not alone here.

I know that some people rather like to see the aliases correspond to the
numbers printed on the case or PCB, thus dropping the aliases from the
SoC dtsi and putting them into the board dts instead.

I think both the UART number from the datasheet and the number printed
on the case are valuable informations, we should come up with a way to
express both informations instead of argueing about the meaning of the
'serialx' alias. This shouldn't even be too hard, we could create
multiple aliases for the same device and let udev create links for
all of them.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
