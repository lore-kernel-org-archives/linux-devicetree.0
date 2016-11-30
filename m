From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: juno: Correct PCI IO window
Date: Wed, 30 Nov 2016 10:43:43 +0000
Message-ID: <20161130104343.GA13903@red-moon>
References: <1480452310-29286-1-git-send-email-jeremy.linton@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480452310-29286-1-git-send-email-jeremy.linton-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy Linton <jeremy.linton-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, liviu.dudau-5wv7dgnIgG8@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 29, 2016 at 02:45:10PM -0600, Jeremy Linton wrote:
> The PCIe root complex on Juno translates the MMIO mapped
> at 0x5f800000 to the PIO address range starting at 0
> (which is common because PIO addresses are generally < 64k).
> Correct the DT to reflect this.
> 
> Signed-off-by: Jeremy Linton <jeremy.linton-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/arm/juno-base.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>

> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index 334271a..7d3a2ac 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -393,7 +393,7 @@
>  		#address-cells = <3>;
>  		#size-cells = <2>;
>  		dma-coherent;
> -		ranges = <0x01000000 0x00 0x5f800000 0x00 0x5f800000 0x0 0x00800000>,
> +		ranges = <0x01000000 0x00 0x00000000 0x00 0x5f800000 0x0 0x00800000>,
>  			 <0x02000000 0x00 0x50000000 0x00 0x50000000 0x0 0x08000000>,
>  			 <0x42000000 0x40 0x00000000 0x40 0x00000000 0x1 0x00000000>;
>  		#interrupt-cells = <1>;
> -- 
> 2.5.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
