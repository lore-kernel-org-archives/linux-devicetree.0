From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 0/3] ARM: l2c: add l2c support for RZ/A1
Date: Thu, 16 Feb 2017 11:17:39 -0500
Message-ID: <20170216161742.29320-1-chris.brandt@renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Brad Mouring <brad.mouring-acOepvfBmUk@public.gmane.org>, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Richard Cochran <rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The PL310 in the Renesas RZ/A1 SoC (R7S72100) does not have the sideband
signals connected between the CPU and L2C. According the PL310 TRM,
sideband signals are optional.

If a PL310 is added to a system, but the sideband signals are not
connected, some Cortex A9 optimizations cannot be used. In particular,
enabling Full Line Zeros in the CA9 without sidebands connected will
crash the system since the CA9 will expect the L2C to perform operations,
yet the L2C never gets the commands.

This series adds the option to not enable anything in the PL310 that
uses sidebands, and then adds L2C support to the RZ/A1 DT.

v4:
* changed l2x0_bresp_dis to l2x0_bresp_disable
* changed l2x0_flz_dis to l2x0_flz_disable

v3:
* split "arm,pl310-no-sideband" into "arm,early-bresp-disable" and
  "arm,full-line-zero-disable"

v2:
* Added "arm,pl310-no-sideband" to cache-l2x0.c instead of hacking in a
  dummy l2c_write_sec function to keep FLZ from being enabled.


Chris Brandt (3):
  ARM: l2c: allow CA9 optimizations to be disabled
  ARM: shmobile: r7s72100: Enable L2 cache
  ARM: dts: r7s72100: add l2 cache

 Documentation/devicetree/bindings/arm/l2c2x0.txt |  3 +++
 arch/arm/boot/dts/r7s72100.dtsi                  | 11 +++++++++++
 arch/arm/mach-shmobile/setup-r7s72100.c          |  2 ++
 arch/arm/mm/cache-l2x0.c                         | 13 +++++++++++--
 4 files changed, 27 insertions(+), 2 deletions(-)

-- 
2.10.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
