From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] clk: Add driver for the si544 clock generator chip
Date: Sun, 18 Mar 2018 07:52:19 -0500
Message-ID: <20180318125219.ar7f2n4o73ljz6vg@rob-hp-laptop>
References: <1521114608-21967-1-git-send-email-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521114608-21967-1-git-send-email-mike.looijmans@topic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

On Thu, Mar 15, 2018 at 12:50:08PM +0100, Mike Looijmans wrote:
> This patch adds the driver and devicetree documentation for the
> Silicon Labs SI544 clock generator chip. This is an I2C controlled
> oscillator capable of generating clock signals ranging from 200kHz
> to 1500MHz.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> v2: Add u64 cast to ls_div_bits calculation loop
>     When ls_div_bits is non-zero, the hs_div must always be even
> 
>  .../devicetree/bindings/clock/silabs,si544.txt     |  25 ++
>  drivers/clk/Kconfig                                |  10 +
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/clk-si544.c                            | 422 +++++++++++++++++++++
>  4 files changed, 458 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/silabs,si544.txt
>  create mode 100644 drivers/clk/clk-si544.c
> 
> diff --git a/Documentation/devicetree/bindings/clock/silabs,si544.txt b/Documentation/devicetree/bindings/clock/silabs,si544.txt
> new file mode 100644
> index 0000000..eec1787
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/silabs,si544.txt
> @@ -0,0 +1,25 @@
> +Binding for Silicon Labs 544 programmable I2C clock generator.
> +
> +Reference
> +This binding uses the common clock binding[1]. Details about the device can be
> +found in the datasheet[2].
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +[2] Si544 datasheet
> +    https://www.silabs.com/documents/public/data-sheets/si544-datasheet.pdf
> +
> +Required properties:
> + - compatible: One of "silabs,si514a", "silabs,si514b" "silabs,si514c" according
> +               to the speed grade of the chip.
> + - reg: I2C device address.
> + - #clock-cells: From common clock bindings: Shall be 0.
> +
> +Optional properties:
> + - clock-output-names: From common clock bindings. Recommended to be "si544".

What's the point if there is only 1 clock output?

> +
> +Example:
> +	si544: clock-generator@55 {

clock-controller@55 is the standard node name.

> +		reg = <0x55>;
> +		#clock-cells = <0>;
> +		compatible = "silabs,si544b";
> +	};

Otherwise, for the binding:

Reviewed-by: Rob Herring <robh@kernel.org>
