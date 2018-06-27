From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add mtk-systimer bindings
Date: Wed, 27 Jun 2018 10:20:38 +0200
Message-ID: <32d0da38-f014-c2c0-70ff-11cdf9ed0569@linaro.org>
References: <1530086039-3763-1-git-send-email-stanley.chu@mediatek.com>
 <1530086039-3763-2-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530086039-3763-2-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stanley Chu <stanley.chu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On 27/06/2018 09:53, Stanley Chu wrote:
> Add binding documentation for the System Timer driver of
> the Mediatek SoCs.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---


>  .../bindings/timer/mediatek,mtk-systimer.txt       |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt
> 
> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt
> new file mode 100644
> index 0000000..7a5bde6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt
> @@ -0,0 +1,18 @@
> +Mediatek System Timers
> +----------------------
> +
> +Required properties:
> +- compatible: Should contain
> +	"mediatek,sys_timer" for those platforms which support system timer.
> +- reg: Should contain the location and length for system timer registers.
> +- clocks: System timer is drived by system clock.
> +
> +Examples:
> +
> +	sys_timer@10017000 {
> +		compatible = "mediatek,sys_timer";
> +		reg = <0 0x10017000 0 0x1000>;
> +		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&sys_clk>;
> +	};
> +

Actually this binding already exists for mediatek timers, it is useless
to add a new one.

I note the binding in

Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt

contains:

 clocks = <&system_clk>, <&rtc_clk>

However the existing driver does only use <&system_clk> AFAICT, I'm
questioning if <&rtc_clk> is really needed.

So, I suggest you sort out and fixup the rtc_clk thing (drop it) and
then just add your new platform in the list in this binding.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
