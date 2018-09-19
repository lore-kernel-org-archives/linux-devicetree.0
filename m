Return-Path: <SRS0=6+VU=MB=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCH 0/6] Add Peripheral EDACs to SOCFPGA Stratix10.
Date: Wed, 19 Sep 2018 14:38:55 -0500
Message-Id: <1537385941-11582-1-git-send-email-thor.thayer@linux.intel.com>
To: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

This series of patches adds peripheral EDAC support for the SOCFPGA
Stratix10. To ease the integration, restructuring of the existing
Stratix10 SDRAM EDAC occurred.
The Stratix10 peripheral support closely mirrors some of the Arria10
peripherals and they can share functions.

Thor Thayer (6):
  arm64: dts: stratix10: Additions to EDAC System Manager
  EDAC, altera: Combine Stratix10 and Arria10 probe functions
  arm64: dts: stratix10: Add SDRAM node
  EDAC, altera: Merge Stratix10 into Arria10 SDRAM probe
  EDAC, altera: Add Stratix10 peripheral support.
  arm64: dts: stratix10: Add peripheral EDAC nodes

 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi |  37 +-
 drivers/edac/altera_edac.c                        | 666 +++++++---------------
 drivers/edac/altera_edac.h                        |  73 +--
 3 files changed, 282 insertions(+), 494 deletions(-)

-- 
2.7.4
