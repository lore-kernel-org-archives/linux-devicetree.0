From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH][v2] devicetree/binding/powerpc/fsl: Add binding for CPLD
Date: Mon, 7 Jul 2014 16:29:29 -0500
Message-ID: <1404768569.21434.195.camel@snotra.buserror.net>
References: <1404448395-6513-1-git-send-email-Priyanka.Jain@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404448395-6513-1-git-send-email-Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2014-07-04 at 10:03 +0530, Priyanka Jain wrote:
> Some Freescale boards like T1040RDB have on board CPLD connected on
> the IFC bus. Add binding for this in board.txt file
> 
> Signed-off-by: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> Changes for v2:
>  convert board name to lower-case based on Scott's suggestions
> 
>  .../devicetree/bindings/powerpc/fsl/board.txt      |   19 +++++++++++++++++++
>  1 files changed, 19 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/board.txt b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
> index 700dec4..f35f295 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/board.txt
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
> @@ -84,3 +84,22 @@ Example:
>  		compatible = "fsl,bsc9132qds-fpga", "fsl,fpga-qixis-i2c";
>  		reg = <0x66>;
>  	};
> +
> +* Freescale on-board CPLD
> +
> +Some Freescale boards like T1040RDB have on board CPLD connected on
> +the IFC bus.
> +
> +Required properties:
> +- compatible: Should be a board-specific string like "fsl,<board>-cpld"
> +  Example:
> +	"fsl,t1040rdb-cpld", "fsl,t1042rdb-cpld", "fsl,t1042rdb_pi-cpld"
> +- reg: Should contain the chip select, address offset and length of the CPLD

We don't say "chip select, address offset and length" anywhere else in
this document.  The reg format expected by the parent node should be
documented in the binding for the parent node (e.g. you could find the
node with a different reg format if for some reason it's not under a
localbus node, such as may happen in certain virtualization
scenarios).  

All you need to say here is that there is one reg region, which
describes the CPLD registers.


> +Example:
> +	cpld@3,0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;

Why do you need #address-cells/#size-cells?

If you do need them, where is ranges and/or a description of what the
child reg format is?

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
