From: Chris Lew <clew@codeaurora.org>
Subject: [PATCH v2 0/3] GLINK intent preallocation support
Date: Thu, 26 Oct 2017 15:28:53 -0700
Message-ID: <1509056936-26578-1-git-send-email-clew@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: aneela@codeaurora.org, smaliyap@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, clew@codeaurora.org
List-Id: devicetree@vger.kernel.org

Intents are used to specify when a channel can receive data from a
remoteproc. Add support for channels to customize the size and amount
of prequeued intents.

An audio channel might expect to receive 3 packets of size 4k in rapid
succession. This change allows the channel to prepare for this data instead
of allocating on demand.

Chris Lew (3):
  dt-bindings: soc: qcom: Support GLINK intents
  rpmsg: glink: Add support to preallocate intents
  rpmsg: glink: Use best fit intent during tx

 .../devicetree/bindings/soc/qcom/qcom,glink.txt    | 10 +++++
 drivers/rpmsg/qcom_glink_native.c                  | 48 +++++++++++++++++-----
 2 files changed, 47 insertions(+), 11 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
