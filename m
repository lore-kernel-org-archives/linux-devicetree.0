From: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v6 0/2] dts/ls2080a: update the DTS for QSPI and DSPI support
Date: Wed, 9 Mar 2016 18:22:04 +0800
Message-ID: <1457518926-18518-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, han.xu-3arQi8VN3Tc@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>

Both of the patches are already send out to l2-mtd as a part of the set
for add QSPI support on Freescale new SOC before.

But those two patch should not be merged into l2-mtd, so I have to resend them.

Yuan Yao (2):
  dts/ls2080a: update the DTS for QSPI and DSPI support
  Documentation: fsl: dspi: Add fsl,ls2080a-dspi compatible string

 Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt | 5 ++++-
 arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts      | 9 ++++++++-
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi         | 4 ++--
 3 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
