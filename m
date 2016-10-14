From: Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/3] ARM: dts: imx6qdl cleanups
Date: Fri, 14 Oct 2016 15:09:27 +0530
Message-ID: <1476437970-15800-1-git-send-email-jteki@openedev.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Patchset for imx6qdl devicetree files cleanups.

Jagan Teki (3):
  arm: dts: imx6qdl: Fix "WARNING: please, no space before tabs"
  arm: dts: imx6qdl: Fix "ERROR: code indent should use tabs where
    possible"
  arm: dts: imx6qdl-wandboard-revb: Fix "ERROR: trailing whitespace"

 arch/arm/boot/dts/imx6qdl-apf6dev.dtsi         | 14 +++++------
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi          |  4 ++--
 arch/arm/boot/dts/imx6qdl-gw53xx.dtsi          |  4 ++--
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi          |  4 ++--
 arch/arm/boot/dts/imx6qdl-gw552x.dtsi          |  2 +-
 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi   |  6 ++---
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi       |  2 +-
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi         |  4 ++--
 arch/arm/boot/dts/imx6qdl-tx6.dtsi             | 32 +++++++++++++-------------
 arch/arm/boot/dts/imx6qdl-wandboard-revb1.dtsi |  2 +-
 arch/arm/boot/dts/imx6qdl-wandboard.dtsi       |  4 ++--
 arch/arm/boot/dts/imx6qdl.dtsi                 |  6 ++---
 12 files changed, 42 insertions(+), 42 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
