From: Wanglai Shi <shiwanglai@hisilicon.com>
Subject: [PATCH v2 0/3] Support static funnel and CoreSight DT on Hikey960
Date: Wed, 20 Mar 2019 20:38:07 +0800
Message-ID: <1553085490-42870-1-git-send-email-shiwanglai@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mathieu.poirier@linaro.org, suzuki.poulose@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, alexander.shishkin@linux.intel.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leo.yan@linaro.org, suzhuangluan@hisilicon.com
List-Id: devicetree@vger.kernel.org

From: Leo Yan <leo.yan@linaro.org>

Since before there have no platforms use static funnel in mainline
kernel (though maybe some in-house SoC has used it but didn't upstream
for mainline kernel yet so we don't be aware for it), when enable
CoreSight DT binding for hikey960, we found the SoC uses the static
funnel in the link path and but it's not supported in CoreSight funnel
driver.

So patches 0001/0002 are two patches to support static funnel, this
first patch is to update DT documentation to support static funnel (we
call it as non-configurable funnel in documentation); the second patch
is to support the static funnel in the CoreSight funnel driver.

Credits to Suzuki shared code for CoreSight replicator refactoring,
patches 0001/0002 heavily follows up the same fashion in Suzuki's shared
code.

Patch 0003 is the DT binding for CoreSight enabling on Hikey960, and
it's the first consumer for use static funnel binding.

This patch set has been tested on Hikey960 with perf command for trace
data recording and decoding with below commands:

  # perf record -e cs_etm/@20010000.etf/ --per-thread ./main
  # perf report --tui


Leo Yan (2):
  dt-bindings: arm: coresight: Support non-configurable funnel
  coresight: funnel: Support static funnel

Wanglai Shi (1):
  arm64: dts: hi3660: Add CoreSight support

 .../devicetree/bindings/arm/coresight.txt     |  45 +-
 .../boot/dts/hisilicon/hi3660-coresight.dtsi  | 456 ++++++++++++++++++
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |   2 +
 .../hwtracing/coresight/coresight-funnel.c    | 112 +++--
 4 files changed, 585 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi

-- 
2.17.1
