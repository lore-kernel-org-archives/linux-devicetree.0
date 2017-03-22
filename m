From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 13/15] arm64: dts: juno: fix PCI bus dtc warnings
Date: Wed, 22 Mar 2017 11:56:18 +0000
Message-ID: <20170322115618.GD6816@e110455-lin.cambridge.arm.com>
References: <20170322020313.24338-1-robh@kernel.org>
 <20170322020313.24338-13-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170322020313.24338-13-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Mar 21, 2017 at 09:03:11PM -0500, Rob Herring wrote:
> dtc recently added PCI bus checks. Fix these warnings.

Was not aware of the warnings and the commit message doesn't quote
them, but the change looks trivial. So:

Acked-by: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>

Thanks for fixing this!
Liviu

> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> ---
> 
>  arch/arm64/boot/dts/arm/juno-base.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index df539e865b90..8ffaff2043d0 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -428,7 +428,7 @@
>  		};
>  	};
>  
> -	pcie_ctlr: pcie-controller@40000000 {
> +	pcie_ctlr: pcie@40000000 {
>  		compatible = "arm,juno-r1-pcie", "plda,xpressrich3-axi", "pci-host-ecam-generic";
>  		device_type = "pci";
>  		reg = <0 0x40000000 0 0x10000000>;	/* ECAM config space */
> -- 
> 2.10.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
