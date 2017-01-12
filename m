From: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] ASpeed mailbox and LPC control drivers
Date: Thu, 12 Jan 2017 11:29:06 +1100
Message-ID: <20170112002910.3650-1-cyrilbur@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

I have written some drivers for the ASpeed AST2400/2500 chips. These
chips are designed to be used as BMCs and the core reason for these
drivers has been to introduce a communication channel between two
processors.

The mailbox registers are the channel through which the two processors
can communicate, it is worth noting here that the mailbox driver is
designed to be flexible enough do allow userspace to arbitrarily write
to one or all or a subset of the mailbox registers. This is important
as the ASpeed chip allows for enabling hardware interrupts based on
writes at a per data register level. It is possible that the other
processor will enable interrupts on one of the data registers, as
such, the ASpeed end of the protocol will need to be able to treat
that register specially.

The first intended use of a communication protocol between the ASpeed
and the other processor is so they can arbitrate on board flash chip
access. The goal is to have the ASpeed chip perform the reads and
writes to the flash and present to the other processor in an area of
its RAM across a shared bus. Currently the other processor has the
flash mapped directly on the shared bus. The LPC bus controlling
driver provides a way for the ASpeed userspace to control the mapping
across the LPC bus between the ASpeed and the other processor. The RAM
region that the LPC control driver will use should be specified in the
device tree.

Cyril Bur (4):
  Documentation: dt: mailbox: Add Aspeed ast2400/2500 bindings
  Documentation: dt: misc: Add Aspeed ast2400/2500 LPC Control bindings
  drivers/misc: Add ASpeed LPC control driver
  drivers/mailbox: Add ASpeed mailbox driver

 .../devicetree/bindings/mailbox/aspeed-mbox.txt    |  44 +++
 .../devicetree/bindings/misc/aspeed-lpc-ctrl.txt   |  78 +++++
 drivers/mailbox/Kconfig                            |   9 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/aspeed-mbox.c                      | 334 +++++++++++++++++++++
 drivers/misc/Kconfig                               |   9 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/aspeed-lpc-ctrl.c                     | 269 +++++++++++++++++
 include/uapi/linux/aspeed-lpc-ctrl.h               |  25 ++
 9 files changed, 771 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
 create mode 100644 drivers/mailbox/aspeed-mbox.c
 create mode 100644 drivers/misc/aspeed-lpc-ctrl.c
 create mode 100644 include/uapi/linux/aspeed-lpc-ctrl.h

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
