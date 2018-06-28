From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 1/5] clocksource/drivers/timer-mediatek: Add system
 timer bindings
Date: Thu, 28 Jun 2018 16:08:12 +0200
Message-ID: <93345c88-f880-5e2e-ae36-cf1b57df9bba@linaro.org>
References: <1530182744-10731-1-git-send-email-stanley.chu@mediatek.com>
 <1530182744-10731-2-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530182744-10731-2-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stanley Chu <stanley.chu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On 28/06/2018 12:45, Stanley Chu wrote:
> This patch fixes bindings of existed "General Purpose Timer",
> and then add bindings of new "System Timer" on Mediatek SoCs.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  .../bindings/timer/mediatek,mtk-timer.txt          |   38 ++++++++++++++++----
>  1 file changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> index b1fe7e9..d42247b 100644
> --- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> @@ -1,5 +1,14 @@
> -Mediatek MT6577, MT6572 and MT6589 Timers
> ----------------------------------------
> +Mediatek Timers
> +---------------
> +
> +Mediatek SoCs have two different timers on different platforms,
> +- GPT (General Purpose Timer)
> +- SYST (System Timer)
> +
> +Please bind correct timers in each platforms.
> +
> +
> +** General Purpose Timer (GPT)
>  
>  Required properties:
>  - compatible should contain:
> @@ -11,9 +20,8 @@ Required properties:
>  	* "mediatek,mt8135-timer" for MT8135 compatible timers
>  	* "mediatek,mt8173-timer" for MT8173 compatible timers
>  	* "mediatek,mt6577-timer" for MT6577 and all above compatible timers
> -- reg: Should contain location and length for timers register.
> -- clocks: Clocks driving the timer hardware. This list should include two
> -	clocks. The order is system clock and as second clock the RTC clock.
> +- reg: Should contain location and length for GPT register.
> +- clocks: GPT is drived by system clock.
>  
>  Examples:
>  
> @@ -21,5 +29,23 @@ Examples:
>  		compatible = "mediatek,mt6577-timer";
>  		reg = <0x10008000 0x80>;
>  		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
> -		clocks = <&system_clk>, <&rtc_clk>;
> +		clocks = <&system_clk>;
> +	};
> +
> +
> +** System Timer (SYST)
> +
> +Required properties:
> +- compatible: Should contain
> +	* "mediatek,mt6765-systimer" for MT6765 compatible timers
> +- reg: Should contain the location and length for system timer registers.
> +- clocks: System timer is drived by system clock.
> +
> +Examples:
> +
> +	systimer@10017000 {
> +		compatible = "mediatek,mt6765-systimer";

why not "mediatek,mt6765-timer" ? for consistency.

> +		reg = <0 0x10017000 0 0x1000>;
> +		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&system_clk>;
>  	};
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
