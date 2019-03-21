From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] ARM: da850: enable cpufreq in DT mode
Date: Thu, 21 Mar 2019 15:10:06 +0100
Message-ID: <20190321141010.19612-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series adds cpufreq-dt operating points for da850 boards supported
with device tree (da850-lcdk, da850-lego-ev3, da850-evm) and also
includes a fix for the da850-evm boardfile which checks an unset variable
to determine the highest available frequency for cpufreq.

Last patch enables CPUFREQ_DT in davinci_all_defconfig.

Bartosz Golaszewski (2):
  ARM: davinci: fix cpufreq registration on da850-evm
  ARM: dts: da850-evm: enable cpufreq

David Lechner (2):
  ARM: dts: da850: add cpu node and operating points to DT
  ARM: davinci_all_defconfig: Enable CPUFREQ_DT

 arch/arm/boot/dts/da850-evm.dts         | 30 +++++++++++++
 arch/arm/boot/dts/da850-lcdk.dts        | 31 ++++++++++++++
 arch/arm/boot/dts/da850-lego-ev3.dts    | 30 +++++++++++++
 arch/arm/boot/dts/da850.dtsi            | 56 +++++++++++++++++++++++++
 arch/arm/configs/davinci_all_defconfig  |  1 +
 arch/arm/mach-davinci/board-da850-evm.c | 12 +-----
 6 files changed, 149 insertions(+), 11 deletions(-)

-- 
2.20.1
