From: Tali Perry <tali.perry1@gmail.com>
Subject: [PATCH v12 0/2] clk: npcm750: Add NPCM7XX Clock driver and binding
Date: Mon, 26 Mar 2018 13:16:24 +0300
Message-ID: <1522059386-20601-1-git-send-email-tali.perry1@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@kernel.org, brendanhiggins@google.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, Tali Perry <tali.perry1@gmail.com>
List-Id: devicetree@vger.kernel.org


Nuvoton NPCM7XX Clock Controller

Nuvoton Poleg BMC NPCM7XX contains an integrated clock controller, which
generates and supplies clocks to all modules within the BMC.


11 ==> 12
Update review comments:
- remove all pr_debug
- eliminate static declerations of parameters.
- change lock name.
- remove double definition for compatible string.

10 ==> 11
update documentation. "eth" replaced with "ethernet" in use case eaxample.

2 ==> 10
update documentation. add external clocks as inputs to clk driver.
fix SPDX comment.

1 ==> 2
This patch includes fix request described here:
https://patchwork.kernel.org/patch/10200033/
(move fixed clocks to DT)

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>

Tali Perry (2):
  dt-binding: clk: npcm750: add binding
  clk: npcm7xx: add clock controller

 .../bindings/clock/nuvoton,npcm750-clk.txt         | 100 +++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-npcm7xx.c                          | 722 +++++++++++++++++++++
 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h  |  44 ++
 4 files changed, 867 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
 create mode 100644 drivers/clk/clk-npcm7xx.c
 create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h

-- 
2.14.1
