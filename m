From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/3] arm64: renesas: Base R-Car D3 support
Date: Thu, 27 Jul 2017 17:12:42 +0200
Message-ID: <20170727151242.GF16143@verge.net.au>
References: <1500553741-21890-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1500553741-21890-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 20, 2017 at 02:28:58PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus, Rob, Mark, Catalin, Will,
> 
> This patch series adds base support for the Renesas R-Car D3 SoC and the
> Renesas Draak development board.
> 
> It documents SoC and board specific DT compatible values, and adds a
> Kconfig symbol.
> 
> Thanks!
> 
> Geert Uytterhoeven (3):
>   ARM: shmobile: Document R-Car D3 SoC DT bindings
>   ARM: shmobile: Document Renesas Draak board DT bindings
>   arm64: renesas: Add Renesas R8A77995 Kconfig support

Thanks, applied for v4.14.
