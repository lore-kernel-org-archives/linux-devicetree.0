From: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3 0/4] powerpc/mpc85xx: Add FSL QorIQ DPAA B/QMan support to device tree(s)
Date: Mon, 1 Dec 2014 04:02:11 -0600
Message-ID: <1417428135-12895-1-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: scottwood-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

v3:	Remove no-map
	Adjust alloc-ranges for the 32-/36-bit SoC(s)

v2:	Remove some reserved-memory properties
	Split the patchset per IP block
	Refined patch assignment

Kumar Gala (4):
  powerpc/mpc85xx: Create dts components for the FSL QorIQ DPAA BMan
  powerpc/mpc85xx: Create dts components for the FSL QorIQ DPAA QMan
  powerpc/mpc85xx: Add FSL QorIQ DPAA BMan support to device tree(s)
  powerpc/mpc85xx: Add FSL QorIQ DPAA QMan support to device tree(s)

 arch/powerpc/boot/dts/b4qds.dtsi                   |  35 +-
 arch/powerpc/boot/dts/fsl/b4860si-post.dtsi        | 129 ++++-
 arch/powerpc/boot/dts/fsl/b4si-post.dtsi           | 180 ++++++-
 arch/powerpc/boot/dts/fsl/p1023si-post.dtsi        |  61 ++-
 arch/powerpc/boot/dts/fsl/p2041si-post.dtsi        |   9 +-
 arch/powerpc/boot/dts/fsl/p3041si-post.dtsi        |   9 +-
 arch/powerpc/boot/dts/fsl/p4080si-post.dtsi        |   9 +-
 arch/powerpc/boot/dts/fsl/p5020si-post.dtsi        |   9 +-
 arch/powerpc/boot/dts/fsl/p5040si-post.dtsi        |   9 +-
 arch/powerpc/boot/dts/fsl/qoriq-bman1-portals.dtsi |  90 ++++
 arch/powerpc/boot/dts/fsl/qoriq-bman1.dtsi         |  41 ++
 arch/powerpc/boot/dts/fsl/qoriq-qman1-portals.dtsi | 101 ++++
 arch/powerpc/boot/dts/fsl/qoriq-qman1.dtsi         |  41 ++
 arch/powerpc/boot/dts/fsl/qoriq-qman3.dtsi         |  41 ++
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi        | 128 ++++-
 arch/powerpc/boot/dts/fsl/t2081si-post.dtsi        | 216 +++++++-
 arch/powerpc/boot/dts/fsl/t4240si-post.dtsi        | 568 ++++++++++++++++++++-
 arch/powerpc/boot/dts/kmcoge4.dts                  |  33 ++
 arch/powerpc/boot/dts/oca4080.dts                  |  33 ++
 arch/powerpc/boot/dts/p1023rdb.dts                 |  36 +-
 arch/powerpc/boot/dts/p2041rdb.dts                 |  35 +-
 arch/powerpc/boot/dts/p3041ds.dts                  |  35 +-
 arch/powerpc/boot/dts/p4080ds.dts                  |  35 +-
 arch/powerpc/boot/dts/p5020ds.dts                  |  35 +-
 arch/powerpc/boot/dts/p5040ds.dts                  |  35 +-
 arch/powerpc/boot/dts/t104xqds.dtsi                |  35 +-
 arch/powerpc/boot/dts/t104xrdb.dtsi                |  32 ++
 arch/powerpc/boot/dts/t208xqds.dtsi                |  35 +-
 arch/powerpc/boot/dts/t208xrdb.dtsi                |  33 ++
 arch/powerpc/boot/dts/t4240qds.dts                 |  35 +-
 arch/powerpc/boot/dts/t4240rdb.dts                 |  33 ++
 31 files changed, 2134 insertions(+), 22 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/fsl/qoriq-bman1-portals.dtsi
 create mode 100644 arch/powerpc/boot/dts/fsl/qoriq-bman1.dtsi
 create mode 100644 arch/powerpc/boot/dts/fsl/qoriq-qman1-portals.dtsi
 create mode 100644 arch/powerpc/boot/dts/fsl/qoriq-qman1.dtsi
 create mode 100644 arch/powerpc/boot/dts/fsl/qoriq-qman3.dtsi

-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
