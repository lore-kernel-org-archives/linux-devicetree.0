From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 6/6] arm64: dts: k3-j721e: Add gpio-keys on common
 processor board
Date: Fri, 9 Aug 2019 20:26:57 +0530
Message-ID: <4d923b5f-16ba-2bc1-b195-d6ec7ae496b0@ti.com>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
 <20190809082947.30590-7-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190809082947.30590-7-lokeshvutla@ti.com>
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
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Common processor board for K3 J721E platform has two push buttons
> namely SW10 and SW11.
> Add a gpio-keys device node to model them as input keys in Linux.
> Add required pinmux nodes to set GPIO pins as input.

Reviewed-by: Keerthy <j-keerthy@ti.com>

> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   .../dts/ti/k3-j721e-common-proc-board.dts     | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> index 509579ca3db2..d2894d55fbbe 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> @@ -6,12 +6,49 @@
>   /dts-v1/;
>   
>   #include "k3-j721e-som-p0.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>   
>   / {
>   	chosen {
>   		stdout-path = "serial2:115200n8";
>   		bootargs = "console=ttyS2,115200n8 earlycon=ns16550a,mmio32,0x02800000";
>   	};
> +
> +	gpio_keys: gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sw10_button_pins_default &sw11_button_pins_default>;
> +
> +		sw10: sw10 {
> +			label = "GPIO Key USER1";
> +			linux,code = <BTN_0>;
> +			gpios = <&main_gpio0 0 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		sw11: sw11 {
> +			label = "GPIO Key USER2";
> +			linux,code = <BTN_1>;
> +			gpios = <&wkup_gpio0 7 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&main_pmx0 {
> +	sw10_button_pins_default: sw10_button_pins_default {
> +		pinctrl-single,pins = <
> +			J721E_IOPAD(0x0, PIN_INPUT, 7) /* (AC18) EXTINTn.GPIO0_0 */
> +		>;
> +	};
> +};
> +
> +&wkup_pmx0 {
> +	sw11_button_pins_default: sw11_button_pins_default {
> +		pinctrl-single,pins = <
> +			J721E_WKUP_IOPAD(0xcc, PIN_INPUT, 7) /* (G28) WKUP_GPIO0_7 */
> +		>;
> +	};
>   };
>   
>   &wkup_uart0 {
> 
