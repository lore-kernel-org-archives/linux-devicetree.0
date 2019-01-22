Return-Path: <SRS0=pK1f=P6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:60583 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725896AbfAVRpg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 22 Jan 2019 12:45:36 -0500
From: thor.thayer@linux.intel.com
Subject: [PATCHv2 0/4] Stratix10 EDAC Improvements
Date: Tue, 22 Jan 2019 11:48:03 -0600
Message-Id: <1548179287-21760-1-git-send-email-thor.thayer@linux.intel.com>
Sender: devicetree-owner@vger.kernel.org
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, james.morse@arm.com
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

This patch series includes a fix, an improvement and the
addition of OCRAM EDAC for Stratix10 SOCFPGA.

V2: Ensure the Fixes: line is on one line.

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
