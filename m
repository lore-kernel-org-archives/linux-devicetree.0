From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 4/7] arm: dts: r7s72100: Add pin controller node
Date: Tue, 21 Feb 2017 11:46:03 +0100
Message-ID: <3dd69ef5-e8a4-b69c-b4fa-1be6ba777cfa@jmondi.org>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
 <1487610788-6939-5-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1487610788-6939-5-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,
     self-review to save you all some time

On 20/02/2017 18:13, Jacopo Mondi wrote:
> Add pin controller node with 12 gpio controller sub-nodes to
> r7s72100 dtsi.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm/boot/dts/r7s72100.dtsi | 81 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index 3dd427d..a77a431b 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/clock/r7s72100-clock.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/r7s72100-pinctrl.h>

I should move this to the board specific .dts file.
It's not needed here.

>
>  / {
>  	compatible = "renesas,r7s72100";
> @@ -171,6 +172,86 @@
>  		};
>  	};
>
> +	pinctrl: pinctrl@fcfe3000 {
> +		compatible = "renesas,r7s72100-ports";
> +
> +		#pinctrl-cells = <1>;
> +
> +		reg = <0xfcfe3000 0x4248>;
> +
> +		port0: gpio@0 {

Geert pointed out offline the if the node has a unit address, it needs a 
"reg" property.
I'll change all of these to portX: gpio-X {

> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 0 16>;

Not all ports have 16 pins available.
This is one of the differences between different RZ/A1 SoC versions 
(RZ/A1H, RZ/A1L etc)

I'll change the number of pins to the actual available ones on each port 
for r7s72100 (RZ/A1H)

Thanks
    j


> +		};
> +
> +		port1: gpio@1 {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 16 16>;
> +		};
> +
> +		port2: gpio@2 {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 32 16>;
> +		};
> +
> +		port3: gpio@3 {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 48 16>;
> +		};
> +
> +		port4: gpio@4 {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 64 16>;
> +		};
> +
> +		port5: gpio@5 {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 80 16>;
> +		};
> +
> +		port6: gpio@6 {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 96 16>;
> +		};
> +
> +		port7: gpio@7 {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 112 16>;
> +		};
> +
> +		port8: gpio@8 {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 128 16>;
> +		};
> +
> +		port9: gpio@9 {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 144 16>;
> +		};
> +
> +		port10: gpio@10 {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 160 16>;
> +		};
> +
> +		port11: gpio@11 {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 176 16>;
> +		};
> +	};
> +
>  	scif0: serial@e8007000 {
>  		compatible = "renesas,scif-r7s72100", "renesas,scif";
>  		reg = <0xe8007000 64>;
>
