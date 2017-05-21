From: "A.S. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH V2 4/5] dt-bindings: pinctrl: add imx7ulp pinctrl binding
 doc
Date: Sun, 21 May 2017 09:40:25 +0000
Message-ID: <AM3PR04MB306654DEA7C2B7676D5C0EC80FB0@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1495177545-23006-1-git-send-email-aisheng.dong@nxp.com>
 <1495177545-23006-5-git-send-email-aisheng.dong@nxp.com>
 <20170521093049.GM26102@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170521093049.GM26102@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "stefan-XLVq0VzYD2Y@public.gmane.org" <stefan-XLVq0VzYD2Y@public.gmane.org>, Jacky Bai <ping.bai-3arQi8VN3Tc@public.gmane.org>, Andy Duan <fugang.duan-3arQi8VN3Tc@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Sunday, May 21, 2017 5:31 PM
> To: A.S. Dong
> Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org;
> linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; stefan-XLVq0VzYD2Y@public.gmane.org; Jacky Bai; Andy Duan;
> kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; Rob Herring; Mark Rutland;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH V2 4/5] dt-bindings: pinctrl: add imx7ulp pinctrl
> binding doc
>=20
> On Fri, May 19, 2017 at 03:05:44PM +0800, Dong Aisheng wrote:
> > i.MX 7ULP has three IOMUXC instances: IOMUXC0 for M4 ports,
> > IOMUXC1 for A7 ports and IOMUXC DDR for DDR interface.
> >
> > This patch adds the IOMUXC1 support for A7.
> >
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
> >
> > ---
> > ChangeLog:
> > v1->v2:
> >  * add more descriptions in binding doc
> >  * add missed prefix for private properties.
> >  * move dt-bindings/pinctrl/imx7ulp-pinfunc.h to arch/arm/boot/dts
> > ---
> >  .../bindings/pinctrl/fsl,imx7ulp-pinctrl.txt       |  63 +++
> >  arch/arm/boot/dts/imx7ulp-pinfunc.h                | 468
> +++++++++++++++++++++
>=20
> Rather than being part of bindings doc patch, this pinfunc header should
> be included in dts patches that add imx7ulp SoC support.
>=20

Okay.
One question is that imx7ulp-pinfunc.h is mentioned in this binding doc,=20
that means after this patch applied, users still can't see it if separate,
Should we worry about this issue or not?
=20
+       Refer to imx7ulp-pinfunc.h in in device tree source folder for all
+       available imx7ulp PIN_FUNC_ID.

Last, thx for other ACKs.

Regards
Dong Aisheng

> Shawn
>=20
> >  2 files changed, 531 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
> >  create mode 100644 arch/arm/boot/dts/imx7ulp-pinfunc.h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
