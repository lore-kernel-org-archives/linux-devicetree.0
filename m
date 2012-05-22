From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 06/12] ARM: imx6q: correct device name of usbphy and
 usb controller clock export
Date: Tue, 22 May 2012 12:56:11 +0800
Message-ID: <20120522045610.GM6206@b20223-02.ap.freescale.net>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <1337592237-5090-7-git-send-email-richard.zhao@freescale.com>
 <201205220631.28739.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201205220631.28739.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 22, 2012 at 06:31:28AM +0200, Marek Vasut wrote:
> Dear Richard Zhao,
> 
> We will need similar patch for mx28 I think?
It has mx28 clk patch. hmm..., something is wrong. I'll fix the name.

Thanks
Richard
> 
> Otherwise
> Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> 
> > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  arch/arm/mach-imx/clk-imx6q.c |    5 ++++-
> >  1 files changed, 4 insertions(+), 1 deletions(-)
> > 
> > diff --git a/arch/arm/mach-imx/clk-imx6q.c b/arch/arm/mach-imx/clk-imx6q.c
> > index 96e9edd..f99509a 100644
> > --- a/arch/arm/mach-imx/clk-imx6q.c
> > +++ b/arch/arm/mach-imx/clk-imx6q.c
> > @@ -391,7 +391,10 @@ int __init mx6q_clocks_init(void)
> >  	clk_register_clkdev(clk[gpt_ipg], "ipg", "imx-gpt.0");
> >  	clk_register_clkdev(clk[gpt_ipg_per], "per", "imx-gpt.0");
> >  	clk_register_clkdev(clk[twd], NULL, "smp_twd");
> > -	clk_register_clkdev(clk[usboh3], NULL, "usboh3");
> > +	clk_register_clkdev(clk[usboh3], NULL, "2184000.usb");
> > +	clk_register_clkdev(clk[usboh3], NULL, "2184200.usb");
> > +	clk_register_clkdev(clk[usboh3], NULL, "2184400.usb");
> > +	clk_register_clkdev(clk[usboh3], NULL, "2184600.usb");
> >  	clk_register_clkdev(clk[uart_serial], "per", "2020000.serial");
> >  	clk_register_clkdev(clk[uart_ipg], "ipg", "2020000.serial");
> >  	clk_register_clkdev(clk[uart_serial], "per", "21e8000.serial");
> 
> Best regards,
> Marek Vasut
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
