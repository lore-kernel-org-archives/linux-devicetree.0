From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH] usb: phy-generic: Don't fail on missing gpio reset
Date: Tue, 27 Jan 2015 13:14:28 -0600
Message-ID: <20150127191427.GN14878@saruman.tx.rr.com>
References: <1422323129-20969-1-git-send-email-soren.brinkmann@xilinx.com>
 <20150127152047.GA13776@saruman.tx.rr.com>
 <19e48726b36942cfb0430fc625b41e1b@BY2FFO11FD043.protection.gbl>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B3NBd8mrXZtPJEYR"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <19e48726b36942cfb0430fc625b41e1b@BY2FFO11FD043.protection.gbl>
Sender: linux-gpio-owner@vger.kernel.org
To: =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>
Cc: Felipe Balbi <balbi@ti.com>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ola Jeppson <ola@adapteva.com>, linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--B3NBd8mrXZtPJEYR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2015 at 11:13:08AM -0800, S=F6ren Brinkmann wrote:
> On Tue, 2015-01-27 at 09:20AM -0600, Felipe Balbi wrote:
> > On Mon, Jan 26, 2015 at 05:45:29PM -0800, Soren Brinkmann wrote:
> > > A reset through a GPIO is optional. Don't fail probing when it is
> > > missing.
> > >=20
> > > Reported-by: Andreas F=E4rber <afaerber@suse.de>
> > > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > > ---
> > > Hi Andreas,
> > >=20
> > > does this do the trick?
> > >=20
> > > 	Thanks,
> > > 	S=F6ren
> > >=20
> > >  drivers/usb/phy/phy-generic.c | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-gene=
ric.c
> > > index dd05254241fb..a73d4c738f0b 100644
> > > --- a/drivers/usb/phy/phy-generic.c
> > > +++ b/drivers/usb/phy/phy-generic.c
> > > @@ -241,10 +241,8 @@ int usb_phy_gen_create_phy(struct device *dev, s=
truct usb_phy_generic *nop,
> > > =20
> > >  	if (err =3D=3D -EPROBE_DEFER)
> > >  		return -EPROBE_DEFER;
> > > -	if (err) {
> > > -		dev_err(dev, "Error requesting RESET GPIO\n");
> > > -		return err;
> > > -	}
> > > +	if (err)
> > > +		nop->gpiod_reset =3D NULL;
> >=20
> > there's a better patch to use gpiod_get_optional(), instead.
>=20
> Great, apparently that wasn't in linux-next yesterday. I'll give it a
> shot once it arrives there.

It's still under discussion ;-)

--=20
balbi

--B3NBd8mrXZtPJEYR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUx+OTAAoJEIaOsuA1yqREyasP/RX1i4b5DIF/mhYSGxNTmUdV
awMNco82ACBvOur+afxzWwVCMMK/Xd9JwpLPFjXBMLyPIu/eRXYYozF1BPRtBstN
yl2Y0YTjXQpTmpVn9iQGz2T3Uuz3HZ/Op3+cmrmsnJDrYbK1Kh73U3scxXFzzxih
V8pgkKYKcO6dVq77wD3vlDkltRLY643f5Ji5+T3RVv3KQl6HPNzMBkL2UohnFzkI
UTGVgRCYIki8ezwmBH92AdBabcYNTkd4SzJJxrnfba4/bdWtDX8swuKcMlN0DjkT
fIDXbM2BmATsJ1a/wadm52GOl8Qz0twn1IgeuRwgSTldkuBL+58qiFfAGpi9LPKv
LJUOPv1z91/tsV+EoA5W8PTbjBTLUYdvUcfXSd25X0okD8zGX+0Diu35yzW7vfsp
HBkIG6IhpijHad4RRH8l+BT50kMzGuOEMr+F9OYPEeqWYx5awXN322qImMroqjWM
NRil2pmzqxibbM11YysvJMcwVDKRER3ZWKsab8ig3ZI3LThUsTTT+s5yRor2zITn
9SK4yIAZiyK/rOvgeM9kd0G+mG6RbDt8Y/o9v5ZBqcZIh8DIEAaAVK1zrYZhRCZN
g9U2aN9YkZZnd/97SPrNG9rsTsVyWC/Nkv9YBbhYwlREWENsuYnqMlscDT25GzxW
nFO8AwVqoLglIA28Terv
=SGSb
-----END PGP SIGNATURE-----

--B3NBd8mrXZtPJEYR--
