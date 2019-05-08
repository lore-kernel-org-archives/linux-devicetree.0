From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 00/11] dts: Update DT bindings for CoreSight replicator and funnel
Date: Wed,  8 May 2019 10:18:51 +0800
Message-ID: <20190508021902.10358-1-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Mike Leach <mike.leach@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Chunyan Zhang <zhang.lyra@gma>
Cc: Leo Yan <leo.yan@linaro.org>, Guodong Xu <guodong.xu@linaro.org>, Zhangfei Gao <zhangfei.gao@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Lee Jones <lee.jones@linaro.org>, Chunyan Zhang <zhang.chunyan@linaro.org>
List-Id: devicetree@vger.kernel.org

Since the DT bindings consolidatoins for CoreSight replicator and funnel
is ready for kernel v5.2 merge window [1], this patch set is to update
the related CoreSight DT bindings for platforms; IIUC, this patch set
will be safe for merging into kernel v5.2 because the dependency
patches in [1] will be landed into mainline kernel v5.2 cycle.

In this patch set, it tries to update below two compatible strings to
the latest strings:

  s/"arm,coresight-replicator"/"arm,coresight-static-replicator"
  s/"arm,coresight-funnel"/"arm,coresight-dynamic-funnel"

Please note, some platforms have two continuous patches, one is for
updating static replicator compatible string and another is for dynamic
funnel change; and other platforms have only one patch since it only
needs to change for dynamic funnel.

Avoid to introduce merging confliction, I rebased this patch set on
linux-next branch with last commit fcdb095ad001 ("Add linux-next
specific files for 20190506").

This patch set has been tested on Arm Juno and Hikey620 boards, other
platforms are only compilation passing.

P.s. when use scirpt/checkpatch.pl, it reports the warnings as below. I
think we can ignore this warnings for this patch set, please review if
this makes sense for you.

WARNING: line over 80 characters
#29: FILE: arch/arm/boot/dts/imx7s.dtsi:178:
+                       compatible = "arm,coresight-dynamic-funnel", "arm,primecell";

[1] https://archive.armlinux.org.uk/lurker/message/20190412.102734.2afbb29a.en.html

== Changes for v2 ==
* Add explanation for the change in the commit logs. (Fabio)
* Merge the separate patches for funnel and replicator per DTS into
  a single patch. (Suzuki)


Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Guodong Xu <guodong.xu@linaro.org>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Chunyan Zhang <zhang.chunyan@linaro.org>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>


Leo Yan (11):
  ARM: dts: hip04: Update coresight DT bindings
  ARM: dts: imx7s: Update coresight DT bindings
  ARM: dts: qcom-apq8064: Update coresight DT bindings
  ARM: dts: ste: Update coresight DT bindings
  ARM: dts: vexpress-v2p-ca15_a7: Update coresight DT bindings
  ARM: dts: qcom-msm8974: Update coresight DT bindings
  arm64: dts: hi6220: Update coresight DT bindings
  arm64: dts: juno: Update coresight DT bindings
  arm64: dts: qcom-msm8916: Update coresight DT bindings
  arm64: dts: sc9836: Update coresight DT bindings
  arm64: dts: sc9860: Update coresight DT bindings

 arch/arm/boot/dts/hip04.dtsi                   | 18 +++++++++---------
 arch/arm/boot/dts/imx7s.dtsi                   |  6 +++---
 arch/arm/boot/dts/qcom-apq8064.dtsi            |  4 ++--
 arch/arm/boot/dts/qcom-msm8974.dtsi            |  6 +++---
 arch/arm/boot/dts/ste-dbx5x0.dtsi              |  4 ++--
 arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts     |  4 ++--
 arch/arm64/boot/dts/arm/juno-base.dtsi         |  6 +++---
 arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi      |  4 ++--
 .../boot/dts/hisilicon/hi6220-coresight.dtsi   |  6 +++---
 arch/arm64/boot/dts/qcom/msm8916.dtsi          |  4 ++--
 arch/arm64/boot/dts/sprd/sc9836.dtsi           |  2 +-
 arch/arm64/boot/dts/sprd/sc9860.dtsi           |  8 ++++----
 12 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.17.1
