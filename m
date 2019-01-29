Return-Path: <SRS0=zDJw=QF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:6466 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727339AbfA2WBd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 29 Jan 2019 17:01:33 -0500
From: thor.thayer@linux.intel.com
Subject: [PATCH 0/4] Update Stratix10 EDAC Bindings
Date: Tue, 29 Jan 2019 16:03:44 -0600
Message-Id: <1548799428-10541-1-git-send-email-thor.thayer@linux.intel.com>
Sender: devicetree-owner@vger.kernel.org
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, james.morse@arm.com
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Instead of using the Arria10 (ARM32) EDAC bindings for
Stratix10 (ARM64), create Stratix10 specific EDAC bindings
to capture architecture differences between ARM32 and ARM64.
This requires fixing the previous Stratix10 bindings.
Also add the peripheral bindings for the Stratix10.

Thor Thayer (4):
  Documentation: dt: edac: Fix Stratix10 IRQ bindings
  Documentation: dt: edac: Add Stratix10 Peripheral bindings
  EDAC, altera: Skip DB IRQ for Stratix10
  arm64: dts: stratix10: Use new Stratix10 EDAC bindings

 .../devicetree/bindings/edac/socfpga-eccmgr.txt    | 129 +++++++++++++++++++--
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |  25 ++--
 drivers/edac/altera_edac.c                         |  31 ++---
 3 files changed, 153 insertions(+), 32 deletions(-)

-- 
2.7.4
