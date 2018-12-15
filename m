From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] Add board support for Chameleon96 Board
Date: Sat, 15 Dec 2018 08:31:50 +0530
Message-ID: <20181215030152.4386-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dinguyen@kernel.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, amit.kucheria@linaro.org, yossi@novtech.com, nazik@novtech.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patchset adds board support for Chameleon96 board from Novetech
based on Intel Cyclone V SoC FPGA. This board is one of the Consumer
Edition boards of the 96Boards family and has the following key features:
    
* SoC - Intel Cyclone V SoC FPGA
* GPU - Graphics based on Intel Video Suite for FPGA
* RAM - 512MB DDR3L
* USB - 2x USB2.0 Host, 1x USB2.0 OTG
* Wireless - Wifi, BT
    
More information about this board can be found in 96Boards product
page: https://www.96boards.org/product/chameleon96/

This patchset has been tested on Chameleon96 board and the board boots
into a distro on SD card with USB ports working.

Thanks,
Mani

Manivannan Sadhasivam (2):
  dt-bindings: vendor-prefixes: Add Novtech Vendor Prefix
  ARM: dts: Add support for 96Boards Chameleon96 board

 .../devicetree/bindings/vendor-prefixes.txt   |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/socfpga_cyclone5_chameleon96.dts | 130 ++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dts

-- 
2.17.1
