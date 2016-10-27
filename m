Return-Path: <j-keerthy@ti.com>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 0/4] mfd: palmas: add powerhold overriding during power off
Date: Thu, 27 Oct 2016 14:40:10 +0530
Message-ID: <1477559414-12520-1-git-send-email-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com, lee.jones@linaro.org, robh+dt@kernel.org
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, nm@ti.com, j-keerthy@ti.com, t-kristo@ti.com
List-ID: <devicetree@vger.kernel.org>

The series lets one over powerhold for pmic.
The powerhold is used to keep the pmic power on even
after the DEV_CTRL On bit is set to off.

Tested on am572x-idk board for poweroff.

Keerthy (4):
  Documentation: pinctrl: palmas: Add ti,palmas-powerhold-override
    property definition
  mfd: palmas: Reset the POWERHOLD mux during power off
  arm: dts: am57xx-beagle-x15-common: Add overide powerhold property
  arm: dts: am57xx-idk-common: Add overide powerhold property

 .../devicetree/bindings/pinctrl/pinctrl-palmas.txt     |  9 +++++++++
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi        |  1 +
 arch/arm/boot/dts/am57xx-idk-common.dtsi               |  1 +
 drivers/mfd/palmas.c                                   | 18 ++++++++++++++++++
 4 files changed, 29 insertions(+)

-- 
1.9.1
