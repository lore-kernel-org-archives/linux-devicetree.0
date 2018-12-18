From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: Add bindings for Cadence GPIO
Date: Tue, 18 Dec 2018 11:33:27 -0600
Message-ID: <20181218173327.GA29063@bogus>
References: <20181217153652.20056-1-jank@cadence.com>
 <20181217153652.20056-2-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181217153652.20056-2-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kotas <jank@cadence.com>
Cc: linus.walleij@linaro.org, bgolaszewski@baylibre.com, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 17, 2018 at 03:36:51PM +0000, Jan Kotas wrote:
> This patch adds a DT binding documentation for
> Cadence GPIO controller.
> 
> Signed-off-by: Jan Kotas <jank@cadence.com>
> ---
>  .../devicetree/bindings/gpio/cdns,gpio.txt         | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/cdns,gpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt b/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
> new file mode 100644
> index 000000000..c87a47827
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
> @@ -0,0 +1,44 @@
> +Cadence GPIO controller bindings
> +
> +Required properties:
> +- compatible: should be "cdns,gpio-r1p02".
> +- reg: the register base address and size.
> +- #gpio-cells: should be 2.
> +	* first cell is the GPIO number.
> +	* second cell specifies the GPIO flags, as defined in
> +		<dt-bindings/gpio/gpio.h>. Only the GPIO_ACTIVE_HIGH
> +		and GPIO_ACTIVE_LOW flags are supported.
> +- gpio-controller: marks the device as a GPIO controller.
> +- clocks: should contain one entry referencing the peripheral clock driving
> +	the GPIO controller.
> +
> +Optional properties:
> +- ngpios: integer number of gpio lines supported by this controller, up to 32.
> +- interrupt-parent: phandle of the parent interrupt controller.

Don't document interrupt-parent as it is implied and could be in a 
parent. Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
