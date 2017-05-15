From: "A.S. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 3/5] dt-bindings: pinctrl: add imx7ulp pinctrl binding doc
Date: Mon, 15 May 2017 13:12:25 +0000
Message-ID: <AM3PR04MB3063C9CFC02E03DE2B4C2ED80E10@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1494592686-30967-1-git-send-email-aisheng.dong@nxp.com>
 <1494592686-30967-5-git-send-email-aisheng.dong@nxp.com>
 <20170515114319.GP8471@dragon>
 <AM3PR04MB3069C90F23CF9C9CC84BA7580E10@AM3PR04MB306.eurprd04.prod.outlook.com>
 <20170515122032.GS8471@dragon>
 <AM3PR04MB3069C788C96EE2854C2C68080E10@AM3PR04MB306.eurprd04.prod.outlook.com>
 <20170515125905.GV8471@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170515125905.GV8471@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Duan <fugang.duan-3arQi8VN3Tc@public.gmane.org>, Jacky Bai <ping.bai-3arQi8VN3Tc@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "stefan-XLVq0VzYD2Y@public.gmane.org" <stefan-XLVq0VzYD2Y@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Monday, May 15, 2017 8:59 PM
> To: A.S. Dong
> Cc: Mark Rutland; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Andy Duan; Jacky Bai;
> linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; stefan-XLVq0VzYD2Y@public.gmane.org; linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Ro=
b
> Herring; kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Subject: Re: [PATCH 3/5] dt-bindings: pinctrl: add imx7ulp pinctrl bindin=
g
> doc
>=20
> On Mon, May 15, 2017 at 12:41:09PM +0000, A.S. Dong wrote:
> > > On Mon, May 15, 2017 at 12:06:19PM +0000, A.S. Dong wrote:
> > > > > > @@ -0,0 +1,56 @@
> > > > > > +* Freescale i.MX7ULP IOMUX Controller
> > > > > > +
> > > > > > +Please refer to fsl,imx-pinctrl.txt in this directory for
> > > > > > +common binding part and usage.
> > > > >
> > > > > Are imx7ulp-pinctrl bindings more alike to fsl,imx-pinctrl.txt
> > > > > or generic pinctrl-bindings.txt?  My personal feeling is that it
> > > > > might be better to take pinctrl-bindings.txt as the reference
> > > > > base and highlight how imx7ulp- pinctrl bindings differ from it.
> > > > >
> > > >
> > > > It seems still more like fsl,imx-pinctrl.txt.
> > > >
> > > > I know fsl,imx-pinctrl.txt is a bit out of date, especially after
> > > > we add generic pinconf.
> > > >
> > > > I plan to update it later after adding generic pin conf support to
> > > > legacy SoCs (MX6 & 7) as well, do you think it's ok?
> > >
> > > Please do not.  Let's use generic pinconf support only for new SoCs,
> > > and not bother with legacy SoCs.
> > >
> >
> > I wonder there may be some guys interested more in generic Pinconfig
> > format rather than old one when they add new board support, or someone
> > else adding the support for legacy SoCs as the pinctrl-imx core
> > already supports it after this patch series.
>=20
> I would take this as an unnecessary churn on existing code and increase o=
f
> maintenance burden.  So that's definitely a NO from me.
>=20

Okay, personally I would be with you!

Regards
Dong Aisheng
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
