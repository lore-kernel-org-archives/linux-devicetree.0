From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/3] firmware: qcom: scm: Improve clock handling
Date: Wed, 29 Aug 2018 16:15:02 -0700
Message-ID: <20180829231505.22660-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Sricharan R <sricharan@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Craig Tatlor <ctatlor97@gmail.com>
List-Id: devicetree@vger.kernel.org

We're currently facing the issue that every new platform requires the addition
of a compatible to the DT binding as well as the driver.

The DT binding patch to allow us to use qcom,scm for all these new platforms
that doesn't require any clocks and the driver is reworked to make the qcom,scm
still pick up specified clocks in this case but won't require them.

This makes it possible to add new platforms by simply add the new compatible to
the list in the DT binding, but no changes needs to be done in the driver.
Which is what is done in patch 3.

Bjorn Andersson (3):
  dt-bindings: firmware: scm: Refactor compatibles and clocks
  firmware: qcom: scm: Refactor clock handling
  dt-bindings: firmware: scm: Add MSM8998 and SDM845

 .../devicetree/bindings/firmware/qcom,scm.txt | 33 ++++++---
 drivers/firmware/qcom_scm.c                   | 74 +++++++++++--------
 2 files changed, 63 insertions(+), 44 deletions(-)

-- 
2.18.0
