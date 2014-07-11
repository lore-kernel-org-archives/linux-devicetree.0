From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: at91sam9x5: add clocks for usb device
Date: Fri, 11 Jul 2014 12:47:56 +0200
Message-ID: <20140711104755.GA3112@piout.net>
References: <1405074175-22444-1-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405074175-22444-1-git-send-email-voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/07/2014 at 18:22:55 +0800, Bo Shen wrote :
> Add clocks for usb device, or else switch to CCF, the gadget
> won't work.
>=20
> Reported-by: Ji=C5=99=C3=AD Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>
> Signed-off-by: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

> ---
>  arch/arm/boot/dts/at91sam9x5.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at=
91sam9x5.dtsi
> index d6133f4..2ebc421 100644
> --- a/arch/arm/boot/dts/at91sam9x5.dtsi
> +++ b/arch/arm/boot/dts/at91sam9x5.dtsi
> @@ -1045,6 +1045,8 @@
>  				reg =3D <0x00500000 0x80000
>  				       0xf803c000 0x400>;
>  				interrupts =3D <23 IRQ_TYPE_LEVEL_HIGH 0>;
> +				clocks =3D <&usb>, <&udphs_clk>;
> +				clock-names =3D "hclk", "pclk";
>  				status =3D "disabled";
> =20
>  				ep0 {
> --=20
> 1.8.5.2
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
