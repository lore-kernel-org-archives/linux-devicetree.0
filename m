From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2 v2] clk: Add bindings for the Gemini Clock Controller
Date: Mon, 8 May 2017 16:24:08 -0500
Message-ID: <CAL_JsqLAMObobPrBDdA8bjaKTX4rEo2=_qd86ibbA2kQP6AvBg@mail.gmail.com>
References: <20170508201159.31634-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170508201159.31634-1-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, openwrt-devel-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 8, 2017 at 3:11 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This adds device tree bindings and a header for the Gemini SoC
> Clock Controller.
>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> ChangeLog v1->v2:
> - Move the clock controller to be directly in the parent syscon
>   node.
> ---
>  .../clock/cortina,gemini-clock-controller.txt      | 22 ++++++++++++++++
>  include/dt-bindings/clock/cortina,gemini-clock.h   | 29 ++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/cortina,gemini-clock-controller.txt
>  create mode 100644 include/dt-bindings/clock/cortina,gemini-clock.h
>
> diff --git a/Documentation/devicetree/bindings/clock/cortina,gemini-clock-controller.txt b/Documentation/devicetree/bindings/clock/cortina,gemini-clock-controller.txt
> new file mode 100644
> index 000000000000..ae0046bccba0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/cortina,gemini-clock-controller.txt
> @@ -0,0 +1,22 @@
> +Clock bindings for the Cortina Systems Gemini SoC Clock Controller
> +
> +Required properties :
> +- compatible : shall contain the following:
> +  "cortina,gemini-clock-controller"
> +- #clock-cells should be <1>
> +
> +The Gemini clock controller needs to be identical to the system controller
> +node.
> +
> +All available clocks are defined as preprocessor macros in
> +dt-bindings/clock/cortina,gemini-clock.h header and can be used in device
> +tree sources.
> +
> +Example:
> +
> +syscon: syscon@40000000 {
> +       compatible = "cortina,gemini-syscon", "cortina,gemini-clock-controller",
> +                    "syscon", "simple-mfd";

There are no child nodes, so you don't need simple-mfd.

> +       reg = <0x40000000 0x1000>;

Looks like you have 2 nodes pointing to the same address with your
reset binding? You shouldn't have overlapping resources. It's allowed
for historical reasons but breaks resource creation in Linux.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
