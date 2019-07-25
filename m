From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: add device tree for Mecer Xtreme Mini S6
Date: Fri, 26 Jul 2019 00:19:32 +0200
Message-ID: <1618985.EOrKlNyPW4@phil>
References: <20190616204746.21001-1-justin.swartz@risingedge.co.za>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190616204746.21001-1-justin.swartz@risingedge.co.za>
Sender: linux-kernel-owner@vger.kernel.org
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Justin,

Am Sonntag, 16. Juni 2019, 22:47:45 CEST schrieb Justin Swartz:
> The Mecer Xtreme Mini S6 features a Rockchip RK3229 SoC,
> 1GB DDR3 RAM, 8GB eMMC, MicroSD port, 10/100Mbps Ethernet,
> Realtek 8723BS WLAN module, 2 x USB 2.0 ports, HDMI output,
> and S/PDIF output.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---

please add an entry to Documentation/devicetree/bindings/arm/rockchip.yaml
for your board and if necessary also a vendor-prefix to
Documentation/devicetree/bindings/vendor-prefixes.(yaml?)

See below.

>  arch/arm/boot/dts/Makefile        |   1 +
>  arch/arm/boot/dts/rk3229-xms6.dts | 286 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 287 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rk3229-xms6.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index dab2914fa293..6fbd7c304f62 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -902,6 +902,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
>  	rk3188-radxarock.dtb \
>  	rk3228-evb.dtb \
>  	rk3229-evb.dtb \
> +	rk3229-xms6.dtb \
>  	rk3288-evb-act8846.dtb \
>  	rk3288-evb-rk808.dtb \
>  	rk3288-fennec.dtb \
> diff --git a/arch/arm/boot/dts/rk3229-xms6.dts b/arch/arm/boot/dts/rk3229-xms6.dts
> new file mode 100644
> index 000000000000..9b666fa66292
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk3229-xms6.dts
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include "rk3229.dtsi"
> +
> +/ {
> +	model = "Rockchip RK3229 (Mecer Xtreme Mini S6)";
> +	compatible = "rockchip,rk3229-xms6", "rockchip,rk3229";

mode = "Mecer Xtreme Mini S6";
compatible = "mecer,xms6", "rockchip,rk3229";

(and as written above, add a vendor-prefix for mecer)

...

> +&cpu0 {
> +	clock-frequency = <1464000000>;

not sure I understand the reasoning here.
There seems to be a regulator defined, so the cpu cores should
have operating points defined to allow them to switch between
different frequencies as needed.

> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu1 {
> +	clock-frequency = <1464000000>;
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu2 {
> +	clock-frequency = <1464000000>;
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu3 {
> +	clock-frequency = <1464000000>;
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&vop {

please sort the &node-references alphabetically.


Heiko
