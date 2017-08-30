From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [RESENT PATCH v7 3/7] arm64: dts: rockchip: Update rt5514 devices' compatible for Gru
Date: Wed, 30 Aug 2017 15:30:59 +0200
Message-ID: <1649093.IvC24TsujL@diego>
References: <20170824045227.15504-1-jeffy.chen@rock-chips.com> <20170824045227.15504-4-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170824045227.15504-4-jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jeffy,

Am Donnerstag, 24. August 2017, 12:52:23 CEST schrieb Jeffy Chen:
> Currently the rt5514 i2c driver and rt5514 spi driver are using the same
> compatible string.
> 
> Add additional unused compatible strings to identify them for Gru
> boards.
> 
> Signed-off-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
> Changes in v7: None
> Changes in v6: None
> Changes in v3: None
> Changes in v2: None
> 
>  arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi index
> 5772c52fbfd3..50fb11ad9f17 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> @@ -611,7 +611,7 @@ ap_i2c_mic: &i2c1 {
>  	i2c-scl-rising-time-ns = <300>;
> 
>  	headsetcodec: rt5514@57 {
> -		compatible = "realtek,rt5514";
> +		compatible = "realtek,rt5514", "realtek,rt5514-i2c";

the rt5514-i2c and -spi compatibles should be documented in the binding-txt
of the chip, but I haven't found any mention of this.


Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
