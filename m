From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH] arm64: dts: sdm845: Include the interconnect resources DT header
Date: Mon, 11 Mar 2019 16:06:02 +0200
Message-ID: <20190311140602.12160-1-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, bjorn.andersson@linaro.org
Cc: daidavid1@codeaurora.org, evgreen@chromium.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
List-Id: devicetree@vger.kernel.org

Include the device tree header for the on-chip interconnect endpoint
resources on sdm845 devices. This will allow using the "interconnects"
property in DT nodes to describe the interconnect path resources they use.

The sdm845 interconnect provider DT node is already present, but the
header file with the resources is not included, so let's fix this.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5308f1671824..be4d4c5859c0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,lpass-sdm845.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,videocc-sdm845.h>
+#include <dt-bindings/interconnect/qcom,sdm845.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/reset/qcom,sdm845-aoss.h>
