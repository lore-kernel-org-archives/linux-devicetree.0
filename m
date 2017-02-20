From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 4/4] ARM: dts: da850-evm: add the UI expander node
Date: Mon, 20 Feb 2017 15:06:44 +0530
Message-ID: <5f194c6d-0937-bac2-31cd-2f1658f68d0d@ti.com>
References: <1487268932-6469-1-git-send-email-bgolaszewski@baylibre.com>
 <1487268932-6469-5-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1487268932-6469-5-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Patrick Titiano <ptitiano@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thursday 16 February 2017 11:45 PM, Bartosz Golaszewski wrote:
> If we're using the UI board and want vpif capture, we need to select
> the video capture functionality by driving the sel_c pin low on the
> tca6416 expander and sel_a & sel_b pins high. Do it statically by
> hogging relevant GPIOs in the device tree.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  arch/arm/boot/dts/da850-evm.dts | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
> index b549861..a90c764 100644
> --- a/arch/arm/boot/dts/da850-evm.dts
> +++ b/arch/arm/boot/dts/da850-evm.dts
> @@ -9,6 +9,7 @@
>   */
>  /dts-v1/;
>  #include "da850.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	compatible = "ti,da850-evm", "ti,da850";
> @@ -78,7 +79,33 @@
>  				DRVDD-supply = <&vbat>;
>  				DVDD-supply = <&vbat>;
>  			};

> +			ui_expander: tca6416@20 {

This should be called:

			tca6416: gpio@20 {

in keeping with ePAPR 1.1 generic node names recommendation.

> +				compatible = "ti,tca6416";
> +				reg = <0x20>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
>  
> +				sel_a {
> +					gpio-hog;
> +					gpios = <7 GPIO_ACTIVE_HIGH>;
> +					output-high;
> +					line-name = "sel_a";
> +				};
> +
> +				sel_b {
> +					gpio-hog;
> +					gpios = <6 GPIO_ACTIVE_HIGH>;
> +					output-high;
> +					line-name = "sel_b";
> +				};
> +
> +				sel_c {
> +					gpio-hog;
> +					gpios = <5 GPIO_ACTIVE_HIGH>;
> +					output-low;
> +					line-name = "sel_c";

I think this is better handled by using an enable-gpios property in vpif
capture device-tree node. So in the vpif capture node you would have:

	enable-gpios =  <&tca6416 7 GPIO_ACTIVE_HIGH
			 &tca6416 6 GPIO_ACTIVE_HIGH
			 &tca6416 5 GPIO_ACTIVE_LOW>;

and in the vpif capture driver, you would request each of these gpios
using: devm_gpiod_get_array_optional(.., .., GPIOD_OUT_HIGH);

Thanks,
Sekhar
