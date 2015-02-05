From: Bintian Wang <bintian.wang@huawei.com>
Subject: [PATCH 0/3] arm64,hi6220: Enable Hisilicon Hi6220 SoC
Date: Thu, 5 Feb 2015 17:24:34 +0800
Message-ID: <1423128277-10297-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, khilman@linaro.org, mturquette@linaro.org, rob.herring@linaro.org, zhangfei.gao@linaro.org, haojian.zhuang@linaro.org, xuwei5@hisilicon.com, jh80.chung@samsung.com, olof@lixom.net, yanhaifeng@gmail.com, sboyd@codeaurora.org, xuejiancheng@huawei.com, sledge.yanwei@huawei.com, tomeu.vizoso@collabora.com, linux@arm.linux.org.uk, guodong.xu@linaro.org
Cc: xuyiping@hisilicon.com, wangbinghui@hisilicon.com, zhenwei.wang@hisilicon.com, victor.lixin@hisilicon.com, puck.chen@hisilicon.com, dan.zhao@hisilicon.com, huxinwei@huawei.com, bintian.wang@huawei.com, z.liuxinliang@huawei.com, heyunlei@huawei.com, kong.kongxinwei@hisilicon.com, btw@mail.itp.ac.cn, w.f@huawei.com, liguozhu@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hello,

Hi6220 is one mobile solution of Hisilicon, this patchset contains
initial support for Hi6220 SoC and HiKey development board, which
is based on ARM Cortex A53 architecture. Initial support is minimal
and includes just the arch configuration, clock driver, device tree
configuration. 

Many peripheral drivers will be submitted later.

Any comments will be appreciated!

Thanks,  

Bintian Wang (3):
  arm64: Enable Hisilicon ARMv8 SoC family in Kconfig and defconfig
  clk: hi6220: Clock driver support for Hisilicon hi6220 SoC
  arm64: dts: Add dts files for Hisilicon Hi6220 SoC

 .../bindings/arm/hisilicon/hisilicon.txt           |   33 +++
 .../devicetree/bindings/clock/hi6220-clock.txt     |   30 +++
 arch/arm64/Kconfig                                 |    6 +
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/hisilicon/Makefile             |    5 +
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts     |   31 +++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |  204 ++++++++++++++
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/Kconfig                                |    2 +
 drivers/clk/Makefile                               |    4 +-
 drivers/clk/hisilicon/Kconfig                      |    5 +
 drivers/clk/hisilicon/Makefile                     |    1 +
 drivers/clk/hisilicon/clk-hi6220.c                 |  284 ++++++++++++++++++++
 drivers/clk/hisilicon/clk.c                        |   29 ++
 drivers/clk/hisilicon/clk.h                        |   17 ++
 drivers/clk/hisilicon/clkdivider-hi6220.c          |  273 +++++++++++++++++++
 include/dt-bindings/clock/hi6220-clock.h           |  172 ++++++++++++
 17 files changed, 1095 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/hi6220-clock.txt
 create mode 100644 arch/arm64/boot/dts/hisilicon/Makefile
 create mode 100644 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
 create mode 100644 arch/arm64/boot/dts/hisilicon/hi6220.dtsi
 create mode 100644 drivers/clk/hisilicon/Kconfig
 create mode 100644 drivers/clk/hisilicon/clk-hi6220.c
 create mode 100644 drivers/clk/hisilicon/clkdivider-hi6220.c
 create mode 100644 include/dt-bindings/clock/hi6220-clock.h

-- 
1.7.9.5
