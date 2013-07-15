From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 5/5] ARM: remove #gpio-ranges-cells property
Date: Mon, 15 Jul 2013 14:34:49 -0500
Message-ID: <51E44ED9.9020807@gmail.com>
References: <1373913629-32179-1-git-send-email-swarren@wwwdotorg.org>
 <1373913629-32179-5-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373913629-32179-5-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Shiraz Hashim <shiraz.hashim-qxv4g6HH51o@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/15/2013 01:40 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This property is no longer required by the GPIO binding. Remove it.

Won't this break compatibility with older kernel? It is one thing to
deprecate, but removal is another. If the relevant maintainers don't
care, then I guess it is fine.

> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> This should presumably be applied along with the previous changes

The rest looks fine to me. I can take this series, but would actually
prefer that this patch go separately to arm-soc.

Rob

> 
> v2: Squash spear and mxc changes into a single patch; there's no
> need to keep vf610.dtsi separate now that this series will go into
> v3.12 or later, and that file is part of v3.11-rc1.
> ---
>  arch/arm/boot/dts/spear1310.dtsi | 1 -
>  arch/arm/boot/dts/spear1340.dtsi | 1 -
>  arch/arm/boot/dts/spear310.dtsi  | 1 -
>  arch/arm/boot/dts/spear320.dtsi  | 2 --
>  arch/arm/boot/dts/vf610.dtsi     | 1 -
>  5 files changed, 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/spear1310.dtsi b/arch/arm/boot/dts/spear1310.dtsi
> index 122ae94..90e99b5 100644
> --- a/arch/arm/boot/dts/spear1310.dtsi
> +++ b/arch/arm/boot/dts/spear1310.dtsi
> @@ -89,7 +89,6 @@
>  		pinmux: pinmux@e0700000 {
>  			compatible = "st,spear1310-pinmux";
>  			reg = <0xe0700000 0x1000>;
> -			#gpio-range-cells = <3>;
>  		};
>  
>  		apb {
> diff --git a/arch/arm/boot/dts/spear1340.dtsi b/arch/arm/boot/dts/spear1340.dtsi
> index 54d128d..5003013 100644
> --- a/arch/arm/boot/dts/spear1340.dtsi
> +++ b/arch/arm/boot/dts/spear1340.dtsi
> @@ -63,7 +63,6 @@
>  		pinmux: pinmux@e0700000 {
>  			compatible = "st,spear1340-pinmux";
>  			reg = <0xe0700000 0x1000>;
> -			#gpio-range-cells = <3>;
>  		};
>  
>  		pwm: pwm@e0180000 {
> diff --git a/arch/arm/boot/dts/spear310.dtsi b/arch/arm/boot/dts/spear310.dtsi
> index 9537208..1e1318e 100644
> --- a/arch/arm/boot/dts/spear310.dtsi
> +++ b/arch/arm/boot/dts/spear310.dtsi
> @@ -25,7 +25,6 @@
>  		pinmux: pinmux@b4000000 {
>  			compatible = "st,spear310-pinmux";
>  			reg = <0xb4000000 0x1000>;
> -			#gpio-range-cells = <3>;
>  		};
>  
>  		fsmc: flash@44000000 {
> diff --git a/arch/arm/boot/dts/spear320.dtsi b/arch/arm/boot/dts/spear320.dtsi
> index ffea342..f630d0c 100644
> --- a/arch/arm/boot/dts/spear320.dtsi
> +++ b/arch/arm/boot/dts/spear320.dtsi
> @@ -1,4 +1,3 @@
> -/*
>   * DTS file for SPEAr320 SoC
>   *
>   * Copyright 2012 Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> @@ -24,7 +23,6 @@
>  		pinmux: pinmux@b3000000 {
>  			compatible = "st,spear320-pinmux";
>  			reg = <0xb3000000 0x1000>;
> -			#gpio-range-cells = <3>;
>  		};
>  
>  		clcd@90000000 {
> diff --git a/arch/arm/boot/dts/vf610.dtsi b/arch/arm/boot/dts/vf610.dtsi
> index e1eb7da..8577780 100644
> --- a/arch/arm/boot/dts/vf610.dtsi
> +++ b/arch/arm/boot/dts/vf610.dtsi
> @@ -162,7 +162,6 @@
>  			iomuxc: iomuxc@40048000 {
>  				compatible = "fsl,vf610-iomuxc";
>  				reg = <0x40048000 0x1000>;
> -				#gpio-range-cells = <3>;
>  
>  				/* functions and groups pins */
>  
> 
