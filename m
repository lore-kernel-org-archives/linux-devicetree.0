From: Ding Tianhong <dingtianhong@huawei.com>
Subject: [PATCH v3 0/2] arm64: Support Hisilicon Hip05-D02 board
Date: Sun, 6 Sep 2015 17:34:33 +0800
Message-ID: <1441532075-9452-1-git-send-email-dingtianhong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, marc.zyngier@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob.herring@linaro.org, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, xuwei5@hisilicon.com, leo.yan@linaro.org, zhizhou.zh@gmail.com, linuxarm@huawei.com
List-Id: devicetree@vger.kernel.org

Hip05-D02 Development Board is based on Cortex-A57, this patchset
contains initial support for Hip05-D02 Soc and Board. Initial support
is minimal and includes just the arch configuration, device tree
configuration.

PSCI is enabled in device tree and there is no problem to boot all the
16 cores, and the CPU hotplug is also working now, you can download and
compile the latest firmware based on the following link to run this
patch set.

https://github.com/hisilicon/estuary/blob/master/README

v3->v2:
- 1. Change the compatible name for per CPU to arm,cortex-a57.
  2. limit the ITS region to 256k.

v1->v2:
- 1. Change the compatible name for per CPU.
  2. Remove the GIC_CPU_MASK_SIMPLE(xx) which is not used for gicv3
     from hip05.dtsi.

Ding Tianhong (2):
  arm64: hip05-d02: Document devicetree bindings for Hisilicon Hip05-D02
    Board
  arm64: dts: add dts files for Hisilicon Hip05-D02 Development Board

 .../bindings/arm/hisilicon/hisilicon.txt           |   4 +
 arch/arm64/boot/dts/hisilicon/Makefile             |   2 +-
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts        |  36 +++
 arch/arm64/boot/dts/hisilicon/hip05.dtsi           | 271 +++++++++++++++++++++
 4 files changed, 312 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/hisilicon/hip05-d02.dts
 create mode 100644 arch/arm64/boot/dts/hisilicon/hip05.dtsi

-- 
1.9.0
