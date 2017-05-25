From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 1/2] dt-bindings: pinctrl: add imx7ulp pinctrl binding
 doc
Date: Thu, 25 May 2017 15:42:59 +0800
Message-ID: <20170525074255.GY26102@dragon>
References: <1495539829-23345-1-git-send-email-aisheng.dong@nxp.com>
 <20170523182321.GA13664@w540>
 <AM3PR04MB3065626F1B45C8459E5765580FE0@AM3PR04MB306.eurprd04.prod.outlook.com>
 <AM3PR04MB306BB77DD89C680DC42636D80FF0@AM3PR04MB306.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AM3PR04MB306BB77DD89C680DC42636D80FF0-f56W/S9L6NSIzFHTN1kKrAfhPeD8jYilXA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "A.S. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
Cc: 'jmondi' <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, "'linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org'" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "'devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Duan <fugang.duan-3arQi8VN3Tc@public.gmane.org>, Jacky Bai <ping.bai-3arQi8VN3Tc@public.gmane.org>, "'stefan-XLVq0VzYD2Y@public.gmane.org'" <stefan-XLVq0VzYD2Y@public.gmane.org>, "'linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'Rob Herring' <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "'kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org'" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "'linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org'" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 25, 2017 at 05:06:56AM +0000, A.S. Dong wrote:
> > > > +=== Pin Configuration Node ===
> > > > +- pins: One integers array, represents a group of pins mux setting.
> > > > +	The format is fsl,pins = <PIN_FUNC_ID>, PIN_FUNC_ID is a pin
> > > > +working
> > > on
> > > > +	a specific function.
> > > > +
> > > > +	NOTE: i.MX7ULP PIN_FUNC_ID consists of 4 integers as it shares one
> > > mux
> > > > +	and config register as follows:
> > > > +	<mux_conf_reg input_reg mux_mode input_val>
> > >
> > > As your PIN_FUNC_ID specifies both the pin ids and their mux settings,
> > > shouldn't you use the newly documented 'pinmux' property in place of
> > > 'pins'?
> > >
> > > Please see
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com
> > > mit/ ?id=8d5e7c5df0a6c442373628be5221321172b1badf
> > >
> > > The current documentation specifies pin ids and mux settings have to
> > > be assembled in one single integer, which is not your case, but that
> > > can be changed to make it accept an array of integers values if needed.
> > >
> > 
> > Thanks for the info.
> > Looks good to me.
> > 
> > Shawn & Linus,
> > Are you okay with this?
> > 
> > If yes, I can extend the standard 'pinmux' property to support integer
> > array and renew the patch series to use it.
> > 
> 
> Would you comment on this question?
> 
> Then I can decide whether sent a new series based on it.

I'm fine with it.  But what's important is whether Linus is fine with
extending the standard 'pinmux' property to cover IMX case.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
