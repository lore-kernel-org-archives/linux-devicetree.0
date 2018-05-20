Return-Path: <SRS0=E3S+=IH=gmail.com=ykaneko0929@kernel.org>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH v4 0/3] thermal: add support for r8a77995
Date: Sun, 20 May 2018 18:26:16 +0900
Message-Id: <1526808379-3850-1-git-send-email-ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This series adds thermal support for r8a77995.
R-Car D3 (r8a77995) have a thermal sensor module which is similar to Gen2.
Therefore this series adds r8a77995 support to rcar_thermal driver not
rcar_gen3_thermal driver.

This series is based on the next branch of Zhang Rui's linux tree.

v4 [Yoshihiro Kaneko]
rcar_thermal.c:
- add Tested-by tag
* As suggested by Simon Horman
- add comment to ".nirqs = 2" of rcar_gen3_thermal

rcar-thermal.txt:
* As suggested by Simon Horman
- update the explanation of the interrupts

r8a77995.dtsi:
- repositioned the thermal subnode by bus address order


v3 [Yoshihiro Kaneko]
* As suggested by Geert Uytterhoeven
rcar_thermal.c:
- make use_of_thermal in structure rcar_thermal_chip a single bit
- add feature bits to rcar_thermal_chip
- add the number of interrupts to rcar_thermal_chip
- remove rcar_thermal_type in rcar_thermal_cip
- make variable chip in rcar_thermal_probe() a const

rcar-thermal.txt:
* No change

r8a77995.dtsi:
* No change


v2 [Yoshihiro Kaneko]
* As suggested by Geert Uytterhoeven
rcar_thermal.c:
- remove rcar_of_data macro
- store a pointer to rcar_thermal_chip in rcar_thermal_priv
- remove unnecessary cast in rcar_thermal_dt_ids

rcar-thermal.txt:
- drop the fallback for D3
- update the paragraph about interrupts

r8a77995.dtsi:
- fix the base address and the register addresses
- drop the fallback

Yoshihiro Kaneko (3):
  thermal: rcar_thermal: add r8a77995 support
  dt-bindings: thermal: rcar-thermal: add R8A77995 support
  arm64: dts: renesas: r8a77995: add thermal device support

 .../devicetree/bindings/thermal/rcar-thermal.txt   |   7 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  31 ++++
 drivers/thermal/rcar_thermal.c                     | 158 ++++++++++++++++-----
 3 files changed, 162 insertions(+), 34 deletions(-)

-- 
1.9.1
