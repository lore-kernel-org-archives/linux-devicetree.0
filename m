From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: keystone-k2g: Add PMMC node to support
 TI-SCI protocol
Date: Tue, 18 Jul 2017 10:00:35 -0500
Message-ID: <8b8c4eff-4f18-f0d2-e075-389921e5a990@ti.com>
References: <20170718032844.29490-1-s-anna@ti.com>
 <20170718032844.29490-2-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170718032844.29490-2-s-anna-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/17/2017 10:28 PM, Suman Anna wrote:
> From: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
> 
> Texas Instrument's System Control Interface (TI-SCI) Message Protocol
> is implemented in Keystone 2 generation 66AK2G SoC with the PMMC entity.
> 
> Add the ti-sci node representing this 66AK2G PMMC module.
> 
> Signed-off-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
> [s-anna-l0cyMroinI0@public.gmane.org: add unit address to DT node]
> Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
> ---
>  arch/arm/boot/dts/keystone-k2g.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
> index a789f75a1ed5..7f0f4180b373 100644
> --- a/arch/arm/boot/dts/keystone-k2g.dtsi
> +++ b/arch/arm/boot/dts/keystone-k2g.dtsi
> @@ -139,5 +139,19 @@
>  			interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> +
> +		pmmc: pmmc@02921c00 {
> +			compatible = "ti,k2g-sci";
> +			/*
> +			 * In case of rare platforms that does not use k2g as
> +			 * system master, use /delete-property/
> +			 */

This comment seems mis-worded, I believe this was meant to say "for
platforms that do not use the *PMMC* as the system master".

Andrew

> +			ti,system-reboot-controller;
> +			mbox-names = "rx", "tx";
> +			mboxes= <&msgmgr 5 2>,
> +				<&msgmgr 0 0>;
> +			reg-names = "debug_messages";
> +			reg = <0x02921c00 0x400>;
> +		};
>  	};
>  };
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
