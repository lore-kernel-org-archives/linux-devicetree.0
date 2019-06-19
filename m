Return-Path: <SRS0=LpfV=US=verge.net.au=horms@kernel.org>
Date: Wed, 19 Jun 2019 16:32:53 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Remove "label" from
 LEDs
Message-ID: <20190619143252.nlolv6rruzbp7qix@verge.net.au>
References: <1560953484-12777-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560953484-12777-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 19, 2019 at 03:11:24PM +0100, Fabrizio Castro wrote:
> Remove "label" properties from the LEDs device tree nodes, since
> we don't have nice labels on the PCB.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks,

I have applied this for inclusion in v5.3.
