From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 00/11] soc: renesas: Identify SoC and register with the SoC bus
Date: Mon, 14 Nov 2016 19:37:06 +0100
Message-ID: <1479148637-5399-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dirk Behme <dirk.behme@de.bosch.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

Some Renesas SoCs may exist in different revisions, providing slightly
different functionalities (e.g. R-Car H3 ES1.x and ES2.0), and behavior
(errate and quirks).  This needs to be catered for by drivers and/or
platform code.  The recently proposed soc_device_match() API is a good
fit to handle this.

This patch series implements the core infrastructure to provide SoC and
revision information through the SoC bus for Renesas ARM SoCs.

Changes compared to v2 (more details in the individual patches):
  - Add Acked-by,
  - Drop soc_device_match() core infrastructure, as this now exists in
    its own immutable branch,
  - Re-add SoC families and family names,
  - Re-add RZ/A1H and R-Car M1A support, without revision info,
  - Drop "renesas,cccr" bindings and patches added CCCR devices nodeas,
    as the CCCR is not a lone register, but part of the HPB/APB register
    block. DT support for obtaining the CCCR register address from DT is
    thus postponed, pending DT bindings for HPB/APB,
  - Include patches to add PRR device nodes for all relevant SoCs.

Changes compared to v1:
  - Add Acked-by,
  - New patches:
      - "[4/7] base: soc: Provide a dummy implementation of
	       soc_device_match()",
      - "[5/7] ARM: shmobile: Document DT bindings for CCCR and PRR",
      - "[6/7] arm64: dts: r8a7795: Add device node for PRR"
        (more similar patches available, I'm not yet spamming you all
	 with them),
  - Drop SoC families and family names; use fixed "Renesas" instead,
  - Drop EMEV2, which doesn't have a chip ID register, and doesn't share
    devices with other SoCs,
  - Drop RZ/A1H and R-CAR M1A, which don't have chip ID registers (for
    M1A: not accessible from the ARM core?),
  - On arm, move "select SOC_BUS" from ARCH_RENESAS to Kconfig symbols
    for SoCs that provide a chip ID register,
  - Build renesas-soc only if SOC_BUS is enabled,
  - Use "renesas,prr" and "renesas,cccr" device nodes in DT if
    available, else fall back to hardcoded addresses for compatibility
    with existing DTBs,
  - Remove verification of product IDs; just print the ID instead,
  - Don't register the SoC bus if the chip ID register is missing,
  - Change R-Mobile APE6 fallback to use PRR instead of CCCR (it has
    both).

Dependencies:
  - Core soc_device_match() infrastructure, available from signed tag
    soc-device-match-tag1 in
    git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git,
  - Tag renesas-devel-20161114-v4.9-rc5 in Simon's renesas repository.

Tested on (machine, family, soc_id, optional revision):
    Genmai, RZ/A, r7s72100
    APE6EVM, R-Mobile, r8a73a4, ES1.0
    armadillo 800 eva, R-Mobile, r8a7740, ES2.0
    bockw, R-Car Gen1, r8a7778
    marzen, R-Car Gen1, r8a7779, ES1.0
    Lager, R-Car Gen2, r8a7790, ES1.0
    Koelsch, R-Car Gen2, r8a7791, ES1.0
    Porter, R-Car Gen2, r8a7791, ES3.0
    Blanche, R-Car Gen2, r8a7792, ES1.1
    Gose, R-Car Gen2, r8a7793, ES1.0
    Alt, R-Car Gen2, r8a7794, ES1.0
    Renesas Salvator-X board based on r8a7795, R-Car Gen3, r8a7795, ES1.0
    Renesas Salvator-X board based on r8a7795, R-Car Gen3, r8a7795, ES1.1
    Renesas Salvator-X board based on r8a7796, R-Car Gen3, r8a7796, ES1.0
    KZM-A9-GT, SH-Mobile, sh73a0, ES2.0

For your convenience, this series is also available in the
topic/renesas-soc-id-v3 branch of my renesas-drivers git repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git

As this is a dependency for driver updates for R-Car H3 ES2.0 (HDMI,
Ethernet, clock, pinctrl, ...), it would be good if this would be in
v4.10.

Thanks for merging soc-device-match-tag1, and applying this series on
top!

Geert Uytterhoeven (11):
  ARM: shmobile: Document DT bindings for Product Register
  soc: renesas: Identify SoC and register with the SoC bus
  ARM: dts: r8a73a4: Add device node for PRR
  ARM: dts: r8a7779: Add device node for PRR
  ARM: dts: r8a7790: Add device node for PRR
  ARM: dts: r8a7791: Add device node for PRR
  ARM: dts: r8a7792: Add device node for PRR
  ARM: dts: r8a7793: Add device node for PRR
  ARM: dts: r8a7794: Add device node for PRR
  arm64: dts: r8a7795: Add device node for PRR
  arm64: dts: r8a7796: Add device node for PRR

 Documentation/devicetree/bindings/arm/shmobile.txt |  18 ++
 arch/arm/boot/dts/r8a73a4.dtsi                     |   5 +
 arch/arm/boot/dts/r8a7779.dtsi                     |   5 +
 arch/arm/boot/dts/r8a7790.dtsi                     |   5 +
 arch/arm/boot/dts/r8a7791.dtsi                     |   5 +
 arch/arm/boot/dts/r8a7792.dtsi                     |   5 +
 arch/arm/boot/dts/r8a7793.dtsi                     |   5 +
 arch/arm/boot/dts/r8a7794.dtsi                     |   5 +
 arch/arm/mach-shmobile/Kconfig                     |   1 +
 arch/arm64/Kconfig.platforms                       |   1 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |   5 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |   5 +
 drivers/soc/renesas/Makefile                       |   2 +
 drivers/soc/renesas/renesas-soc.c                  | 257 +++++++++++++++++++++
 14 files changed, 324 insertions(+)
 create mode 100644 drivers/soc/renesas/renesas-soc.c

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
