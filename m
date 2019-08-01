From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: qcs404: Fix DTS warnings
Date: Thu,  1 Aug 2019 15:20:46 +0530
Message-ID: <20190801095049.13855-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: devicetree@vger.kernel.org

So this is second installment of my work to fix warns on qcom DTS, this time
the traget is qcs404 platform.

Changes since v1:
	- Fix node addresses as pointed by Amit
	- Add review tags of Amit

Vinod Koul (3):
  arm64: dts: qcom: pms405: add unit name adc nodes
  arm64: dts: qcom: pms405: remove reduandant properties
  arm64: dts: qcom: qcs404: remove unit name for thermal trip points

 arch/arm64/boot/dts/qcom/pms405.dtsi | 16 +++++++--------
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 30 ++++++++++++++--------------
 2 files changed, 22 insertions(+), 24 deletions(-)

-- 
2.20.1
