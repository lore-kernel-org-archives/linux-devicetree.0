From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/1] arm: dts: modify Nuvoton NPCM750 device tree
Date: Mon, 26 Mar 2018 13:11:52 +0300
Message-ID: <1522059113-20418-1-git-send-email-tmaimon77@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, avifishman70@gmail.com, brendanhiggins@google.com, venture@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: devicetree@vger.kernel.org

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

In addition, the NPCM7xx device tree include the following changes:
        - watchdog module added
        - clock module modification
        - serial module modification
        - Modify Makefile NPCM7XX configuration name

Sorry if it cause more work after pushing NPCM750 device tree.

Thanks a lot,

Tomer

Tomer Maimon (1):
  arm: dts: modify Nuvoton NPCM750 device tree

 arch/arm/boot/dts/Makefile                    |   2 +-
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 187 ++++++++++++++++++++++++++
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts     |   6 +-
 arch/arm/boot/dts/nuvoton-npcm750.dtsi        | 131 +-----------------
 4 files changed, 198 insertions(+), 128 deletions(-)
 create mode 100644 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi

-- 
2.14.1
