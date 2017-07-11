From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 0/5] arm64: dts: renesas: ulcb: Enable HDMI
Date: Tue, 11 Jul 2017 11:04:23 +0200
Message-ID: <20170711090423.GG4517@verge.net.au>
References: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1499394976-14201-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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
> 
> Vladimir Barinov (5):
> [1/5] arm64: dts: renesas: ulcb: Add DU external dot clock sources
> [2/5] arm64: dts: renesas: r8a7795-h3ulcb: Add DU external dot clocks
> [3/5] arm64: dts: renesas: r8a7796-m3ulcb: Add DU external dot clocks
> [4/5] arm64: dts: renesas: ulcb: Add HDMI output connector
> [5/5] arm64: dts: renesas: ulcb: Enable HDMI output

Thanks, I have applied v2 or 4/5 along with the remaining patches above for
v4.14.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
