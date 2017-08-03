From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 5/5] arm64: dts: msm8916: Mark rmtfs node as qcom,rfsa compatible
Date: Wed,  2 Aug 2017 19:57:54 -0700
Message-ID: <20170803025754.19101-6-bjorn.andersson@linaro.org>
References: <20170803025754.19101-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170803025754.19101-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that we have a binding defined for the shared file system memory use
this to describe the rmtfs memory region.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 039991f80831..9d364297df3a 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -69,8 +69,11 @@
 		};
 
 		rmtfs@86700000 {
+			compatible = "qcom,rfsa";
 			reg = <0x0 0x86700000 0x0 0xe0000>;
 			no-map;
+
+			qcom,client-id = <1>;
 		};
 
 		rfsa@867e00000 {
-- 
2.12.0
