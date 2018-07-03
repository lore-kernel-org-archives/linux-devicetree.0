From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/5] clocksource/drivers/timer-mediatek: Add system
 timer bindings
Date: Tue, 3 Jul 2018 17:32:56 -0600
Message-ID: <20180703233256.GA27424@rob-hp-laptop>
References: <1530231446-13760-1-git-send-email-stanley.chu@mediatek.com>
 <1530231446-13760-2-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530231446-13760-2-git-send-email-stanley.chu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanley Chu <stanley.chu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Fri, Jun 29, 2018 at 08:17:22AM +0800, Stanley Chu wrote:
> This patch fixes bindings of existed "General Purpose Timer",
> and then add bindings of new "System Timer" on Mediatek SoCs.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  .../bindings/timer/mediatek,mtk-timer.txt          |   38 ++++++++++++++++----
>  1 file changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> index b1fe7e9..605fd8f 100644
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

s/drived/driven/

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
> +	* "mediatek,mt6765-timer" for MT6765 compatible timers
> +- reg: Should contain the location and length for system timer registers.
> +- clocks: System timer is drived by system clock.

These look the same. Can't you just add the compatible string and note 
in the description it is the system timer. Or make the compatible 
"mediatek,mt6765-systimer"

> +
> +Examples:
> +
> +	systimer@10017000 {

timer@

> +		compatible = "mediatek,mt6765-timer";
> +		reg = <0 0x10017000 0 0x1000>;
> +		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&system_clk>;
>  	};
> -- 
> 1.7.9.5
> 
