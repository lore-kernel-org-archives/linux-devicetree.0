From: Vikash Garodia <vgarodia@codeaurora.org>
Subject: [PATCH v5 0/4] Venus updates - PIL
Date: Tue, 21 Aug 2018 22:49:30 +0530
Message-ID: <1534871974-32269-1-git-send-email-vgarodia@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stanimir.varbanov@linaro.org, hverkuil@xs4all.nl, mchehab@kernel.org, robh@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, acourbot@chromium.org, vgarodia@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hello,

Here is v5 with following comments addressed:

* non-pixel register programming during reset.
* comments related to instructions reordering.

Vikash Garodia (4):
  venus: firmware: add routine to reset ARM9
  venus: firmware: move load firmware in a separate function
  venus: firmware: add no TZ boot and shutdown routine
  venus: firmware: register separate driver for firmware device

 .../devicetree/bindings/media/qcom,venus.txt       |  17 +-
 drivers/media/platform/qcom/venus/core.c           |  60 +++++--
 drivers/media/platform/qcom/venus/core.h           |   7 +
 drivers/media/platform/qcom/venus/firmware.c       | 194 ++++++++++++++++++---
 drivers/media/platform/qcom/venus/firmware.h       |  17 +-
 drivers/media/platform/qcom/venus/hfi_venus.c      |  13 +-
 drivers/media/platform/qcom/venus/hfi_venus_io.h   |   8 +
 7 files changed, 272 insertions(+), 44 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
