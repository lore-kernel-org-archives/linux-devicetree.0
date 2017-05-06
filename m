From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 00/11] Broadcom Stingray SOC Initial Support
Date: Sat,  6 May 2017 17:24:35 +0530
Message-ID: <1494071686-19098-1-git-send-email-anup.patel@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Oza Pawandeep <oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod Kumar <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <sandeep.tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds initial support of Broadcom Stingray SOC
by reusing existing Broadcom iProc device drivers.

Most of the patches in this patchset are DT patches except
the Stingray clock tree support which just one patch.

This patchset is based on Linux-4.11 and it is also available
at stingray-v1 branch of https://github.com/Broadcom/arm64-linux.git

Anup Patel (3):
  dt-bindings: bcm: Add Broadcom Stingray bindings document
  arm64: dts: Initial DTS files for Broadcom Stingray SOC
  arm64: dts: Add PL022, PL330 and SP805 DT nodes for Stingray

Oza Pawandeep (1):
  arm64: dts: Add I2C DT nodes for Stingray SoC

Pramod Kumar (3):
  arm64: dts: Add NAND DT nodes for Stingray SOC
  arm64: dts: Add pinctrl DT nodes for Stingray SOC
  arm64: dts: Add GPIO DT nodes for Stingray SOC

Sandeep Tripathy (3):
  dt-bindings: clk: Extend binding doc for Stingray SOC
  clk: bcm: Add clocks for Stingray SOC
  arm64: dts: Add clock DT nodes for Stingray SOC

Srinath Mannam (1):
  arm64: dts: Add PWM and SDHCI DT nodes for Stingray SOC

 .../devicetree/bindings/arm/bcm/brcm,stingray.txt  |  12 +
 .../bindings/clock/brcm,iproc-clocks.txt           |  76 ++++
 arch/arm64/boot/dts/broadcom/Makefile              |   1 +
 arch/arm64/boot/dts/broadcom/stingray/Makefile     |   6 +
 .../boot/dts/broadcom/stingray/bcm958742-base.dtsi | 140 +++++++
 .../boot/dts/broadcom/stingray/bcm958742k.dts      |  78 ++++
 .../boot/dts/broadcom/stingray/bcm958742t.dts      |  40 ++
 .../boot/dts/broadcom/stingray/stingray-clock.dtsi | 162 ++++++++
 .../dts/broadcom/stingray/stingray-pinctrl.dtsi    | 345 ++++++++++++++++
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi | 457 +++++++++++++++++++++
 drivers/clk/bcm/Kconfig                            |   8 +
 drivers/clk/bcm/Makefile                           |   1 +
 drivers/clk/bcm/clk-sr.c                           | 300 ++++++++++++++
 include/dt-bindings/clock/bcm-sr.h                 | 101 +++++
 .../dt-bindings/pinctrl/brcm,pinctrl-stingray.h    |  68 +++
 15 files changed, 1795 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,stingray.txt
 create mode 100644 arch/arm64/boot/dts/broadcom/stingray/Makefile
 create mode 100644 arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/stingray/bcm958742t.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-clock.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
 create mode 100644 drivers/clk/bcm/clk-sr.c
 create mode 100644 include/dt-bindings/clock/bcm-sr.h
 create mode 100644 include/dt-bindings/pinctrl/brcm,pinctrl-stingray.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
