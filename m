From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: bcm2835: dt: Add the ethernet to the device
 trees
Date: Fri, 05 Feb 2016 15:55:26 +0100
Message-ID: <1454684126.2779.2.camel@v3.sk>
References: <1454571364-24708-1-git-send-email-lkundrak@v3.sk>
	 <1454571364-24708-2-git-send-email-lkundrak@v3.sk>
	 <m3fux76xqa.fsf@euphor.blino.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m3fux76xqa.fsf-sb2orAewljU5LtT840wCHw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, popcornmix <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Olivier,

On Fri, 2016-02-05 at 15:25 +0100, Olivier Blin wrote:
> Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org> writes:
>=20
> > diff --git a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
> > b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
> [...]
> > @@ -33,3 +37,17 @@
> > =C2=A0		brcm,function =3D <BCM2835_FSEL_ALT0>;
> > =C2=A0	};
> > =C2=A0};
> > +
> > +&usb {
> > +	usb1@1 {
> > +		compatible =3D "usb0424,9514";
> > +		reg =3D <01>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		ethernet: usbether@1 {
> > +			compatible =3D "usb0424,ec00";
> > +			reg =3D <01>;
> > +		};
> > +	};
> > +};
>=20
> Hi,
>=20
> This works for me, after making sure that your u-boot patch gets a
> chance to be run (unset usbethaddr from u-boot).

Thanks for that.

> Though, I am not really DT-literate, but shouldn't the ethernet block
> use the PID from the ethernet device?
> The usbether device is 9514 on RPi2, while ec00 is the hub.

Are you sure? I didn't check on RPi2, but I check the Models B and B+
and the ethernet device was 0xec00 on both. The driver attaches to that
product ID:

[lkundrak@odvarok linux]$ modinfo smsc95xx |grep EC
alias:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0usb:v=
0424pEC00d*dc*dsc*dp*ic*isc*ip*in*
[lkundrak@odvarok linux]$ modinfo smsc95xx |grep 9514
[lkundrak@odvarok linux]$

> Your patch works, but this works as well after swapping the PIDs.
>=20
> Thanks

Take care
Lubo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
