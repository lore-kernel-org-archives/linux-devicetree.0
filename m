From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 00/12] etnaviv DRM driver
Date: Fri,  4 Dec 2015 14:59:52 +0100
Message-ID: <1449237604-19064-1-git-send-email-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

this is the latest round of etnaviv DRM driver patches. Since RFCv2
we made some substantial changes and improvements. I'm confident
that the driver is in a state where it can go in now, so I removed
the RFC tag.

Most notable issues fixed:
- better input validation for all the ioctls in place
- basic command stream parsing and rejection of sensitive state loads
  has been implemented by Russell
- cross GPU synchronization fixed by Russell, so the GPUs cores don't
  trip over their feet when using 2D GPU for X.Xorg accel, while
  doing OpenGL rendering on the 3D core
- removed usage of deprecated DRM features, like driver load and
  unload callbacks, DRM_UNLOCKED
- reworked locking design to drop DRM struct_mutex usage in driver,
  switch to more fine grained locking, allowing for a lot more
  concurrency
- moved driver out of initial staging directory into proper
  DRM directory

As the original patchstack is now over 190 patches, some of which
totally rework some aspects of the driver, we've opted to not submit
it this way. Instead all the driver patches are squashed and reorganized
to add individual, logical groups of files. This should make review a
lot easier. As the driver is a collaborative effort of Christian Gmeiner,
Russell King and myself all of those patches have a fictive author, but
our signoff. Only the last commit of those wires the driver up in Kconfig
and Makefiles, so there should be no intermediate breakage.

First 2 patches need an Ack from the DT maintainers. The last patch adds
the necessary DT integration for i.MX6 and should either get an Ack from
Shawn to merge along with the DRM changes, or he could pick it up as an
individual patch, whatever suits better.

After everyone is happy with the driver and if that's preferred I can
also provide a proper pull request.

Happy reviewing!

Lucas

Lucas Stach (3):
  drm/etnaviv: add devicetree bindings
  MAINTAINERS: add Lucas Stach as maintainer for the etnaviv DRM driver
  ARM: dts: imx6: add Vivante GPU nodes

Philipp Zabel (1):
  devicetree: add vendor prefix for Vivante Corporation

The etnaviv authors (8):
  drm/etnaviv: add etnaviv UAPI header
  drm/etnaviv: add generated hardware description headers
  drm/etnaviv: add GPU core driver
  drm/etnaviv: add GEM core functionality
  drm/etnaviv: add GEM submit and cmdstream validation bits
  drm/etnaviv: add GPU MMU handling functionality
  drm/etnaviv: add GPU core dump functionality
  drm/etnaviv: add master driver and hook up in Kconfig and Makefile

 .../bindings/display/etnaviv/etnaviv-drm.txt       |   46 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 MAINTAINERS                                        |    7 +
 arch/arm/boot/dts/imx6dl.dtsi                      |    5 +
 arch/arm/boot/dts/imx6q.dtsi                       |   15 +
 arch/arm/boot/dts/imx6qdl.dtsi                     |   22 +
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/etnaviv/Kconfig                    |   20 +
 drivers/gpu/drm/etnaviv/Makefile                   |   14 +
 drivers/gpu/drm/etnaviv/cmdstream.xml.h            |  218 +++
 drivers/gpu/drm/etnaviv/common.xml.h               |  249 +++
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c           |  268 ++++
 drivers/gpu/drm/etnaviv/etnaviv_cmd_parser.c       |  209 +++
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |  707 +++++++++
 drivers/gpu/drm/etnaviv/etnaviv_drv.h              |  161 ++
 drivers/gpu/drm/etnaviv/etnaviv_dump.c             |  227 +++
 drivers/gpu/drm/etnaviv/etnaviv_dump.h             |   54 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |  897 +++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gem.h              |  117 ++
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |  122 ++
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |  438 ++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              | 1644 ++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h              |  209 +++
 drivers/gpu/drm/etnaviv/etnaviv_iommu.c            |  240 +++
 drivers/gpu/drm/etnaviv/etnaviv_iommu.h            |   28 +
 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c         |   33 +
 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.h         |   25 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c              |  299 ++++
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h              |   71 +
 drivers/gpu/drm/etnaviv/state.xml.h                |  351 +++++
 drivers/gpu/drm/etnaviv/state_hi.xml.h             |  407 +++++
 include/uapi/drm/etnaviv_drm.h                     |  221 +++
 33 files changed, 7328 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
 create mode 100644 drivers/gpu/drm/etnaviv/Kconfig
 create mode 100644 drivers/gpu/drm/etnaviv/Makefile
 create mode 100644 drivers/gpu/drm/etnaviv/cmdstream.xml.h
 create mode 100644 drivers/gpu/drm/etnaviv/common.xml.h
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_buffer.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_cmd_parser.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_drv.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_drv.h
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_dump.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_dump.h
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_gem.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_gem.h
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_gpu.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_gpu.h
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_iommu.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_iommu.h
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.h
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_mmu.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_mmu.h
 create mode 100644 drivers/gpu/drm/etnaviv/state.xml.h
 create mode 100644 drivers/gpu/drm/etnaviv/state_hi.xml.h
 create mode 100644 include/uapi/drm/etnaviv_drm.h

-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
