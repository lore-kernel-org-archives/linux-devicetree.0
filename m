From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/5] arm64: dts: renesas: ulcb: Enable HDMI
Date: Mon, 10 Jul 2017 16:09:52 +0300
Message-ID: <1836107.QXaVz3MGJb@avalon>
References: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

H Vladimir,

On Friday 07 Jul 2017 05:36:16 Vladimir Barinov wrote:
> Hello,
> 
> This patch series enables HDMI support for the H3 and M3-W based ULCB boards
> 
> This has the following dependency:
> - [PATCH v2 series] R-Car Salvator-X M3-W: Enable DU support
> - [PATCH] arm64: dts: renesas: ulcb: Enable I2C4
> - [PATCH] clk: vc5: Add support for IDT VersaClock 5P49V5925
> 
> Vladimir Barinov (5):
> [1/5] arm64: dts: renesas: ulcb: Add DU external dot clock sources
> [2/5] arm64: dts: renesas: r8a7795-h3ulcb: Add DU external dot clocks
> [3/5] arm64: dts: renesas: r8a7796-m3ulcb: Add DU external dot clocks
> [4/5] arm64: dts: renesas: ulcb: Add HDMI output connector
> [5/5] arm64: dts: renesas: ulcb: Enable HDMI output

Thank you for the patches.

For patches 1/5, 2/5, 3/5 and 5/5,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Please see patch 4/5 for a small comment.

> ---
> This patchset is against the 'kernel/git/horms/renesas.git' repo.
> 
>  r8a7795-h3ulcb.dts |   14 ++++++++++++++
>  r8a7796-m3ulcb.dts |   12 ++++++++++++
>  ulcb.dtsi          |   42 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 68 insertions(+)

-- 
Regards,

Laurent Pinchart
