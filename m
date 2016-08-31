From: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 0/12] arm64: renesas: add H3ULCB board
Date: Wed, 31 Aug 2016 13:01:52 +0300
Message-ID: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This adds the folowing:
- R8A7795 SoC based H3ULCB low cost board device tree
- Document DT bindings

Vladimir Barinov (12):
[01/12] dt: arm: shmobile: add H3ULCB board DT bindings
[02/12] arm64: dts: h3ulcb: initial device tree
[03/12] arm64: dts: h3ulcb: enable SCIF clk and pins
[04/12] arm64: dts: h3ulcb: enable EthernetAVB
[05/12] arm64: dts: h3ulcb: enable GPIO leds
[06/12] arm64: dts: h3ulcb: enable SDHI0
[07/12] arm64: dts: h3ulcb: enable I2C2
[08/12] arm64: dts: h3ulcb: enable EXTALR clk
[09/12] arm64: dts: h3ulcb: enable WDT
[10/12] arm64: dts: h3ulcb: enable USB2 PHY of channel 1
[11/12] arm64: dts: h3ulcb: enable USB2.0 Host channel 1
[12/12] arm64: dts: h3ulcb: Sound SSI support

---
This patchset is against the 'kernel/git/horms/renesas.git' repo.

 arch/arm64/boot/dts/renesas/Makefile               |   2 +-
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     | 316 +++++++++++++++++++++++++
 Documentation/devicetree/bindings/arm/shmobile.txt |   2 ++
 3 files changed, 319 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
