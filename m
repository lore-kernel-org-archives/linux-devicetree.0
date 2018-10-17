From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: add description of 74aup1g157gw
Date: Wed, 17 Oct 2018 11:05:56 -0500
Message-ID: <20181017160556.GA14935@bogus>
References: <87efcy1rm4.wl-kuninori.morimoto.gx@renesas.com>
 <87d0si1rkt.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87d0si1rkt.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 10, 2018 at 02:16:35AM +0000, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> 74aup1g157gw needs i0 and i1 pin as input, select and output it by
> sel gpio pin. This patch adds description for 74aup1g157gw as clock
> multiplexer.
> "nxp,74aup1g157gw-clk" will select most closest input as output,
> "nxp,74aup1g157gw-audio-clk" will select 48kHz/44.1kHz categorized
> input as output.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/clock/nxp,74aup1g157gw.txt    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/nxp,74aup1g157gw.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,74aup1g157gw.txt b/Documentation/devicetree/bindings/clock/nxp,74aup1g157gw.txt
> new file mode 100644
> index 0000000..d07bc04
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/nxp,74aup1g157gw.txt
> @@ -0,0 +1,19 @@
> +NXP 74AUP1G157GW Low-power 2-input multiplexer for clock
> +
> +Required properties:
> +- compatible:	"nxp,74aup1g157gw-clk"      (select closest input as output)
> +		"nxp,74aup1g157gw-audio-clk (select 48kHz / 44.1kHz as output)

I don't understand why you need the second one.


What's wrong with the existing gpio-mux-clock binding?

> +- clocks:	select input clock as i0, i1
> +- clock-names:	"i0" and "i1"
> +- sel-gpios:	selector pin
> +
> +Examples:
> +
> +	clk {
> +		#clock-cells = <0>;
> +		compatible = "nxp,74aup1g157gw-audio-clk";
> +		clocks = <&clk8snd>, <&clksnd>;
> +		clock-names = "i0", "i1";
> +		sel-gpios = <&gpio_exp_75 13 GPIO_ACTIVE_HIGH>;
> +	};
> +
> -- 
> 2.7.4
> 
