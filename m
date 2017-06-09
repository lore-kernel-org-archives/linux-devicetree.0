From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH] arm64: allwinner: sun50i-a64: Remove
 duplicate ethernet@1c30000
Date: Fri, 9 Jun 2017 14:38:39 +0100
Message-ID: <6d21516d-7412-5f16-f6f8-b7d46106b4f5@arm.com>
References: <1497012052-14027-1-git-send-email-jteki@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497012052-14027-1-git-send-email-jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 09/06/17 13:40, Jagan Teki wrote:
> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> 
> Remove duplicate ethernet@1c30000 from allwinner/sun50i-a64.dtsi

I think this is an artefact of the sun8i-dwmac merging, where both David
and Maxime merged the DT patches in their trees (compare e53f67e9 and
103aefa0). I think both of them are in the process of sorting this out
(as this effects more than this hunk, I believe).

Cheers,
Andre.

> 
> Build error:
> arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dtb:
> ERROR (duplicate_node_names): Duplicate node name /soc/ethernet@1c30000
> ERROR: Input tree has errors, aborting (use -f to force output)
> 
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 20 --------------------
>  1 file changed, 20 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 1b36aab..9d00622 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -469,26 +469,6 @@
>  			};
>  		};
>  
> -		emac: ethernet@1c30000 {
> -			compatible = "allwinner,sun50i-a64-emac";
> -			syscon = <&syscon>;
> -			reg = <0x01c30000 0x100>;
> -			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "macirq";
> -			resets = <&ccu RST_BUS_EMAC>;
> -			reset-names = "stmmaceth";
> -			clocks = <&ccu CLK_BUS_EMAC>;
> -			clock-names = "stmmaceth";
> -			status = "disabled";
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			mdio: mdio {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -			};
> -		};
> -
>  		gic: interrupt-controller@1c81000 {
>  			compatible = "arm,gic-400";
>  			reg = <0x01c81000 0x1000>,
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
