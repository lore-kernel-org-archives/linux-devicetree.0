Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55334 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfDLLRe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 07:17:34 -0400
Date: Fri, 12 Apr 2019 13:17:30 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 20/20] dt-bindings: can: rcar_can: Document r8a77470
 bindings
Message-ID: <20190412111729.vmgs6xw7oklb4n6k@verge.net.au>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-21-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-21-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Hi Dong-san,

On Thu, Apr 11, 2019 at 04:54:22PM +0900, Cao Van Dong wrote:
> Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.

I think it is worth mentioning that no driver update is required
because the renesas,rcar-gen2-can fallback compatibility string
with activate the correct code.

> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>  Documentation/devicetree/bindings/net/can/rcar_can.txt | 1 +
>  1 file changed, 1 insertion(+)

As per the ouput of ./scripts/get_maintainer.pl I think this should be
reposted including the following recipients:

Wolfgang Grandegger <wg@grandegger.com>
Marc Kleine-Budde <mkl@pengutronix.de>
"David S. Miller" <davem@davemloft.net>
Rob Herring <robh+dt@kernel.org>
Mark Rutland <mark.rutland@arm.com>
linux-can@vger.kernel.org
netdev@vger.kernel.org

As well as the following that are already included:
linux-renesas-soc@vger.kernel.org
devicetree@vger.kernel.org

The patch should be targeted at David Miller's net-next tree and thus
should have "net-next" included in the subject, something like this:

[PATCH net-next v2 20/20] dt-bindings: can: rcar_can: Document r8a77470

Please see Documentation/networking/netdev-FAQ.rst for more information
on submitting patches to the Networking subsystem.

> 
> diff --git a/Documentation/devicetree/bindings/net/can/rcar_can.txt b/Documentation/devicetree/bindings/net/can/rcar_can.txt
> index 9936b9e..a5d57da 100644
> --- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
> +++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
> @@ -5,6 +5,7 @@ Required properties:
>  - compatible: "renesas,can-r8a7743" if CAN controller is a part of R8A7743 SoC.
>  	      "renesas,can-r8a7744" if CAN controller is a part of R8A7744 SoC.
>  	      "renesas,can-r8a7745" if CAN controller is a part of R8A7745 SoC.
> +	      "renesas,can-r8a77470" if CAN controller is a part of R8A77470 SoC.
>  	      "renesas,can-r8a774a1" if CAN controller is a part of R8A774A1 SoC.
>  	      "renesas,can-r8a7778" if CAN controller is a part of R8A7778 SoC.
>  	      "renesas,can-r8a7779" if CAN controller is a part of R8A7779 SoC.
> -- 
> 2.7.4
> 
