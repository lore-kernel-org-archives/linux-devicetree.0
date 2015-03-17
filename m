From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/2] DT: arm64: msm8916-mtp: enable spi3
Date: Tue, 17 Mar 2015 18:25:32 +0200
Message-ID: <1426609532-11996-2-git-send-email-stanimir.varbanov@linaro.org>
References: <1426609532-11996-1-git-send-email-stanimir.varbanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426609532-11996-1-git-send-email-stanimir.varbanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-Id: devicetree@vger.kernel.org

This enable spi3 on msm8916 mtp board

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
index 270ba55..fa229d0 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
@@ -26,3 +26,11 @@
 		};
 	};
 };
+
+&blsp_dma {
+	status = "okay";
+};
+
+&blsp_spi3 {
+	status = "okay";
+};
-- 
1.7.0.4
