From: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/18] arm64: renesas: add ULCB Kingfisher board
Date: Thu,  7 Sep 2017 01:34:27 +0300
Message-ID: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This adds the folowing:
- ULCB Kingfisher infotainment board device tree
- Document DT bindings

Vladimir Barinov (18):
[01/18] dt: arm: shmobile: add M3ULCB Kingfisher board DT
[02/18] dt: arm: shmobile: add H3ULCB Kingfisher board DT
[03/18] arm64: dts: ulcb-kf: initial device tree
[04/18] arm64: dts: m3ulcb-kf: initial device tree
[05/18] arm64: dts: h3ulcb-kf: ES1.x SoC initial device tree
[06/18] arm64: dts: h3ulcb-kf: ES2.0+ SoC initial device tree
[07/18] arm64: dts: ulcb-kf: enable SCIF1
[08/18] arm64: dts: ulcb-kf: enable CAN0/1
[09/18] arm64: dts: ulcb-kf: enable USB2 PHY of channel 0
[10/18] arm64: dts: ulcb-kf: enable HSUSB
[11/18] arm64: dts: ulcb-kf: enable USB2.0 Host channel 0
[12/18] arm64: dts: ulcb-kf: enable PCIE0/1
[13/18] arm64: dts: ulcb-kf: enable USB3.0 Host
[14/18] arm64: dts: ulcb-kf: enable PCA9539 on I2C2
[15/18] arm64: dts: ulcb-kf: enable PCA9539 on I2C4
[16/18] arm64: dts: ulcb-kf: enable PCA9548 on I2C2
[17/18] arm64: dts: ulcb-kf: enable PCA9548 on I2C4
[18/18] arm64: dts: ulcb-kf: hog USB3 hub control gpios

---
This patchset is against the 'kernel/git/horms/renesas.git' repo.

 Documentation/devicetree/bindings/arm/shmobile.txt    |    2 
 arch/arm64/boot/dts/renesas/Makefile                  |    3 
 arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts |   17 +
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts     |   17 +
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts     |   17 +
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi              |  185 ++++++++++++++++++
 6 files changed, 241 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf.dts

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
