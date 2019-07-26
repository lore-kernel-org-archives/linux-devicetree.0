From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.2 17/85] arm64: qcom: qcs404: Add reset-cells to GCC node
Date: Fri, 26 Jul 2019 09:38:27 -0400
Message-ID: <20190726133936.11177-17-sashal@kernel.org>
References: <20190726133936.11177-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726133936.11177-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Andy Gross <agross@kernel.org>, Niklas Cassel <niklas.cassel@linaro.org>, Vinod Koul <vkoul@kernel.org>, Olof Johansson <olof@lixom.net>, Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Andy Gross <agross@kernel.org>

[ Upstream commit 0763d0c2273a3c72247d325c48fbac3d918d6b87 ]

This patch adds a reset-cells property to the gcc controller on the QCS404.
Without this in place, we get warnings like the following if nodes reference
a gcc reset:

arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_property):
/soc@0/remoteproc@b00000: Missing property '#reset-cells' in node
/soc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
  also defined at arch/arm64/boot/dts/qcom/qcs404-evb.dtsi:82.18-84.3
  DTC     arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb
arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_property):
/soc@0/remoteproc@b00000: Missing property '#reset-cells' in node
/soc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
  also defined at arch/arm64/boot/dts/qcom/qcs404-evb.dtsi:82.18-84.3

Signed-off-by: Andy Gross <agross@kernel.org>
Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Olof Johansson <olof@lixom.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index ffedf9640af7..65a2cbeb28be 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -383,6 +383,7 @@
 			compatible = "qcom,gcc-qcs404";
 			reg = <0x01800000 0x80000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 
 			assigned-clocks = <&gcc GCC_APSS_AHB_CLK_SRC>;
 			assigned-clock-rates = <19200000>;
-- 
2.20.1
