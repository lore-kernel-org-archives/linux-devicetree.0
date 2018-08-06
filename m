From: Vikash Garodia <vgarodia@codeaurora.org>
Subject: [PATCH v4 0/4] Venus updates - PIL
Date: Mon,  6 Aug 2018 18:58:01 +0530
Message-ID: <1533562085-8773-1-git-send-email-vgarodia@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stanimir.varbanov@linaro.org, hverkuil@xs4all.nl, mchehab@kernel.org, robh@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, acourbot@chromium.org, vgarodia@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hello,

Here is v4 with following comments addressed:

* inline function for setting suspend and resume.
* keep firmware size as 6 MB.
* comments related to indentation, cleanup, etc.

As per comments from Bjorn, qcom_mdt_load_no_init is being used in this
patch series to align with https://patchwork.kernel.org/patch/10397889/.

Comments are welcome!

Vikash Garodia (4):
  venus: firmware: add routine to reset ARM9
  venus: firmware: move load firmware in a separate function
  venus: firmware: add no TZ boot and shutdown routine
  venus: firmware: register separate driver for firmware device

 .../devicetree/bindings/media/qcom,venus.txt       |  17 +-
 drivers/media/platform/qcom/venus/core.c           |  60 +++++--
 drivers/media/platform/qcom/venus/core.h           |   7 +
 drivers/media/platform/qcom/venus/firmware.c       | 192 ++++++++++++++++++---
 drivers/media/platform/qcom/venus/firmware.h       |  17 +-
 drivers/media/platform/qcom/venus/hfi_venus.c      |  13 +-
 drivers/media/platform/qcom/venus/hfi_venus_io.h   |   6 +
 7 files changed, 268 insertions(+), 44 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
