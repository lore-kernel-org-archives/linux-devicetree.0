From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] syscon: dt-bindings: Add documentation for Aspeed system
 control units
Date: Thu, 8 Sep 2016 08:00:02 +0100
Message-ID: <20160908070002.GF4921@dell>
References: <1473311598-32722-1-git-send-email-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473311598-32722-1-git-send-email-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, "linux-gpio @ vger . kernel . org" <linux-gpio@vger.kernel.org>, "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>, "devicetree @ vger . kernel . org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 08 Sep 2016, Andrew Jeffery wrote:

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Joel Stanley <joel@jms.id.au>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/aspeed-scu.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-scu.txt

Thanks for resending.

Applied, thanks

> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
> new file mode 100644
> index 000000000000..4fc5b83726d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
> @@ -0,0 +1,18 @@
> +The Aspeed System Control Unit manages the global behaviour of the SoC,
> +configuring elements such as clocks, pinmux, and reset.
> +
> +Required properties:
> +- compatible:	One of:
> +		"aspeed,ast2400-scu", "syscon", "simple-mfd"
> +		"aspeed,g4-scu", "syscon", "simple-mfd"
> +		"aspeed,ast2500-scu", "syscon", "simple-mfd"
> +		"aspeed,g5-scu", "syscon", "simple-mfd"
> +
> +- reg:		contains the offset and length of the SCU memory region
> +
> +Example:
> +
> +syscon: syscon@1e6e2000 {
> +	compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
> +	reg = <0x1e6e2000 0x1a8>;
> +};

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
