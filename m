From: Jagan Teki <jagannadh.teki@gmail.com>
Subject: [PATCH 0/9] rockchip: rk3288-vyasa: dts fixes/additions
Date: Mon, 16 Oct 2017 17:46:18 +0530
Message-ID: <1508156187-27519-1-git-send-email-jagan@amarulasolutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Michael Trimarchi <michael@amarulasolutions.com>, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Series add new dts nodes like gmac, usb, io_domains and fixed existing
regulator, pmic stuff as per schematic. 

Jagan Teki (9):
  ARM: dts: rockchip: rk3288-vyasa: Remove vdd_log from rk808, DCDC_REG1
  ARM: dts: rockchip: rk3288-vyasa: Use fixed voltage range for vccio_sd
  ARM: dts: rockchip: rk3288-vyasa: Use vmmc-supply from PMIC
  ARM: dts: rockchip: Add regulators for rk3288-vyasa
  ARM: dts: rockchip: Add gmac support for rk3288-vyasa board
  ARM: dts: rockchip: Add usb host for rk3288-vyasa
  ARM: dts: rockchip: Add usb otg for rk3288-vyasa
  ARM: dts: rockchip: Add io domains for rk3288-vyasa
  ARM: multi_v7_defconfig: Statically build RTC_DRV_RK808

 arch/arm/boot/dts/rk3288-vyasa.dts     | 181 ++++++++++++++++++++++++++++++---
 arch/arm/configs/multi_v7_defconfig    |   2 +-
 include/dt-bindings/pinctrl/rockchip.h |   1 +
 3 files changed, 168 insertions(+), 16 deletions(-)

-- 
2.7.4
