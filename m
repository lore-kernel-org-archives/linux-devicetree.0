From: Rob Herring <robh@kernel.org>
Subject: Re: [RESEND][PATCH V2 1/4] mfd: Add ROHM BD9571MWV-M PMIC DT bindings
Date: Fri, 28 Apr 2017 14:43:26 -0500
Message-ID: <20170428194326.yshnrbwivlgniw5u@rob-hp-laptop>
References: <20170425183210.30594-1-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170425183210.30594-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, lee.jones@linaro.org, Marek Vasut <marek.vasut+renesas@gmail.com>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 25, 2017 at 08:32:07PM +0200, Marek Vasut wrote:
> Add DT bindings for the ROHM BD9571MWV-M PMIC. This PMIC has
> the following features:
> - multiple voltage monitors for 1V8, 2V5, 3V3 voltage rail
> - one voltage regulator for DVFS
> - two GPIOs
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Drop the compatible = "regulator-fixed" from the binding example,
>       it should not be there.
>     - List the VD09 regulator
> ---
>  .../devicetree/bindings/mfd/bd9571mwv.txt          | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/bd9571mwv.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/bd9571mwv.txt b/Documentation/devicetree/bindings/mfd/bd9571mwv.txt
> new file mode 100644
> index 000000000000..ce24231edd7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/bd9571mwv.txt
> @@ -0,0 +1,49 @@
> +* ROHM BD9571MWV Power Management Integrated Circuit (PMIC) bindings
> +
> +Required properties:
> + - compatible		: Should be "rohm,bd9571mwv".
> + - reg			: I2C slave address.
> + - interrupt-parent	: Phandle to the parent interrupt controller.
> + - interrupts		: The interrupt line the device is connected to.
> + - interrupt-controller	: Marks the device node as an interrupt controller.
> + - #interrupt-cells	: The number of cells to describe an IRQ, should be 2.
> +			    The first cell is the IRQ number.
> +			    The second cell is the flags, encoded as trigger
> +			    masks from ../interrupt-controller/interrupts.txt.
> + - gpio-controller      : Marks the device node as a GPIO Controller.
> + - #gpio-cells          : Should be two.  The first cell is the pin number and
> +                            the second cell is used to specify flags.
> +                            See ../gpio/gpio.txt for more information.
> + - regulators:          : List of child nodes that specify the regulator
> +                            initialization data. Child nodes must be named
> +                            after their hardware counterparts:
> +			     - vd09
> +			     - vd18
> +			     - vd25
> +			     - vd33
> +			     - dvfs
> +			    Each child node is defined using the standard
> +			    binding for regulators.
> +
> +Example:
> +
> +	pmic: bd9571mwv@30 {

pmic@30 ...

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>
