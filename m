From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/2] clk: qcom: gcc: Add support to child devices.
Date: Fri, 30 Jan 2015 10:16:44 +0000
Message-ID: <1422613004-29802-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1422611459-15217-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422611459-15217-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, edubezval@gmail.com, nrajan@codeaurora.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support to child devices whose memory registers fall
insider gcc memory map.
For example on APQ8064 whose thermal sensor registers are inside gcc memory range.

Changes since v1:
	- Check return value of qcom_cc_probe spotted by Pramod.

Thanks,
srini

Srinivas Kandagatla (2):
  clk: qcom: gcc-msm8960: add child devices support.
  clk: qcom: gcc bindings: Update to add child node support.

 Documentation/devicetree/bindings/clock/qcom,gcc.txt |  5 +++++
 drivers/clk/qcom/gcc-msm8960.c                       | 10 +++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
1.9.1
