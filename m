From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v7 0/1] Broadcom Stingray SOC Initial Support
Date: Tue,  6 Jun 2017 09:53:57 +0530
Message-ID: <1496723038-4693-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Oza Pawandeep <oza.oza@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Pramod Kumar <pramod.kumar@broadcom.com>, Sandeep Tripathy <sandeep.tripathy@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patchset adds initial support of Broadcom Stingray SOC
by reusing existing Broadcom iProc device drivers.

Most of the patches in this patchset are DT patches except
the Stingray clock tree support which just one patch.

This patchset is based on Linux-4.12-rc4 and it is also available
at stingray-v7 branch of https://github.com/Broadcom/arm64-linux.git

Changes since v6:
 - Rebased patches for Linux-4.12-rc3
 - Dropped all patches except PATCH3 because these are
   already applied in Broadcom tree
 - Dropped __init usage in clk-sr driver
 - Add tab indentation for sr_clk_dt_ids in clk-sr driver
 - Made various clk init functions similar to platform probe function
   in clk-sr driver
 - Use of_device_get_match_data() instead of of_match_device()
   in clk-sr driver

Changes since v5:
 - Rebased patches for Linux-4.12-rc3
 - Update DT node names to match register offset

Changes since v4:
 - Reduce number of include headers in Stingray clk driver

Changes since v3:
 - Rebased patches for Linux-4.12-rc1
 - Updated PATCH3 to have all clocks except genpll3 to be
   registered via platform driver probe

Changes since v2:
 - Remove default bootargs from chosen DT node
 - Remove "linux" prefix from stdout DT attribute of chosen DT node
 - Remove use of GIC_CPU_MASK_xxx() for PPIs

Changes since v1:
 - Rebased patches for Linux-4.12-rc1
 - Removed unwanted /memreserve/ from bcm958742-base.dtsi
 - Use ranges DT property to clear view of memory-layout
 - Make bcm-sr.h part of clock DT bindings patch

Sandeep Tripathy (1):
  clk: bcm: Add clocks for Stingray SOC

 drivers/clk/bcm/Kconfig  |   8 ++
 drivers/clk/bcm/Makefile |   1 +
 drivers/clk/bcm/clk-sr.c | 327 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 336 insertions(+)
 create mode 100644 drivers/clk/bcm/clk-sr.c

-- 
2.7.4

