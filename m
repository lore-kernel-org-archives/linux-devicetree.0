Return-Path: <SRS0=j87X=S2=verge.net.au=horms@kernel.org>
Date: Wed, 24 Apr 2019 11:46:16 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add HDMI video
 suport
Message-ID: <20190424094616.5e7d5u4t2h6pxcdb@verge.net.au>
References: <1555403977-7188-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1555403977-7188-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 16, 2019 at 09:39:37AM +0100, Fabrizio Castro wrote:
> The CAT874 board comes with a HDMI connector, managed by
> a TDA19988BET chip, connected to the RZ/G2E SoC via DPAD.
> This patch adds the necessary support to the board DT.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks Fabrizio,

applied for inclusion in v5.3 with the spelling of support corrected.
