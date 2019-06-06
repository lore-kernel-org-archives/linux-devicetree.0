Return-Path: <SRS0=Sfu6=UF=verge.net.au=horms@kernel.org>
Date: Thu, 6 Jun 2019 11:00:52 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774a1: Add operating points
Message-ID: <20190606090052.zz64s5xtuolh5v3w@verge.net.au>
References: <1559318333-27306-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559318333-27306-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, May 31, 2019 at 04:58:53PM +0100, Fabrizio Castro wrote:
> The RZ/G2M (a.k.a. r8a774a1) comes with two clusters of
> processors, similarly to the r8a7796.
> The first cluster is made of A57s, the second cluster is
> made of A53s.
> 
> The operating points for the cluster with the A57s are:
> 
>  Frequency | Voltage
> -----------|---------
>  500 MHz   | 0.82V
>  1.0 GHz   | 0.82V
>  1.5 GHz   | 0.82V
> 
> The operating points for the cluster with the A53s are:
> 
>  Frequency | Voltage
> -----------|---------
>  800 MHz   | 0.82V
>  1.0 GHz   | 0.82V
>  1.2 GHz   | 0.82V
> 
> This patch adds the definitions for the operating points
> to the SoC specific DT.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Thanks, applied for inclusion in v5.3.
