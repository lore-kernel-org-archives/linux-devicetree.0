From: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 0/2] dts: arm64: add DPAA 1 support for ARM based SoCs
Date: Mon, 30 Jan 2017 16:43:05 +0200
Message-ID: <1485787387-12410-1-git-send-email-madalin.bucur@nxp.com>
Reply-To: <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: stuart.yoder-3arQi8VN3Tc@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add DPAA 1 nodes for LS1043A/LS1046A and networking support for RDB
and QDS boards with these SoCs.

Madalin Bucur (2):
  dts: arm64: add LS1043A DPAA support
  dts: arm64: add LS1046A DPAA support

 arch/arm64/boot/dts/freescale/fsl-ls1043-post.dtsi |  33 +++++++
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts  |   2 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts  |  75 +++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  73 +++++++++++++-
 arch/arm64/boot/dts/freescale/fsl-ls1046-post.dtsi |  37 +++++++
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts  |   2 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts  |  62 ++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |  66 ++++++++++++-
 .../boot/dts/freescale/qoriq-bman1-portals.dtsi    |  93 ++++++++++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-10g-0.dtsi    |  68 +++++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-10g-1.dtsi    |  68 +++++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-1g-0.dtsi     |  67 +++++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-1g-1.dtsi     |  67 +++++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-1g-2.dtsi     |  67 +++++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-1g-3.dtsi     |  67 +++++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-1g-4.dtsi     |  67 +++++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-1g-5.dtsi     |  67 +++++++++++++
 arch/arm64/boot/dts/freescale/qoriq-fman3-0.dtsi   | 106 +++++++++++++++++++++
 .../boot/dts/freescale/qoriq-qman1-portals.dtsi    | 102 ++++++++++++++++++++
 19 files changed, 1187 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1043-post.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1046-post.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-bman1-portals.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-10g-0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-10g-1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-4.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-5.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-qman1-portals.dtsi

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
