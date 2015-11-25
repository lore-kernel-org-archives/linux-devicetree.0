From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: lpc4337-ciaa: add i2c0 and devices
Date: Wed, 25 Nov 2015 09:28:48 -0300
Message-ID: <5655A980.9000605@vanguardiasur.com.ar>
References: <1448282225-2635-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1448282225-2635-4-git-send-email-ariel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448282225-2635-4-git-send-email-ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

(+To: Joachim)

El 23/11/15 a las 09:37, Ariel D'Alessandro escribi=F3:
> Add I2C0 and two I2C EEPROM devices on the CIAA-NXP board:
>=20
> * 24AA1025 EEPROM, 1Mbit: it is accessed as two 512Kbit EEPROMs.
> * 24AA025E48 EEPROM, 2kbit.
>=20
> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
> ---
>  arch/arm/boot/dts/lpc4337-ciaa.dts | 30 ++++++++++++++++++++++++++++=
++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/lpc4337-ciaa.dts b/arch/arm/boot/dts/l=
pc4337-ciaa.dts
> index 1a23589..d81047a 100644
> --- a/arch/arm/boot/dts/lpc4337-ciaa.dts
> +++ b/arch/arm/boot/dts/lpc4337-ciaa.dts
> @@ -99,6 +99,14 @@
>  		};
>  	};
> =20
> +	i2c0_pins: i2c0-pins {
> +		i2c0_pins_cfg {
> +			pins =3D "i2c0_scl", "i2c0_sda";
> +			function =3D "i2c0";
> +			input-enable;
> +		};
> +	};
> +
>  	ssp_pins: ssp-pins {
>  		ssp1_cs {
>  			pins =3D "p6_7";
> @@ -163,6 +171,28 @@
>  	clock-frequency =3D <50000000>;
>  };
> =20
> +&i2c0 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0_pins>;
> +	clock-frequency =3D <400000>;
> +
> +	eeprom@50 {
> +		compatible =3D "microchip,24c512";
> +		reg =3D <0x50>;
> +	};
> +
> +	eeprom@51 {
> +		compatible =3D "microchip,24c02";
> +		reg =3D <0x51>;
> +	};
> +
> +	eeprom@54 {
> +		compatible =3D "microchip,24c512";
> +		reg =3D <0x54>;
> +	};
> +};
> +
>  &mac {
>  	status =3D "okay";
>  	phy-mode =3D "rmii";
>=20

--=20
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
