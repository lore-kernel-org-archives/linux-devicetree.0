From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 2/6] arm64: dts: ti: k3-j721e: Add gpio nodes in main
 domain
Date: Fri, 9 Aug 2019 20:23:30 +0530
Message-ID: <170f021e-eeeb-9b5b-1e66-7cf2dfc54185@ti.com>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
 <20190809082947.30590-3-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190809082947.30590-3-lokeshvutla@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 09/08/19 1:59 PM, Lokesh Vutla wrote:
> There are 8 instances of gpio modules in main domain divided into 2 groups:
> - Group1: gpio0, gpio2, gpio4, gpio6
> - Group2: gpio1, gpio3, gpio5, gpio7
> 
> Groups are created to provide protection between two different processor
> virtual worlds. There are x gpio lines coming out of each group. Each module
> in a group has equal x gpio lines pinned out. There is a top level mux for
> selecting the module instance for each pin coming out of group. Exactly
> one module can be selected to control the corresponding pin. This muxing
> can be controlled along the pad mux configuration registers.
> 
> Group1 pins out 128 lines(8 banks). Group 2 pins out 36 lines(2 banks).
> 
> Add DT nodes for each module instance in the main domain. Users should
> make sure that correct gpio instance is selected in their pad configuration.

Reviewed-by: Keerthy <j-keerthy@ti.com>

> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 132 ++++++++++++++++++++++
>   1 file changed, 132 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> index 01661c22c39d..199bc9a00b20 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> @@ -240,4 +240,136 @@
>   		clocks = <&k3_clks 286 0>;
>   		clock-names = "fclk";
>   	};
> +
> +	main_gpio0: gpio@600000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00600000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <105 0>, <105 1>, <105 2>, <105 3>,
> +			     <105 4>, <105 5>, <105 6>, <105 7>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <128>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 105 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 105 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	main_gpio1: gpio@601000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00601000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <106 0>, <106 1>, <106 2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <36>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 106 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 106 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	main_gpio2: gpio@610000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00610000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <107 0>, <107 1>, <107 2>, <107 3>,
> +			     <107 4>, <107 5>, <107 6>, <107 7>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <128>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 107 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 107 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	main_gpio3: gpio@611000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00611000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <108 0>, <108 1>, <108 2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <36>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 108 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 108 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	main_gpio4: gpio@620000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00620000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <109 0>, <109 1>, <109 2>, <109 3>,
> +			     <109 4>, <109 5>, <109 6>, <109 7>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <128>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 109 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 109 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	main_gpio5: gpio@621000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00621000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <110 0>, <110 1>, <110 2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <36>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 110 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 110 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	main_gpio6: gpio@630000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00630000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <111 0>, <111 1>, <111 2>, <111 3>,
> +			     <111 4>, <111 5>, <111 6>, <111 7>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <128>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 111 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 111 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	main_gpio7: gpio@631000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x00631000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&main_gpio_intr>;
> +		interrupts = <112 0>, <112 1>, <112 2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <36>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 112 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 112 0>;
> +		clock-names = "gpio";
> +	};
>   };
> 
