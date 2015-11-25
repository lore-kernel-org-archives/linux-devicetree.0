From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: lpc4337-ciaa: enable SCT-PWM
Date: Wed, 25 Nov 2015 09:28:39 -0300
Message-ID: <5655A977.1040408@vanguardiasur.com.ar>
References: <1448282225-2635-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1448282225-2635-3-git-send-email-ariel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448282225-2635-3-git-send-email-ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

(+To: Joachim)

El 23/11/15 a las 09:37, Ariel D'Alessandro escribi=F3:
> Enable the PWM based on the State Configurable Timer (SCT) included i=
n
> the LPC4337 SoC of the CIAA-NXP board.
>=20
> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
> ---
>  arch/arm/boot/dts/lpc4337-ciaa.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/lpc4337-ciaa.dts b/arch/arm/boot/dts/l=
pc4337-ciaa.dts
> index 03bdf77..1a23589 100644
> --- a/arch/arm/boot/dts/lpc4337-ciaa.dts
> +++ b/arch/arm/boot/dts/lpc4337-ciaa.dts
> @@ -170,6 +170,10 @@
>  	pinctrl-0 =3D <&enet_rmii_pins>;
>  };
> =20
> +&sct_pwm {
> +	status =3D "okay";
> +};
> +
>  &ssp1 {
>  	status =3D "okay";
>  	pinctrl-names =3D "default";
>=20

--=20
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
