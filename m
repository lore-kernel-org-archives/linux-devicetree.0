From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: dts: skeleton: add unit name to memory node
Date: Wed, 30 Mar 2016 12:06:12 +0100
Message-ID: <20160330110611.GB25354@leverpostej>
References: <1459290646-3592-1-git-send-email-manabian@gmail.com>
 <1459290646-3592-3-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459290646-3592-3-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 30, 2016 at 12:30:41AM +0200, Joachim Eastwood wrote:
> Add unit name to memory to remove the following warning:
>  Warning (unit_address_vs_reg): Node /memory has a reg or ranges
> 				property, but no unit name

If anything, it would be better to get rid of the memory node from the
skeleton DTs.

For DTs which have a memory node there's no problem, and DTs which
expect a bootlaoder to fill things in have a logical place to document
that fact.

Thanks,
Mark.

> 
> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/skeleton.dtsi   | 2 +-
>  arch/arm/boot/dts/skeleton64.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/skeleton.dtsi b/arch/arm/boot/dts/skeleton.dtsi
> index b41d241..a20da0a 100644
> --- a/arch/arm/boot/dts/skeleton.dtsi
> +++ b/arch/arm/boot/dts/skeleton.dtsi
> @@ -9,5 +9,5 @@
>  	#size-cells = <1>;
>  	chosen { };
>  	aliases { };
> -	memory { device_type = "memory"; reg = <0 0>; };
> +	memory@0 { device_type = "memory"; reg = <0 0>; };
>  };
> diff --git a/arch/arm/boot/dts/skeleton64.dtsi b/arch/arm/boot/dts/skeleton64.dtsi
> index b5d7f36..6dbe9f9 100644
> --- a/arch/arm/boot/dts/skeleton64.dtsi
> +++ b/arch/arm/boot/dts/skeleton64.dtsi
> @@ -9,5 +9,5 @@
>  	#size-cells = <2>;
>  	chosen { };
>  	aliases { };
> -	memory { device_type = "memory"; reg = <0 0 0 0>; };
> +	memory@0 { device_type = "memory"; reg = <0 0 0 0>; };
>  };
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
