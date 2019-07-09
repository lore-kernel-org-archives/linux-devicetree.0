Return-Path: <SRS0=cJxD=VG=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCH 0/3] Stratix10 SDRAM Common EDAC Framework
Date: Tue,  9 Jul 2019 17:24:47 -0500
Message-Id: <1562711090-900-1-git-send-email-thor.thayer@linux.intel.com>
To: bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Use the common Altera EDAC Device Framework for the SDRAM so that
Double Bit Error Addresses can be tracked for SDRAM.
This also simplifies the device tree.

Thor Thayer (3):
  Documentation: dt: edac: Add reg to S10 SDRAM node
  arm64: dts: Stratix10: Include regs in SDRAM ECC node
  EDAC, altera: Use common framework for Stratix10 SDRAM ECC

 .../devicetree/bindings/edac/socfpga-eccmgr.txt    |  4 ++-
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |  9 ++----
 drivers/edac/altera_edac.c                         | 32 ++++++++++++++++++++--
 drivers/edac/altera_edac.h                         | 25 ++++++++++++++++-
 4 files changed, 58 insertions(+), 12 deletions(-)

-- 
2.7.4
