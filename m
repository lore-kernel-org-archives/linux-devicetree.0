From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH][v2]devicetree/binding/powerpc/fsl: Add binding for CPLD
Date: Tue, 8 Jul 2014 09:06:58 -0500
Message-ID: <1404828418.21434.278.camel@snotra.buserror.net>
References: <1404796006-3254-1-git-send-email-Priyanka.Jain@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404796006-3254-1-git-send-email-Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2014-07-08 at 10:36 +0530, Priyanka Jain wrote:
> Some Freescale boards like T1040RDB have on board CPLD connected on
> the IFC bus. Add binding for this in board.txt file
> 
> Signed-off-by: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> Changes for v2: Incorporated Scott's comments

Isn't this v3?

>  .../devicetree/bindings/powerpc/fsl/board.txt      |   16 ++++++++++++++++
>  1 files changed, 16 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/board.txt b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
> index 700dec4..67ef6a4 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/board.txt
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
> @@ -84,3 +84,19 @@ Example:
>  		compatible = "fsl,bsc9132qds-fpga", "fsl,fpga-qixis-i2c";
>  		reg = <0x66>;
>  	};
> +
> +* Freescale on-board CPLD
> +
> +Some Freescale boards like T1040RDB have on board CPLD connected.

s/have on board/have an on board/

> +
> +Required properties:
> +- compatible: Should be a board-specific string like "fsl,<board>-cpld"
> +  Example:
> +	"fsl,T1040RDB-cpld", "fsl,T1042RDB-cpld", "fsl,T1042RDB_PI-cpld"
> +- reg: should describe CPLD registers
> +
> +Example:
> +	cpld@3,0 {
> +		compatible = "fsl,T1040RDB-cpld";
> +		reg = <3 0 0x300>;
> +	};

Again, please keep the board name lowercase.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
