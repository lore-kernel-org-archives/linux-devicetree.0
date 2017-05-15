From: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v2 0/3] arm64: dts: introduce QorIQ DPAA 1.x QBMan device tree nodes
Date: Mon, 15 May 2017 12:21:15 +0300
Message-ID: <1494840078-22243-1-git-send-email-madalin.bucur@nxp.com>
Reply-To: <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set introduces the QorIQ Data Path Acceleration Arhitecture
(DPAA) Queue Manager and Buffer Manager device tree nodes for the ARM
based DPAA 1.x platforms.

Changes since v1 - addressed feedback received from Shawn Guo:
 - renamed portal dtsi files
 - added required newlines
 - removed typos

Madalin Bucur (3):
  arm64: dts: add DPAA QBMan portals
  arm64: dts: add LS1043A DPAA QBMan nodes
  arm64: dts: add LS1046A DPAA QBMan nodes

 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     | 53 ++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     | 54 +++++++++++++++
 .../boot/dts/freescale/qoriq-bman-portals.dtsi     | 71 +++++++++++++++++++
 .../boot/dts/freescale/qoriq-qman-portals.dtsi     | 80 ++++++++++++++++++++++
 4 files changed, 258 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-bman-portals.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/qoriq-qman-portals.dtsi

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
