From: thor.thayer@linux.intel.com
Subject: [PATCHv3 0/3] Update Stratix10 EDAC Bindings
Date: Mon, 25 Mar 2019 10:57:53 -0500
Message-ID: <1553529476-26181-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: mchehab@kernel.org, james.morse@arm.com, thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

This patch series makes the Stratix10 EDAC Bindings
specific to the Stratix10 ARM64 architecture.

Instead of using the Arria10 (ARM32) EDAC bindings for
Stratix10 (ARM64), create Stratix10 specific EDAC bindings
to capture architecture differences between ARM32 and ARM64.
This requires fixing the previous Stratix10 bindings.
Also add the peripheral bindings for the Stratix10.

V2: Remove Stratix10 compatible check.

V3: Remove patches not related to EDAC bindings so that
    this patchset is targeted toward the bindings.
    Improve the Stratix10 specific binding description by
    adding in descriptions of ARM64 differences.

Thor Thayer (3):
  Documentation: dt: edac: Fix Stratix10 IRQ bindings
  Documentation: dt: edac: Add Stratix10 Peripheral bindings
  arm64: dts: stratix10: Use new Stratix10 EDAC bindings

 .../devicetree/bindings/edac/socfpga-eccmgr.txt    | 135 +++++++++++++++++++--
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |  25 ++--
 2 files changed, 138 insertions(+), 22 deletions(-)

-- 
2.7.4
