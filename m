From: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
Subject: [RFC PATCH 0/5] soc/fsl/qbman: Rework private memory allocations
Date: Wed, 29 Mar 2017 17:13:52 -0400
Message-ID: <1490822037-6752-1-git-send-email-roy.pledge@nxp.com>
Reply-To: <roy.pledge-3arQi8VN3Tc@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robin.murphy-5wv7dgnIgG8@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: madalin.bucur-3arQi8VN3Tc@public.gmane.org, Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The QBMan device requires three separate memory areas that are only
accessed by the device. These areas are reserved using the OF reserved
memory mechanism and associated to the device in the device trees
memory-region attribute. However in order to be allocatable using
the dma_alloc() APIs the reservations compatiable string must
include "shared-dma-pool" and specify "no-map".

This set of changes updates the QBMan driver, PPC device trees and
bindings to use the above mechasism. This work was encouraged as part
of preparing this driver to work on ARM processors.

Roy Pledge (5):
  soc/fsl/qbman: Use shared-dma-pool for BMan private memory allocations
  soc/fsl/qbman: Use shared-dma-pool for QMan private memory allocations
  dts: arch/powerpc: Update Freescale DTS for QBMan memory allocations
  dt-bindings: soc/fsl: Update reserved memory binding for QBMan
  powerpc: Add HAVE_GENERIC_DMA_COHERENT options to Kconfig

 Documentation/devicetree/bindings/soc/fsl/bman.txt |  10 +-
 Documentation/devicetree/bindings/soc/fsl/qman.txt |  16 +--
 arch/powerpc/Kconfig                               |   1 +
 arch/powerpc/boot/dts/fsl/b4qds.dtsi               |   6 ++
 arch/powerpc/boot/dts/fsl/b4si-post.dtsi           |  15 ---
 arch/powerpc/boot/dts/fsl/cyrus_p5020.dts          |   6 ++
 arch/powerpc/boot/dts/fsl/kmcent2.dts              |   6 ++
 arch/powerpc/boot/dts/fsl/kmcoge4.dts              |   6 ++
 arch/powerpc/boot/dts/fsl/oca4080.dts              |   6 ++
 arch/powerpc/boot/dts/fsl/p1023rdb.dts             |   6 ++
 arch/powerpc/boot/dts/fsl/p1023si-post.dtsi        |  15 ---
 arch/powerpc/boot/dts/fsl/p2041rdb.dts             |   6 ++
 arch/powerpc/boot/dts/fsl/p2041si-post.dtsi        |  15 ---
 arch/powerpc/boot/dts/fsl/p3041ds.dts              |   6 ++
 arch/powerpc/boot/dts/fsl/p3041si-post.dtsi        |  15 ---
 arch/powerpc/boot/dts/fsl/p4080ds.dts              |   6 ++
 arch/powerpc/boot/dts/fsl/p4080si-post.dtsi        |  15 ---
 arch/powerpc/boot/dts/fsl/p5020ds.dts              |   6 ++
 arch/powerpc/boot/dts/fsl/p5020si-post.dtsi        |  15 ---
 arch/powerpc/boot/dts/fsl/p5040ds.dts              |   6 ++
 arch/powerpc/boot/dts/fsl/p5040si-post.dtsi        |  15 ---
 arch/powerpc/boot/dts/fsl/t1023rdb.dts             |   6 ++
 arch/powerpc/boot/dts/fsl/t1023si-post.dtsi        |  15 ---
 arch/powerpc/boot/dts/fsl/t1024qds.dts             |   6 ++
 arch/powerpc/boot/dts/fsl/t1024rdb.dts             |   6 ++
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi        |  15 ---
 arch/powerpc/boot/dts/fsl/t104xd4rdb.dtsi          |   6 ++
 arch/powerpc/boot/dts/fsl/t104xqds.dtsi            |   6 ++
 arch/powerpc/boot/dts/fsl/t104xrdb.dtsi            |   6 ++
 arch/powerpc/boot/dts/fsl/t2081si-post.dtsi        |  15 ---
 arch/powerpc/boot/dts/fsl/t208xqds.dtsi            |   6 ++
 arch/powerpc/boot/dts/fsl/t208xrdb.dtsi            |   6 ++
 arch/powerpc/boot/dts/fsl/t4240qds.dts             |   6 ++
 arch/powerpc/boot/dts/fsl/t4240rdb.dts             |   6 ++
 arch/powerpc/boot/dts/fsl/t4240si-post.dtsi        |  15 ---
 drivers/soc/fsl/qbman/bman_ccsr.c                  |  27 ++++-
 drivers/soc/fsl/qbman/bman_priv.h                  |   3 +
 drivers/soc/fsl/qbman/qman_ccsr.c                  | 119 ++++++++++++---------
 drivers/soc/fsl/qbman/qman_priv.h                  |   4 +-
 drivers/soc/fsl/qbman/qman_test.h                  |   2 -
 40 files changed, 238 insertions(+), 235 deletions(-)

--
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
