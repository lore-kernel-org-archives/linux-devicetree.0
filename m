From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: add chosen node on veyron chromebooks
Date: Sat, 16 Feb 2019 00:08:50 +0100
Message-ID: <22158501.cNvkU8jGDh@diego>
References: <20190215115150.32299-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215115150.32299-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, dianders@chromium.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Enric,

Am Freitag, 15. Februar 2019, 12:51:50 CET schrieb Enric Balletbo i Serra:
> In order to use earlycon, the stdout-path property needs to be set
> in the chosen node.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

What's the reason for adding this only for the Chromebook variants?
Uart2 is pretty much the standard output for all devices, so I'd assume
at least all veyron boards should use uart2 as well, making this ideally
live in the rk3288-veyron.dtsi instead?

Heiko

> ---
> 
>  arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
> b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi index
> b54746df3661..8890967ed572 100644
> --- a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
> +++ b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
> @@ -62,6 +62,10 @@
>  		pwm-off-delay-ms = <10>;
>  	};
> 
> +	chosen {
> +		stdout-path = "serial2:115200n8";
> +	};
> +
>  	gpio-charger {
>  		compatible = "gpio-charger";
>  		charger-type = "mains";
