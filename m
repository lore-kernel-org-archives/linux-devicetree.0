From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 0/3] watchdog: add wdt and reset for renesas r7s72100
Date: Thu,  2 Mar 2017 08:57:43 -0500
Message-ID: <20170302135746.30550-1-chris.brandt@renesas.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some Renesas SoCs do not have a reset register and the only way to do a SW
controlled reset is to use the watchdog timer. So while this series started
out by only adding a reset feature, now it's a full watchdog timer driver that
includes a reset handler.

The longest WDT overflow you can get with a RZ/A1 (R7S72100) with its 8-bit
wide counter is 125ms. Not very long.

However, by setting max_hw_heartbeat_ms, the watchdog core will now handle
pinging the WDT automatically and allow the user to set times as big as they
want. Therefore, the default timeout for this driver is 30 seconds.

Of course if system interrupts are disabled too long and wdt can't be pinged
by the watchdog core, then the system will reset before the user specified
timeout. But hey, it's better nothing.

This driver was tested on an RZ/A1 RSK board using watchdog-simple.c from
samples/watchdog/.

v4:
* r7s72100.dtsi: changed from timer@ to watchdog@

v3:
* changed from a reset driver to a watchdog timer driver
* use udelay(20) instead of msleep for reset handler
* added Reviewed-by for r7s72100.dtsi and renesas-wdt.txt
* added Acked-by for renesas-wdt.txt

v2:
* added to renesas-wdt.txt instead of creating a new file
* changed "renesas,r7s72100-reset" to "renesas,r7s72100-wdt"
* changed "renesas,wdt-reset" to "renesas,rza-wdt"
* added "renesas,rza-wdt" as a fallback
* added interupt property (even though it is not used)
* added clocks property
* changed hard coded register values to defines
* added msleep to while(1) loop
* removed unnecessary #include files
* added Reviewed-by: Geert Uytterhoeven for renesas-reset.c

Chris Brandt (3):
  watchdog: add rza_wdt driver
  watchdog: renesas-wdt: add support for rza
  ARM: dts: r7s72100: Add watchdog timer

 .../devicetree/bindings/watchdog/renesas-wdt.txt   |   4 +-
 arch/arm/boot/dts/r7s72100.dtsi                    |   7 +
 drivers/watchdog/Kconfig                           |   8 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/rza_wdt.c                         | 208 +++++++++++++++++++++
 5 files changed, 227 insertions(+), 1 deletion(-)
 create mode 100644 drivers/watchdog/rza_wdt.c

-- 
2.10.1


--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
