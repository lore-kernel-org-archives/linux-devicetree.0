From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/3] RPMPD for QCS404
Date: Wed, 20 Feb 2019 22:44:31 -0800
Message-ID: <20190221064434.2760-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Reworkd the macros of the rpmpd driver and add qcs404 power domains, then add
this to the dts.

Bjorn Andersson (3):
  soc: qcom: rpmpd: Modify corner defining macros
  soc: qcom: rpmpd: Add QCS404 corners
  arm64: dts: qcom: qcs404: Add rpmpd node

 .../devicetree/bindings/power/qcom,rpmpd.txt  |  1 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi          | 35 +++++++++++
 drivers/soc/qcom/rpmpd.c                      | 63 +++++++++++++------
 include/dt-bindings/power/qcom-rpmpd.h        |  9 +++
 4 files changed, 88 insertions(+), 20 deletions(-)

-- 
2.18.0
