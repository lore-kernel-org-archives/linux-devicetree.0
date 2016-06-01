From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/1] soc: renesas: Add DT fixup code for backwards compatibility
Date: Wed,  1 Jun 2016 21:50:49 +0200
Message-ID: <1464810650-23002-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Dirk Behme <dirk.behme@de.bosch.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Arnd Bergmann <arnd@arndb.de>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi all,

When moving functionality from C code to DT, we're regularly faced with
stable DT issues: old DTBs should keep on working. This requires keeping
workaround code in the kernel.

An alternative solution to having workaround C code, would be to
dynamically modify the DT, to add missing device nodes and phandle links.
This has several advantages:
  - All workarounds are kept together,
  - Workarounds can be enabled/disabled using a single Kconfig option,
  - Individual driver code is not polluted by workaround code.

Examples of missing support in DT are:
  - A device node for the R-Car RST (Reset Controller), which a.o.
    provides access to the Mode Pins (currently handled using an
    hardcoded address in platform/driver code), cfr. the series
    "[PATCH/RFC v3 00/22] soc: renesas: Add R-Car RST driver for
    obtaining mode pin state" I've just sent
    (http://www.spinics.net/lists/linux-renesas-soc/msg04289.html),
  - A device node for the R-Car SYSC (System Controller), to link CPUs
    to their respective power domains (On R-Car Gen2 CPUs can be
    auto-detected, as there's a register indicating which CPU cores are
    present),
  - Add a device node for the R-Car Gen2 APMU (Advanced Power
    Management Unit), for modern CPU bringup using "enable-method".
    Note that the method from this RFC doesn't work for
    "enable-method", as that is parsed in arm_dt_init_cpu_maps(),
    immediately after unflatten_device_tree(), long before initcalls
    run.

However, there are other possible uses:
  - Workarounds for hardware bugs: early engineering samples of an SoC
    may have non-functional devices. This would allow to describe the
    latest (functional) hardware in the .dtsi, knowing that the fixup
    code will disable non-functional devices when running on an early
    engineering sample, based on reading the PRR (Product Revision
    Register).
  - Handle other differences between SoC versions, e.g. change
    compatible values for an early engineering sample that needs special
    handling, or limit the features of a device.
  - Add SoC-specific compatible values to all device nodes (e.g. add
    "renesas,r8a7795-wdt" to a node already having
    "renesas,rcar-gen3-wdt" when running on r8a7795). This would make
    it easier to share .dtsi files within the same SoC family, without
    relying on e.g. C preprocessor tricks.

This proof-of-concept implements this for the missing R-Car RST (Reset
Controller) node. This poc is not suitable for all of the above, as some
DT structures (e.g. the CPU's "enable-method) are parsed long before
early_initcall(), and would need a different workaround.

What do you think?
Should this be handled at another level? E.g. operate on the FDT?

Thanks!

Geert Uytterhoeven (1):
  soc: renesas: Add DT fixup code for missing r8a7791 RST

 drivers/soc/renesas/Makefile           |   4 +
 drivers/soc/renesas/renesas-dt-fixup.c | 159 +++++++++++++++++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 drivers/soc/renesas/renesas-dt-fixup.c

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
