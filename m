From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] clk: ux500: Add device tree bindings for ABx500
 clocks
Date: Wed, 18 Jan 2017 17:09:48 -0600
Message-ID: <20170118230948.hplhmyp6hyu3olzd@rob-hp-laptop>
References: <20170113150826.30202-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170113150826.30202-1-linus.walleij@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 13, 2017 at 04:08:26PM +0100, Linus Walleij wrote:
> This adds device tree bindings for the ABx500 clocks on the
> ST-Ericsson platforms.
> 
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/clock/stericsson,abx500.txt         | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/stericsson,abx500.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/stericsson,abx500.txt b/Documentation/devicetree/bindings/clock/stericsson,abx500.txt
> new file mode 100644
> index 000000000000..8764d80e3412
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/stericsson,abx500.txt
> @@ -0,0 +1,13 @@
> +Clock bindings for ST-Ericsson ABx500 clocks
> +
> +Required properties :
> +- compatible : shall contain the following:
> +  "stericsson,ab8500-clk"
> +- #clock-cells should be <1>

Header for clock numbers?

> +
> +Example:
> +
> +ab8500_clock: ab8500-clock {

clock-controller {

or 

clocks {

> +	compatible = "stericsson,ab8500-clk";

No reg, they're all just fixed?

> +	#clock-cells = <1>;
> +};
> -- 
> 2.9.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
