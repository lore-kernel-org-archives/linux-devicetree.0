From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] ARM: at91/dt: sama5d3 xplained: don't disable hsmci
 regulator
Date: Tue, 22 Mar 2016 11:56:41 +0100
Message-ID: <56F124E9.8010304@atmel.com>
References: <1457693033-3619-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457693033-3619-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>, alexandre.belloni@free-electrons.com
Cc: plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 11/03/2016 11:43, Ludovic Desroches a =E9crit :
> If enabling the hsmci regulator on card detection, the board can rebo=
ot
> on sd card insertion. Keeping the regulator always enabled fixes this
> issue.
>=20
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> Fixes: 1b53e3416dd0 ("ARM: at91/dt: sama5d3 xplained: add fixed
> regulator for vmmc0")
> Cc: stable@vger.kernel.org #4.3 and later

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Like the one about sama5d4 Xplained, I changed the $subject prefix and
stacked both on top of at91-4.6-fixes branch that I plan to send to
arm-soc soon.

Bye,

> ---
>  arch/arm/boot/dts/at91-sama5d3_xplained.dts | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/at91-sama5d3_xplained.dts b/arch/arm/b=
oot/dts/at91-sama5d3_xplained.dts
> index d81474e..d4f5987 100644
> --- a/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> +++ b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> @@ -303,6 +303,7 @@
>  		regulator-name =3D "mmc0-card-supply";
>  		regulator-min-microvolt =3D <3300000>;
>  		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
>  	};
> =20
>  	gpio_keys {
>=20


--=20
Nicolas Ferre
