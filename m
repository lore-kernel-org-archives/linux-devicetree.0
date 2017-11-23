From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH 0/6] 66AK2G: Add DT nodes for few peripherals
Date: Thu, 23 Nov 2017 13:21:48 +0530
Message-ID: <20171123075154.3938-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

This patch series adds DT nodes for bunch of peripherials on 66AK2G EVM and
66AK2G ICE boards.

Tested on 66AK2G EVM and ICE boards


Vignesh R (6):
  ARM: dts: keystone-k2g: Add QSPI DT entry
  ARM: dts: keystone-k2g-evm: Fix botched up merge
  ARM: dts: keystone-k2g: Move ti,non-removable property to board dts
  ARM: dts: keystone-k2g-evm: Add QSPI DT node.
  ARM: dts: keystone-k2g-ice: Add DT nodes for few peripherals
  ARM: configs: keystone_defconfig: Enable few peripheral drivers

 arch/arm/boot/dts/keystone-k2g-evm.dts |  90 +++++++--
 arch/arm/boot/dts/keystone-k2g-ice.dts | 336 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/keystone-k2g.dtsi    |  15 +-
 arch/arm/configs/keystone_defconfig    |   7 +
 4 files changed, 431 insertions(+), 17 deletions(-)

-- 
2.15.0
