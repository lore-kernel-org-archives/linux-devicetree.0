From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH RESEND v2 0/4] ARM: vf610: restructure device trees
Date: Sun,  2 Nov 2014 21:36:43 +0100
Message-ID: <1414960607-29316-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org, bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset is v2 of "ARM: dts: vf500/vf610: support VF500 SoC",
and grew by some patches. It now also solves some issues uncovered
by the "ARM: vf610m4: Add Vybrid Cortex-M4 support" patchset.  The
next Cortex-M4 patchset will then base on this patchset.

I could again not use the -M/-B parameter to generate smaller and
better readable patches. Those patches ended up not apply-able.

Resend also to Shawn's new address. This patchset is queueing up
other work on the vf610 device trees somewhat, so it would be nice
getting it in soon, if accepted.

Changes in v2:
- Assign fixed input clocks to clock controller module to ensure correct
  initialization order
- Get rid of "clocks"-node and move fixed clocks to the root level
- Move peripherals to vfxxx.dtsi to allow share the nodes for Cortex-A5
  and Cortex-M4 SoC device trees.
  
Stefan Agner (4):
  ARM: dts: vf610: assign oscillator to clock module
  ARM: imx: clk-vf610: get input clocks from assigned clocks
  ARM: dts: vf610: create generic base device trees
  ARM: dts: vf500-colibri: add Colibri VF50 support

 .../devicetree/bindings/clock/vf610-clock.txt      |  15 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/vf-colibri-eval-v3.dtsi          |  54 +++
 arch/arm/boot/dts/vf-colibri.dtsi                  | 142 ++++++
 arch/arm/boot/dts/vf500-colibri-eval-v3.dts        |  17 +
 arch/arm/boot/dts/vf500-colibri.dtsi               |  20 +
 arch/arm/boot/dts/vf500.dtsi                       | 171 +++++++
 arch/arm/boot/dts/vf610-colibri-eval-v3.dts        |  47 +-
 arch/arm/boot/dts/vf610-colibri.dtsi               | 137 +-----
 arch/arm/boot/dts/vf610-cosmic.dts                 |  14 +-
 arch/arm/boot/dts/vf610-twr.dts                    |  37 +-
 arch/arm/boot/dts/vf610.dtsi                       | 507 +--------------------
 arch/arm/boot/dts/vfxxx.dtsi                       | 436 ++++++++++++++++++
 arch/arm/mach-imx/clk-vf610.c                      |  20 +-
 14 files changed, 920 insertions(+), 698 deletions(-)
 create mode 100644 arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
 create mode 100644 arch/arm/boot/dts/vf-colibri.dtsi
 create mode 100644 arch/arm/boot/dts/vf500-colibri-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/vf500-colibri.dtsi
 create mode 100644 arch/arm/boot/dts/vf500.dtsi
 create mode 100644 arch/arm/boot/dts/vfxxx.dtsi

-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
