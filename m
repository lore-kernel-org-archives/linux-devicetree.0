From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/6] arm: dts: modify Nuvoton NPCM750 device tree
Date: Wed,  4 Apr 2018 14:10:56 +0300
Message-ID: <1522840262-21635-1-git-send-email-tmaimon77@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, avifishman70@gmail.com, brendanhiggins@google.com, venture@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch set include modifications to the NPCM7xx
device tree according latest sent modules patches:

1. add watchdog device to NPCM750 device tree
- https://patchwork.kernel.org/patch/10269679/

2. modify UART compatible name in NPCM750 device tree
- https://patchwork.kernel.org/patch/10220251/

3. modify timer register size in NPCM750 device tree
- https://patchwork.ozlabs.org/patch/883180/

4. modify clock binding in NPCM750 device tree
- https://patchwork.kernel.org/patch/10307601/

5. modify Makefile NPCM750 configuration name
- https://patchwork.kernel.org/patch/10285929/

6. modify Nuvoton NPCM7xx device tree structure

The NPCM7xx are a family of BMC's that include several chips as:
NPCM750, NPCM730 etc.

All of the NPCM7xx BMC's have the common modules like Cortex-A9,
WDT, timers, etc, and there are a optional modules that can be added.

NPCM750 device tree already pushed to arm-soc.git:
https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/commit/?h=for-next&id=d6bdd009c21db3f677dd1d1bbb8c20bc819074bc

After discussion with Rob Herring we have modified the structure
of the NPCM7xx device tree as follow:

nuvoton-common-npcm7xx device tree include all common modules
nuvoton-npcm750 device tree include specific npcm750 modules,
the nuvoton-npcm750 device tree include nuvoton-common-npcm7xx device tree

I will like to replace the device tree that pushed to arm-soc.git with
this patch set.

Please review it, sorry if it cause more work after pushing
NPCM750 device tree.

Thanks a lot,

Tomer

Tomer Maimon (6):
  arm: dts: add watchdog device to NPCM750 device tree
  arm: dts: modify UART compatible name in NPCM750 device tree
  arm: dts: modify timer register size in NPCM750 device tree
  arm: dts: modify clock binding in NPCM750 device tree
  arm: dts: modify Makefile NPCM750 configuration name
  arm: dts: modify Nuvoton NPCM7xx device tree structure

 arch/arm/boot/dts/Makefile                    |   2 +-
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 187 ++++++++++++++++++++++++++
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts     |   6 +-
 arch/arm/boot/dts/nuvoton-npcm750.dtsi        | 131 +-----------------
 4 files changed, 198 insertions(+), 128 deletions(-)
 create mode 100644 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi

-- 
2.14.1
