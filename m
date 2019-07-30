From: Thara Gopinath <thara.gopinath@linaro.org>
Subject: [Patch v2 0/2] Add support for AOSS resources that are used to warm up the SoC
Date: Tue, 30 Jul 2019 11:24:41 -0400
Message-ID: <1564500283-16038-1-git-send-email-thara.gopinath@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, amit.kucheria@linaro.org, vinod.koul@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Always On Sub System (AOSS) hosts certain resources
that are used to warm up the soc if the temperature falls
below certain threshold. These resources are
added can be considered as thermal warming devices
(opposite of thermal cooling devices).

These resources are controlled via AOSS QMP protocol
In kernel, these devices can be treated the same way as any other
thermal cooling device and hence are registered with the thermal
cooling framework.

To use these resources as warming devices require further tweaks in
the thermal framework which are out of scope of this patch series.

Thara Gopinath (2):
  soc: qcom: Extend AOSS QMP driver to support resources that are used
    to wake up the SoC.
  arm64: dts: qcom: Extend AOSS QMP node

 arch/arm64/boot/dts/qcom/sdm845.dtsi |   8 +++
 drivers/soc/qcom/qcom_aoss.c         | 131 +++++++++++++++++++++++++++++++++++
 2 files changed, 139 insertions(+)

-- 
2.1.4
