From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PATCH 3/4] arm64: add support for i.MX8M EVK board
Date: Thu, 25 Jan 2018 11:52:24 +0200
Message-ID: <20180125095224.npweaunijmesbmhs@tarshish>
References: <20180117183244.28303-1-l.stach@pengutronix.de>
 <20180117183244.28303-3-l.stach@pengutronix.de>
 <20180124144751.jt6y3uayhplzbjxf@sapphire.tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180124144751.jt6y3uayhplzbjxf-MwjkAAnuF3khR1HGirfZ1z4kX+cae0hd@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lucas,

On Wed, Jan 24, 2018 at 04:47:51PM +0200, Baruch Siach wrote:
> On Wed, Jan 17, 2018 at 07:32:43PM +0100, Lucas Stach wrote:
> > This is the evaluation kit board for the i.MX8M. The current level of
> > support yields a working console and is able to boot userspace from
> > SD card or Network.
> > 
> > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/nxp/Makefile       |   3 +
> >  arch/arm64/boot/dts/nxp/imx8mq-evk.dts | 287 +++++++++++++++++++++++++++++++++
> >  2 files changed, 290 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/nxp/Makefile
> >  create mode 100644 arch/arm64/boot/dts/nxp/imx8mq-evk.dts
> > 
> > diff --git a/arch/arm64/boot/dts/nxp/Makefile b/arch/arm64/boot/dts/nxp/Makefile
> > new file mode 100644
> > index 000000000000..1aebb1f16708
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/nxp/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +dtb-$(CONFIG_SOC_IMX8MQ) += imx8m-evk.dtb
> 
> Typo, should be imx8mq-evk.dtb. Without this fix I'm getting:
> 
> make[2]: *** No rule to make target 'arch/arm64/boot/dts/nxp/imx8m-evk.dtb', needed by '__build'.  Stop.

With this fix and CONFIG_CPU_IDLE disabled:

Tested-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>

On i.MX8MQ EVK rev B3.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.52.368.4656, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
