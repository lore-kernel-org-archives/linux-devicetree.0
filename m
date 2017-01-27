From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 0/2] clocksource: Add renesas-ostm timer driver
Date: Thu, 26 Jan 2017 21:23:30 -0500
Message-ID: <20170127022332.15906-1-chris.brandt@renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set adds a new clocksource driver that uses the OS Timer
(OSTM) that exists in the R7S72100 (RZ/A1) SoC.

The operation of the driver was tested with a simple user application
that does multiple calls to nanosleep() and gettimeofday().

The purpose of adding this driver is to get better time keeping
accuracy over the default MTU2 clocksource timer.

v6:
* add Copyright

v5:
* changed iowrite8/32 to writeb/l

v4:
* Added more details to commit log
* Kconfig: SYS_SUPPORTS_RENESAS_OSTM to just RENESAS_OSTM
* removed all MODULE code (this driver is builtin only)
* removed items from 'struct ostm_device'
* changed ioread8 to readb
* explain endless while loop
* removed un-needed vars like 'ret'
* removed WARN_ON(!clockevent_state_oneshot(ced));
* removed "failed to allocate memory" message
* remove pm_runtime calls
* remove "earlytimer" register (only for sh, not arm)
* convert from platform driver to CLOCKSOURCE_OF_DECLARE
* ostm_probe code is now in ostm_init

v3:
* Changed ostm@fcfec000 to timer@fcfec000
* Added power-domains to nodes

v2:
* The biggest change was now the channels are independent of each
  other and have separate nodes in the DT. The first probed will
  be set up as a clock source, and any additional channels probed
  will become a clock event.


Chris Brandt (2):
  dt-bindings: document renesas-ostm timer
  clocksource: Add renesas-ostm timer driver

 .../devicetree/bindings/timer/renesas,ostm.txt     |  30 +++
 arch/arm/mach-shmobile/Kconfig                     |   1 +
 drivers/clocksource/Kconfig                        |   7 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/renesas-ostm.c                 | 265 +++++++++++++++++++++
 5 files changed, 304 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,ostm.txt
 create mode 100644 drivers/clocksource/renesas-ostm.c

-- 
2.10.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
