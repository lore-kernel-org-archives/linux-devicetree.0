Return-Path: <SRS0=+yaY=OT=verge.net.au=horms@kernel.org>
Date: Mon, 10 Dec 2018 13:24:59 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: r8a7743: Fix sorting of rwdt node
Message-ID: <20181210122458.hnwle4jfui5lnwon@verge.net.au>
References: <1544442750-39442-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544442750-39442-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Dec 10, 2018 at 11:52:30AM +0000, Biju Das wrote:
> Watchdog node is incorrectly placed on r8a7743 SoC dtsi. This patch fixes
> the sorting order.
> 
> Fixes: b5beb5d4c81c358f50a8310108 ("ARM: dts: r8a7743: Add watchdog support to SoC dtsi")
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
