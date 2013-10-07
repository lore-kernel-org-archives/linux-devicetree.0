From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH|RFC] of: let of_match_device() always return best match
Date: Mon, 7 Oct 2013 10:17:03 +0200
Message-ID: <21074.28159.130293.169699@ipc1.ka-ro>
References: <1380826284-18381-1-git-send-email-mkl@pengutronix.de>
	<CAOMZO5BekS_BvJzrt8vM1=7LjsiO=3hKL=mMfTjxkO3aZ4qwRQ@mail.gmail.com>
	<525052F5.5080204@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <525052F5.5080204-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel@pengutronix.de" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Marc Kleine-Budde writes:
> On 10/05/2013 07:46 PM, Fabio Estevam wrote:
> > Hi Marc,
> >=20
> > On Thu, Oct 3, 2013 at 3:51 PM, Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
> >=20
> >> For example:
> >>
> >> The imx28.dtsi gives this compatible string for its CAN core:
> >>
> >>>       compatible =3D "fsl,imx28-flexcan", "fsl,p1010-flexcan";
> >>
> >> The flexcan driver defines:
> >>
> >>> static const struct of_device_id flexcan_of_match[] =3D {
> >>>       { .compatible =3D "fsl,p1010-flexcan", .data =3D &fsl_p1010=
_devtype_data, },
> >>>       { .compatible =3D "fsl,imx28-flexcan", .data =3D &fsl_imx28=
_devtype_data, },
> >>>       { .compatible =3D "fsl,imx6q-flexcan", .data =3D &fsl_imx6q=
_devtype_data, },
> >>>       { /* sentinel */ },
> >>> };
> >>
> >> The "p1010" was the first Freescale SoC with the flexcan core. But=
 this SoC has
> >> a bug, so a workaround has to be enabled in the driver. The mx28 h=
as this bug
> >> fixed, so we don't need this quite costly workaround.
> >=20
> > What about defining in imx28.dtsi:
> > compatible =3D "fsl,imx28-flexcan".
>=20
> It already works with changing only the driver.
>=20
IMO the change proposed by Fabio is much more sensible. If the imx28
implementation of the CAN controller is not compatible to p1010 (which
is obviously true) there is no point in having the "fsl,p1010-flexcan"
in the DT for imx28.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org
___________________________________________________________
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
