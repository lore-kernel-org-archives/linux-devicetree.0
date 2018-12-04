Return-Path: <SRS0=jrs2=ON=verge.net.au=horms@kernel.org>
Date: Tue, 4 Dec 2018 06:27:32 -0800
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 17/22] ARM: dts: iwg20d-q7-common: Move cmt/rwdt node out
 of RZ/G1M SOM
Message-ID: <20181204142732.p6ksk2nakt653b3o@verge.net.au>
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
 <1543319795-48325-18-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543319795-48325-18-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Nov 27, 2018 at 11:56:30AM +0000, Biju Das wrote:
> The iWave RZ/G1N board is almost identical to RZ/G1M. cmt and rwdt modules
> are SoC specific and should be part of board dts rather than SoM dtsi. By
> moving these nodes to the common dtsi it allows cmt and rwdt to be enabled
> on both of these boards with less lines of code.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


Geert, did you miss this one when reviewing this series?
