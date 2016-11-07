From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 0/9] arm64: renesas: add M3ULCB board
Date: Mon, 7 Nov 2016 14:35:51 +0100
Message-ID: <20161107133551.GD29721@verge.net.au>
References: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1478196375-1131-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 03, 2016 at 09:06:15PM +0300, Vladimir Barinov wrote:
> Hello,
> 
> This adds the folowing:
> - R8A7796 SoC based M3ULCB (R-Car Starter Kit Pro) device tree
> - Document DT bindings
> 
> Vladimir Barinov (9):
> [1/9] dt: arm: shmobile: add M3ULCB board DT bindings

I took the liberty of changing the subject of the above patch to:

arm64: dts: m3ulcb: add M3ULCB board DT bindings

> [2/9] arm64: dts: m3ulcb: initial device tree
> [3/9] arm64: dts: m3ulcb: enable SCIF clk and pins
> [4/9] arm64: dts: m3ulcb: enable GPIO leds
> [5/9] arm64: dts: m3ulcb: enable GPIO keys
> [6/9] arm64: dts: m3ulcb: enable SDHI0
> [7/9] arm64: dts: m3ulcb: enable EXTALR clk
> [8/9] arm64: dts: m3ulcb: enable WDT
> [9/9] arm64: dts: m3ulcb: enable SDHI2

I have queued up patches 1-5,7,8.
Please repost the SDHI patches when you are ready.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
