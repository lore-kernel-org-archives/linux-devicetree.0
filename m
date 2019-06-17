Return-Path: <SRS0=zr72=UQ=gmail.com=magnus.damm@kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 17 Jun 2019 18:02:47 +0900
Message-Id: <156076216767.4736.16337667537984218274.sendpatchset@octo>
Subject: [PATCH 0/8] dt-bindings: timer: renesas, cmt: Various updates
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

dt-bindings: timer: renesas, cmt: Various updates

[PATCH 1/8] dt-bindings: timer: renesas, cmt: Add CMT0234 to sh73a0 and r8a7740
[PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
[PATCH 3/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7792
[PATCH 4/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7795
[PATCH 5/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77965
[PATCH 6/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77990
[PATCH 7/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77995
[PATCH 8/8] dt-bindings: timer: renesas, cmt: Update R-Car Gen3 CMT1 usage

This series collect the following rather trivial DT binding changes:
- Add 32-bit CMT0234 and convert CMT1 DT binding on sh73a0 and r8a7740.
- Add documentation for the CMT on the R-Car Gen2 V2H (r8a7792) SoC.
- Add missing R-Car Gen3 DT bindings for H3, M3-N, E3 an D3.
- Update the R-Car Gen3 description to reflect current usage.

Please see each individual patch for more information.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |   54 +++++++++------
 1 file changed, 33 insertions(+), 21 deletions(-)
