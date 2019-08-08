From: Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: Introduce soc sleep stats bindings for Qualcomm SoCs
Date: Thu,  8 Aug 2019 11:42:27 +0530
Message-ID: <20190808061228.16573-2-mkshah@codeaurora.org>
References: <20190808061228.16573-1-mkshah@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808061228.16573-1-mkshah@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, bjorn.andersson@linaro.org, evgreen@chromium.org, dianders@chromium.org, swboyd@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org, mkshah@codeaurora.org, devicetree@vger.kernel.org, Mahesh Sivasubramanian <msivasub@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add device binding documentation for Qualcomm Technology Inc's (QTI)
SoC sleep stats driver. The driver is used for displaying SoC sleep
statistic maintained by Always On Processor or Resource Power Manager.

Cc: devicetree@vger.kernel.org
Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 .../bindings/soc/qcom/soc-sleep-stats.txt     | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.txt b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.txt
new file mode 100644
index 000000000000..ee40687ded34
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.txt
@@ -0,0 +1,36 @@
+* SoC Sleep Stats
+
+Always On Processor/Resource Power Manager maintains statistics of the SoC
+sleep modes involving lowering or powering down of the backbone rails - Cx
+and Mx and the oscillator clock, XO.
+
+Statistics includes SoC sleep mode type, number of times low power mode were
+entered, time of last entry, time of last exit and accumulated sleep duration.
+SoC Sleep Stats driver provides sysfs interface to display this information.
+
+PROPERTIES
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: Should be "qcom,rpmh-sleep-stats" or "qcom,rpm-sleep-stats".
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: The base address on the Always On Processor or Resource Power
+		    Manager from where the stats are read.
+
+EXAMPLE 1:
+
+	rpmh_sleep_stats: soc-sleep-stats@c3f0000 {
+		compatible = "qcom,rpmh-sleep-stats";
+		reg = <0 0xc3f0000 0 0x400>;
+	};
+
+EXAMPLE 2:
+
+	rpm_sleep_stats: soc-sleep-stats@4690000 {
+		compatible = "qcom,rpm-sleep-stats";
+		reg = <0 0x04690000 0 0x400>;
+	};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, hosted by The Linux Foundation.
