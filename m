From: thor.thayer@linux.intel.com
Subject: [PATCHv2 0/5] Update Stratix10 EDAC Bindings
Date: Wed, 27 Feb 2019 11:27:20 -0600
Message-ID: <1551288445-22335-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Instead of using the Arria10 (ARM32) EDAC bindings for
Stratix10 (ARM64), create Stratix10 specific EDAC bindings
to capture architecture differences between ARM32 and ARM64.
This requires fixing the previous Stratix10 bindings.
Also add the peripheral bindings for the Stratix10.

Thor Thayer (5):
  Documentation: dt: edac: Fix Stratix10 IRQ bindings
  Documentation: dt: edac: Add Stratix10 Peripheral bindings
  EDAC, altera: Skip DB IRQ for Stratix10
  arm64: dts: stratix10: Use new Stratix10 EDAC bindings
  EDAC, altera: Remove Stratix10 Machine compatible check

 .../devicetree/bindings/edac/socfpga-eccmgr.txt    | 129 +++++++++++++++++++--
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |  25 ++--
 drivers/edac/altera_edac.c                         |  49 ++++----
 3 files changed, 158 insertions(+), 45 deletions(-)

-- 
2.7.4
