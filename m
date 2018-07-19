Return-Path: <SRS0=Hazi=KD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr680070.outbound.protection.outlook.com ([40.107.68.70]:38316
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726574AbeGSK5i (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Jul 2018 06:57:38 -0400
From: Manish Narani <manish.narani@xilinx.com>
Subject: [PATCH 0/4] EDAC: Enhancements to Synopsys EDAC driver
Date: Thu, 19 Jul 2018 15:44:46 +0530
Message-ID: <1531995290-15643-1-git-send-email-manish.narani@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, mdf@kernel.org, willw@xilinx.com, naga.sureshkumar.relli@xilinx.com, edgar.iglesias@xilinx.com, bharat.kumar.gogada@xilinx.com, shubhrajyoti.datta@xilinx.com, stefan.krsmanovic@aggios.com
Cc: anirudh@xilinx.com, sgoud@xilinx.com, Manish Narani <manish.narani@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

This patch series enhances the current EDAC driver to support different
platforms.This series adds support for ZynqMP DDRC controller in synopsys
EDAC driver. This series also adds Device tree properties and relevant
binding documentation.

Manish Narani (4):
  edac: synps: Add platform specific structures for ddrc controller
  dt: bindings: Document ZynqMP DDRC in Synopsys documentation
  edac: synopsys: Add EDAC ECC support for ZynqMP DDRC
  arm64: zynqmp: Add DDRC node

 .../bindings/memory-controllers/synopsys.txt       |  25 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |   7 +
 drivers/edac/Kconfig                               |   2 +-
 drivers/edac/synopsys_edac.c                       | 916 ++++++++++++++++++++-
 4 files changed, 918 insertions(+), 32 deletions(-)

-- 
2.1.1

