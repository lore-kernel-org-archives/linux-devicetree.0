Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52686 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfDLKxH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 06:53:07 -0400
Date: Fri, 12 Apr 2019 12:53:03 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 15/20] media: dt-bindings: media: rcar_vin: Document
 r8a77470 bindings
Message-ID: <20190412105303.xwo2tn3sebgdav3r@verge.net.au>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-16-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-16-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 11, 2019 at 04:54:17PM +0900, Cao Van Dong wrote:
> Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.

I think it is worth mentioning that no driver change is required
renesas,rcar-gen2-vin will activate the right code.

> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

I think this patch should be reposted including the following recipients.

Mauro Carvalho Chehab <mchehab@kernel.org>
Rob Herring <robh+dt@kernel.org>
Mark Rutland <mark.rutland@arm.com>
linux-media@vger.kernel.org

As well as the following you already have:

linux-renesas-soc@vger.kernel.org
devicetree@vger.kernel.org

> ---
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/rcar_vin.txt
> index aa217b0..a66b9fe 100644
> --- a/Documentation/devicetree/bindings/media/rcar_vin.txt
> +++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
> @@ -13,6 +13,7 @@ on Gen3 and RZ/G2 platforms to a CSI-2 receiver.
>     - "renesas,vin-r8a7743" for the R8A7743 device
>     - "renesas,vin-r8a7744" for the R8A7744 device
>     - "renesas,vin-r8a7745" for the R8A7745 device
> +   - "renesas,vin-r8a77470" for the R8A77470 device
>     - "renesas,vin-r8a774a1" for the R8A774A1 device
>     - "renesas,vin-r8a774c0" for the R8A774C0 device
>     - "renesas,vin-r8a7778" for the R8A7778 device
> -- 
> 2.7.4
> 
