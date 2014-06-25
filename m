From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: add support for Ka-Ro TX51
Date: Wed, 25 Jun 2014 09:08:49 +0200
Message-ID: <20140625070849.GO15686@pengutronix.de>
References: <1402578584-12640-1-git-send-email-LW@KARO-electronics.de>
 <20140618150152.GP8860@dragon>
 <20140623121839.679f35ee@ipc1.ka-ro>
 <20140625064841.GA2224@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140625064841.GA2224@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Lothar =?iso-8859-15?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 25, 2014 at 02:48:43PM +0800, Shawn Guo wrote:
> On Mon, Jun 23, 2014 at 12:18:39PM +0200, Lothar Wa=DFmann wrote:
> ...
> > > > +	phy-handle =3D <&phy0>;
> > > > +	mac-address =3D [000000000000]; /* will be set by U-Boot */
> > >=20
> > > Shouldn't it be local-mac-address?
> > >=20
> > probably yes, but both 'mac-address' and 'local-mac-address' are be=
ing
> > set up by U-Boot anyway.
>=20
> Okay, never mind.  I just realized kernel supports both properties.
>=20
> ...
>=20
> > > > +&esdhc1 {
> > > > +	cd-gpios =3D <&gpio3 8 GPIO_ACTIVE_LOW>;
> > > > +	fsl,wp-controller;
> > >=20
> > > Does it work for you, since the driver does not support it as of =
today?
> > >=20
> > What driver doesn't support what?
> > AFAICT the sdhci-esdhc-imx.c driver supports both of these properti=
es.
>=20
> That was the case before, but it's not the case since commit
> 89d7e5c13122 (mmc: sdhci-esdhc-imx: add runtime pm support).
>=20
> http://thread.gmane.org/gmane.linux.kernel.mmc/27287
>=20
> ...
>=20
> > > > +	spidev0: spi@0 {
> > > > +		compatible =3D "spidev";
> > > > +		reg =3D <0>;
> > > > +		spi-max-frequency =3D <54000000>;
> > > > +	};
> > > > +
> > > > +	spidev1: spi@1 {
> > > > +		compatible =3D "spidev";
> > > > +		reg =3D <1>;
> > > > +		spi-max-frequency =3D <54000000>;
> > > > +	};
> > >=20
> > > I'm not sure we should have these two devices.
> > >=20
> > Why not? With this the SPI bus can readily be used with the spidev
> > driver from Documentation/spi/spidev_test.c (which is what most of =
our
> > customers are asking for)!
>=20
> Is this something that has been approved by DT maintainers?  I do not
> see "spidev" documented as a compatible in any bindings doc.

I don't think it has been approved, but it's used already in several
places:

arch/arm/boot/dts/spear1340-evb.dts:496:                               =
         compatible =3D "spidev";
arch/arm/boot/dts/spear1310-evb.dts:402:                               =
         compatible =3D "spidev";
arch/arm/boot/dts/imx28-tx28.dts:623:           compatible =3D "spidev"=
;
arch/arm/boot/dts/imx28-tx28.dts:629:           compatible =3D "spidev"=
;
arch/arm/boot/dts/atlas6-evb.dts:32:                                   =
 compatible =3D "spidev";
arch/arm/boot/dts/marco-evb.dts:41:                                    =
 compatible =3D "spidev";
arch/arm/boot/dts/tegra30-colibri-eval-v3.dts:78:                      =
 compatible =3D "spidev";
arch/arm/boot/dts/imx53-tx53.dtsi:173:          compatible =3D "spidev"=
;
arch/arm/boot/dts/imx53-tx53.dtsi:179:          compatible =3D "spidev"=
;
arch/powerpc/boot/dts/mgcoge.dts:235:                                  =
 compatible =3D "gen,spidev";
arch/powerpc/boot/dts/o2d.dtsi:43:                              compati=
ble =3D "spidev";
arch/powerpc/boot/dts/digsy_mtc.dts:34:                         compati=
ble =3D "spidev";

Usually this binding gets denied with "spidev is Linux specific. Use a
specific compatible instead". This had the result that the spidev drive=
r
now matches to "rohm,dh2228fv" and I have already seen people claiming
that their spi device is a "rohm,dh2228fv" just to let the spidev drive=
r
match.

Maybe the reasoning for a spidev binding could be:

There is a SPI device, but we don't know what it is, so we just call it
"spidev". Linux just tries to make the best from the situation and make=
s
a userspace device from it.


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
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
