From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 0/4] CoreSight: Support static funnel with DT binding consolidation
Date: Sat,  6 Apr 2019 19:21:41 +0800
Message-ID: <20190406112145.15184-1-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Wanglai Shi <shiwanglai@hisilicon.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

Since before there have no platforms use static funnel in mainline
kernel (though maybe some in-house SoC has used it but didn't upstream
for mainline kernel yet so we don't be aware for it), when enable
CoreSight DT binding for hikey960, we found the SoC uses the static
funnel in the link path and but it's not supported in CoreSight funnel
driver.

When support static funnel it's found the DT binding compatible string
doesn't follow the same fashion between replicator and funnel; so the
first two patches are firstly to refine the replicator DT binding and
correspondingly, change the replicator driver to support new DT binding
compatible.

Patch 0003 is to update DT documentation to support static funnel (we
call it as non-configurable funnel in documentation) and unify the
compatible string with the same fashion for replicator and funnel.

Patch 0004 is to support the static funnel in the CoreSight funnel
driver.

This patch set has been rebased on CoreSight next branch [1] with
latest commit d5d246a56af0 ("coresight: Merge the static and dynamic
replicator drivers") and tested on Hikey960/Hikey with perf commands:

  Hikey960:

  # perf record -e cs_etm/@ec033000.etr/ --per-thread ./main
  # perf report --tui

  Hikey:
  # perf record -e cs_etm/@f6404000.etr/ --per-thread uname
  # perf report --tui

P.s. in this version, Hikey960 CoreSight DT binding has not been
included and will be sent out separately.

[1] https://git.linaro.org/kernel/coresight.git/log/?h=next

== Changes for v4 ==
* Consolidate the DT binding compatible strings for replicator and
  funnel (Mathieu).
* Changed replicator driver to support new compatible string.


Leo Yan (4):
  dt-bindings: arm: coresight: Add new compatible for static replicator
  coresight: replicator: Add new device id for static replicator
  dt-bindings: arm: coresight: Unify funnel DT binding
  coresight: funnel: Support static funnel

 .../devicetree/bindings/arm/coresight.txt     |  60 +++++++++-
 .../hwtracing/coresight/coresight-funnel.c    | 112 +++++++++++++-----
 .../coresight/coresight-replicator.c          |   3 +-
 3 files changed, 141 insertions(+), 34 deletions(-)

-- 
2.17.1
