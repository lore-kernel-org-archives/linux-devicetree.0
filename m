From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] pinctrl: Broadcom NSP GPIO-a device tree bindings
Date: Mon, 7 Dec 2015 08:57:10 -0600
Message-ID: <20151207145710.GA14994@rob-hp-laptop>
References: <1449249057-12975-1-git-send-email-yrdreddy@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1449249057-12975-1-git-send-email-yrdreddy@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Scott Branden <sbranden@broadcom.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 04, 2015 at 12:10:57PM -0500, Yendapally Reddy Dhananjaya Reddy wrote:
> Device tree binding documentation for Broadcom NSP GPIO-a
> 
> Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  .../devicetree/bindings/pinctrl/brcm,nsp-gpio.txt  | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt
> new file mode 100644
> index 0000000..0844168
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt
> @@ -0,0 +1,80 @@
> +Broadcom Northstar plus (NSP) GPIO/PINCONF Controller
> +
> +Required properties:
> +- compatible:
> +    Must be "brcm,nsp-gpio-a"
> +
> +- reg:
> +    Should contain the register physical address and length for each of
> +    GPIO base, IO control registers
> +
> +- #gpio-cells:
> +    Must be two. The first cell is the GPIO pin number (within the
> +    controller's pin space) and the second cell is used for the following:
> +    bit[0]: polarity (0 for active high and 1 for active low)
> +
> +- gpio-controller:
> +    Specifies that the node is a GPIO controller
> +
> +- ngpios:
> +    Number of gpios supported (58x25 supports 32 and 58x23 supports 24)
> +
> +Optional properties:
> +- interrupts:
> +    Interrupt ID
> +
> +- interrupt-controller:
> +    Specifies that the node is an interrupt controller
> +
> +- gpio-ranges:
> +    Specifies the mapping between gpio controller and pin-controllers pins.
> +    This requires 4 fields in cells defined as -
> +    1. Phandle of pin-controller.
> +    2. GPIO base pin offset.
> +    3  Pin-control base pin offset.
> +    4. number of gpio pins which are linearly mapped from pin base.
> +
> +Supported generic PINCONF properties in child nodes:
> +- pins:
> +    The list of pins (within the controller's own pin space) that properties
> +    in the node apply to. Pin names are "gpio-<pin>"
> +
> +- bias-disable:
> +    Disable pin bias
> +
> +- bias-pull-up:
> +    Enable internal pull up resistor
> +
> +- bias-pull-down:
> +    Enable internal pull down resistor
> +
> +- drive-strength:
> +    Valid drive strength values include 2, 4, 6, 8, 10, 12, 14, 16 (mA)
> +
> +Example:
> +
> +	gpioa: gpio@18000020 {
> +		compatible = "brcm,nsp-gpio-a";
> +		reg = <0x18000020 0x100>,
> +		      <0x1803f1c4 0x1c>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		ngpios = <32>;
> +		gpio-ranges = <&pinctrl 0 0 31>;
> +		interrupt-controller;
> +		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		/* Hog a few default settings */
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&led>;
> +		led: led {
> +			pins = "gpio-1";
> +			bias-pull-up;
> +		};
> +
> +		pwr: pwr {
> +			gpio-hog;
> +			gpios = <3 1>;
> +			output-high;
> +		};
> +	};
> -- 
> 2.1.0
> 
