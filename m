From: Manish Narani <manish.narani@xilinx.com>
Subject: [PATCH v2 0/4] EDAC: Enhancements to Synopsys EDAC driver
Date: Thu, 2 Aug 2018 18:04:44 +0530
Message-ID: <1533213288-8771-1-git-send-email-manish.narani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, michal.simek@xilinx.com, bp@alien8.de, mchehab@kernel.org, mdf@kernel.org, edgar.iglesias@xilinx.com, shubhrajyoti.datta@xilinx.com, naga.sureshkumar.relli@xilinx.com, bharat.kumar.gogada@xilinx.com, stefan.krsmanovic@aggios.com
Cc: sgoud@xilinx.com, anirudh@xilinx.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, Manish Narani <manish.narani@xilinx.com>
List-Id: devicetree@vger.kernel.org

This patch series enhances the current EDAC driver to support different
platforms.This series adds support for ZynqMP DDRC controller in synopsys
EDAC driver. This series also adds Device tree properties and relevant
binding documentation.

Changes in v2:
	- Moved checking of DDR_ECC_INTR_SUPPORT from (1/4) to (3/4) as it is
	  a feature of ZynqMP DDRC
	- The Binding Documentation in (2/4) is modified as per the review
	  comments

Manish Narani (4):
  edac: synps: Add platform specific structures for ddrc controller
  dt: bindings: Document ZynqMP DDRC in Synopsys documentation
  edac: synopsys: Add EDAC ECC support for ZynqMP DDRC
  arm64: zynqmp: Add DDRC node

 .../bindings/memory-controllers/synopsys.txt       |  27 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |   7 +
 drivers/edac/Kconfig                               |   2 +-
 drivers/edac/synopsys_edac.c                       | 919 ++++++++++++++++++++-
 4 files changed, 922 insertions(+), 33 deletions(-)

-- 
2.1.1
