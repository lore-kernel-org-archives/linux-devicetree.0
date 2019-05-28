From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [linux-sunxi] [RESEND PATCH] ARM: dts: sun7i: olimex-lime2:
 Enable ac and power supplies
Date: Tue, 28 May 2019 14:58:57 +0200
Message-ID: <2b671c1f0734177a6283407f753403473b70f5bc.camel@bootlin.com>
References: <20190528063544.17408-1-plaes@plaes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528063544.17408-1-plaes@plaes.org>
Sender: linux-kernel-owner@vger.kernel.org
To: plaes@plaes.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 2019-05-28 at 09:35 +0300, Priit Laes wrote:
> Lime2 has battery connector so enable these supplies.

Out of curiosity, what is reported to userspace when no battery is
attached?

Looks good otherwise:
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
> index 9c8eecf4337a..9001b5527615 100644
> --- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
> @@ -206,6 +206,14 @@
>  
>  #include "axp209.dtsi"
>  
> +&ac_power_supply {
> +	status = "okay";
> +};
> +
> +&battery_power_supply {
> +	status = "okay";
> +};
> +
>  &reg_dcdc2 {
>  	regulator-always-on;
>  	regulator-min-microvolt = <1000000>;
> -- 
> 2.11.0
> 
-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
