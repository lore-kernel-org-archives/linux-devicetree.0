Return-Path: <SRS0=v2oS=VG=verge.net.au=horms@kernel.org>
Date: Tue, 9 Jul 2019 10:46:11 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add SSIU support for
 sound
Message-ID: <20190709084611.bfgsa7frfntntuwk@verge.net.au>
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1562333979-28516-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562333979-28516-3-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 05, 2019 at 02:39:38PM +0100, Fabrizio Castro wrote:
> Add SSIU support to the SoC DT as the sound driver supports
> it now, and also since the sound driver can now handle
> BUSIF0-7 via SSIU remove the no longer needed "rxu" and "txu"
> properties.
> 
> Based on similar work from Kuninori Morimoto and Simon Horman:
> 8d14bfa074db ("arm64: dts: renesas: r8a7796: add SSIU support for
> sound")
> 10bd03fa896e ("arm64: dts: renesas: r8a7796: remove BUSIF0 settings from
> rcar_sound,ssi")
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
