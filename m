Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54560 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfDLLKO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 07:10:14 -0400
Date: Fri, 12 Apr 2019 13:10:10 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 19/20] spi: sh-msiof: Document r8a77470 bindings
Message-ID: <20190412111010.4o4chp4qmylo2q47@verge.net.au>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-20-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-20-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Hi Dong-san,

On Thu, Apr 11, 2019 at 04:54:21PM +0900, Cao Van Dong wrote:
> Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.

I think it is worth mentioning that no driver change is required as the
renesas,rcar-gen2-msiof fallback compatibility string will activate the
correct code.

> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

I think this patch should be reposted including the following recipients:

Rob Herring <robh+dt@kernel.org>
Mark Rutland <mark.rutland@arm.com>
linux-spi@vger.kernel.org

As well as the following who are already included:

Mark Brown <broonie@kernel.org>
devicetree@vger.kernel.org
linux-renesas-soc@vger.kernel.org

> ---
>  Documentation/devicetree/bindings/spi/sh-msiof.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
> index 37cf695..18e14ee 100644
> --- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
> +++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
> @@ -4,6 +4,7 @@ Required properties:
>  - compatible           : "renesas,msiof-r8a7743" (RZ/G1M)
>  			 "renesas,msiof-r8a7744" (RZ/G1N)
>  			 "renesas,msiof-r8a7745" (RZ/G1E)
> +			 "renesas,msiof-r8a77470" (RZ/G1C)
>  			 "renesas,msiof-r8a774a1" (RZ/G2M)
>  			 "renesas,msiof-r8a774c0" (RZ/G2E)
>  			 "renesas,msiof-r8a7790" (R-Car H2)
> -- 
> 2.7.4
> 
