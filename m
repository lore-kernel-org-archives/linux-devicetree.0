From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Docs: dt: add #msi-cells to GICv3 ITS binding
Date: Thu, 17 Sep 2015 14:39:25 -0500
Message-ID: <55FB16ED.5060407@kernel.org>
References: <1441619343-12087-1-git-send-email-mark.rutland@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441619343-12087-1-git-send-email-mark.rutland-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/07/2015 04:49 AM, Mark Rutland wrote:
> The GICv3 ITS uses sideband master identification data (known as a
> DeviceID) to identify which master wrote to a doorbell, and this data is
> used to determine how to react in response to the write.
> 
> Commit 1e6db000482fa65a ("irqchip/gicv3-its: Add platform MSI support")
> added support per this binding, but failed to update the documentation.
> This patch fixes the documentation.
> 
> Signed-off-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/arm/gic-v3.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/gic-v3.txt b/Documentation/devicetree/bindings/arm/gic-v3.txt
> index ddfade4..7803e77 100644
> --- a/Documentation/devicetree/bindings/arm/gic-v3.txt
> +++ b/Documentation/devicetree/bindings/arm/gic-v3.txt
> @@ -57,6 +57,8 @@ used to route Message Signalled Interrupts (MSI) to the CPUs.
>  These nodes must have the following properties:
>  - compatible : Should at least contain  "arm,gic-v3-its".
>  - msi-controller : Boolean property. Identifies the node as an MSI controller
> +- #msi-cells: Must be <1>. The single msi-cell is the DeviceID of the device
> +  which will generate the MSI.
>  - reg: Specifies the base physical address and size of the ITS
>    registers.
>  
> @@ -83,6 +85,7 @@ Examples:
>  		gic-its@2c200000 {
>  			compatible = "arm,gic-v3-its";
>  			msi-controller;
> +			#msi-cells = <1>;
>  			reg = <0x0 0x2c200000 0 0x200000>;
>  		};
>  	};
> @@ -107,12 +110,14 @@ Examples:
>  		gic-its@2c200000 {
>  			compatible = "arm,gic-v3-its";
>  			msi-controller;
> +			#msi-cells = <1>;
>  			reg = <0x0 0x2c200000 0 0x200000>;
>  		};
>  
>  		gic-its@2c400000 {
>  			compatible = "arm,gic-v3-its";
>  			msi-controller;
> +			#msi-cells = <1>;
>  			reg = <0x0 0x2c400000 0 0x200000>;
>  		};
>  	};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
