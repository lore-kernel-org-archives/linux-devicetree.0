From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/13] ARM: dts: renesas: Add missing clocks for ARM CPU cores
Date: Thu, 12 Oct 2017 11:35:03 +0200
Message-ID: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

This series improves DT hardware descriptions for Renesas arm32 SoCs by
adding missing clocks properties to the device nodes corresponding to
ARM CPU cores.

Notes:
  - This series should have no functional impact, except perhaps on
    big.LITTLE SoCs, when using a firmware that enables both big and
    little CPU cores (see also Sudeep Holla's comments for R-Car Gen3 in
    "Re: [PATCH v2 2/2] arm64: dts: r8a7796: Add OPPs table for cpu
    devices" (https://www.spinics.net/lists/arm-kernel/msg610489.html),
  - The clocks for CA9 CPU cores on R-Mobile A1 and EMMA Mobile EV2 are
    still missing, as these clocks are not supported by the DT bindings
    and drivers, and cannot be referenced yet.

Tested on r8a73a4/ape6evm, r8a7791/koelsch, and sh73a0/kzm9g.

Testing on r8a7790/lager would be appreciated.

Thanks for your comments!

Geert Uytterhoeven (13):
  dt-bindings: clk: r7s72100: Add missing I and G clocks
  ARM: dts: r7s72100: Add clock for CA9 CPU core
  ARM: dts: r8a73a4: Add clock for CA15 CPU0 core
  ARM: dts: r8a7743: Add missing clock for secondary CA15 CPU core
  ARM: dts: r8a7778: Add clock for CA9 CPU core
  ARM: dts: r8a7779: Add clocks for CA9 CPU cores
  ARM: dts: r8a7790: Add missing clocks for secondary CA15 CPU cores
  ARM: dts: r8a7790: Add clocks for CA7 CPU cores
  ARM: dts: r8a7791: Add missing clock for secondary CA15 CPU core
  ARM: dts: r8a7792: Add missing clock for secondary CA15 CPU core
  ARM: dts: r8a7793: Add missing clock for secondary CA15 CPU core
  ARM: dts: r8a7794: Add missing clock for secondary CA7 CPU core
  ARM: dts: sh73a0: Add clocks for CA9 CPU cores

 arch/arm/boot/dts/r7s72100.dtsi            | 1 +
 arch/arm/boot/dts/r8a73a4.dtsi             | 1 +
 arch/arm/boot/dts/r8a7743.dtsi             | 1 +
 arch/arm/boot/dts/r8a7778.dtsi             | 1 +
 arch/arm/boot/dts/r8a7779.dtsi             | 4 ++++
 arch/arm/boot/dts/r8a7790.dtsi             | 7 +++++++
 arch/arm/boot/dts/r8a7791.dtsi             | 1 +
 arch/arm/boot/dts/r8a7792.dtsi             | 1 +
 arch/arm/boot/dts/r8a7793.dtsi             | 1 +
 arch/arm/boot/dts/r8a7794.dtsi             | 1 +
 arch/arm/boot/dts/sh73a0.dtsi              | 2 ++
 include/dt-bindings/clock/r7s72100-clock.h | 2 ++
 12 files changed, 23 insertions(+)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
