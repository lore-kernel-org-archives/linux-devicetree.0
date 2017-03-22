From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 0/2] clk: qcom: Add RPM clocks for msm8996
Date: Wed, 22 Mar 2017 15:09:24 +0530
Message-ID: <1490175566-4084-1-git-send-email-rnayak@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: sboyd@codeaurora.org, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, srinivas.kandagatla@linaro.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patchset adds all the RPM clocks on msm8996 platforms,
while at it, we also remove some of the RCGs from the GCC
driver as they are controlled by RPM and hence should not
be part of GCC.

Series depends on Bjorns patches which add support for glink
on msm8996
https://www.spinics.net/lists/linux-wireless/msg160393.html
http://www.spinics.net/lists/devicetree/msg168445.html

Rajendra Nayak (2):
  clk: qcom: clk-smd-rpm: add msm8996 rpmclks
  clk: qcom: gcc-msm8996: Remove RPM controlled clocks

 .../devicetree/bindings/clock/qcom,rpmcc.txt       |   1 +
 drivers/clk/qcom/clk-smd-rpm.c                     |  82 +++++++++++
 drivers/clk/qcom/gcc-msm8996.c                     | 156 +++++----------------
 include/dt-bindings/clock/qcom,gcc-msm8996.h       |   4 -
 include/dt-bindings/clock/qcom,rpmcc.h             |  14 ++
 include/linux/soc/qcom/smd-rpm.h                   |   4 +
 6 files changed, 134 insertions(+), 127 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
