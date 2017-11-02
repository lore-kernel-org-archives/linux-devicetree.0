From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2 00/10] Allwinner H3/H5/A64(DE2) SimpleFB support
Date: Thu, 02 Nov 2017 16:51:29 +0800
Message-ID: <9bca10cc95d04f87a1122bc582402310@aosc.io>
References: <20171027150658.18509-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171027150658.18509-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2017-10-27 23:06，Icenowy Zheng 写道：
> This patchset adds support for the SimpleFB on Allwinner SoCs with
> "Display Engine 2.0".
> 
> PATCH 1 to PATCH 3 are DE2 CCU fixes for H3/H5 SoCs.
> 
> PATCH 4 adds the pipeline strings for DE2 SimpleFB.
> 
> PATCH 5 to 7 adds necessary device tree nodes (DE2 CCU and SimpleFB)
> for H3/H5 SoCs.
> 
> PATCH 8 to 10 are for Allwinner A64 SoC to enable SimpleFB.
> 
> Icenowy Zheng (10):
>   dt-bindings: fix the binding of Allwinner DE2 CCU of A83T and H3
>   clk: sunxi-ng: add support for Allwinner H3 DE2 CCU
>   clk: sunxi-ng: fix the A64/H5 clock description of DE2 CCU
>   dt-bindings: simplefb-sunxi: add pipelines for DE2
>   ARM: sun8i: h3/h5: add DE2 CCU device node for H3
>   arm64: allwinner: h5: add compatible string for DE2 CCU
>   ARM: sunxi: h3/h5: add simplefb nodes
>   dt-bindings: add binding for A64 DE2 CCU SRAM
>   arm64: allwinner: a64: add DE2 CCU for A64 SoC
>   arm64: allwinner: a64: add simplefb for A64 SoC

Maxime, could you review and, if possible, apply the H3/5
part of this patchset?

Thanks!
Icenowy

> 
>  .../devicetree/bindings/clock/sun8i-de2.txt        | 10 +++-
>  .../bindings/display/simple-framebuffer-sunxi.txt  |  4 ++
>  arch/arm/boot/dts/sun8i-h3.dtsi                    |  4 ++
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi                 | 43 ++++++++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 65 
> ++++++++++++++++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       |  4 ++
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c               | 53 
> +++++++++++++++++-
>  7 files changed, 178 insertions(+), 5 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
