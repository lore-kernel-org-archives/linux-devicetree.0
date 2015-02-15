From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH/RFC] ARM: shmobile: r8a7791: Fix HSUSB clock to hp_clk
 from mp_clk
Date: Sun, 15 Feb 2015 10:36:50 -0500
Message-ID: <20150215153649.GC25065@verge.net.au>
References: <1424011746-3787-3-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1424011746-3787-3-git-send-email-ykaneko0929-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Kaneko <ykaneko0929-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 15, 2015 at 11:49:06PM +0900, Yoshihiro Kaneko wrote:
> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> 
> HSUSB uses hp_clk for H/W register access.
> HSUSB uses mp_clk for USB-DMAC access.
> The clock is defined for H/W register access.
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> 
> This patch is based on devel branch of Simon Horman's renesas tree.

I plan to take this through the renesas tree unless someone objects.
In the mean time, for reference:

Reviewed-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>

>  arch/arm/boot/dts/r8a7791.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
> index afba8af..cb9a9e7 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
> @@ -1,7 +1,7 @@
>  /*
>   * Device Tree Source for the r8a7791 SoC
>   *
> - * Copyright (C) 2013-2014 Renesas Electronics Corporation
> + * Copyright (C) 2013-2015 Renesas Electronics Corporation
>   * Copyright (C) 2013-2014 Renesas Solutions Corp.
>   * Copyright (C) 2014 Cogent Embedded Inc.
>   *
> @@ -1136,7 +1136,7 @@
>  		mstp7_clks: mstp7_clks@e615014c {
>  			compatible = "renesas,r8a7791-mstp-clocks", "renesas,cpg-mstp-clocks";
>  			reg = <0 0xe615014c 0 4>, <0 0xe61501c4 0 4>;
> -			clocks = <&mp_clk>,  <&mp_clk>, <&zs_clk>, <&p_clk>, <&p_clk>, <&zs_clk>,
> +			clocks = <&mp_clk>,  <&hp_clk>, <&zs_clk>, <&p_clk>, <&p_clk>, <&zs_clk>,
>  				 <&zs_clk>, <&p_clk>, <&p_clk>, <&p_clk>, <&p_clk>,
>  				 <&zx_clk>, <&zx_clk>, <&zx_clk>;
>  			#clock-cells = <1>;
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-sh" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
