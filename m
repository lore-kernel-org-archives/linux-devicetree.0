From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: mcp23s08: Clarify gpiospec flags
 cell usage
Date: Mon, 16 Apr 2018 13:50:21 -0500
Message-ID: <20180416185021.thnxtpvgvsdqvh6q@rob-hp-laptop>
References: <20180411214257.14902-1-rjpdasilva@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180411214257.14902-1-rjpdasilva@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Silva <rjpdasilva@gmail.com>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 11, 2018 at 10:42:57PM +0100, Ricardo Silva wrote:
> The pinctrl-mcp23s08 driver doesn't provide a specific gpiospec
> of_xlate() function, causing the gpiolib-of's of_gpio_simple_xlate()
> function to be used instead, which takes the gpiospec's second cell as
> the flags specifier according to 'include/dt-bindings/gpio/gpio.h'.
> 
> The pinctrl-mcp23s08 bindings document was mentioning that the flags
> were unused, which is not accurate because values in that second cell
> are indeed used by the gpiolib-of's of_gpio_simple_xlate() for
> configuring the gpio (e.g. its polarity).
> 
> This way, replace the "flags currently unused" reference in the
> dt-bindings document with references to the appropriate files specifying
> the possible flag values and gpiospec description.
> 
> CC: devicetree@vger.kernel.org
> Signed-off-by: Ricardo Silva <rjpdasilva@gmail.com>
> ---
>  .../devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt          | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
