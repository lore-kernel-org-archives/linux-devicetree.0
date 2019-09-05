From: "Andrew Jeffery" <andrew@aj.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_4/4]_gpio:_dt-bindings:_Update_documentation_wit?=
 =?UTF-8?Q?h_ast2600_controllers?=
Date: Thu, 05 Sep 2019 13:29:29 +0930
Message-ID: <3f9d48eb-79ed-42e9-a346-761871e74c98@www.fastmail.com>
References: <20190905011800.16156-1-rashmica.g@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905011800.16156-1-rashmica.g@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rashmica Gupta <rashmica.g@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On Thu, 5 Sep 2019, at 10:48, Rashmica Gupta wrote:
> The ast2600 is a new generation of SoC from ASPEED. Similarly to the
> ast2400 and ast2500, it has a GPIO controller for it's 3.6V GPIO pins.
> Additionally, it has a GPIO controller for 36 1.8V GPIO pins. These
> voltages are fixed and cannot be configured via pinconf, so we have two
> separate drivers for them.

See 3/4 for discussion about the commit message.

> 
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt 
> b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> index 7e9b586770b0..cd388797e07c 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> @@ -2,7 +2,8 @@ Aspeed GPIO controller Device Tree Bindings
>  -------------------------------------------
>  
>  Required properties:
> -- compatible		: Either "aspeed,ast2400-gpio" or "aspeed,ast2500-gpio"
> +- compatible		: Either "aspeed,ast2400-gpio", "aspeed,ast2500-gpio",
> +					  "aspeed,ast2600-gpio", or "aspeed,ast2600-1-8v-gpio"

See the discussion on patch 3/4 about how we might eliminate the
aspeed,ast2600-1-8v-gpio compatible string.

Also, this patch should be the first in the series and start the subject with
"dt-bindings: gpio: aspeed: ..."

Cheers,

Andrew
