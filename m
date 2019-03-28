From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3 0/2] CoreSight: Support static funnel
Date: Thu, 28 Mar 2019 10:35:07 +0800
Message-ID: <20190328023509.22242-1-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, coresight@lists.linaro.org, Wanglai Shi <shiwanglai@hisilicon.com>
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

Since before there have no platforms use static funnel in mainline
kernel (though maybe some in-house SoC has used it but didn't upstream
for mainline kernel yet so we don't be aware for it), when enable
CoreSight DT binding for hikey960, we found the SoC uses the static
funnel in the link path and but it's not supported in CoreSight funnel
driver.

So the first patch is to update DT documentation to support static
funnel (we call it as non-configurable funnel in documentation); the
second patch is to support the static funnel in the CoreSight funnel
driver.

Credits to Suzuki shared code for CoreSight replicator refactoring,
the static funnel related implementation heavily follows up the same
fashion in Suzuki's replicator code.

This patch set has been rebased on CoreSight next branch [1] with
latest commit d5d246a56af0 ("coresight: Merge the static and dynamic
replicator drivers") and tested on Hikey960 with perf commands:

  # perf record -e cs_etm/@20010000.etf/ --per-thread ./main
  # perf report --tui

P.s. in this version, Hikey960 CoreSight DT binding has not been
included and will be sent out separately.

[1] https://git.linaro.org/kernel/coresight.git/log/?h=next


Leo Yan (2):
  dt-bindings: arm: coresight: Support static funnel
  coresight: funnel: Support static funnel

 .../devicetree/bindings/arm/coresight.txt     |  45 ++++++-
 .../hwtracing/coresight/coresight-funnel.c    | 112 +++++++++++++-----
 2 files changed, 127 insertions(+), 30 deletions(-)

-- 
2.17.1
