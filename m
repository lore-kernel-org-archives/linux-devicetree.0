From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] ARM: at91: dts: sama5d4ek: add leds in DT node
Date: Wed, 4 Mar 2015 11:54:33 +0100
Message-ID: <54F6E469.8020405@atmel.com>
References: <1423474820-19118-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423474820-19118-1-git-send-email-josh.wu@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Wu <josh.wu@atmel.com>
Cc: linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 09/02/2015 10:40, Josh Wu a =E9crit :
> Add the leds DT node in the dts file.
> In the leds, d10 is set as heartbeat led.
>=20
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

added to at91-4.1-dt branch.

Thanks.

> ---
>=20
>  arch/arm/boot/dts/at91-sama5d4ek.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/at91-sama5d4ek.dts b/arch/arm/boot/dts=
/at91-sama5d4ek.dts
> index 9198b71..0c418be 100644
> --- a/arch/arm/boot/dts/at91-sama5d4ek.dts
> +++ b/arch/arm/boot/dts/at91-sama5d4ek.dts
> @@ -257,4 +257,26 @@
>  			gpio-key,wakeup;
>  		};
>  	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		status =3D "okay";
> +
> +		d8 {
> +			label =3D "d8";
> +			/* PE28, conflicts with usart4 rts pin */
> +			gpios =3D <&pioE 28 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		d9 {
> +			label =3D "d9";
> +			gpios =3D <&pioE 9 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		d10 {
> +			label =3D "d10";
> +			gpios =3D <&pioE 8 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
>  };
>=20


--=20
Nicolas Ferre
