From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v9 1/5] clocksource/drivers/timer-mediatek: Add system
 timer bindings
Date: Tue, 10 Jul 2018 17:02:23 +0200
Message-ID: <a4c1a9cf-4d48-a9a7-e7ac-d94685c30619@linaro.org>
References: <1530832288-8156-1-git-send-email-stanley.chu@mediatek.com>
 <1530832288-8156-2-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530832288-8156-2-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stanley Chu <stanley.chu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org


Rob ? Are you fine with this change ?

On 06/07/2018 01:11, Stanley Chu wrote:
> This patch adds bindings of new "System Timer" on Mediatek SoCs.
> 
> Remove RTC clock in the same time because it is not used by
> both "General Purpose Timer" and "System Timer" now.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  .../bindings/timer/mediatek,mtk-timer.txt          |   34 ++++++++++++--------
>  1 file changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> index b1fe7e9..18d4d01 100644
> --- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> @@ -1,19 +1,25 @@
> -Mediatek MT6577, MT6572 and MT6589 Timers
> ----------------------------------------
> +Mediatek Timers
> +---------------
> +
> +Mediatek SoCs have two different timers on different platforms,
> +- GPT (General Purpose Timer)
> +- SYST (System Timer)
> +
> +The proper timer will be selected automatically by driver.
>  
>  Required properties:
>  - compatible should contain:
> -	* "mediatek,mt2701-timer" for MT2701 compatible timers
> -	* "mediatek,mt6580-timer" for MT6580 compatible timers
> -	* "mediatek,mt6589-timer" for MT6589 compatible timers
> -	* "mediatek,mt7623-timer" for MT7623 compatible timers
> -	* "mediatek,mt8127-timer" for MT8127 compatible timers
> -	* "mediatek,mt8135-timer" for MT8135 compatible timers
> -	* "mediatek,mt8173-timer" for MT8173 compatible timers
> -	* "mediatek,mt6577-timer" for MT6577 and all above compatible timers
> -- reg: Should contain location and length for timers register.
> -- clocks: Clocks driving the timer hardware. This list should include two
> -	clocks. The order is system clock and as second clock the RTC clock.
> +	* "mediatek,mt2701-timer" for MT2701 compatible timers (GPT)
> +	* "mediatek,mt6580-timer" for MT6580 compatible timers (GPT)
> +	* "mediatek,mt6589-timer" for MT6589 compatible timers (GPT)
> +	* "mediatek,mt7623-timer" for MT7623 compatible timers (GPT)
> +	* "mediatek,mt8127-timer" for MT8127 compatible timers (GPT)
> +	* "mediatek,mt8135-timer" for MT8135 compatible timers (GPT)
> +	* "mediatek,mt8173-timer" for MT8173 compatible timers (GPT)
> +	* "mediatek,mt6577-timer" for MT6577 and all above compatible timers (GPT)
> +	* "mediatek,mt6765-timer" for MT6765 compatible timers (SYST)
> +- reg: Should contain location and length for timer register.
> +- clocks: Should contain system clock.
>  
>  Examples:
>  
> @@ -21,5 +27,5 @@ Examples:
>  		compatible = "mediatek,mt6577-timer";
>  		reg = <0x10008000 0x80>;
>  		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
> -		clocks = <&system_clk>, <&rtc_clk>;
> +		clocks = <&system_clk>;
>  	};
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
