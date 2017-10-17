From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 3/4] ARM: dts: iwg22d-sodimm-dbhd-ca: Add device tree for
 HDMI DB
Date: Tue, 17 Oct 2017 10:02:20 +0200
Message-ID: <20171017080220.ff5brg2jh4womfj2@verge.net.au>
References: <1507899796-7941-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1507899796-7941-4-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507899796-7941-4-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 13, 2017 at 02:03:15PM +0100, Fabrizio Castro wrote:
> Add file r8a7745-iwg22d-sodimm-dbhd-ca.dts to provide support for
> iW-RainboW-G22D with HDMI daughter board plugged in.
> 
> The interfaces defined in the new .dts file are: scif1, scif5,
> and hscif2.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

I wonder if this patch should include a chosen node.
