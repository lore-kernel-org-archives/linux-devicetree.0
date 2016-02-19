From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH V5 0/3] add gpio/pinctrl/spi DTS for hi6220 and hikey
Date: Fri, 19 Feb 2016 19:58:24 +0800
Message-ID: <1455883107-8411-1-git-send-email-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, xuyiping@hisilicon.com, bintian.wang@huawei.com, haojian.zhuang@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, w.f@huawei.com, dan.zhao@hisilicon.com, zhongkaihua@huawei.com, kong.kongxinwei@hisilicon.com, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

As of V4, this patchset has been ack'ed by Rob Herring.

V5, added pmx0 pmx1 pmx2 nodes description into hi6220.dtsi.

Zhong Kaihua (3):
  arm64: dts: Add Hi6220 gpio configuration nodes
  arm64: dts: add Hi6220 pinctrl configuration nodes
  arm64: dts: add Hi6220 spi configuration nodes

 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts   |   3 +
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi        | 351 +++++++++++
 arch/arm64/boot/dts/hisilicon/hikey-gpio.dtsi    | 607 +++++++++++++++++++
 arch/arm64/boot/dts/hisilicon/hikey-pinctrl.dtsi | 705 +++++++++++++++++++++++
 include/dt-bindings/pinctrl/hisi.h               |  59 ++
 5 files changed, 1725 insertions(+)
 create mode 100644 arch/arm64/boot/dts/hisilicon/hikey-gpio.dtsi
 create mode 100644 arch/arm64/boot/dts/hisilicon/hikey-pinctrl.dtsi
 create mode 100644 include/dt-bindings/pinctrl/hisi.h

-- 
1.9.1
