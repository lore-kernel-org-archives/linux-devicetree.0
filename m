From: Vikash Garodia <vgarodia@codeaurora.org>
Subject: [PATCH v3 0/4] Venus updates - PIL
Date: Thu,  5 Jul 2018 00:36:48 +0530
Message-ID: <1530731212-30474-1-git-send-email-vgarodia@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stanimir.varbanov@linaro.org, hverkuil@xs4all.nl, mchehab@kernel.org, robh@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, acourbot@chromium.org, vgarodia@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hello,

Here is v3 with following comments addressed:

* merged patch 1 and 4 from v2.
* removed enum for Video CPU state and handled it as a bool.
* introduced a flag to specify if tz is not present.
* add misc code review comments related to better coding ways

There is an ongoing discussion on getting iova in a specified
range. Once concluded, will update the series, if needed.

Comments are welcome!

Vikash Garodia (4):
  venus: firmware: add routine to reset ARM9
  venus: firmware: move load firmware in a separate function
  venus: firmware: add no TZ boot and shutdown routine
  venus: firmware: register separate driver for firmware device

 .../devicetree/bindings/media/qcom,venus.txt       |  17 +-
 drivers/media/platform/qcom/venus/core.c           |  59 +++++-
 drivers/media/platform/qcom/venus/core.h           |   6 +
 drivers/media/platform/qcom/venus/firmware.c       | 203 ++++++++++++++++++---
 drivers/media/platform/qcom/venus/firmware.h       |   7 +-
 drivers/media/platform/qcom/venus/hfi_venus.c      |  13 +-
 drivers/media/platform/qcom/venus/hfi_venus_io.h   |   5 +
 7 files changed, 263 insertions(+), 47 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
