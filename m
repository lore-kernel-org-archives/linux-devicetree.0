From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sdm845-mtp: Mark protected gcc clocks
Date: Mon,  5 Nov 2018 21:50:13 -0800
Message-ID: <20181106055013.11271-1-bjorn.andersson@linaro.org>
References: <20181105194011.43770-1-swboyd@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105194011.43770-1-swboyd@chromium.org>
References: 
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

As of v4.20-rc1 probing the GCC driver on a SDM845 device with the
standard security implementation causes an access violation and an
immediate system restart. Use the protected-clocks property to mark the
offending clocks protected for the MTP, in order to allow it to boot.

Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

This depends on the acceptance of
https://lore.kernel.org/lkml/20181105194011.43770-1-swboyd@chromium.org/

 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index d667eee4e6d0..b3def0358177 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -343,6 +343,12 @@
 	};
 };
 
+&gcc {
+	protected-clocks = <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
+};
+
 &i2c10 {
 	status = "okay";
 	clock-frequency = <400000>;
-- 
2.18.0
