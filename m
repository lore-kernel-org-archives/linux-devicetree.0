Return-Path: <SRS0=wIoc=OO=verge.net.au=horms@kernel.org>
Date: Wed, 5 Dec 2018 11:53:55 -0800
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 2/5] ARM: dts: r8a7744-iwg20m: Add SPI NOR support
Message-ID: <20181205195355.nb6dticyzvr3kv3w@verge.net.au>
References: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
 <1544000815-28069-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544000815-28069-3-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Dec 05, 2018 at 09:06:52AM +0000, Biju Das wrote:
> Add support for the SPI NOR device used to boot up the system
> to the iWave RZ/G1N Qseven System On Module DT.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V1-->V2
>      * Removed compatible string "sst,sst25vf016b".

Thanks, applied for v4.21.
