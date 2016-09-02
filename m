From: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 0/4] arm64: renesas: enable H3ULCB board peripherals
Date: Fri,  2 Sep 2016 19:23:39 +0300
Message-ID: <1472833419-26139-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This adds the folowing:
- R8A7795 SoC based H3ULCB board peripherals

Vladimir Barinov (4):
[1/4] arm64: dts: h3ulcb: enable GPIO leds
[2/4] arm64: dts: h3ulcb: enable GPIO keys
[3/4] arm64: dts: h3ulcb: enable SDHI0
[4/4] arm64: dts: h3ulcb: Sound SSI support

---
This patchset is against the 'kernel/git/horms/renesas.git' repo.

 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     | 189 +++++++++++++++++++++++++
 1 file changed, 189 insertions(+)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
