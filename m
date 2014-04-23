From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 2/5] clk: berlin: add berlin clocks DT bindings documentation
Date: Wed, 23 Apr 2014 19:21:46 +0200
Message-ID: <5357F6AA.1010406@gmail.com>
References: <1398261667-12621-1-git-send-email-alexandre.belloni@free-electrons.com> <1398261667-12621-3-git-send-email-alexandre.belloni@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398261667-12621-3-git-send-email-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/23/2014 04:01 PM, Alexandre Belloni wrote:
> Document the newly added berlin clock driver
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
> Cc: devicetree@vger.kernel.org
>  Documentation/devicetree/bindings/clock/berlin-clock.txt | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/berlin-clock.txt b/Documentation/devicetree/bindings/clock/berlin-clock.txt
> index 49b7860bffb8..00f0053ef587 100644
> --- a/Documentation/devicetree/bindings/clock/berlin-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/berlin-clock.txt
> @@ -9,6 +9,8 @@ Required properties:
>  	"marvell,berlin2-pll",
>  	"marvell,berlin2q-pll":
>  		CPU PLL and System PLL
> +	"marvell,berlin2-clk":
> +		simple clocks
>  - reg: Address and length of the clock register set.
>  - #clock-cells: from common clock binding; shall be set to 0.
>  - clocks: from common clock binding
> @@ -26,4 +28,9 @@ cpupll: cpupll@ea003c {
>  	reg = <0xea003c 0x8>;
>  };
>  
> -
> +sdio0xinclk: sdio0xinclk@ea023c {

Yuck! ;)

Can't we just simply use "clock@<addr>" for the node name and
have the driver compute the name like simple-bus does?

Sebastian

> +	compatible = "marvell,berlin-clk";
> +	clocks = <&syspll>;
> +	#clock-cells = <0>;
> +	reg = <0xea023c 4>;
> +};
> 
