From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/4] Add Core Divider clock support for Armada 370/XP
Date: Thu, 26 Sep 2013 16:35:26 -0300
Message-ID: <1380224130-11868-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <elopez93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for a set of clocks available in Armada 370/XP
known as "Core Divider" clocks.

These are a set of gatable clocks, derived from a fixed PLL at
a configurable ratio. Although this patchset adds support for the more
general case, we only support one of the clocks, namely the NAND clock.

With this infrastructure in place, the addition of the rest of the clocks
would be fairly easy.

A pictorical representation of the clock tree would be:

    PLL
    |
    |
    ---------------------
    |			|
    |			|
    NAND clock		...

This patchset is based on v3.12-rc2. Any opinions are highly appreciated.

Thanks!

Changes from v1:

  * The most significative change is the simplification of the NAND clock
    tree. Instead of exposing two clocks: NAND ECC and NAND, we choose a
    simpler approach and view both clocks as one.

    The only impact these simplification has is that the NAND controller
    driver will have to divide the rate by two when using it to calculate
    the timings.

  * A spinlock protecting the enable, disable and set_rate operations is added
    as noted by Andrew Lunn.

  * The round_rate algorithm was also simplified, as the previous one was rather
    silly; also noted by Andrew.

  * The size of the 'reg' property was fixed; also noted by Andrew.

  * The exceedingly long macros names have been simplified and some other minor
    coding style issues have been solved.

Ezequiel Garcia (4):
  clk: mvebu: Add Core Divider clock
  ARM: mvebu: Add Core Divider clock device-tree binding
  ARM: mvebu: Add a 2 GHz fixed-clock Armada 370/XP
  ARM: mvebu: Add the core-divider clock to Armada 370/XP

 .../bindings/clock/mvebu-corediv-clock.txt         |  19 ++
 arch/arm/boot/dts/armada-370-xp.dtsi               |  17 ++
 drivers/clk/mvebu/Kconfig                          |   5 +
 drivers/clk/mvebu/Makefile                         |   1 +
 drivers/clk/mvebu/clk-corediv.c                    | 223 +++++++++++++++++++++
 5 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt
 create mode 100644 drivers/clk/mvebu/clk-corediv.c

-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
