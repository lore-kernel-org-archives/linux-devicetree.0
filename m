From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv3 4/7] Documentation: dt: socfpga: Add Arria10 Ethernet
 binding
Date: Thu, 16 Jun 2016 13:39:53 -0500
Message-ID: <20160616183953.GA6667@rob-hp-laptop>
References: <1465852752-11018-1-git-send-email-tthayer@opensource.altera.com>
 <1465852752-11018-5-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465852752-11018-5-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 13, 2016 at 04:19:09PM -0500, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> Add the device tree bindings needed to support the Altera Ethernet
> FIFO buffers on the Arria10 chip.
> 
> Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
> v2  No Change
> v3  Change to common compatible string based on maintainer comments
>     Add local IRQ values.
> ---
>  .../bindings/arm/altera/socfpga-eccmgr.txt         |   24 ++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
> index 15eb0df..e9febbb 100644
> --- a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
> @@ -82,6 +82,14 @@ Required Properties:
>  - interrupts : Should be single bit error interrupt, then double bit error
>  	interrupt, in this order.
>  
> +Ethernet FIFO ECC
> +Required Properties:
> +- compatible : Should be "altr,socfpga-eth-mac-ecc"
> +- reg        : Address and size for ECC block registers.
> +- parent     : phandle to parent Ethernet node.

parent is too vague. How about altr,ethernet-mac.

> +- interrupts : Should be single bit error interrupt, then double bit error
> +	interrupt, in this order.
> +
>  Example:
>  
>  	eccmgr: eccmgr@ffd06000 {
> @@ -108,4 +116,20 @@ Example:
>  			interrupts = <1 IRQ_TYPE_LEVEL_HIGH>,
>  				     <33 IRQ_TYPE_LEVEL_HIGH> ;
>  		};
> +
> +		emac0-rx-ecc@ff8c0800 {
> +			compatible = "altr,socfpga-eth-mac-ecc";
> +			reg = <0xff8c0800 0x400>;
> +			parent = <&gmac0>;
> +			interrupts = <4 IRQ_TYPE_LEVEL_HIGH>,
> +				     <36 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		emac0-tx-ecc@ff8c0c00 {
> +			compatible = "altr,socfpga-eth-mac-ecc";
> +			reg = <0xff8c0c00 0x400>;
> +			parent = <&gmac0>;
> +			interrupts = <5 IRQ_TYPE_LEVEL_HIGH>,
> +				     <37 IRQ_TYPE_LEVEL_HIGH>;
> +		};
>  	};
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
