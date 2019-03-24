From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: qcs404: CDSP for APF support
Date: Sun, 24 Mar 2019 10:20:14 -0700
Message-ID: <20190324172016.1195-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the clock controller and describe the cdsp in a way that it can be reused
between different trusted environments.

Bjorn Andersson (2):
  arm64: dts: qcom: qcs404: Add turingcc node
  arm64: dts: qcom: Fully describe the CDSP

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 100 ++++++++++++++++++---------
 1 file changed, 69 insertions(+), 31 deletions(-)

-- 
2.18.0
