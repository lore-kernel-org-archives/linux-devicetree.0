From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [RFC 16/18] arm: dts: omap3: Add DT entries for OMAP 3
Date: Sun, 08 Mar 2015 01:51:51 +0200
Message-ID: <2423520.KeZmBeFNoH@avalon>
References: <1425764475-27691-1-git-send-email-sakari.ailus@iki.fi> <1425764475-27691-17-git-send-email-sakari.ailus@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425764475-27691-17-git-send-email-sakari.ailus-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Saturday 07 March 2015 23:41:13 Sakari Ailus wrote:
> The resources the ISP needs are slightly different on 3[45]xx and 3[67]xx.
> Especially the phy-type property is different.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
> ---
>  arch/arm/boot/dts/omap34xx.dtsi |   15 +++++++++++++++
>  arch/arm/boot/dts/omap36xx.dtsi |   15 +++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/omap34xx.dtsi
> b/arch/arm/boot/dts/omap34xx.dtsi index 3819c1e..4c034d0 100644
> --- a/arch/arm/boot/dts/omap34xx.dtsi
> +++ b/arch/arm/boot/dts/omap34xx.dtsi
> @@ -37,6 +37,21 @@
>  			pinctrl-single,register-width = <16>;
>  			pinctrl-single,function-mask = <0xff1f>;
>  		};
> +
> +		omap3_isp: omap3_isp@480bc000 {
> +			compatible = "ti,omap3-isp";
> +			reg = <0x480bc000 0x12fc
> +			       0x480bd800 0x017c>;
> +			interrupts = <24>;
> +			iommus = <&mmu_isp>;
> +			syscon = <&omap3_scm_general 0xdc>;
> +			ti,phy-type = <0>;
> +			#clock-cells = <1>;
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;

How about predefining the ports too ?

> +			};
> +		};
>  	};
>  };
> 
> diff --git a/arch/arm/boot/dts/omap36xx.dtsi
> b/arch/arm/boot/dts/omap36xx.dtsi index 541704a..31ac41c 100644
> --- a/arch/arm/boot/dts/omap36xx.dtsi
> +++ b/arch/arm/boot/dts/omap36xx.dtsi
> @@ -69,6 +69,21 @@
>  			pinctrl-single,register-width = <16>;
>  			pinctrl-single,function-mask = <0xff1f>;
>  		};
> +
> +		omap3_isp: omap3_isp@480bc000 {
> +			compatible = "ti,omap3-isp";
> +			reg = <0x480bc000 0x12fc
> +			       0x480bd800 0x0600>;
> +			interrupts = <24>;
> +			iommus = <&mmu_isp>;
> +			syscon = <&omap3_scm_general 0x2f0>;
> +			ti,phy-type = <1>;
> +			#clock-cells = <1>;
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;

And obviously here too.

> +			};
> +		};
>  	};
>  };

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
