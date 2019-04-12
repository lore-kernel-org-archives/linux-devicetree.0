Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51778 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbfDLKnM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 06:43:12 -0400
Date: Fri, 12 Apr 2019 12:43:08 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 14/20] dt-bindings: display: renesas: lvds: Add
 r8a77470 support
Message-ID: <20190412104308.nozru2hcwmah53nx@verge.net.au>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-15-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-15-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 11, 2019 at 04:54:16PM +0900, Cao Van Dong wrote:
> Add lvds support and document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

The register layout of the LVDS module on the RZ/G1C (r8a77470) seems
different to that of, f.e. the R8A7791 (R-Car M2-W). Are you sure this
is the right driver for this IP block?

> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 1 +
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                               | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> index a720dbb..f720883 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -9,6 +9,7 @@ Required properties:
>  - compatible : Shall contain one of
>    - "renesas,r8a7743-lvds" for R8A7743 (RZ/G1M) compatible LVDS encoders
>    - "renesas,r8a7744-lvds" for R8A7744 (RZ/G1N) compatible LVDS encoders
> +  - "renesas,r8a77470-lvds" for R8A77470 (RZ/G1C) compatible LVDS encoders
>    - "renesas,r8a774c0-lvds" for R8A774C0 (RZ/G2E) compatible LVDS encoders
>    - "renesas,r8a7790-lvds" for R8A7790 (R-Car H2) compatible LVDS encoders
>    - "renesas,r8a7791-lvds" for R8A7791 (R-Car M2-W) compatible LVDS encoders
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index f7e4710..61a536f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -925,6 +925,7 @@ static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
>  static const struct of_device_id rcar_lvds_of_table[] = {
>  	{ .compatible = "renesas,r8a7743-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a7744-lvds", .data = &rcar_lvds_gen2_info },
> +	{ .compatible = "renesas,r8a77470-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a774c0-lvds", .data = &rcar_lvds_r8a77990_info },
>  	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
>  	{ .compatible = "renesas,r8a7791-lvds", .data = &rcar_lvds_gen2_info },
> -- 
> 2.7.4
> 
