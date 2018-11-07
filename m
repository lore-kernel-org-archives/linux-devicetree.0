Return-Path: <SRS0=GM37=NS=ti.com=j-keerthy@kernel.org>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 0/6] ARM: dts: am437x-gp-evm: Add pinctrl nodes 
Date: Wed, 7 Nov 2018 10:34:14 +0530
Message-ID: <1541567060-5671-1-git-send-email-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, d-gerlach@ti.com, t-kristo@ti.com, j-keerthy@ti.com
List-ID: <devicetree@vger.kernel.org>

The series adds pinctrl nodes for unused, debug, vtt, beeper
pins.

Tested on am437x-gp-evm for DS0. 

Dave Gerlach (5):
  ARM: dts: am437x-gp-evm: Add state for ddr3 vtt toggle pin
  ARM: dts: am437x-gp-evm: Add pinctrl for unused_pins
  ARM: dts: am437x-gp-evm: Add pinctrl for debugss pins
  ARM: dts: am437x-gp-evm: Add pinmux for gpio0 wake
  ARM: dts: am437x-gp-evm: Add uart0 pinctrl default and sleep states

Keerthy (1):
  ARM: dts: am437x-gp-evm: Add sleep state for beeper pins

 arch/arm/boot/dts/am437x-gp-evm.dts | 127 +++++++++++++++++++++++++++++++++---
 1 file changed, 117 insertions(+), 10 deletions(-)

-- 
1.9.1
