From: <tthayer@altera.com>
Subject: [PATCHv7 0/3] Addition of Altera SDRAM Controller Summary
Date: Wed, 25 Jun 2014 16:15:24 -0500
Message-ID: <1403730927-16163-1-git-send-email-tthayer@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: robherring2@gmail.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, dinguyen@altera.com, dougthompson@xmission.com, grant.likely@linaro.org, bp@alien8.de
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com, tthayer@altera.com
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@altera.com>

This patch series adds Altera SDRAM EDAC support.

The one sticky issue seems to be the use of "syscon". One register
in the SDRAM controller shares bitfields with different functionality.
In this series the devicetree includes the "syscon" designation
for the SDRAM Controller [patch 1] but the bindings document does not.
This flexibility means future generations of SDRAM controller may
correct this sharing of bitfields without changes to the bindings.

Thor Thayer (3):
  devicetree: Addition of the Altera SDRAM Controller. 
    Add the Altera SDRAM controller bindings and device tree 
    changes to the Altera SoC project.
  devicetree: Addition of the Altera SDRAM EDAC. 
    Add the Altera SDRAM EDAC bindings and device tree changes 
    to the Altera SoC project.
  edac: altera: Add EDAC support for Altera SoC SDRAM Controller.    
    This patch adds support for the CycloneV and ArriaV SDRAM    
    controllers. Correction and reporting of SBEs, Panic on DBEs.

 .../bindings/arm/altera/socfpga-sdram-edac.txt     |   15 +
 .../bindings/arm/altera/socfpga-sdram.txt          |   11 +
 arch/arm/boot/dts/socfpga.dtsi                     |   11 +
 drivers/edac/Kconfig                               |    9 +
 drivers/edac/Makefile                              |    2 +
 drivers/edac/altera_edac.c                         |  448 ++++++++++++++++++++
 6 files changed, 496 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt
 create mode 100644 drivers/edac/altera_edac.c

-- 
1.7.9.5

