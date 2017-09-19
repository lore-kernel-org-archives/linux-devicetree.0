From: Vignesh R <vigneshr@ti.com>
Subject: [RESEND PATCH 0/3] K2G: Add support for PWM ECAP
Date: Tue, 19 Sep 2017 11:45:48 +0530
Message-ID: <20170919061551.11981-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org


This series adds support for TI ECAP PWM IP present in 66AK2G SoC.
Resending based on today's linux-next.


Vignesh R (3):
  ARM: dts: keystone-k2g: Add ECAP PWM DT nodes
  ARM: dts: keystone-k2g-evm: Enable PWM ECAP0
  ARM: configs: keystone: Enable TIECAP PWM driver

 arch/arm/boot/dts/keystone-k2g-evm.dts | 12 ++++++++++++
 arch/arm/boot/dts/keystone-k2g.dtsi    | 20 ++++++++++++++++++++
 arch/arm/configs/keystone_defconfig    |  2 ++
 3 files changed, 34 insertions(+)

-- 
2.14.1
