From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] Add the tinker board S to the device tree - just an
 outline
Date: Mon, 15 Oct 2018 11:12:14 -0500
Message-ID: <20181015161214.GA13740@bogus>
References: <20180922170236.8690-1-beagleboard@davidjohnsummers.uk>
 <20180922170236.8690-2-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180922170236.8690-2-beagleboard@davidjohnsummers.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Summers <beagleboard@davidjohnsummers.uk>
Cc: mark.rutland@arm.com, linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 22, 2018 at 06:02:34PM +0100, David Summers wrote:

Commit message needed.

Use subject prefixes that match the subsystem. 'dt-bindings: ...' for 
binding docs. 'ARM: dts: ...' for ARM dts files.

> Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
> ---
>  .../devicetree/bindings/arm/rockchip.txt      |   4 +

Bindings should be a separate patch.

>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/rk3288-tinker-s.dts         |  13 +
>  arch/arm/boot/dts/rk3288-tinker.dts           | 498 +----------------
>  arch/arm/boot/dts/rk3288-tinker.dtsi          | 504 ++++++++++++++++++
>  5 files changed, 524 insertions(+), 496 deletions(-)
>  create mode 100644 arch/arm/boot/dts/rk3288-tinker-s.dts
>  create mode 100644 arch/arm/boot/dts/rk3288-tinker.dtsi

Would be better to split the dts changes into 2 patches: restructuring 
and add Tinker S board. Then we're not re-reviewing the existing stuff.

> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt b/Documentation/devicetree/bindings/arm/rockchip.txt
> index acfd3c773dd0..037ce94c3a73 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.txt
> +++ b/Documentation/devicetree/bindings/arm/rockchip.txt
> @@ -13,6 +13,10 @@ Rockchip platforms device tree bindings
>      Required root node properties:
>        - compatible = "asus,rk3288-tinker", "rockchip,rk3288";
>  
> +- Asus Tinker board S
> +    Required root node properties:
> +      - compatible = "asus,rk3288-tinker-s", "rockchip,rk3288";
> +
>  - Kylin RK3036 board:
>      Required root node properties:
>        - compatible = "rockchip,kylin-rk3036", "rockchip,rk3036";
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index b5bd3de87c33..65c75265adfa 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -864,6 +864,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
>  	rk3288-r89.dtb \
>  	rk3288-rock2-square.dtb \
>  	rk3288-tinker.dtb \
> +	rk3288-tinker-s.dtb \	
>  	rk3288-veyron-brain.dtb \
>  	rk3288-veyron-jaq.dtb \
>  	rk3288-veyron-jerry.dtb \
> diff --git a/arch/arm/boot/dts/rk3288-tinker-s.dts b/arch/arm/boot/dts/rk3288-tinker-s.dts
> new file mode 100644
> index 000000000000..5e1078c6a784
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk3288-tinker-s.dts
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2017 Fuzhou Rockchip Electronics Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "rk3288-tinker.dtsi"
> +
> +/ {
> +	model = "Rockchip RK3288 Asus Tinker Board S";
> +	compatible = "asus,rk3288-tinker-s", "rockchip,rk3288";

Perhaps you should have 'asus,rk3288-tinker' as a fallback?

> +};
