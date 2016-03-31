From: <tthayer@opensource.altera.com>
Subject: [PATCHv2 0/7] Add Altera Arria10 OCRAM EDAC support
Date: Thu, 31 Mar 2016 13:48:00 -0500
Message-ID: <1459450087-24792-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer@opensource.altera.com
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

This series of patches adds the Arria10 OCRAM EDAC support

Thor Thayer (7):
  EDAC, altera: New file operations for Arria10 ECC modules
  EDAC, altera: Add register offset for ECC Enable
  EDAC, altera: Make OCRAM ECC dependency check generic
  Documentation: dt: socfpga: Add Altera Arria10 OCRAM binding
  EDAC, altera: Addition of Arria10 OCRAM ECC
  ARM: socfpga: Enable Arria10 OCRAM ECC on startup
  ARM: dts: Add Altera Arria10 OCRAM EDAC devicetree entry

 .../bindings/arm/altera/socfpga-eccmgr.txt         |   10 ++
 arch/arm/boot/dts/socfpga_arria10.dtsi             |    5 +
 arch/arm/mach-socfpga/ocram.c                      |  128 ++++++++++++++++++++
 drivers/edac/altera_edac.c                         |  127 +++++++++++++++----
 drivers/edac/altera_edac.h                         |   37 ++++++
 5 files changed, 284 insertions(+), 23 deletions(-)

-- 
1.7.9.5

