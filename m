Return-Path: <SRS0=Tq4V=PY=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCH 0/4] Stratix10 EDAC Improvements
Date: Wed, 16 Jan 2019 17:11:50 -0600
Message-Id: <1547680314-31045-1-git-send-email-thor.thayer@linux.intel.com>
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

This patch series includes a fix, an improvement and the
addition of OCRAM EDAC for Stratix10 SOCFPGA.

Thor Thayer (4):
  EDAC, altera: Fix S10 persistent register offset
  EDAC, altera: Less Intrusive Error Injection
  EDAC, altera: Add Stratix10 OCRAM ECC support
  arm64: dts: stratix10: Add OCRAM EDAC node

 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi |  7 +++
 drivers/edac/altera_edac.c                        | 52 ++++++++++++++---------
 drivers/edac/altera_edac.h                        |  6 +--
 3 files changed, 43 insertions(+), 22 deletions(-)

-- 
2.7.4
