From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 12/22 v2] ARM: dts: add top-level DT bindings for Cortina
 Gemini
Date: Tue, 7 Feb 2017 12:40:29 -0600
Message-ID: <20170207184029.tbblqmkp6vcuvo3x@rob-hp-laptop>
References: <20170201194632.18455-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170201194632.18455-1-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: openwrt-devel@openwrt.org, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Janos Laube <janos.dev@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 01, 2017 at 08:46:32PM +0100, Linus Walleij wrote:
> This adds the top level SoC bindings for Cortina systems Gemini
> platforms.
> 
> Cc: Janos Laube <janos.dev@gmail.com>
> Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>
> Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Rename required property "intcon" to "interrupt-controller"
> - Elaborate a bit on the SoC origins
> - Put the example DTS SoC nodes in a soc {} node
> ---
>  Documentation/devicetree/bindings/arm/gemini.txt | 81 ++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/gemini.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/gemini.txt b/Documentation/devicetree/bindings/arm/gemini.txt
> new file mode 100644
> index 000000000000..eb788302d3e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/gemini.txt
> @@ -0,0 +1,81 @@
> +Cortina systems Gemini platforms
> +
> +The Gemini SoC is the project name for an ARMv4 FA525-based SoC originally
> +produced by Storlink Semiconductor around 2005. The company was renamed
> +later renamed Storm Semiconductor. The chip product name is Storlink SL3516.
> +It was derived from earlier products from Storm named SL3316 (Centroid) and
> +SL3512.
> +
> +Storm Semiconductor was acquired by Cortina Systems in 2008 and the SoC was
> +produced and used for NAS and similar usecases. In 2014 Cortina Systems was
> +in turn acquired by Inphi, who seem to have discontinued this product family.
> +
> +Required properties (in root node):
> +	compatible = "cortina,gemini";
> +
> +Required nodes:
> +
> +- syscon: the root node must have a system controller node pointing to the

the soc bus node...

> +  global control registers, with the compatible string
> +  "cortina,gemini-syscon", "syscon";
> +
> +- timer: the root node must have a timer node pointing to the SoC timer

ditto

> +  block, with the compatible string "cortina,gemini-timer"
> +  See: clocksource/cortina,gemini-timer.txt
> +
> +- interrup-controller: the root node must have an interrupt controller
> +  node pointing to the SoC interrupt controller block, with the compatible
> +  string "cortina,gemini-interrupt-controller"
> +  See interrupt-controller/cortina,gemini-interrupt-controller.txt
> +
> +Example:
> +
> +/ {
> +	model = "Foo Gemini Machine";
> +	compatible = "cortina,gemini";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x00000000 0x8000000>;
> +	};
> +
> +	soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +		compatible = "simple-bus";
> +		interrupt-parent = <&intcon>;
> +
> +		syscon: syscon@40000000 {
> +			compatible = "cortina,gemini-syscon", "syscon";
> +			reg = <0x40000000 0x1000>;
> +		};
> +
> +		uart0: serial@42000000 {
> +			compatible = "ns16550a";
> +			reg = <0x42000000 0x100>;
> +			clock-frequency = <48000000>;
> +			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +		};
> +
> +		timer@43000000 {
> +			compatible = "cortina,gemini-timer";
> +			reg = <0x43000000 0x1000>;
> +			interrupt-parent = <&intcon>;
> +			interrupts = <14 IRQ_TYPE_EDGE_RISING>, /* Timer 1 */
> +				     <15 IRQ_TYPE_EDGE_RISING>, /* Timer 2 */
> +				     <16 IRQ_TYPE_EDGE_RISING>; /* Timer 3 */
> +			syscon = <&syscon>;
> +		};
> +
> +		intcon: interrupt-controller@48000000 {
> +			compatible = "cortina,gemini-interrupt-controller";
> +			reg = <0x48000000 0x1000>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};
> -- 
> 2.9.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
