Return-Path: <SRS0=x3SR=JG=verge.net.au=horms@kernel.org>
Date: Wed, 20 Jun 2018 10:54:41 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] arm64: dts: renesas: salvator-common: Add HSCIF1
 device support
Message-ID: <20180620085439.rt4jyiem4hu5er5w@verge.net.au>
References: <20180619171401.19489-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180619171401.19489-1-geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jun 19, 2018 at 07:14:01PM +0200, Geert Uytterhoeven wrote:
> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> 
> This patch adds pin control for HSCIF1, and supports connection with
> Debug Serial-1 (CN26) on Salvator boards.
> 
> SCIF1 and HSCIF1 are sharing the pins connected to Debug Serial-1 (CN26)
> on Salvator boards, and it is necessary to ensure that either SCIF1 or
> HSCIF1 is enabled, not both.
> 
> As for the default of this DeviceTree, SCIF1 is connected.
> 
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [geert: Add missing "uart-has-rtscts"]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Drop RFC state,
>   - Reword.

Thanks Geert,

applied.
