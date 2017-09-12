From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 00/11] Add R8A77970/Eagle board support
Date: Tue, 12 Sep 2017 23:37:16 +0300
Message-ID: <20170912203716.238067587@cogentembedded.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 11 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20170911v2-v4.13' tag. I'm adding the device tree support for
the R8A77970-based Eagle board. The necessary SYS-DMAC, [H]SCIF, and EtherAVB
bindings updates have been posted earlier.

[01/11] soc: renesas: identify R-Car V3M
[02/11] soc: renesas: rcar-rst: add R8A77970 support
[03/11] dt-bindings: power: add R8A77970 SYSC power domain definitions
[04/11] soc: renesas: rcar-sysc: add R8A77970 support
[05/11] arm64: dts: renesas: initial R8A77970 SoC device tree
[06/11] arm64: dts: renesas: r8a77970: add SYS-DMAC support
[07/11] arm64: dts: renesas: r8a77970: add [H]SCIF support
[08/11] arm64: dts: renesas: r8a77970: add EtherAVB support
[09/11] arm64: renesas: document Eagle board
[11/11] arm64: dts: renesas: initial Eagle board device tree
[11/11] arm64: dts: renesas: eagle: add EtherAVB support

WBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
