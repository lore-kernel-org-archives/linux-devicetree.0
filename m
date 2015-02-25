From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] ARM: dts: add bcm2835-pwm bindings
Date: Wed, 25 Feb 2015 14:50:17 +0000
Message-ID: <20150225145017.GB5132@x1>
References: <1421325190-7648-1-git-send-email-bart.tanghe@thomasmore.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421325190-7648-1-git-send-email-bart.tanghe-2dq7lIxLGp5qkBXjtECzWg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bart Tanghe <bart.tanghe-2dq7lIxLGp5qkBXjtECzWg@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 15 Jan 2015, Bart Tanghe wrote:

> To probe the bcm2835-pwm driver properly, this dts bindings has to be=
 added=20
> to the bcm2835 dtsi file.
> In expectation of a bcm2835 clock driver, I've added fixed-clock cloc=
k binding.=20
> ---
> Changes in v4:
>  - node added by reg value =20
>=20
> Signed-off-by: Bart Tanghe <bart.tanghe-2dq7lIxLGp5qkBXjtECzWg@public.gmane.org>
> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

Applied, thanks.

> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm28=
35.dtsi
> index 3342cb1..e8a0f13 100644
> --- a/arch/arm/boot/dts/bcm2835.dtsi
> +++ b/arch/arm/boot/dts/bcm2835.dtsi
> @@ -122,6 +123,14 @@
>  			status =3D "disabled";
>  		};
> =20
> +                pwm: pwm@7e20c000 {
> +                        compatible =3D "brcm,bcm2835-pwm";
> +                        reg =3D <0x7e20c000 0x28>;
> +                        clocks =3D <&clk_pwm>;
> +                        #pwm-cells =3D <2>;
> +                        status =3D "disabled";
> +                };
> +
>  		sdhci: sdhci@7e300000 {
>  			compatible =3D "brcm,bcm2835-sdhci";
>  			reg =3D <0x7e300000 0x100>;
> @@ -179,5 +188,13 @@
>  			clock-output-names =3D "spi";
>  			clock-frequency =3D <250000000>;
>  		};
> +
> +		clk_pwm: clock@3 {
> +			compatible =3D "fixed-clock";
> +			reg =3D <3>;
> +			#clock-cells =3D <0>;
> +			clock-output-names =3D "pwm";
> +			clock-frequency =3D <9200000>;
> +		};
>  	};
>  };

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
