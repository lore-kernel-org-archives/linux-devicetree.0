From: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 0/2] arm64: dts: ls1043a: add the DTS node for QSPI support
Date: Wed, 13 Apr 2016 18:08:25 +0800
Message-ID: <1460542107-45807-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>

Yuan Yao (2):
  Documentation: fsl-quadspi: Add fsl, ls1043a-qspi compatible string
	Changed in v2: Remove unused property.
  arm64: dts: ls1043a: add the DTS node for QSPI support

 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt |  3 ++-
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts     | 13 +++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi        | 14 ++++++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
