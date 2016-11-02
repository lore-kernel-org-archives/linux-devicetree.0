From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH v9 0/3] Add initial support for RPM clocks
Date: Wed,  2 Nov 2016 17:56:55 +0200
Message-ID: <20161102155658.32203-1-georgi.djakov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@codeaurora.org, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org
List-Id: devicetree@vger.kernel.org

This patchset adds initial support for the clocks controlled by
the RPM (Resource Power Manager) processor on Qualcomm platforms.

The RPM is a dedicated hardware engine for managing the shared
SoC resources in order to keep the lowest power profile. It
communicates with other hardware subsystems via shared memory
and accepts clock requests, aggregates the requests and turns
the clocks on/off or scales them on demand.

Until now the RPM clock controller was not supported and a hard-
coded fixed-rate clocks were registered in the drivers. Now we
are moving the on-board clocks to the DT (where they actually
belong). If the RPM clock controller is enabled we insert it
right after the DT clocks making it a parent of some GCC clocks.

Changes since v8 (https://lkml.org/lkml/2016/4/14/495)
* Rebase and switch to clk_hw APIs
* Drop registration of all xo/cxo/pxo clocks and replace patch 3
  with another one, which always registers factor clocks. With
  this approuch we avoid having a DT dependency.

Changes since v7 (https://lkml.org/lkml/2016/2/23/542)
* Add handoff support.
* Remove smd-rpm XO clocks until clk deferring is supported.

Changes since v6 (https://lkml.org/lkml/2015/12/15/279)
* Remove header files and exported ops.
* Add support for active only RPM clocks.

Changes since v5 (https://lkml.org/lkml/2015/12/3/376)
* Drop all DT patches as they are already picked.
* Fix dependencies in Kconfig.
* Minor changes.

Changes since v4 (https://lkml.org/lkml/2015/11/19/309)
* Re-organize code into two separate drivers:
  - clk-smd-rpm for RPM over SMD based clocks like msm8916
  - clk-rpm for RPM based clocks like apq8064
* Drop the patches that are already merged.
* Added the extra compatible string to docs and example.

Changes since v3 (https://lkml.org/lkml/2015/10/20/613)
* Drop some of the patches as now we handle both scenarios -
  RPMCC enabled or disabled.
* Addressed more comments from Stephen. Thanks again!

Changes since v2 (https://lkml.org/lkml/2015/8/3/513)
* Addressed various comments from Stephen. Thanks!
* Added sleep sets support.
* Added a mutex in the RPM driver.
* Support both scenarios - RPMCC enabled or disabled.
* Make RPMCC more generic in order to support other SMD RPM
  based platforms.

Changes since v1 (https://lkml.org/lkml/2015/7/9/257):
* Changed the driver name to clk-smd-rpm, also build it only
  when it is needed - suggested by Srini and Bjorn.
* More detailed binding example.
* Minor changes.


Georgi Djakov (3):
  clk: qcom: Add support for SMD-RPM Clocks
  clk: qcom: Add support for RPM Clocks
  clk: qcom: Always add factor clock for xo clocks

 .../devicetree/bindings/clock/qcom,rpmcc.txt       |  37 ++
 drivers/clk/qcom/Kconfig                           |  29 ++
 drivers/clk/qcom/Makefile                          |   2 +
 drivers/clk/qcom/clk-rpm.c                         | 489 ++++++++++++++++++
 drivers/clk/qcom/clk-smd-rpm.c                     | 571 +++++++++++++++++++++
 drivers/clk/qcom/common.c                          |  15 +-
 include/dt-bindings/clock/qcom,rpmcc.h             |  69 +++
 7 files changed, 1203 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
 create mode 100644 drivers/clk/qcom/clk-rpm.c
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.c
 create mode 100644 include/dt-bindings/clock/qcom,rpmcc.h
