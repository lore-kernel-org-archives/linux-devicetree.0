From: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: imx6ul: Add flexcan1 and flexcan2 support
Date: Sat, 20 Feb 2016 18:18:23 +0100
Message-ID: <20160220171816.GA24064@panicking>
References: <1455963652-24618-1-git-send-email-michael@amarulasolutions.com>
 <1455963652-24618-2-git-send-email-michael@amarulasolutions.com>
 <CAOMZO5Bk_ZMhYzFLRFNK2TQvK4KHuj62AM_6uF-m-P1kJupTHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5Bk_ZMhYzFLRFNK2TQvK4KHuj62AM_6uF-m-P1kJupTHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio

On Sat, Feb 20, 2016 at 12:02:51PM -0200, Fabio Estevam wrote:
> On Sat, Feb 20, 2016 at 8:20 AM, Michael Trimarchi
> <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> 
> > +
> > +                               flexcan1: can@02090000 {
> > +                                       compatible = "fsl,imx6ul-flexcan", "fsl,imx6q-flexcan";
> > +                                       reg = <0x02090000 0x4000>;
> > +                                       interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> > +                                       clocks = <&clks IMX6UL_CLK_CAN1_IPG>,
> > +                                                <&clks IMX6UL_CLK_CAN1_SERIAL>;
> > +                                       clock-names = "ipg", "per";
> > +                                       stop-mode = <&gpr 0x10 1 0x10 17>;
> 
> This 'stop-mode' property is not handled in mainline, only in NXP
> kernel, so I suggest to drop this.

ok. Can you point me out to a driver in freescale source that use it?

Michael

-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
