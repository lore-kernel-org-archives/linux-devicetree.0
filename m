Return-Path: <SRS0=euvp=MH=verge.net.au=horms@kernel.org>
Date: Tue, 25 Sep 2018 09:34:44 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: iwg20d-q7-common: Move pciec node out of
 common dtsi
Message-ID: <20180925073444.llppei4jbxdcrqfu@verge.net.au>
References: <1537538875-62836-1-git-send-email-biju.das@bp.renesas.com>
 <20180924083850.dtxnkxttjg24757g@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180924083850.dtxnkxttjg24757g@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Sep 24, 2018 at 10:38:51AM +0200, Simon Horman wrote:
> On Fri, Sep 21, 2018 at 03:07:55PM +0100, Biju Das wrote:
> > PCIe is not populated by default on iWave RZ/G1N board. RZ/G1N board
> > is almost identical to RZ/G1M. In order to reuse the common dtsi for
> > both the boards, it is required to move pcie node from common dtsi
> > to board specific dts.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Thanks again, applied for v4.20.
