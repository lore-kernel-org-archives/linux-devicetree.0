From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: bcm2835: dt: Add the ethernet to the device
 tree
Date: Wed, 03 Feb 2016 16:11:50 +0100
Message-ID: <1454512310.25750.3.camel@v3.sk>
References: <1454511759-24827-1-git-send-email-lkundrak@v3.sk>
	 <1454511759-24827-3-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454511759-24827-3-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2016-02-03 at 16:02 +0100, Lubomir Rintel wrote:
> The hub and the ethernet in its port 1 are hardwired on the board.
>=20
> Compared to the adapters that can be plugged into the USB ports, this
> one has no serial EEPROM to store its MAC. Nevertheless, the
> Raspberry Pi
> has the MAC address for this adapter in its ROM, accessible from its
> firmware.
>=20
> U-Boot can read out the address and set the local-mac-address
> property of the
> node with "ethernet" alias. Let's add the node so that U-Boot can do
> its
> business.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> ---
> =C2=A0arch/arm/boot/dts/bcm2835-rpi-b-plus.dts | 18 +++++++++++++++++=
+
> =C2=A0arch/arm/boot/dts/bcm283x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A04 +++-
> =C2=A02 files changed, 21 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> index ef54050..32bbd2a 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> +++ b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> @@ -6,6 +6,10 @@
> =C2=A0	compatible =3D "raspberrypi,model-b-plus", "brcm,bcm2835";
> =C2=A0	model =3D "Raspberry Pi Model B+";
> =C2=A0
> +	aliases {
> +		ethernet =3D &ethernet;
> +	}

I'm missing a semicolon here. I'll follow up with an updated version
once I get some feedback.

> +
> =C2=A0	leds {
> =C2=A0		act {
> =C2=A0			gpios =3D <&gpio 47 0>;
> @@ -29,3 +33,17 @@
> =C2=A0		brcm,function =3D <BCM2835_FSEL_ALT0>;
> =C2=A0	};
> =C2=A0};
> +
> +&usb {
> +	usb1@01 {
> +		compatible =3D "usb1d6b,0002";
> +		reg =3D <01>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		ethernet: usbether@01 {
> +			compatible =3D "usb0424,9514";
> +			reg =3D <01>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/bcm283x.dtsi
> b/arch/arm/boot/dts/bcm283x.dtsi
> index 971e741..bc5fde1 100644
> --- a/arch/arm/boot/dts/bcm283x.dtsi
> +++ b/arch/arm/boot/dts/bcm283x.dtsi
> @@ -187,10 +187,12 @@
> =C2=A0			status =3D "disabled";
> =C2=A0		};
> =C2=A0
> -		usb@7e980000 {
> +		usb: usb@7e980000 {
> =C2=A0			compatible =3D "brcm,bcm2835-usb";
> =C2=A0			reg =3D <0x7e980000 0x10000>;
> =C2=A0			interrupts =3D <1 9>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> =C2=A0		};
> =C2=A0	};
> =C2=A0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
