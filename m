From: <tthayer@altera.com>
Subject: [PATCHv8 0/3] Addition of Altera SDRAM Controller
Date: Fri, 27 Jun 2014 10:26:56 -0500
Message-ID: <1403882819-24929-1-git-send-email-tthayer@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robherring2@gmail.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, dinguyen@altera.com, dougthompson@xmission.com, grant.likely@linaro.org, bp@alien8.de
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com, tthayer@altera.com
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@altera.com>

Thor Thayer (3):
  devicetree: Addition of the Altera SDRAM Controller.     Add the
    Altera SDRAM controller bindings and device     tree changes to the
    Altera SoC project.
  devicetree: Addition of the Altera SDRAM EDAC.     Add the Altera
    SDRAM EDAC bindings and device tree     changes to the Altera SoC
    project.
  edac: altera: Add EDAC support for Altera SoC SDRAM Controller.    
    This patch adds support for the CycloneV and ArriaV SDRAM    
    controllers.     Correction and reporting of SBEs, Panic on DBEs.

 .../bindings/arm/altera/socfpga-sdram-edac.txt     |   15 +
 .../bindings/arm/altera/socfpga-sdram.txt          |   11 +
 arch/arm/boot/dts/socfpga.dtsi                     |   11 +
 drivers/edac/Kconfig                               |    9 +
 drivers/edac/Makefile                              |    2 +
 drivers/edac/altera_edac.c                         |  449 ++++++++++++++++++++
 6 files changed, 497 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram-edac.txt
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt
 create mode 100644 drivers/edac/altera_edac.c

-- 
1.7.9.5
