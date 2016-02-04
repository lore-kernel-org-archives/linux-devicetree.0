From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: bcm2835: dt: Add the ethernet to the device
 tree
Date: Thu, 04 Feb 2016 08:18:13 +0100
Message-ID: <1454570293.25750.23.camel@v3.sk>
References: <1454511759-24827-1-git-send-email-lkundrak@v3.sk>
	 <1454511759-24827-3-git-send-email-lkundrak@v3.sk>
	 <m37fil8iq4.fsf@euphor.blino.org>
	 <HE1PR04MB14503FBA55F4F9C19EE669B68BD10@HE1PR04MB1450.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <HE1PR04MB14503FBA55F4F9C19EE669B68BD10-6LN7OEpIatVC+P/YwrXEHc9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>
Cc: "linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2016-02-04 at 06:28 +0000, Peter Chen wrote:
> =C2=A0
> > Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org> writes:
> >=20
> > > diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> > > b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> > > index ef54050..32bbd2a 100644
> > > --- a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> > > +++ b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> >=20
> > Hi,
> >=20
> > Shouldn't this be common to all RPi1 B and RPi2 models, instead of
> > being
> > specific to just RPi B+?
> >=20
> > > +&usb {
> > > +	usb1@01 {
> > > +		compatible =3D "usb1d6b,0002";
> > > +		reg =3D <01>;
> > > +		#address-cells =3D <1>;
> > > +		#size-cells =3D <0>;
> > > +
> > > +		ethernet: usbether@01 {
> > > +			compatible =3D "usb0424,9514";
> > > +			reg =3D <01>;
> > > +		};
> > > +	};
> > > +};
> >=20
> > For reference, on RPi2:
>=20
> Using "lsusb -t" you may get bus topology.
>=20
> > Bus 001 Device 003: ID 0424:ec00 Standard Microsystems Corp.
> > SMSC9512/9514 Fast Ethernet Adapter
>=20
> It is the ethernet device, you may need to change vid/pid in dts.=C2=A0
>=20
> > Bus 001 Device 002: ID 0424:9514 Standard Microsystems Corp.
> > SMC9514 Hub
>=20
> It is the hub device, you may need to change vid/pid in dts.
>=20
> > Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> >=20
> =C2=A0
> It is root hub, it doesn't need to be described at dts.

Thank you; neither of the vid/pid pairs in the original submission is
okay. I'll follow up with an updated version.

I've also checked this on RPi B rev2; and I'll be including that one,
and the RPI2 too.

I can't find my rev1 RPi B; but maybe I can just do the same for the
same board. It would likely work, but I may get the vid/pid wrong if
it's different from rev2.=C2=A0

> Best regards,
> Peter

Thanks
Lubo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
