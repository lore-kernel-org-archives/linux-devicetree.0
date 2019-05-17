Return-Path: <SRS0=gB64=TR=ti.com=j-keerthy@kernel.org>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH v2 0/4] dra71/76: Fix boot issues
Date: Fri, 17 May 2019 06:44:05 +0530
Message-ID: <20190517011409.22167-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, t-kristo@ti.com, j-keerthy@ti.com
List-ID: <devicetree@vger.kernel.org>

This series adds patches that fix boot on dra76/71-evms.

Changes in v2:

  * Pushed the disabling to dra76x and dra71x.dtsi respectively

Keerthy (4):
  arm: dts: dra76x: Disable rtc target module
  arm: dts: dra76x: Disable usb4_tm target module
  arm: dts: dra71x: Disable rtc target module
  arm: dts: dra71x: Disable usb4_tm target module

 arch/arm/boot/dts/dra7-l4.dtsi  |  2 +-
 arch/arm/boot/dts/dra71-evm.dts |  2 +-
 arch/arm/boot/dts/dra71x.dtsi   | 17 +++++++++++++++++
 arch/arm/boot/dts/dra76x.dtsi   |  8 ++++++++
 4 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/dra71x.dtsi

-- 
2.17.1
