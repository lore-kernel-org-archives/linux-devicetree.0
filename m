From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] dt-bindings: pinctrl: add imx7ulp pinctrl binding doc
Date: Mon, 15 May 2017 20:20:33 +0800
Message-ID: <20170515122032.GS8471@dragon>
References: <1494592686-30967-1-git-send-email-aisheng.dong@nxp.com>
 <1494592686-30967-5-git-send-email-aisheng.dong@nxp.com>
 <20170515114319.GP8471@dragon>
 <AM3PR04MB3069C90F23CF9C9CC84BA7580E10@AM3PR04MB306.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AM3PR04MB3069C90F23CF9C9CC84BA7580E10-f56W/S9L6NSIzFHTN1kKrAfhPeD8jYilXA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "A.S. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Duan <fugang.duan-3arQi8VN3Tc@public.gmane.org>, Jacky Bai <ping.bai-3arQi8VN3Tc@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "stefan-XLVq0VzYD2Y@public.gmane.org" <stefan-XLVq0VzYD2Y@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 15, 2017 at 12:06:19PM +0000, A.S. Dong wrote:
> > > @@ -0,0 +1,56 @@
> > > +* Freescale i.MX7ULP IOMUX Controller
> > > +
> > > +Please refer to fsl,imx-pinctrl.txt in this directory for common
> > > +binding part and usage.
> > 
> > Are imx7ulp-pinctrl bindings more alike to fsl,imx-pinctrl.txt or generic
> > pinctrl-bindings.txt?  My personal feeling is that it might be better to
> > take pinctrl-bindings.txt as the reference base and highlight how imx7ulp-
> > pinctrl bindings differ from it.
> > 
> 
> It seems still more like fsl,imx-pinctrl.txt.
> 
> I know fsl,imx-pinctrl.txt is a bit out of date, especially after we add
> generic pinconf.
> 
> I plan to update it later after adding generic pin conf support to legacy
> SoCs (MX6 & 7) as well, do you think it's ok?

Please do not.  Let's use generic pinconf support only for new SoCs, and
not bother with legacy SoCs.

<snip>

> > > diff --git a/include/dt-bindings/pinctrl/imx7ulp-pinfunc.h
> > > b/include/dt-bindings/pinctrl/imx7ulp-pinfunc.h
> > > new file mode 100644
> > > index 0000000..b6db73f
> > > --- /dev/null
> > > +++ b/include/dt-bindings/pinctrl/imx7ulp-pinfunc.h
> > 
> > The header will only be used by dts files, right?  If so,
> > arch/arm/boot/dts is the better place.
> > 
> 
> I can do it, but I'm just a bit confused that only IMX is still
> Putting pinctrl headfile under arch/arm/boot/dts/.

It makes sense to define DT constants in include/dt-bindings/pinctrl/
only when they are referenced by both kernel and dts.  If it's only
included by dts, arch/arm/boot/dts/ should definitely be the better
place.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
