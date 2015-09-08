From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH linux-next v9 2/3] mfd: devicetree: add bindings for Atmel
 Flexcom
Date: Tue, 8 Sep 2015 18:40:57 -0500
Message-ID: <55EF7209.8060407@kernel.org>
References: <cover.1441118159.git.cyrille.pitchen@atmel.com>
 <90fa2e0ded92567a29c996658153d833aaa5e411.1441118159.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <90fa2e0ded92567a29c996658153d833aaa5e411.1441118159.git.cyrille.pitchen@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, alexandre.belloni@free-electrons.com, sameo@linux.intel.com, lee.jones@linaro.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09/01/2015 09:46 AM, Cyrille Pitchen wrote:
> This patch documents the DT bindings for the Atmel Flexcom which will be
> introduced by sama5d2x SoCs. These bindings will be used by the actual
> Flexcom driver to be sent in another patch.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

A few comments, but in general looks fine.

> ---
>  .../devicetree/bindings/mfd/atmel-flexcom.txt      | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> new file mode 100644
> index 000000000000..fc3511e41542
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> @@ -0,0 +1,67 @@
> +* Device tree bindings for Atmel Flexcom (Flexible Serial Communication Unit)
> +
> +The Atmel Flexcom is just a wrapper which embeds a SPI controller, an I2C
> +controller and an USART. Only one function can be used at a time and is chosen
> +at boot time according to the device tree.

Doesn't the board design choose (unless pins go to a header)?

> +
> +Required properties:
> +- compatible:		Should be "atmel,sama5d2-flexcom"
> +- reg:			Should be the offset/length value for Flexcom dedicated
> +			I/O registers (without USART, TWI or SPI registers).
> +- clocks:		Should be the Flexcom peripheral clock from PMC.
> +- #address-cells:	Should be <1>
> +- #size-cells:		Should be <1>
> +- ranges:		Should be one range for the full I/O register region
> +			(including USART, TWI and SPI registers).
> +- atmel,flexcom-mode:	Should be one of the 3 following macros as defined in
> +			include/dt-bindings/mfd/atmel-flexcom.h:
> +			- ATMEL_FLEXCOM_MODE_USART for USART
> +			- ATMEL_FLEXCOM_MODE_SPI for SPI
> +			- ATMEL_FLEXCOM_MODE_TWI for I2C
> +
> +Required child:
> +a single child device of type matching the "atmel,flexcom-mode" property.

Okay, but why not allow all children and use "status"?

> +
> +The reg property of this child should be:
> +- <0x200 0x200> for USART
> +- <0x400 0x200> for SPI
> +- <0x600 0x200> for I2C
> +
> +The phandle provided by the clocks property of the child is the same as one for
> +the Flexcom parent.
> +
> +Other properties remain unchanged. See documentation of the respective device:
> +- ../serial/atmel-usart.txt
> +- ../spi/spi_atmel.txt
> +- ../i2c/i2c-at91.txt
> +
> +Example:
> +
> +flexcom@f8034000 {
> +	compatible = "atmel,sama5d2-flexcom";
> +	reg = <0xf8034000 0x200>;
> +	clocks = <&flx0_clk>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	ranges = <0x0 0xf8034000 0x800>;
> +	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_SPI>;
> +
> +	spi@400 {
> +		compatible = "atmel,at91rm9200-spi";
> +		reg = <0x400 0x200>;
> +		interrupts = <19 IRQ_TYPE_LEVEL_HIGH 7>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_flx0_default>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clocks = <&flx0_clk>;
> +		clock-names = "spi_clk";
> +		atmel,fifo-size = <32>;
> +
> +		mtd_dataflash@0 {
> +			compatible = "atmel,at25f512b";
> +			reg = <0>;
> +			spi-max-frequency = <20000000>;
> +		};
> +	};
> +};
> 
