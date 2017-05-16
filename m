From: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 0/3] arm64: dts: introduce QorIQ DPAA 1.x FMan device tree nodes
Date: Tue, 16 May 2017 15:07:20 +0300
Message-ID: <1494936443-14869-1-git-send-email-madalin.bucur@nxp.com>
Reply-To: <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set introduces the QorIQ Data Path Acceleration Arhitecture
(DPAA) Frame Manager device tree nodes for the ARM based DPAA 1.x platforms.

Madalin Bucur (3):
  arm64: dts: add DPAA FMan nodes
  arm64: dts: add LS1043A DPAA FMan support
  arm64: dts: add LS1046A DPAA FMan nodes

 arch/arm64/boot/dts/freescale/fsl-ls1043-post.dtsi | 45 ++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts  |  2 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts  | 73 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     | 13 +++-
 arch/arm64/boot/dts/freescale/fsl-ls1046-post.dtsi | 48 +++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts  |  2 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts  | 60 ++++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     | 11 ++-
 .../boot/dts/freescale/qoriq-fman3-0-10g-0.dtsi    | 42 +++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-10g-1.dtsi    | 42 +++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-1g-0.dtsi     | 41 +++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-1g-1.dtsi     | 41 +++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-1g-2.dtsi     | 41 +++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-1g-3.dtsi     | 41 +++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-1g-4.dtsi     | 41 +++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-1g-5.dtsi     | 41 +++++++++++
 arch/arm64/boot/dts/freescale/qoriq-fman3-0.dtsi   | 81 ++++++++++++++++++++++
 17 files changed, 663 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1043-post.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1046-post.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-10g-0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-10g-1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-4.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-5.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-fman3-0.dtsi

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
