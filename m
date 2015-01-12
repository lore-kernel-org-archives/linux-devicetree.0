From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] ARM: at91: sama5d3: dt: correct the sound route
Date: Mon, 12 Jan 2015 14:21:13 +0100
Message-ID: <54B3CA49.7010302@atmel.com>
References: <1420795096-8944-1-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420795096-8944-1-git-send-email-voice.shen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bo Shen <voice.shen@atmel.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 09/01/2015 10:18, Bo Shen a =E9crit :
> The MICBIAS is a supply, should route to MIC while not IN1L.
>=20
> Signed-off-by: Bo Shen <voice.shen@atmel.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

I stack it up in at91-3.19-fixes.

Thanks. Bye.


> ---
>=20
>  arch/arm/boot/dts/sama5d3xmb.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/sama5d3xmb.dtsi b/arch/arm/boot/dts/sa=
ma5d3xmb.dtsi
> index 0399be6..83d0598 100644
> --- a/arch/arm/boot/dts/sama5d3xmb.dtsi
> +++ b/arch/arm/boot/dts/sama5d3xmb.dtsi
> @@ -176,7 +176,7 @@
>  			"Headphone Jack", "HPOUTR",
>  			"IN2L", "Line In Jack",
>  			"IN2R", "Line In Jack",
> -			"MICBIAS", "IN1L",
> +			"Mic", "MICBIAS",
>  			"IN1L", "Mic";
> =20
>  		atmel,ssc-controller =3D <&ssc0>;
>=20


--=20
Nicolas Ferre
