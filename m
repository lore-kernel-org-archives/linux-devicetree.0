From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH 2/5] arm: allwinner: a64: drop the dummy
 vcc3v3 regulator in Pine64 DT
Date: Fri, 21 Jul 2017 13:45:39 +0100
Message-ID: <4e2c9486-9c0d-14e9-62e7-8642758c5472@arm.com>
References: <20170719161019.62133-1-icenowy@aosc.io>
 <20170719161019.62133-3-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170719161019.62133-3-icenowy-h8G6r0blFSE@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: icenowy-h8G6r0blFSE@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 19/07/17 17:10, Icenowy Zheng wrote:
> The Pine64 DT used to contain a dummy vcc3v3 regulator, in order to
> satisfy some device nodes when proper AXP803 regulator support is
> available. It's in fact the DCDC1 regulator of AXP803.
> 
> Drop the dummy regulator, and fix the reference of this regulator to
> DCDC1.

Do we really need to have this?
While I see that this is technically correct, it breaks older kernels,
which miss the AXP driver. So we can't use this DT for syncing it into
U-Boot anymore, while still expecting various kernels (for instance from
distribution installers) to work via UEFI (for which U-Boot provides the
DT). That would be a shame, because we start to see generic arm64
distribution installers to work out of the box.

I see these solutions:
1) We drop this patch, instead add a comment that technically it's
DCDC1. I believe we can't really turn off DCDC1 anyway.
2) We keep theses patches, but don't sync them to U-Boot to have a
universal DT in there which works with every kernel.
3) We keep these patches *and* sync them to U-Boot, but add the fixed
regulator back in via a U-Boot specific .dtsi "overlay" snippet. This
would take care of the parts that break compatibility. The end result
would be similar to 2), then.

The easiest and most maintainable would be 1), but I am OK with 3) as
well, though I am not sure this won't get messy in the future and will
work for every change that we make.

What do you think?

Cheers,
Andre.

> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> index ac31c9477b25..68a47d9b07d9 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> @@ -61,13 +61,6 @@
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> -
> -	reg_vcc3v3: vcc3v3 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "vcc3v3";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -	};
>  };
>  
>  &ehci0 {
> @@ -108,7 +101,7 @@
>  &mmc0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc0_pins>;
> -	vmmc-supply = <&reg_vcc3v3>;
> +	vmmc-supply = <&reg_dcdc1>;
>  	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
>  	cd-inverted;
>  	disable-wp;
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
