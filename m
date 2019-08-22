From: Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/2] arm64: dts: msm8916-samsung-a2015: Enable WCNSS for WiFi and BT
Date: Thu, 22 Aug 2019 13:23:38 +0200
Message-ID: <20190822112339.121804-1-stephan@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
List-Id: devicetree@vger.kernel.org

WCNSS is used on A3U and A5U for WiFi and BT,
and seems to work fine without further changes.

Enable it in the common include.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index e675ff48fdd2..6fc0b80d1f90 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -63,6 +63,10 @@
 			};
 		};
 
+		wcnss@a21b000 {
+			status = "okay";
+		};
+
 		/*
 		 * Attempting to enable these devices causes a "synchronous
 		 * external abort". Suspected cause is that the debug power
-- 
2.22.1
