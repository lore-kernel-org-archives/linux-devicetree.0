From: Ilia Lin <ilialin@codeaurora.org>
Subject: [PATCH v3 04/10] clk: qcom: Add DT bindings for CPU clock driver for msm8996
Date: Wed, 14 Feb 2018 15:59:46 +0200
Message-ID: <1518616792-29028-5-git-send-email-ilialin@codeaurora.org>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, mark.rutland@arm.com, will.deacon@arm.com, rnayak@codeaurora.org, ilialin@codeaurora.org, amit.kucheria@linaro.org, nicolas.dechesne@linaro.org, celster@codeaurora.org, tfinkel@codeaurora.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
---
 Documentation/devicetree/bindings/clock/qcom,kryocc.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,kryocc.txt

diff --git a/Documentation/devicetree/bindings/clock/qcom,kryocc.txt b/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
new file mode 100644
index 0000000..e7cf15a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
@@ -0,0 +1,17 @@
+Qualcomm CPUSS clock controller for Kryo CPUs
+----------------------------------------------------
+
+Required properties :
+- compatible : shall contain only one of the following:
+
+			"qcom-msm8996-apcc"
+
+- reg : shall contain base register location and length
+- #clock-cells : shall contain 1
+
+Example:
+	kryocc: clock-controller@6400000 {
+		compatible = "qcom-msm8996-apcc";
+		reg = <0x6400000 0x90000>;
+		#clock-cells = <1>;
+	};
-- 
1.9.1

