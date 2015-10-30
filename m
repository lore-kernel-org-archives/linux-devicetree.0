From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v4 0/3] NAND support for Broadcom NS2 SoC
Date: Fri, 30 Oct 2015 11:48:55 +0530
Message-ID: <1446185938-17520-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Linux MTD <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Pramod KUMAR <pramodku@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>, Sandeep Tripathy <tripathy@broadcom.com>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, Device Tree <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

We enable NAND support for Broadcom NS2 SoC by reusing existing
BRCMNAND driver.

This patchset applies on-top of "arm64: Simple additions to
NS2 DT" v1 patchset and is available in ns2_nand_v4 branch of
https://github.com/Broadcom/arm64-linux.git.

The patchset is tested on NS2 SVK.

Changes since v3:
 - Include Brian's patch for magic number cleanup related to
   CFG and CFG_EXT registers
 - Base patch1 of v3 patchset upon Brian's cleanup patch

Changes since v2:
 - Dropped patch1 and patch2 because these are already merged
   by MTD maintainer.
 - Avoid using absolute node paths in ns2-svk.dts.

Changes since v1:
 - Dropped patch3 and patch4 because we don't need to reset
   BRCMNAND controller for NS2.
 - Added patch to force 8bit mode before doing nand_scan_ident()
   in brcmnand_init_cs().

Anup Patel (2):
  mtd: brcmnand: Force 8bit mode before doing nand_scan_ident()
  arm64: dts: Add BRCM IPROC NAND DT node for NS2

Brian Norris (1):
  mtd: brcmnand: factor out CFG and CFG_EXT bitfields

 arch/arm64/boot/dts/broadcom/ns2-svk.dts | 30 +++++++++++++-------
 arch/arm64/boot/dts/broadcom/ns2.dtsi    | 14 ++++++++++
 drivers/mtd/nand/brcmnand/brcmnand.c     | 48 +++++++++++++++++++++++++++-----
 3 files changed, 75 insertions(+), 17 deletions(-)

-- 
1.9.1
