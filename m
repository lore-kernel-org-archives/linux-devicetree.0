From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/8] Add Renesas R8A77970/Eagle board support
Date: Fri, 15 Sep 2017 22:43:18 +0300
Message-ID: <20170915193718.359780292__5839.07107725299$1505504663$gmane$org@cogentembedded.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

   Here's the set of 8 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20170915-v4.13' tag. I'm adding the device tree support for
the R8A77970-based Eagle board. Already merged patches will not be reposted.
The necessary SYS-DMAC, [H]SCIF, and EtherAVB bindings updates have been
posted earlier.

[1/8] soc: renesas: rcar-sysc: add R8A77970 support
[2/8] arm64: dts: renesas: initial R8A77970 SoC device tree
[3/8] arm64: dts: renesas: r8a77970: add SYS-DMAC support
[4/8] arm64: dts: renesas: r8a77970: add [H]SCIF support
[5/8] arm64: dts: renesas: r8a77970: add EtherAVB support
[6/8] arm64: renesas: document Eagle board bindings
[7/8] arm64: dts: renesas: initial Eagle board device tree
[8/8] arm64: dts: renesas: eagle: add EtherAVB support

WBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
