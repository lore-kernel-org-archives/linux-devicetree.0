From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] devicetree/bindings/powerpc/fsl: Add binding for board
Date: Mon, 7 Jul 2014 16:30:24 -0500
Message-ID: <1404768624.21434.196.camel@snotra.buserror.net>
References: <1404722194-8103-1-git-send-email-Priyanka.Jain@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404722194-8103-1-git-send-email-Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2014-07-07 at 14:06 +0530, Priyanka Jain wrote:
> Signed-off-by: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  .../devicetree/bindings/powerpc/fsl/board.txt      |   17 ++++++++++++++++-
>  1 files changed, 16 insertions(+), 1 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/board.txt b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
> index f35f295..7800729 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/board.txt
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
> @@ -1,8 +1,23 @@
>  Freescale Reference Board Bindings
>  
> -This document describes device tree bindings for various devices that
> +This document describes device tree bindings for board and  various devices that
>  exist on some Freescale reference boards.
>  
> +* Board node
> +Required properties:
> +
> + - model : Should be "fsl,<board>"
> + - compatible : Should be "fsl,<board>"
> +	example: "fsl,T1040RDB", "fsl,T1042RDB", "fsl,T1042RDB_PI"
> +		 "fsl,T1040QDS", "fsl,T1042QDS"
> +
> +Example:
> +
> +/ {
> +	model = "fsl,T1040RDB";
> +	compatible = "fsl,T1040RDB";
> +};

We really don't need to do this for every board just to satisfy
checkpatch.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
