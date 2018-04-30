Return-Path: <SRS0=9tjN=HT=verge.net.au=horms@kernel.org>
Date: Mon, 30 Apr 2018 10:00:05 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH  2/2] ARM: dts: iwg23s-sbc: Add EtherAVB support
Message-ID: <20180430080005.pisthehpcwgeuceo@verge.net.au>
References: <1524584253-52936-1-git-send-email-biju.das@bp.renesas.com>
 <1524584253-52936-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524584253-52936-3-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 24, 2018 at 04:37:33PM +0100, Biju Das wrote:
> Define the iW-RainboW-G23S board dependent part of the
> EtherAVB device node.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Thanks, applied.

> ---
> * currently u-boot sets the AVB pin configuration.

Understood, I assume at some point the pins will be described in DT.
