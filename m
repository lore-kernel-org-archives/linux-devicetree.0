From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mq: Add gpio-ranges property
Date: Tue, 2 Jul 2019 07:10:55 +0000
Message-ID: <20190702071054.t7v4fis436klmgdv@fsr-ub1664-175>
References: <20190702014400.33554-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190702014400.33554-1-Anson.Huang@nxp.com>
Content-Language: en-US
Content-ID: <61459D010418E24189C3AAB936B4F9BA@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, Jacky Bai <ping.bai@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "angus@akkea.ca" <angus@akkea.ca>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 19-07-02 09:43:59, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
>=20
> Add "gpio-ranges" property to establish connections between GPIOs
> and PINs on i.MX8MQ pinctrl driver.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

For both patches:

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mq.dtsi
> index 477c523..3187428 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -287,6 +287,7 @@
>  				#gpio-cells =3D <2>;
>  				interrupt-controller;
>  				#interrupt-cells =3D <2>;
> +				gpio-ranges =3D <&iomuxc 0 10 30>;
>  			};
> =20
>  			gpio2: gpio@30210000 {
> @@ -299,6 +300,7 @@
>  				#gpio-cells =3D <2>;
>  				interrupt-controller;
>  				#interrupt-cells =3D <2>;
> +				gpio-ranges =3D <&iomuxc 0 40 21>;
>  			};
> =20
>  			gpio3: gpio@30220000 {
> @@ -311,6 +313,7 @@
>  				#gpio-cells =3D <2>;
>  				interrupt-controller;
>  				#interrupt-cells =3D <2>;
> +				gpio-ranges =3D <&iomuxc 0 61 26>;
>  			};
> =20
>  			gpio4: gpio@30230000 {
> @@ -323,6 +326,7 @@
>  				#gpio-cells =3D <2>;
>  				interrupt-controller;
>  				#interrupt-cells =3D <2>;
> +				gpio-ranges =3D <&iomuxc 0 87 32>;
>  			};
> =20
>  			gpio5: gpio@30240000 {
> @@ -335,6 +339,7 @@
>  				#gpio-cells =3D <2>;
>  				interrupt-controller;
>  				#interrupt-cells =3D <2>;
> +				gpio-ranges =3D <&iomuxc 0 119 30>;
>  			};
> =20
>  			tmu: tmu@30260000 {
> --=20
> 2.7.4
> =
