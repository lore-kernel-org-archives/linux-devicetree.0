Return-Path: <SRS0=UTzV=JZ=atomide.com=tony@kernel.org>
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 0/5] Update omap4 l4 to probe with ti-sysc
Date: Sun,  8 Jul 2018 23:36:07 -0700
Message-Id: <20180709063612.12025-1-tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>, Tero Kristo <t-kristo@ti.com>
List-ID: <devicetree@vger.kernel.org>

Hi all,

Here's a series to update omap4 l4 interconnects to probe with
ti-sysc device tree data instead of the legacy hwmod platform
data.

This includes most l4 devices except for abe interconnect and
dsp_mmu. I'll provide patches later on for abe, and dsp_mmu
can be converted after we have a proper reset framework driver
for ti rstctrl registers.

We start the device tree data conversion with omap4 as it's
the first SoC using the clkctrl registers that all the later
omap variant SoCs use. And we now have omap4 runtime PM working
somewhat with core retention for non-USB cases so testing for
PM related regressions is possible.

Regards,

Tony


Tony Lindgren (5):
  dt-bindings: Update omap l4 binding for optional registers
  ARM: dts: omap4: Add l4 interconnect hierarchy and ti-sysc data
  ARM: dts: omap4: Probe watchdog 3 with ti-sysc
  ARM: dts: omap4: Move l4 child devices to probe them with ti-sysc
  ARM: dts: omap4: Add l4 ranges for 4460

 .../devicetree/bindings/arm/omap/l4.txt       |   15 +-
 arch/arm/boot/dts/omap4-l4.dtsi               | 2444 +++++++++++++++++
 arch/arm/boot/dts/omap4-panda-es.dts          |    2 +-
 arch/arm/boot/dts/omap4.dtsi                  |  812 +-----
 arch/arm/boot/dts/omap4460.dtsi               |   36 +
 5 files changed, 2526 insertions(+), 783 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap4-l4.dtsi

-- 
2.17.1
