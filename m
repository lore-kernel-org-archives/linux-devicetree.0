From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 2/8] syscon: dt-bindings: Add documentation for Aspeed
 system control units
Date: Tue, 30 Aug 2016 15:34:55 +0930
Message-ID: <CACPK8XdRe645W0CvEzEdEt=XhvvLUkFX_H8kqG66_ZMXuGuCqg@mail.gmail.com>
References: <20160819124414.24242-1-andrew@aj.id.au> <20160819124414.24242-3-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160819124414.24242-3-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 19, 2016 at 10:14 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

Nothing to say here?

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>
> Since v1:
>
> * Add SoC-specific compatible strings
>
>  Documentation/devicetree/bindings/mfd/aspeed-scu.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-scu.txt
>
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
> +- compatible:  One of:
> +               "aspeed,ast2400-scu", "syscon", "simple-mfd"
> +               "aspeed,g4-scu", "syscon", "simple-mfd"
> +               "aspeed,ast2500-scu", "syscon", "simple-mfd"
> +               "aspeed,g5-scu", "syscon", "simple-mfd"
> +
> +- reg:         contains the offset and length of the SCU memory region
> +
> +Example:
> +
> +syscon: syscon@1e6e2000 {
> +       compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
> +       reg = <0x1e6e2000 0x1a8>;
> +};
> --
> 2.9.3
>
