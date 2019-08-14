From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/2] Venus interconnect support for sdm845
Date: Wed, 14 Aug 2019 11:46:59 +0300
Message-ID: <20190814084701.25455-1-stanimir.varbanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Vikash Garodia <vgarodia@codeaurora.org>, Andy Gross <agross@kernel.org>, Aniket Masule <amasule@codeaurora.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello,

Here are two patches which adds interconnect bandwidth requests
depending on the resolution (macroblocks) in order to lower
bandwidth pressure on the interconnect and memory.

regards,
Stan

Stanimir Varbanov (2):
  venus: use on-chip interconnect API
  arm64: dts: sdm845: Add interconnect properties for Venus

 arch/arm64/boot/dts/qcom/sdm845.dtsi        |  3 +
 drivers/media/platform/qcom/venus/core.c    | 34 +++++++++++
 drivers/media/platform/qcom/venus/core.h    | 14 +++++
 drivers/media/platform/qcom/venus/helpers.c | 67 ++++++++++++++++++++-
 4 files changed, 117 insertions(+), 1 deletion(-)

-- 
2.17.1
