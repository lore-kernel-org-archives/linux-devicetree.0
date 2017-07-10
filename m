From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/5] arm64: dts: renesas: ulcb: Enable HDMI
Date: Mon, 10 Jul 2017 11:21:17 +0200
Message-ID: <20170710092117.GO13680@verge.net.au>
References: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 07, 2017 at 05:36:16AM +0300, Vladimir Barinov wrote:
> Hello,
> 
> This patch series enables HDMI support for the H3 and M3-W based ULCB boards
> 
> This has the following dependency:
> - [PATCH v2 series] R-Car Salvator-X M3-W: Enable DU support
> - [PATCH] arm64: dts: renesas: ulcb: Enable I2C4
> - [PATCH] clk: vc5: Add support for IDT VersaClock 5P49V5925

I am holding off on applying these pending the first dependency above.

> 
> Vladimir Barinov (5):
> [1/5] arm64: dts: renesas: ulcb: Add DU external dot clock sources
> [2/5] arm64: dts: renesas: r8a7795-h3ulcb: Add DU external dot clocks
> [3/5] arm64: dts: renesas: r8a7796-m3ulcb: Add DU external dot clocks
> [4/5] arm64: dts: renesas: ulcb: Add HDMI output connector
> [5/5] arm64: dts: renesas: ulcb: Enable HDMI output
> 
> ---
> This patchset is against the 'kernel/git/horms/renesas.git' repo.
> 
>  r8a7795-h3ulcb.dts |   14 ++++++++++++++
>  r8a7796-m3ulcb.dts |   12 ++++++++++++
>  ulcb.dtsi          |   42 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 68 insertions(+)
> 
