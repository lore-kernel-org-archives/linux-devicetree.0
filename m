From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: use cs-gpios for cros_ec_spi
Date: Tue, 13 Jun 2017 10:50:44 -0700
Message-ID: <20170613175043.GC9026@google.com>
References: <1497331543-8565-1-git-send-email-jeffy.chen@rock-chips.com>
 <1497331543-8565-4-git-send-email-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497331543-8565-4-git-send-email-jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 13, 2017 at 01:25:43PM +0800, Jeffy Chen wrote:
> The cros_ec requires CS line to be active after last message. But the CS
> would be toggled when powering off/on rockchip spi, which breaks ec xfer.
> Use GPIO CS to prevent that.

I suppose this change is fine. (At least, I don't have a good reason not
to do this.)

But I still wonder whether this is something that the SPI core can be
expected to handle. drivers/mfd/cros_ec_spi.c already sets the
appropriate trans->cs_change bits, to ensure CS remains active in
between certain messages (all under spi_bus_lock()). But you're
suggesting that your bus controller may deassert CS if you runtime
suspend the device (e.g., in between messages).

So, is your controller just peculiar? Or should the SPI core avoid
autosuspending the bus controller when it's been instructed to keep CS
active? Any thoughts Mark?

> Signed-off-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
> Changes in v2:
> Fix wrong pinconf for spi5_cs0.
> 
>  arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> index eb50593..b34a51d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> @@ -790,6 +790,8 @@ ap_i2c_audio: &i2c8 {
>  &spi5 {
>  	status = "okay";
>  
> +	cs-gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;

This isn't actually true; it's not active high, it's active low. I guess it
doesn't really matter because the SPI framework uses the gpio_* APIs, which
don't account for the ACTIVE_* flags, and it has separate flags for uncommon
device polarity ("spi-cs-high").

Brian

> +
>  	cros_ec: ec@0 {
>  		compatible = "google,cros-ec-spi";
>  		reg = <0>;
> @@ -813,6 +815,10 @@ ap_i2c_audio: &i2c8 {
>  	};
>  };
>  
> +&spi5_cs0 {
> +	rockchip,pins = <RK_GPIO2 23 RK_FUNC_GPIO &pcfg_output_high>;
> +};
> +
>  &tsadc {
>  	status = "okay";
>  
> -- 
> 2.1.4
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
