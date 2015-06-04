From: <tthayer@opensource.altera.com>
Subject: [PATCHv2 0/4] Add Altera Arria10 EDAC Support
Date: Thu, 4 Jun 2015 09:28:44 -0500
Message-ID: <1433428128-7292-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

This series of patches adds support for the Arria10 EDAC. The
SDRAM controller and ECC registers are significantly different
from the CycloneV/ArriaV but common areas could be abstracted.

Thor Thayer (4):
  edac, altera: Generalize driver to use DT Memory size
  edac, altera: Refactor EDAC for Altera CycloneV SoC.
  edac, altera: Addition of Arria10 EDAC
  arm: socfpga: dts: Arria10 SDRAM EDAC DTS additions.

 .../bindings/arm/altera/socfpga-sdram-edac.txt     |    2 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi             |   11 +
 drivers/edac/altera_edac.c                         |  364 ++++++++++++--------
 drivers/edac/altera_edac.h                         |  201 +++++++++++
 4 files changed, 437 insertions(+), 141 deletions(-)
 create mode 100644 drivers/edac/altera_edac.h

-- 
1.7.9.5

