From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 0/3] ARM: da850: enable cpufreq in DT mode
Date: Mon,  8 Apr 2019 09:59:21 +0200
Message-ID: <20190408075924.2284-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series adds cpufreq-dt operating points for da850 boards supported
with device tree (da850-lcdk, da850-lego-ev3, da850-evm).

Last patch enables CPUFREQ_DT in davinci_all_defconfig.

v1 -> v2:
- use the VDCDC3_1.2V regulator as cpu-supply on da850-evm

v2 -> v3:
- drop patch 1, as the revision tag is in fact correctly passed to the kernel
  by u-boot
- only enable the 375 operating point for da850-evm as this is the standard
  frequency for this board

Bartosz Golaszewski (1):
  ARM: dts: da850-evm: enable cpufreq

David Lechner (2):
  ARM: dts: da850: add cpu node and operating points to DT
  ARM: davinci_all_defconfig: Enable CPUFREQ_DT

 arch/arm/boot/dts/da850-evm.dts        | 13 ++++++
 arch/arm/boot/dts/da850-lcdk.dts       | 31 ++++++++++++++
 arch/arm/boot/dts/da850-lego-ev3.dts   | 30 ++++++++++++++
 arch/arm/boot/dts/da850.dtsi           | 56 ++++++++++++++++++++++++++
 arch/arm/configs/davinci_all_defconfig |  1 +
 5 files changed, 131 insertions(+)

-- 
2.21.0
