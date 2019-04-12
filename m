Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53446 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbfDLK6h (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 06:58:37 -0400
Date: Fri, 12 Apr 2019 12:58:33 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 17/20] dt-bindings: pwm: Document r8a77470 bindings
Message-ID: <20190412105833.m7krdipwhs5fo7jr@verge.net.au>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-18-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-18-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 11, 2019 at 04:54:19PM +0900, Cao Van Dong wrote:
> Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

I think it is worth mentioning that no driver update is required because
using the renesas,pwm-rcar fallback compat string will activate the correct
code.

I think this patch should be reposted including the following recipients:

Thierry Reding <thierry.reding@gmail.com>
Rob Herring <robh+dt@kernel.org>
Mark Rutland <mark.rutland@arm.com>
linux-pwm@vger.kernel.org

As well as the following that are already included:
linux-renesas-soc@vger.kernel.org
devicetree@vger.kernel.org

> ---
>  Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
> index fbd6a4f..cba6ace 100644
> --- a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
> +++ b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
> @@ -5,6 +5,7 @@ Required Properties:
>   - "renesas,pwm-r8a7743": for RZ/G1M
>   - "renesas,pwm-r8a7744": for RZ/G1N
>   - "renesas,pwm-r8a7745": for RZ/G1E
> + - "renesas,pwm-r8a77470": for RZ/G1C
>   - "renesas,pwm-r8a774a1": for RZ/G2M
>   - "renesas,pwm-r8a774c0": for RZ/G2E
>   - "renesas,pwm-r8a7778": for R-Car M1A
> -- 
> 2.7.4
> 
