From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH v2 1/3] arm64: dts: db820c: Add qcom,apq8096 to compatible string
Date: Wed,  5 Sep 2018 20:35:15 +0200
Message-ID: <20180905183517.9390-2-niklas.cassel@linaro.org>
References: <20180905183517.9390-1-niklas.cassel@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905183517.9390-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add qcom,apq8096 to compatible string.
This compatible is defined in Documentation/devicetree/bindings/arm/qcom.txt
and is needed for e.g. drivers/cpufreq/qcom-cpufreq-kryo.c to be probed
correctly (and for drivers/cpufreq/cpufreq-dt-platdev.c to work properly).

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index 230e9c8484ac..da23bdafbd33 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -17,5 +17,5 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. DB820c";
-	compatible = "arrow,apq8096-db820c", "qcom,apq8096-sbc";
+	compatible = "arrow,apq8096-db820c", "qcom,apq8096-sbc", "qcom,apq8096";
 };
-- 
2.17.1
