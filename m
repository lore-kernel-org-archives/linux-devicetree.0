From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: Add ST Multi-Function eXpander
 driver
Date: Sun, 18 Feb 2018 17:19:38 -0600
Message-ID: <20180218231938.goeht7tomfkab6uu@rob-hp-laptop>
References: <1518100057-23234-1-git-send-email-amelie.delaunay@st.com>
 <1518100057-23234-2-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1518100057-23234-2-git-send-email-amelie.delaunay@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 08, 2018 at 03:27:32PM +0100, Amelie Delaunay wrote:
> This patch adds documentation of device tree bindings for the
> STMicroelectronics Multi-Function eXpander (MFX).
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  Documentation/devicetree/bindings/mfd/st-mfx.txt | 51 ++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/st-mfx.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/st-mfx.txt b/Documentation/devicetree/bindings/mfd/st-mfx.txt
> new file mode 100644
> index 0000000..423d800
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/st-mfx.txt
> @@ -0,0 +1,51 @@
> +STMicroelectronics Multi-Function eXpander
> +
> +ST Multi-Function eXpander (MFX) is a slave controller using I2C for
> +communication with the main MCU. Its main features are gpio expansion, main
> +MCU IDD measurement (IDD is the amount of current that flows through VDD)
> +and resistive touchscreen controller.

You don't have to implement all the drivers now, but please completely 
describe the device. As is, there is no reason to have a child GPIO 
node.

> +
> +Required properties:
> +- compatible: must be "st,mfx"

Kind of generic. Only 1 single version ever?

> +- reg: I2C address of the device
> +- interrupts: interrupt triggered by MFX_IRQ_OUT signal
> +- interrupt-parent: interrupt controller MFX is connected to
> +- interrupt-controller: marks the device as an interrupt controller
> +- #interrupt-cells: should be <1>, index of the interrupt within the
> +  controller, in accordance with the "one cell" variant of
> +  <devicetree/bindings/interrupt-controller/interrupt.txt>
> +
> +Optional nodes:
> +
> +* GPIO eXpander
> +MFX provides 16 programmable GPIOs, and it is also possible to recover 8
> +alternate GPIOs if the main functions are not used (touchscreen controller and
> +IDD measurement not enabled).
> +
> +Required properties:
> +- compatible : must be "st,mfx-gpio"
> +- interrupt-parent : must be <&mfx>

Not necessary. A parent node with 'interrupt-controller' property is the 
interrupt's parent.

> +- interrupts = must be <0>
> +- gpio-controller: marks the device node as a GPIO controller
> +- #gpio-cells: should be <2>, the first cell is the GPIO offset on this GPIO
> +  controller, the second cell is the gpio flags in accordance with
> +  <dt-bindings/gpio/st-mfx-gpio.h>.

Custom flags? Use standard flags.

DT binding headers should be part of this patch.

> +
> +Example:
> +
> +	mfx: mfx@42 {
> +		compatible = "st,mfx";
> +		reg = <0x42>;
> +		interrupts = <8 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-parent = <&gpioi>;
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		mfxgpio: mfx_gpio {

gpio {

> +			compatible = "st,mfx-gpio";
> +			interrupt-parent = <&mfx>;
> +			interrupts = <0>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +	};
> -- 
> 2.7.4
> 
