From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH RFC 0/4] DDR/L3 Scaling support on SDM845 SoCs
Date: Thu, 27 Jun 2019 19:04:20 +0530
Message-ID: <20190627133424.4980-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org, georgi.djakov@linaro.org
Cc: agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, rjw@rjwysocki.net, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This RFC series aims to extend cpu based scaling support to L3/DDR on
SDM845 SoCs. The patch series depends on "Introduce OPP bandwidth bindings"
series (https://patchwork.kernel.org/cover/10912993/). A part of the
series will still be applicable if we decide to go ahead with the proposal
from Saravana as well so I decided to post this out.

v2:
* Incorporated Viresh's comments from:
[1]https://lore.kernel.org/lkml/20190410102429.r6j6brm5kspmqxc3@vireshk-i7/
[2]https://lore.kernel.org/lkml/20190410112516.gnh77jcwawvld6et@vireshk-i7/


Sibi Sankar (4):
  OPP: Add and export helper to update voltage
  OPP: Add and export helper to set bandwidth
  cpufreq: qcom: Update the bandwidth levels on frequency change
  arm64: dts: qcom: sdm845: Add cpu OPP tables

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 343 +++++++++++++++++++++++++++
 drivers/cpufreq/qcom-cpufreq-hw.c    |  77 +++++-
 drivers/opp/core.c                   |  98 ++++++++
 include/linux/pm_opp.h               |  16 ++
 4 files changed, 532 insertions(+), 2 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
