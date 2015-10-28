From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] doc: dt: mtd: support partitions in a special
 'partitions' subnode
Date: Wed, 28 Oct 2015 15:50:37 -0700
Message-ID: <20151028225037.GD13239@google.com>
References: <1446072486-145169-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1446072486-145169-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 28, 2015 at 03:48:06PM -0700, Brian Norris wrote:
> From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> To avoid conflict with other drivers using subnodes of the mtd device
> create only one ofpart-specific node rather than any number of
> arbitrary partition subnodes.
> 
> Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

Ugh, I wrote this up to stick below the '---' but I forgot to send it
out with the patch. Here goes:

This is a resend with only slight modifications of Michal's v3 patch, for 
clarity:

http://thread.gmane.org/gmane.linux.drivers.mtd/60890/focus=60889

It's been reviewed by me and Rob and I plan to take it for v4.4. But at Rob's
suggestion, I'm sending this to the devicetree-spec list too, as this is a
binding for somewhat generic infrastructure, rather than just drivers.

Regards,
Brian

>  .../devicetree/bindings/mtd/partition.txt          | 71 +++++++++++++---------
>  1 file changed, 42 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
> index 8e5557da1955..f1e2a02381a4 100644
> --- a/Documentation/devicetree/bindings/mtd/partition.txt
> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> @@ -4,10 +4,17 @@ Partitions can be represented by sub-nodes of an mtd device. This can be used
>  on platforms which have strong conventions about which portions of a flash are
>  used for what purposes, but which don't use an on-flash partition table such
>  as RedBoot.
> -NOTE: if the sub-node has a compatible string, then it is not a partition.
>  
> -#address-cells & #size-cells must both be present in the mtd device. There are
> -two valid values for both:
> +The partition table should be a subnode of the mtd node and should be named
> +'partitions'. Partitions are defined in subnodes of the partitions node.
> +
> +For backwards compatibility partitions as direct subnodes of the mtd device are
> +supported. This use is discouraged.
> +NOTE: also for backwards compatibility, direct subnodes that have a compatible
> +string are not considered partitions, as they may be used for other bindings.
> +
> +#address-cells & #size-cells must both be present in the partitions subnode of the
> +mtd device. There are two valid values for both:
>  <1>: for partitions that require a single 32-bit cell to represent their
>       size/address (aka the value is below 4 GiB)
>  <2>: for partitions that require two 32-bit cells to represent their
> @@ -28,44 +35,50 @@ Examples:
>  
>  
>  flash@0 {
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> +	partitions {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
>  
> -	partition@0 {
> -		label = "u-boot";
> -		reg = <0x0000000 0x100000>;
> -		read-only;
> -	};
> +		partition@0 {
> +			label = "u-boot";
> +			reg = <0x0000000 0x100000>;
> +			read-only;
> +		};
>  
> -	uimage@100000 {
> -		reg = <0x0100000 0x200000>;
> +		uimage@100000 {
> +			reg = <0x0100000 0x200000>;
> +		};
>  	};
>  };
>  
>  flash@1 {
> -	#address-cells = <1>;
> -	#size-cells = <2>;
> +	partitions {
> +		#address-cells = <1>;
> +		#size-cells = <2>;
>  
> -	/* a 4 GiB partition */
> -	partition@0 {
> -		label = "filesystem";
> -		reg = <0x00000000 0x1 0x00000000>;
> +		/* a 4 GiB partition */
> +		partition@0 {
> +			label = "filesystem";
> +			reg = <0x00000000 0x1 0x00000000>;
> +		};
>  	};
>  };
>  
>  flash@2 {
> -	#address-cells = <2>;
> -	#size-cells = <2>;
> +	partitions {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
>  
> -	/* an 8 GiB partition */
> -	partition@0 {
> -		label = "filesystem #1";
> -		reg = <0x0 0x00000000 0x2 0x00000000>;
> -	};
> +		/* an 8 GiB partition */
> +		partition@0 {
> +			label = "filesystem #1";
> +			reg = <0x0 0x00000000 0x2 0x00000000>;
> +		};
>  
> -	/* a 4 GiB partition */
> -	partition@200000000 {
> -		label = "filesystem #2";
> -		reg = <0x2 0x00000000 0x1 0x00000000>;
> +		/* a 4 GiB partition */
> +		partition@200000000 {
> +			label = "filesystem #2";
> +			reg = <0x2 0x00000000 0x1 0x00000000>;
> +		};
>  	};
>  };
> -- 
> 2.6.0.rc2.230.g3dd15c0
> 
