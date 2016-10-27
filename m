From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 0/3] Add TI SCI Reset Driver
Date: Thu, 27 Oct 2016 16:49:38 -0500
Message-ID: <20161027214941.24641-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F . Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello all,

This series adds a reset controller driver that uses the TI SCI
protocol to manage resets.

The TI SCI protocol is used to communicate with power management
controllers used by some SoCs. These controllers manage the various
power domains, clocks, and resets available on a SoC.

This series is based on drivers for TI SCI and the first two controlled
elements above, these series can be found here:

TI-SCI: http://www.spinics.net/lists/arm-kernel/msg536851.html
PM Domains: http://www.spinics.net/lists/devicetree/msg146621.html
Clocks: https://www.spinics.net/lists/linux-clk/msg12785.html

Thanks,
Andrew

Changes from v1:
 - Revised dt binding
 - CC Linux ARM list

Andrew F. Davis (3):
  Documentation: dt: reset: Add TI SCI reset binding
  dt-bindings: reset: Add K2G reset definitions
  reset: Add the TI SCI reset driver

 .../devicetree/bindings/reset/ti,sci-reset.txt     |  65 +++++
 MAINTAINERS                                        |   3 +
 drivers/reset/Kconfig                              |   9 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-ti-sci.c                       | 262 +++++++++++++++++++++
 include/dt-bindings/reset/k2g.h                    |  22 ++
 6 files changed, 362 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/ti,sci-reset.txt
 create mode 100644 drivers/reset/reset-ti-sci.c
 create mode 100644 include/dt-bindings/reset/k2g.h

-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
