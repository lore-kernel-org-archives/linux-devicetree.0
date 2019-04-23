From: thor.thayer@linux.intel.com
Subject: [PATCH 0/4] Add Stratix10 OCRAM & SDMMC EDAC Support
Date: Tue, 23 Apr 2019 09:36:33 -0500
Message-ID: <1556030197-24534-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

This patch series adds EDAC support for the Stratix10 OCRAM
and SDMMC peripherals.

Thor Thayer (4):
  EDAC, altera: Add Stratix10 OCRAM ECC support
  arm64: dts: stratix10: Add OCRAM EDAC node
  EDAC, altera: Add Stratix10 SDMMC support
  arm64: dts: stratix10: Add SDMMC EDAC node

 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |  8 ++++
 .../boot/dts/altera/socfpga_stratix10_socdk.dts    | 11 ++++++
 drivers/edac/altera_edac.c                         | 43 ++++++++++++++++++++--
 3 files changed, 59 insertions(+), 3 deletions(-)

-- 
2.7.4
