From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH v2 0/2] Add initial CoreSight support for the Qualcomm 8x16 chipsets
Date: Thu,  7 May 2015 18:36:07 +0300
Message-ID: <1431012969-16338-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Kumar Gala <galak@codeaurora.org>
Cc: Pratik Patel <pratikp@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add initial CoreSight support for the Qualcomm 8x16 chipsets

This patch series add initial set of CoreSight components for the
8x16 chipsets.

Components will not be functional, because of missing clock controller
driver, which is under internal testing.

Patches are based on "Enable CoreSight for the Ux500 "[1] and
"Support for coresight ETMv4 tracer" [2]

Changes since first version [3]:

* Added comments about not described funnels ports in DT files.
* Removed MODULE_ macros.
* Print replicator version at probe time.
* Fixed Kconfig driver description.
* Added "1x" suffix to compatible string, to reflect supported replicator version
* Add comment how replicator output port is disabled.

[1] http://www.spinics.net/lists/arm-kernel/msg412873.html
[2] https://lwn.net/Articles/641585/
[3] https://lkml.org/lkml/2015/4/29/241

Ivan T. Ivanov (1):
  arm64: dts: qcom: Add msm8916 CoreSight components

Pratik Patel (1):
  coresight: replicator: Add Qualcomm CoreSight Replicator driver

 .../devicetree/bindings/arm/coresight.txt          |   1 +
 arch/arm64/boot/dts/qcom/msm8916-coresight.dtsi    | 254 +++++++++++++++++++++
 drivers/hwtracing/coresight/Kconfig                |   8 +
 drivers/hwtracing/coresight/Makefile               |   1 +
 .../coresight/coresight-replicator-qcom.c          | 214 +++++++++++++++++
 5 files changed, 478 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-coresight.dtsi
 create mode 100644 drivers/hwtracing/coresight/coresight-replicator-qcom.c

--
1.9.1
