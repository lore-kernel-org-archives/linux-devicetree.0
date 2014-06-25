From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: add support for Ka-Ro TX51
Date: Wed, 25 Jun 2014 14:48:43 +0800
Message-ID: <20140625064841.GA2224@dragon>
References: <1402578584-12640-1-git-send-email-LW@KARO-electronics.de>
 <20140618150152.GP8860@dragon> <20140623121839.679f35ee@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140623121839.679f35ee-VjFSrY7JcPWvSplVBqRQBQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 23, 2014 at 12:18:39PM +0200, Lothar Wa=DFmann wrote:
=2E..
> > > +	phy-handle =3D <&phy0>;
> > > +	mac-address =3D [000000000000]; /* will be set by U-Boot */
> >=20
> > Shouldn't it be local-mac-address?
> >=20
> probably yes, but both 'mac-address' and 'local-mac-address' are bein=
g
> set up by U-Boot anyway.

Okay, never mind.  I just realized kernel supports both properties.

=2E..

> > > +&esdhc1 {
> > > +	cd-gpios =3D <&gpio3 8 GPIO_ACTIVE_LOW>;
> > > +	fsl,wp-controller;
> >=20
> > Does it work for you, since the driver does not support it as of to=
day?
> >=20
> What driver doesn't support what?
> AFAICT the sdhci-esdhc-imx.c driver supports both of these properties=
=2E

That was the case before, but it's not the case since commit
89d7e5c13122 (mmc: sdhci-esdhc-imx: add runtime pm support).

http://thread.gmane.org/gmane.linux.kernel.mmc/27287

=2E..

> > > +	spidev0: spi@0 {
> > > +		compatible =3D "spidev";
> > > +		reg =3D <0>;
> > > +		spi-max-frequency =3D <54000000>;
> > > +	};
> > > +
> > > +	spidev1: spi@1 {
> > > +		compatible =3D "spidev";
> > > +		reg =3D <1>;
> > > +		spi-max-frequency =3D <54000000>;
> > > +	};
> >=20
> > I'm not sure we should have these two devices.
> >=20
> Why not? With this the SPI bus can readily be used with the spidev
> driver from Documentation/spi/spidev_test.c (which is what most of ou=
r
> customers are asking for)!

Is this something that has been approved by DT maintainers?  I do not
see "spidev" documented as a compatible in any bindings doc.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
