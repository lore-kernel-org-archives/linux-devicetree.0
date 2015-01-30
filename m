From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] clk: qcom: gcc: Add support to child devices.
Date: Fri, 30 Jan 2015 09:50:59 +0000
Message-ID: <1422611459-15217-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, edubezval@gmail.com, nrajan@codeaurora.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support to child devices whose memory registers fall
insider gcc memory map.
For example on APQ8064 whose thermal sensor registers are inside gcc memory range.

Thanks,
srini

Srinivas Kandagatla (2):
  clk: qcom: gcc-msm8960: add child devices support.
  clk: qcom: gcc bindings: Update to add child node support.

 Documentation/devicetree/bindings/clock/qcom,gcc.txt | 5 +++++
 drivers/clk/qcom/gcc-msm8960.c                       | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
1.9.1
