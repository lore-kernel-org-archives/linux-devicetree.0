Return-Path: <SRS0=v2oS=VG=verge.net.au=horms@kernel.org>
Date: Tue, 9 Jul 2019 10:46:02 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a774a1: Use extended audio
 dmac register
Message-ID: <20190709084602.7mgfh6z7tjpuvcba@verge.net.au>
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1562333979-28516-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562333979-28516-2-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 05, 2019 at 02:39:37PM +0100, Fabrizio Castro wrote:
> Basic audio dmac register only supports busif from 0 to 3,
> in order to use busif4 ~ busif7 extended audio dmac registers
> need to be used.
> 
> Based on similar work from Jiada Wang:
> 7a516e49d975 ("arm64: dts: renesas: use extended audio dmac register")
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
