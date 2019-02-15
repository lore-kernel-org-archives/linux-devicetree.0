From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: rockpro64 dts rename LED labels
 and default trigger
Date: Fri, 15 Feb 2019 10:21:54 +0100
Message-ID: <2294853.gTMg7XEmWK@diego>
References: <20190213170651.3210-1-Akash_Gajjar@mentor.com>
 <20190213170651.3210-4-Akash_Gajjar@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190213170651.3210-4-Akash_Gajjar@mentor.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Akash Gajjar <Akash_Gajjar@mentor.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Shohei Maruyama <cheat.sc.linux@outlook.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Oskari Lemmela <oskari@lemmela.net>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Levin Du <djw@t-chip.com.cn>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 13. Februar 2019, 18:06:39 CET schrieb Akash Gajjar:
> rename white and red LEDs with status and heartbeat respectively.
> replace red LED default state off with default-trigger heartbeat.
> 
> Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>

Hmm, in the schematics the leds are named work + diy as in the current
devicetree, so I'd like to keep node names + pinctrl matching schematics
please.

And changing the functionality of the LEDs would require a bit more
rationale in the commit message on why that is something we want.


Heiko

> ---
>  .../arm64/boot/dts/rockchip/rk3399-rockpro64.dts | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
> b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts index
> c9a2b26d7cad..dab53d2eb676 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
> @@ -43,17 +43,17 @@
>  	leds {
>  		compatible = "gpio-leds";
>  		pinctrl-names = "default";
> -		pinctrl-0 = <&work_led_gpio>, <&diy_led_gpio>;
> +		pinctrl-0 = <&status_led_gpio>, <&heartbeat_led_gpio>;
> 
> -		work-led {
> -			label = "work";
> +		status-led {
> +			label = "rockpro64:white:status";
>  			default-state = "on";
>  			gpios = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
>  		};
> 
> -		diy-led {
> -			label = "diy";
> -			default-state = "off";
> +		heartbeat-led {
> +			label = "rockpor64:red:heartbeat";
> +			linux,default-trigger = "heartbeat";
>  			gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
>  		};
>  	};
> @@ -502,11 +502,11 @@
>  	};
> 
>  	leds {
> -		work_led_gpio: work_led-gpio {
> +		status_led_gpio: status-led-gpio {
>  			rockchip,pins = <0 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
> 
> -		diy_led_gpio: diy_led-gpio {
> +		heartbeat_led_gpio: heartbeat-led-gpio {
>  			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
>  	};
