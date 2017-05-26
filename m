From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 0/2] reset: Basic reset controller
Date: Fri, 26 May 2017 13:32:12 +1000
Message-ID: <20170526033214.8081-1-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

In the Aspeed SoCs we have some reset registers spread out in various parts of
the soc: in the system controller IP, as well as other peripherals. I need to be
able to deassert those resets before other drivers work.

In writing a driver to do this I realised it was very generic. So instead I've
sent a generic driver that can be used by the device tree to clear reset lines
described by single bits in a register.

Let me know what you think of the idea. I've tested this driver on our SoC to
release the UART reset.

Joel Stanley (2):
  dt-bindings: reset: Add bindings for basic reset controller
  reset: Add basic single-register reset driver

 .../devicetree/bindings/reset/reset-basic.txt      |  31 ++++++
 drivers/reset/Kconfig                              |   6 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-basic.c                        | 109 +++++++++++++++++++++
 4 files changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/reset-basic.txt
 create mode 100644 drivers/reset/reset-basic.c

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
