From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] Revert "ARM: dts: rockchip: set PWM delay backlight
 settings for Minnie"
Date: Tue, 18 Jun 2019 10:21:52 +0200
Message-ID: <45f94c6a-5bd7-92b0-d23f-ae7e0481935f@collabora.com>
References: <20190614224533.169881-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614224533.169881-1-mka@chromium.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Matthias,

On 15/6/19 0:45, Matthias Kaehlcke wrote:
> This reverts commit 288ceb85b505c19abe1895df068dda5ed20cf482.
> 
> According to the commit message the AUO B101EAN01 panel on minnie
> requires a PWM delay of 200 ms, however this is not what the
> datasheet says. The datasheet mentions a *max* delay of 200 ms
> for T2 ("delay from LCDVDD to black video generation") and T3
> ("delay from LCDVDD to HPD high"), which aren't related to the
> PWM. The backlight power sequence does not specify min/max
> constraints for T15 (time from PWM on to BL enable) or T16
> (time from BL disable to PWM off).
> 

Could you point from where the confusion comes from? I think will be helpful for
the record. B101EAN01.8 vs B101EAN01.1

> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

With the above added:

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Thanks,
~ Enric

> ---
> Enric, if you think I misinterpreted the datasheet please holler!
> ---
>  arch/arm/boot/dts/rk3288-veyron-minnie.dts | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/rk3288-veyron-minnie.dts b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
> index 468a1818545d..28cbe07f96ec 100644
> --- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
> +++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
> @@ -86,8 +86,6 @@
>  			240 241 242 243 244 245 246 247
>  			248 249 250 251 252 253 254 255>;
>  	power-supply = <&backlight_regulator>;
> -	post-pwm-on-delay-ms = <200>;
> -	pwm-off-delay-ms = <200>;
>  };
>  
>  &emmc {
> 
