From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 0/2] Add support for SYSCON reset
Date: Thu, 10 Mar 2016 15:46:03 -0600
Message-ID: <1457646365-1723-1-git-send-email-afd@ti.com>
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

Changes from v1:
 - Reset control information is now described in the reset node, this
   keeps the reset information centralized for easy verification
 - Other small fixups

Andrew F. Davis (2):
  Documentation: dt: reset: Add syscon reset binding
  reset: add a SYSCON based reset driver

 .../devicetree/bindings/reset/syscon-reset.txt     | 114 +++++++++
 drivers/reset/Kconfig                              |  10 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-syscon.c                       | 283 +++++++++++++++++++++
 include/dt-bindings/reset/syscon.h                 |  23 ++
 5 files changed, 431 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/syscon-reset.txt
 create mode 100644 drivers/reset/reset-syscon.c
 create mode 100644 include/dt-bindings/reset/syscon.h

-- 
2.7.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
