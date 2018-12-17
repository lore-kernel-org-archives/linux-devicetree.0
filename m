Return-Path: <SRS0=NQmY=O2=verge.net.au=horms@kernel.org>
Date: Mon, 17 Dec 2018 12:03:24 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 13/17] arm64: dts: renesas: r8a774c0: Connect RZ/G2E
 SYS-DMAC to IPMMU
Message-ID: <20181217110324.mzkdctwnngjolcgg@verge.net.au>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-14-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544780260-27590-14-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Dec 14, 2018 at 09:37:36AM +0000, Fabrizio Castro wrote:
> Hook up SYS-DMAC0, SYS-DMAC1, and SYS-DMAC2 to IPMMU-DS0 and
> IPMMU-DS1, according to what reported by the RZ/G2 User's manual.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
