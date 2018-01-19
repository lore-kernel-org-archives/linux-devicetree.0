From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/5] Add R8A77970/V3MSK LVDS/HDMI support
Date: Fri, 19 Jan 2018 22:42:33 +0300
Message-ID: <20180119194233.615400015@cogentembedded.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello!

Here's the set of 5 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180119-v4.15-rc8' tag. We're adding the R8A77970 FCPVD/VSPD/
DU/LVDS device nodes and then describing the HDMI encoder connected to the LVDS
output (we're omitting the LVDS decoder for now). These patches depend on
the recent R8A77970 DU/LVDS and  on the R8A77970 PFC driver in order to work,
and R8A77970 PFC DT patches support patch in order to apply/compile/...

[1/5] arm64: dts: renesas: r8a77970: add FCPVD support
[2/5] arm64: dts: renesas: r8a77970: add VSPD support
[3/5] arm64: dts: renesas: r8a77970: add DU support
[4/5] arm64: dts: renesas: r8a77970: add LVDS support
[5/5] arm64: dts: renesas: v3msk: add DU/LVDS/HDMI support

WBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
