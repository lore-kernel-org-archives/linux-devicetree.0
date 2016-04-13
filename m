From: Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 0/2 v2] fsl-mc binding and device tree updates
Date: Wed, 13 Apr 2016 16:05:10 -0500
Message-ID: <1460581510-32056-1-git-send-email-stuart.yoder@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: leoyang.li-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, german.rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds a few missing things from the binding
for the fsl-mc node on the ls2080a Soc-- msi-parent, ranges,
dpmac definition.  The ls2080a device tree is updated to
reflect the binding updates.

-v2
   -added ack to binding patch
   -updated whitespace and comment in dts patch

Stuart Yoder (2):
  Documentation: fsl-mc: binding updates for MSIs, ranges, PHYs
  arm64: dts: ls2080a: fsl-mc dt node updates

 .../devicetree/bindings/misc/fsl,qoriq-mc.txt      | 81 +++++++++++++++++-
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     | 98 ++++++++++++++++++++++
 2 files changed, 178 insertions(+), 1 deletion(-)

-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
