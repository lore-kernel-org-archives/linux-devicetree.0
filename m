From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v4 0/2] Add support for SYSCON reset
Date: Mon, 20 Jun 2016 13:46:05 -0500
Message-ID: <20160620184607.4380-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some SoCs contain reset controls for modules that are memory-mapped to
areas shared with other module configuration settings. This requires
synchronization across all drivers accessing this memory area. This
series adds a generic SYSCON reset driver to allow resets toggled
by bits in memory-mapped registers through SYSCON.

Changes from v3:
 - Add depends on HAS_IOMEM to Kconfig
 - Re-worked naming to be more TI specific for now
 - Changed DT binding to Philipp's suggestion

Changes from v2:
 - Rebased on v4.7-rc1
 - Removed the need to give reset specifier nodes an index address

Changes from v1:
 - Reset control information is now described in the reset node, this
   keeps the reset information centralized for easy verification
 - Other small fixups

Andrew F. Davis (2):
  Documentation: dt: reset: Add TI syscon reset binding
  reset: add TI SYSCON based reset driver

 .../devicetree/bindings/reset/ti-syscon-reset.txt  |  83 +++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-ti-syscon.c                    | 260 +++++++++++++++++++++
 include/dt-bindings/reset/ti-syscon.h              |  30 +++
 5 files changed, 385 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
 create mode 100644 drivers/reset/reset-ti-syscon.c
 create mode 100644 include/dt-bindings/reset/ti-syscon.h

-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
