From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 2/3 v2] clk: ux500: Add device tree bindings for ABx500 clocks
Date: Fri, 20 Jan 2017 16:56:27 +0100
Message-ID: <CAPDyKFrLfR7Z=B=d76J7kcnhYmhxSpni_gzZYxE6VxAdHYXx=g@mail.gmail.com>
References: <20170120132539.3013-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170120132539.3013-1-linus.walleij@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 20 January 2017 at 14:25, Linus Walleij <linus.walleij@linaro.org> wrote:
> This adds device tree bindings for the ABx500 clocks on the
> ST-Ericsson platforms.
>
> Cc: devicetree@vger.kernel.org
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Stephen, can pick this up once Rob acked it?

Kind regards
Uffe


> ---
> ChangeLog v1->v2:
> - Indicate that the abx500 clocks need to be in a device tree
>   node under an ABx500 MFD device.
> - Rename the example node to clock-controller.
> ---
>  .../devicetree/bindings/clock/stericsson,abx500.txt  | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/stericsson,abx500.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/stericsson,abx500.txt b/Documentation/devicetree/bindings/clock/stericsson,abx500.txt
> new file mode 100644
> index 000000000000..dbaa886b223e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/stericsson,abx500.txt
> @@ -0,0 +1,20 @@
> +Clock bindings for ST-Ericsson ABx500 clocks
> +
> +Required properties :
> +- compatible : shall contain the following:
> +  "stericsson,ab8500-clk"
> +- #clock-cells should be <1>
> +
> +The ABx500 clocks need to be placed as a subnode of an AB8500
> +device node, see mfd/ab8500.txt
> +
> +All available clocks are defined as preprocessor macros in
> +dt-bindings/clock/ste-ab8500.h header and can be used in device
> +tree sources.
> +
> +Example:
> +
> +clock-controller {
> +       compatible = "stericsson,ab8500-clk";
> +       #clock-cells = <1>;
> +};
> --
> 2.9.3
>
