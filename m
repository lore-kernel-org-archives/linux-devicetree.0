From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 5/7] arm64: dts: add Allwinner A64 SoC .dtsi
Date: Wed, 10 Aug 2016 15:00:34 -0500
Message-ID: <20160810200034.GA14244@rob-hp-laptop>
References: <20160808172149.30861-1-andre.przywara@arm.com>
 <20160808172149.30861-6-andre.przywara@arm.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERBZEPV26QKGQEKDFCD3Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160808172149.30861-6-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 08, 2016 at 06:21:47PM +0100, Andre Przywara wrote:
> The Allwinner A64 SoC is a low-cost chip with 4 ARM Cortex-A53 cores
> and the typical tablet / TV box peripherals.
> The SoC is based on the (32-bit) Allwinner H3 chip, sharing most of
> the peripherals and the memory map.
> Although the cores are proper 64-bit ones, the whole SoC is actually
> limited to 4GB (including all the supported DRAM), so we use 32-bit
> address and size cells. This has the nice feature of us being able to
> reuse the DT for 32-bit kernels as well.
> This .dtsi lists the hardware that we support so far.
> 
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
> Hi,
> 
> I dropped Rob's previous ACK, as there were quite some changes.
> 
> Cheers,
> Andre.
> 
>  Documentation/devicetree/bindings/arm/sunxi.txt    |   1 +
>  .../boot/dts/allwinner/sun50i-a64-clocks.dtsi      | 140 ++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 398 +++++++++++++++++++++
>  3 files changed, 539 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-clocks.dtsi
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
> index 7e79fcc..7e59d8b 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.txt
> +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
> @@ -14,3 +14,4 @@ using one of the following compatible strings:
>    allwinner,sun8i-a83t
>    allwinner,sun8i-h3
>    allwinner,sun9i-a80
> +  allwinner,sun50i-a64
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-clocks.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-clocks.dtsi
> new file mode 100644
> index 0000000..9bfcd41
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-clocks.dtsi
> @@ -0,0 +1,140 @@
> +/*
> + * Allwinner A64 clocks
> + *
> + * Copyright (c) 2016 ARM Ltd
> + *
> + * This file is licensed under a dual GPLv2 or BSD license.
> + *
> + */
> +
> +	osc24M: osc24M_clk {

Drop the '_' in the node names here and throughout.

Rob
