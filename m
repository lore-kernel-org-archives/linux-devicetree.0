From: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 0/4][v4] dt-bindings: mtd-physmap: Add endianness supports
Date: Thu, 15 Feb 2018 17:18:03 +0530
Message-ID: <20180215114803.23570-1-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Connection between flash and controller is not necessary to be always
of same type. It may varies from platform to platform.

Adding endianness (optional) property to provide connection type
information. This endianness property is checked in physmap_of_core.c
to decide swap type. 

This patch also set "big-endian" property for ls1021a, ls1043a
and ls1046a device tree. here connection between IFC controller
and NOR flash is big-endian.

Prabhakar Kushwaha (4):
  dt-bindings: mtd-physmap: Add endianness supports
  driver: mtd: update struct map_info's swap as per map requirement
  ARM: dts: Add NOR connection type with IFC
  ARM64: dts: Add NOR connection type with IFC

 Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 5 +++++
 arch/arm/boot/dts/ls1021a-qds.dts                     | 1 +
 arch/arm/boot/dts/ls1021a-twr.dts                     | 1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts     | 1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts     | 1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts     | 1 +
 drivers/mtd/maps/physmap_of_core.c                    | 8 ++++++++
 7 files changed, 18 insertions(+)

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
