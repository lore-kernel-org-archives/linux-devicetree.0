From: <tthayer@opensource.altera.com>
Subject: [PATCH 0/5] Set Arria10 ECC Manager IRQ Controller
Date: Wed, 25 May 2016 11:29:38 -0500
Message-ID: <1464193783-5071-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

The Arria10 IRQs for each peripheral ECC block funnel into 2 IRQs
[1 for single bit errors (SBERR) and 1 for double bit errors (DBERR)]
which are better handled by the IRQ controller and IRQ domain
framework than the IRQ handler in the current implementation.

The IRQ numbers (hwirq) in each peripheral ECC block (currently L2
and OCRAM) device tree node cannot be parsed using of_ functions
in the current implementation because these functions attach the
IRQ to an IRQ domain.

This patch set adds the IRQ controller/IRQ domain framework but
requires some device tree and binding changes as a result.

Thor Thayer (5):
  Documentation: dt: socfpga: Add interrupt-controller to ecc-manager
  EDAC, altera: ECC Manager IRQ controller support
  EDAC, altera: Handle Arria10 SDRAM child node.
  ARM: dts: Arria10 ECC Manager IRQ controller changes
  ARM: dts: Move Arria10 SDRAM as child of ECC Manager

 .../bindings/arm/altera/socfpga-eccmgr.txt         |   14 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi             |   19 +-
 drivers/edac/altera_edac.c                         |  182 +++++++++++++++-----
 drivers/edac/altera_edac.h                         |    5 +-
 4 files changed, 168 insertions(+), 52 deletions(-)

-- 
1.7.9.5
