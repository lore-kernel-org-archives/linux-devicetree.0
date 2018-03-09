From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v3 3/3] pinctrl: bcm2835: Update docs about generic
 pinctrl bindings support
Date: Fri, 9 Mar 2018 12:46:44 +0100 (CET)
Message-ID: <483687035.384686.1520596004410@email.1und1.de>
References: <5b3419be-12ca-75d7-6f5e-d3338ddd7f14@castello.eng.br>
 <1520568974-15547-1-git-send-email-matheus@castello.eng.br>
 <1520568974-15547-4-git-send-email-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520568974-15547-4-git-send-email-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Matheus Castello <matheus@castello.eng.br>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, eric@anholt.net, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Matheus,

> Matheus Castello <matheus@castello.eng.br> hat am 9. März 2018 um 05:16 geschrieben:
> 
> 
> Now we have generic pin configuration and multiplexing support,
> ahd shoud be preferred than brcm legacy one.

i suspect this patch won't get noticed by the DT maintainer because of the wrong subject.

Please try something like this:

dt-bindings: pinctrl: bcm2835-gpio: Add generic pinctrl support

Even this sounds strange to you, but this patch must be the first patch of series (1/3).

Stefan

> 
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
> ---
>  .../devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
> index 2569866..58b4720 100644
> --- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
> @@ -36,6 +36,25 @@ listed. In other words, a subnode that lists only a mux function implies no
>  information about any pull configuration. Similarly, a subnode that lists only
>  a pul parameter implies no information about the mux function.
>  
> +This driver supports the generic pin multiplexing and configuration
> +bindings. For details on each properties, you can refer to
> +./pinctrl-bindings.txt.
> +
> +Required sub-node properties:
> +  - pins
> +  - function
> +
> +Optional sub-node properties:
> +  - bias-disable
> +  - bias-pull-up
> +  - bias-pull-down
> +  - output-high
> +  - output-low
> +
> +Legacy pin configuration and multiplexing binding:
> +*** (Its use is deprecated, use generic multiplexing and configuration
> +bindings instead)
> +
>  Required subnode-properties:
>  - brcm,pins: An array of cells. Each cell contains the ID of a pin. Valid IDs
>    are the integer GPIO IDs; 0==GPIO0, 1==GPIO1, ... 53==GPIO53.
> -- 
> 2.7.4
>
