Return-Path: <SRS0=wIoc=OO=verge.net.au=horms@kernel.org>
Date: Wed, 5 Dec 2018 11:53:44 -0800
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 1/5] ARM: dts: iwg20d-q7-common: Move cmt/rwdt node
 out of RZ/G1M SOM
Message-ID: <20181205195344.yz6sj53ulddp3tpp@verge.net.au>
References: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
 <1544000815-28069-2-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544000815-28069-2-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Dec 05, 2018 at 09:06:51AM +0000, Biju Das wrote:
> The iWave RZ/G1N board is almost identical to RZ/G1M. cmt and rwdt modules
> are SoC specific and should be part of board dts rather than SoM dtsi. By
> moving these nodes to the common dtsi it allows cmt and rwdt to be enabled
> on both of these boards with less lines of code.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have this in my tree for v4.21.
