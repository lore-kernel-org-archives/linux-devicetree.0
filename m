From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 3/6] arm64: dts: ti: k3-j721e: Add gpio nodes in wakeup
 domain
Date: Fri, 9 Aug 2019 20:24:29 +0530
Message-ID: <48fca046-d683-bb6c-d848-24ffada6ed85@ti.com>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
 <20190809082947.30590-4-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190809082947.30590-4-lokeshvutla@ti.com>
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
> Similar to the gpio groups in main domain, there is one gpio group
> in wakup domain with 2 module instances in it. This gpio group pins
> out 84 lines(6 banks). Add DT node for these 2 gpio module instances.

Reviewed-by: Keerthy <j-keerthy@ti.com>

> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
> index e616c2481f51..555dc7b7aedc 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi
> @@ -87,4 +87,38 @@
>   		ti,sci-dst-id = <14>;
>   		ti,sci-rm-range-girq = <0x5>;
>   	};
> +
> +	wkup_gpio0: gpio@42110000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x42110000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&wkup_gpio_intr>;
> +		interrupts = <113 0>, <113 1>, <113 2>,
> +			     <113 3>, <113 4>, <113 5>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <84>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 113 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 113 0>;
> +		clock-names = "gpio";
> +	};
> +
> +	wkup_gpio1: gpio@42100000 {
> +		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
> +		reg = <0x0 0x42100000 0x0 0x100>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&wkup_gpio_intr>;
> +		interrupts = <114 0>, <114 1>, <114 2>,
> +			     <114 3>, <114 4>, <114 5>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		ti,ngpio = <84>;
> +		ti,davinci-gpio-unbanked = <0>;
> +		power-domains = <&k3_pds 114 TI_SCI_PD_EXCLUSIVE>;
> +		clocks = <&k3_clks 114 0>;
> +		clock-names = "gpio";
> +	};
>   };
> 
