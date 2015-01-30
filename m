From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: [PATCH v3 0/3] pinctrl: Qualcomm msm8916 pinctrl driver
Date: Fri, 30 Jan 2015 12:03:58 +0200
Message-ID: <1422612241-12944-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Joonwoo Park <joonwoop@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
List-Id: devicetree@vger.kernel.org

Changes since v2:
 - addressed all Andy's comments
 
-------------------------------------------------------------------------------

Changes since v1:
 - correct the subject and description in 1/3
 - not break the fields in msm8916_groups[] array in 3/3
 - added Reviewed-by tags on all three patches

-------------------------------------------------------------------------------

This series adds a pinctrl driver for Snapdragon 410 (msm8916) SoC. The first
patch increase the register address variable size, next adds a binding document
and the last patch adds the pinctrl driver

Comments are welcome!

regards,
Stan

Joonwoo Park (2):
  pinctrl: qcom: increase variable size for register offsets
  pinctrl: qcom: Add msm8916 pinctrl driver

Stanimir Varbanov (1):
  DT: pinctrl: Document Qualcomm MSM8916 pinctrl binding

 .../bindings/pinctrl/qcom,msm8916-pinctrl.txt      |  186 ++++
 drivers/pinctrl/qcom/Kconfig                       |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm.h                 |   10 +-
 drivers/pinctrl/qcom/pinctrl-msm8916.c             | 1005 ++++++++++++++++++++
 5 files changed, 1205 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8916-pinctrl.txt
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8916.c

