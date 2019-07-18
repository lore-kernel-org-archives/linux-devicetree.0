From: Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 0/7] renesas, cmt: DT Binding Documentation and Minor Driver Updates
Date: Thu, 18 Jul 2019 20:43:58 +0900
Message-ID: <156345023791.5307.6113391102648394591.sendpatchset@octo>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, geert+renesas@glider.be, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

renesas, cmt: DT Binding Documentation and Minor Driver Updates

[PATCH 1/7] dt-bindings: timer: renesas, cmt: Add CMT0234 to sh73a0 and r8a7740
[PATCH 2/7] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
[PATCH 3/7] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7792
[PATCH 4/7] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77995
[PATCH 5/7] dt-bindings: timer: renesas, cmt: Update R-Car Gen3 CMT1 usage
[PATCH 6/7] clocksource/drivers/sh_cmt: r8a7740 and sh73a0 SoC-specific match
[PATCH 7/7] clocksource/drivers/sh_cmt: Document "cmt-48" as deprecated 

This series collect the following rather trivial changes for the CMT driver:
- Add 32-bit CMT0234 and convert CMT1 DT binding docs on sh73a0 and r8a7740.
- Add documentation for the CMT on the R-Car Gen2 V2H (r8a7792) SoC.
- Add missing R-Car Gen3 DT binding documentation for D3 (r8a77995).
- Update the R-Car Gen3 DT documentation to reflect current usage.
- Introduce SoC-specific matching in the driver for CMT1 on sh73a0 and sh73a0.
- Document old "cmt-48" binding as deprecated in the driver.

Please see each individual patch for more detailed information.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> [Patch 3-5]
Reviewed-by: Rob Herring <robh@kernel.org> [Patch 1-5]
---

Developed on top of "renesas-devel-2019-07-08-v5.2" which includes
CMT DT Documentation patches queued for v5.3-rc

Earlier posted as:
[PATCH 0/8] dt-bindings: timer: renesas, cmt: Various updates
[PATCH 0/3] clocksource/drivers/sh_cmt: Minor DT compat string update

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |   42 ++++++++-------
 drivers/clocksource/sh_cmt.c                            |   14 ++++-
 2 files changed, 37 insertions(+), 19 deletions(-)
