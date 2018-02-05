From: Jacky Bai <ping.bai-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v2 2/4] arm64: add basic DTS for i.MX8MQ
Date: Mon, 5 Feb 2018 09:07:24 +0000
Message-ID: <HE1PR04MB31135BD7833FD443CD6BAD6B87FE0@HE1PR04MB3113.eurprd04.prod.outlook.com>
References: <20180201183126.32384-1-l.stach@pengutronix.de>
 <20180201183126.32384-2-l.stach@pengutronix.de>
 <HE1PR04MB3113FF72B02D642392D625DF87F90@HE1PR04MB3113.eurprd04.prod.outlook.com>
 <20180205084505.GV31354@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205084505.GV31354@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dl-linux-imx <linux-imx-3arQi8VN3Tc@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "A.s. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH v2 2/4] arm64: add basic DTS for i.MX8MQ
>=20
> On Fri, Feb 02, 2018 at 08:13:56AM +0000, Jacky Bai wrote:
> > > Subject: [PATCH v2 2/4] arm64: add basic DTS for i.MX8MQ
> > >
> > > This adds the basic DTS for the i.MX8MQ.
> > > For now only the following peripherals are supported:
> > > - IOMUXC (pin controller)
> > > - CCM (clock controller)
> > > - GPIO
> > > - UART
> > > - uSDHC (SD/eMMC controller)
> > > - FEC (ethernet controller)
> > > - i2c
> > >
> > > This is enough to get a very basic board support up and running.
> > >
> > > One known limitation is that the driver for the GPC interrupt
> > > controller is still missing, rendering the CPU sleep states unusable
> > > as there is nothing waking them up anymore. This will be fixed in
> > > due course.
> > >
> >
> > The cpu sleep states can NOT be supported in community kernel due to
> hardware limitation.
>=20
> Jacky,
>=20
> Can you elaborate your comment a bit?  If it's a hardware limitation, I g=
uess
> not only community but also vendor kernel has no way to support sleep sta=
tes,
> right?
>=20
> Shawn

It need to add a workaround in GIC common code, maybe it can NOT be accepte=
d by community.

BR
Jacky bai
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
