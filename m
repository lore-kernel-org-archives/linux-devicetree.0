From: Vikash Garodia <vgarodia@codeaurora.org>
Subject: [PATCH v6 0/4] Venus updates - PIL
Date: Thu, 23 Aug 2018 19:58:44 +0530
Message-ID: <1535034528-11590-1-git-send-email-vgarodia@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stanimir.varbanov@linaro.org, hverkuil@xs4all.nl, mchehab@kernel.org, robh@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, acourbot@chromium.org, vgarodia@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hello,

Here is v6 with following comments addressed:

* 4/4 from earlier series was dropped as .probe was not needed.
* indentation as per checkpatch --strict option.
* tested on Venus v4 hardware. 

Stanimir Varbanov (1):
  venus: firmware: register separate platform_device for firmware loader

Vikash Garodia (3):
  venus: firmware: add routine to reset ARM9
  venus: firmware: move load firmware in a separate function
  venus: firmware: add no TZ boot and shutdown routine

 .../devicetree/bindings/media/qcom,venus.txt       |  13 +-
 drivers/media/platform/qcom/venus/core.c           |  24 ++-
 drivers/media/platform/qcom/venus/core.h           |   9 +
 drivers/media/platform/qcom/venus/firmware.c       | 223 +++++++++++++++++++--
 drivers/media/platform/qcom/venus/firmware.h       |  17 +-
 drivers/media/platform/qcom/venus/hfi_venus.c      |  13 +-
 drivers/media/platform/qcom/venus/hfi_venus_io.h   |   8 +
 7 files changed, 265 insertions(+), 42 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
