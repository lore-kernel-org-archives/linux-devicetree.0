From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 15/22] arm64: dts: qcom: sm8150-mtp: Include pmics
Date: Wed, 14 Aug 2019 18:20:05 +0530
Message-ID: <20190814125012.8700-16-vkoul@kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814125012.8700-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

sm8150-mtp uses pm8150, pm8150b and pm8150l pmics,
so include the files

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index 8700f015c074..43ba14cc0b00 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -5,6 +5,9 @@
 /dts-v1/;
 
 #include "sm8150.dtsi"
+#include "pm8150.dtsi"
+#include "pm8150b.dtsi"
+#include "pm8150l.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8150 MTP";
-- 
2.20.1
