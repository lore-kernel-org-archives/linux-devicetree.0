From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] of: match the compatible in the order set by the dts file
Date: Tue, 9 Jul 2013 09:51:24 +0200
Message-ID: <20130709075124.GR516@pengutronix.de>
References: <1373013818-11365-1-git-send-email-b32955@freescale.com>
 <20130709070541.GQ516@pengutronix.de>
 <51DBBFDA.70302@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51DBBFDA.70302@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Huang Shijie <b32955@freescale.com>
Cc: grant.likely@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 09, 2013 at 03:46:34PM +0800, Huang Shijie wrote:
> =E4=BA=8E 2013=E5=B9=B407=E6=9C=8809=E6=97=A5 15:05, Sascha Hauer =E5=
=86=99=E9=81=93:
> >Why don't you set the matching order in the driver the way you want =
it
> >to be, i.e.:
> >
> >	{ .compatible =3D "fsl,imx6q-uart", ... },
> >	{ .compatible =3D "fsl,imx21-uart", ... },
> >	{ .compatible =3D "fsl,imx1-uart", ... },
> >
> yes. i can set it like this.
>=20
> but this method looks like a ugly workaround.

If a driver has different ways of supporting a single device, then
putting the preferred or most feature rich on top doesn't look very ugl=
y
to me.

Sascha

--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
