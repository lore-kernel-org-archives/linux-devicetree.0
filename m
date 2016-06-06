From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 0/3] ARM: keystone-k2l: Enable pinctrl support
Date: Mon, 6 Jun 2016 10:15:03 +0530
Message-ID: <1465188306-32556-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ssantosh@kernel.org
Cc: j-keerthy@ti.com, lokeshvutla@ti.com, nm@ti.com, devicetree@vger.kernel.org, robh+dt@kernel.org, m-karicheri2@ti.com, fcooper@ti.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk
List-Id: devicetree@vger.kernel.org

The series enables pinctrl support for k2l devices.
Tested on keystone-k2l-evm board.

Franklin S Cooper Jr (1):
  ARM: configs: keystone: Enable PINCTRL_SINGLE Config

Keerthy (1):
  ARM: dts: keystone-k2l: Add pinctrl node

Lokesh Vutla (1):
  arm: mach-keystone: Enable PINCTRL config

 arch/arm/boot/dts/keystone-k2l.dtsi | 149 ++++++++++++++++++++++++++++++++++++
 arch/arm/configs/keystone_defconfig |   1 +
 arch/arm/mach-keystone/Kconfig      |   1 +
 3 files changed, 151 insertions(+)

-- 
1.9.1
