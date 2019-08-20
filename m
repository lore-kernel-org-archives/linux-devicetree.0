From: Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 0/7] renesas, cmt: DT Binding Documentation and Minor Driver Updates V2
Date: Tue, 20 Aug 2019 21:34:52 +0900
Message-ID: <156630449239.17444.11157306180861080402.sendpatchset@octo>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, geert+renesas@glider.be, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

renesas, cmt: DT Binding Documentation and Minor Driver Updates V2

[PATCH v2 1/7] dt-bindings: timer: renesas, cmt: Add CMT0234 to sh73a0 and r8a7740
[PATCH v2 2/7] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
[PATCH v2 3/7] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7792
[PATCH v2 4/7] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77995
[PATCH v2 5/7] dt-bindings: timer: renesas, cmt: Update R-Car Gen3 CMT1 usage
[PATCH v2 6/7] clocksource/drivers/sh_cmt: r8a7740 and sh73a0 SoC-specific match
[PATCH v2 7/7] clocksource/drivers/sh_cmt: Document "cmt-48" as deprecated 

This series collect the following rather trivial changes for the CMT driver:
- Add 32-bit CMT0234 and convert CMT1 DT binding docs on sh73a0 and r8a7740.
- Add documentation for the CMT on the R-Car Gen2 V2H (r8a7792) SoC.
- Add missing R-Car Gen3 DT binding documentation for D3 (r8a77995).
- Update the R-Car Gen3 DT documentation to reflect current usage.
- Introduce SoC-specific matching in the driver for CMT1 on sh73a0 and sh73a0.
- Document old "cmt-48" binding as deprecated in the driver.

Since V1 the only update is the addition of reviewed-by from Simon - thanks!

Please see each individual patch for more detailed information.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> [Patch 3-5]
Reviewed-by: Rob Herring <robh@kernel.org> [Patch 1-5]
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---

Developed on top of "renesas-drivers-2019-08-13-v5.3-rc4". Earlier posted as:
[PATCH 0/7] renesas, cmt: DT Binding Documentation and Minor Driver Updates

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |   42 ++++++++-------
 drivers/clocksource/sh_cmt.c                            |   14 ++++-
 2 files changed, 37 insertions(+), 19 deletions(-)
