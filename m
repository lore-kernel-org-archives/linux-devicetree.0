From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 4/5] dt-bindings: pinctrl: add imx7ulp pinctrl binding
 doc
Date: Thu, 25 May 2017 14:23:49 +0800
Message-ID: <20170525062347.GT26102@dragon>
References: <1495177545-23006-1-git-send-email-aisheng.dong@nxp.com>
 <1495177545-23006-5-git-send-email-aisheng.dong@nxp.com>
 <5e78ef100319f229a87e33804384e5b3@agner.ch>
 <DBXPR04MB320A55DE4386DE561A1D4DC80F90@DBXPR04MB320.eurprd04.prod.outlook.com>
 <20170525031620.GS26102@dragon>
 <AM3PR04MB3068FA0B94C9B0D6269FC9C80FF0@AM3PR04MB306.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AM3PR04MB3068FA0B94C9B0D6269FC9C80FF0-f56W/S9L6NSIzFHTN1kKrAfhPeD8jYilXA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "A.S. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Duan <fugang.duan-3arQi8VN3Tc@public.gmane.org>, Jacky Bai <ping.bai-3arQi8VN3Tc@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 25, 2017 at 05:04:58AM +0000, A.S. Dong wrote:
> If we really want to change, 'IMX7ULP1' may be a little strange as 'IMX7ULP' is
> the official external name and all other places are using it.
> So IMX7ULP may be more suitable.

Yes, I actually meant IMX7ULP, which matches how we name the SoC
elsewhere in the kernel.

> 
> Then next generation may be:
> IMX7ULP0_PAD_PTC0_PTC0.
> Vs
> IMX7ULP_PAD_PTC0_PTC0
> 
> Just not much better than:
> ULP1_PAD_PTC0_PTC0.
> vs
> ULP0_PAD_PTC0_PTC0
> 
> That's why I did not do it initially.
> 
> However, if you do want the change, i'm okay to do it.

For the next generation, we will have a name for it in the kernel
anyway.  The pinctrl macro simply follows that name.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
