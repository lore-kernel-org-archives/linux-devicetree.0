From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: imx6: Add support for Toradex Apalis
	iMX6Q/D SoM
Date: Fri, 8 Jan 2016 09:42:47 +0100
Message-ID: <20160108084247.GB27359@ibawizard.net>
References: <1452011942-11940-1-git-send-email-marcel.ziswiler@toradex.com> <1452011942-11940-2-git-send-email-marcel.ziswiler@toradex.com> <20160106080358.GD9030@ibawizard.net> <1452071716.30372.61.camel@toradex.com>
Reply-To: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452071716.30372.61.camel-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: "ynezz-knWk7/PSn+s@public.gmane.org" <ynezz-knWk7/PSn+s@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "stefan-XLVq0VzYD2Y@public.gmane.org" <stefan-XLVq0VzYD2Y@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org> [2016-01-06 09:15:18]:

> > > <&pinctrl_regulator_usbotg_pwr>;
> > > +			regulator-name =3D "usb_otg_vbus";
> > > +			regulator-min-microvolt =3D <5000000>;
> > > +			regulator-max-microvolt =3D <5000000>;
> > > +			gpio =3D <&gpio3 22 GPIO_ACTIVE_HIGH>;
> > > +			enable-active-high;
> > > +			status =3D "disabled";
> > > +		};
> >=20
> > I'm not sure, but it seems to me, that we should move this regulato=
r into
> > the carrier board DTS. On our custom carrier board we've this regul=
ator
> > always on and we use this GPIO for heartbeat LED, so I've this in o=
ur
> > carrier board DTS[2]:
>=20
> Yes, you are absolutely right and e.g. on Apalis T30 [1] that is exac=
tly how
> we did it.

And what about usdhc? It leads to the same overrides in the carrier boa=
rd
file:

&iomuxc {
	usdhc {
		/* GPIO4_IO20 is LVDS */
		pinctrl_mmc_cd: gpio_mmc_cd {
		};

		/* Used as misc GPIOs */
		pinctrl_usdhc1: usdhc1grp {
		};
	};
};

> > > +/* PAD Ctrl values for common settings */
> > > +/*
> > > + * (PAD_CTL_HYS | PAD_CTL_PUS_100K_UP | PAD_CTL_PUE | PAD_CTL_PK=
E
> > > |
> > > + *=A0=A0PAD_CTL_SPEED_MED | PAD_CTL_DSE_40ohm)
> > > + */
> > > +#define PAD_CTRL_HYS_PU 0x1b0b0
> >=20
> > This was requested to be reworked. I've simply replaced all the
> > macros with
> > hex values.
>=20
> I don't think the reviewers really concluded on the action to be take=
n
> on here and just using hex values is probably the most stupid solutio=
n.

It's simple, if you just leave it as it is, then it will never get merg=
ed.
That's how kernel development works :) We've at least two options here:

1. Follow the old path and just convert those macros to hex values
2. Rework it - move those macros to some header file etc.

-- ynezz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
