From: Ilia Lin <ilialin@codeaurora.org>
Subject: [PATCH v11 0/2] CPU scaling support for msm8996 DT
Date: Wed, 23 May 2018 16:11:29 +0300
Message-ID: <1527081091-13389-1-git-send-email-ilialin@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

[v11]
 * Split the series into domains

The series adds OPP tables, thermal and CPU definitions in order to support
the CPU frequency scaling on msm8996 CPUs.

Ilia Lin (2):
  dt: qcom: Add opp and thermal to the msm8996
  dt: qcom: Add qcom-cpufreq-kryo driver configuration

 arch/arm64/boot/dts/qcom/apq8096-db820c.dts |   2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi       | 546 +++++++++++++++++++++++++++-
 2 files changed, 528 insertions(+), 20 deletions(-)

-- 
1.9.1
