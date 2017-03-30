From: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 0/3] introduce QorIQ DPAA 1.x QBMan device tree nodes
Date: Thu, 30 Mar 2017 17:37:49 +0300
Message-ID: <1490884672-18294-1-git-send-email-madalin.bucur@nxp.com>
Reply-To: <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Gang.Liu-3arQi8VN3Tc@public.gmane.org, Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set introduces the QorIQ Data Path Acceleration Arhitecture
(DPAA) Queue Manager and Buffer Manager device tree nodes for the ARM
based DPAA 1.x platforms.

Madalin Bucur (3):
  dts: arm64: add DPAA QBMan portals
  dts: arm64: add LS1043A DPAA QBMan nodes
  dts: arm64: add LS1046A DPAA QBMan nodes

 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     | 52 +++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     | 52 +++++++++++++++
 .../boot/dts/freescale/qoriq-bman1-portals.dtsi    | 67 +++++++++++++++++++
 .../boot/dts/freescale/qoriq-qman1-portals.dtsi    | 76 ++++++++++++++++++++++
 4 files changed, 247 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-bman1-portals.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-qman1-portals.dtsi

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
