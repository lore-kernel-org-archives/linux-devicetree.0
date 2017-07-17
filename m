From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] pinctrl: Add DT bindings for Cortina Gemini
Date: Mon, 17 Jul 2017 14:39:39 -0500
Message-ID: <20170717193939.dwl2w6m47gqysvdc@rob-hp-laptop>
References: <20170715175056.13040-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170715175056.13040-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 15, 2017 at 07:50:52PM +0200, Linus Walleij wrote:
> The Cortina Gemini pin controller uses the standard pin control
> bindings for muxing functions with groups so these bindings
> should be entirely uncontroversial.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/pinctrl/cortina,gemini-pinctrl.txt    | 54 ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
> new file mode 100644
> index 000000000000..2ef3e8a65559
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
> @@ -0,0 +1,54 @@
> +Cortina Systems Gemini pin controller
> +
> +This pin controller is found in the Cortina Systems Gemini SoC family,
> +see further arm/gemini.txt. It is a purely group-based multiplexing pin
> +controller.
> +
> +Required properties:
> +- compatible: "cortina,gemini-pinctrl"
> +- regmap: phandle to the system controller node

Why not a child of the system controller?

Rob
