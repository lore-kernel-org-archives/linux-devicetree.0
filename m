From: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio@elopez.com.ar>
Subject: Re: [PATCH v3 7/7] ARM: sunxi: dt: add PRCM clk and reset controller
 subdevices
Date: Tue, 13 May 2014 12:17:42 -0300
Message-ID: <53723796.10308@elopez.com.ar>
References: <1399633911-7094-1-git-send-email-boris.brezillon@free-electrons.com> <1399633911-7094-8-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1399633911-7094-8-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <boris.brezillon@free-electrons.com>, Mike Turquette <mturquette@linaro.org>, Lee Jones <lee.jones@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>, Shuge <shuge@allwinnertech.com>, kevin@allwinnertech.com, Hans de Goede <hdegoede@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dev@linux-sunxi.org
List-Id: devicetree@vger.kernel.org

Hi Boris,

El 09/05/14 08:11, Boris BREZILLON escribi=F3:
> Add DT definitions for PRCM (Power/Reset/Clock Management) clock and =
reset
> controller subdevices.
>
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
> ---
>   arch/arm/boot/dts/sun6i-a31.dtsi | 37 +++++++++++++++++++++++++++++=
++++++++
>   1 file changed, 37 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun=
6i-a31.dtsi
> index 9feb3f4..03d5258 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -496,6 +496,43 @@
>   		prcm@01f01400 {
>   			compatible =3D "allwinner,sun6i-a31-prcm";
>   			reg =3D <0x01f01400 0x200>;
> +
> +			ar100: ar100_clk {
> +				compatible =3D "allwinner,sun6i-a31-ar100-clk";
> +				#clock-cells =3D <0>;
> +				clocks =3D <&osc32k>, <&osc24M>, <&pll6>, <&pll6>;

You could add
				clock-output-names =3D "ar100";
here, so you don't depend on the node name. Your code already checks fo=
r=20
it and uses it when available.

> +			};

Cheers,

Emilio

