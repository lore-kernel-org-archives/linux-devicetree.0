Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54042 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbfDLLFW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 07:05:22 -0400
Date: Fri, 12 Apr 2019 13:05:18 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 18/20] sh_eth: Document r8a77470 bindings
Message-ID: <20190412110518.qb22lwmblhocgq64@verge.net.au>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-19-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-19-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Hi Dong-san,

On Thu, Apr 11, 2019 at 04:54:20PM +0900, Cao Van Dong wrote:
> Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.

I think it would be worth mentioning that no driver changes are required
because the renesas,rcar-gen2-ether fallaback compatibility string
will activate the correct code.

> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>


I think this should be reposted including the following recipients:

"David S. Miller" <davem@davemloft.net>
Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Rob Herring <robh+dt@kernel.org>
Mark Rutland <mark.rutland@arm.com>
netdev@vger.kernel.org

As well as the following that are already included:
linux-renesas-soc@vger.kernel.org
devicetree@vger.kernel.org

The patch should be targeted at David Miller's net-next tree and thus
should have "net-next" included in the subject, something like this:

[PATCH net-next v2 18/20] sh_eth: Document r8a77470 bindings

Please see Documentation/networking/netdev-FAQ.rst for more information
on submitting patches to the Networking subsystem.

> ---
>  Documentation/devicetree/bindings/net/sh_eth.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/sh_eth.txt b/Documentation/devicetree/bindings/net/sh_eth.txt
> index abc3627..b184b29 100644
> --- a/Documentation/devicetree/bindings/net/sh_eth.txt
> +++ b/Documentation/devicetree/bindings/net/sh_eth.txt
> @@ -8,6 +8,7 @@ Required properties:
>  	      "renesas,gether-r8a7740" if the device is a part of R8A7740 SoC.
>  	      "renesas,ether-r8a7743"  if the device is a part of R8A7743 SoC.
>  	      "renesas,ether-r8a7745"  if the device is a part of R8A7745 SoC.
> +	      "renesas,ether-r8a77470"  if the device is a part of R8A77470 SoC.
>  	      "renesas,ether-r8a7778"  if the device is a part of R8A7778 SoC.
>  	      "renesas,ether-r8a7779"  if the device is a part of R8A7779 SoC.
>  	      "renesas,ether-r8a7790"  if the device is a part of R8A7790 SoC.
> -- 
> 2.7.4
> 
