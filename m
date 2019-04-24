Return-Path: <SRS0=j87X=S2=verge.net.au=horms@kernel.org>
Date: Wed, 24 Apr 2019 11:49:40 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add HDMI audio
Message-ID: <20190424094940.vrsjqwzjbqi4zxdt@verge.net.au>
References: <1556025408-16366-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556025408-16366-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 23, 2019 at 02:16:48PM +0100, Fabrizio Castro wrote:
> The CAT874 board pushes sound via I2S over SSI0 into the
> TDA19988BET chip.
> This commit wires things up so that we can get sound out of
> the HDMI interface.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks Fabrizio,

applied for inclusion in v5.3.
