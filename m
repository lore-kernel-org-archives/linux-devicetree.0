From: Thara Gopinath <thara.gopinath@linaro.org>
Subject: [PATCH 3/5] dt-bindings: thermal: Add generic power domain warming device binding
Date: Tue, 10 Sep 2019 13:14:34 -0400
Message-ID: <1568135676-9328-4-git-send-email-thara.gopinath@linaro.org>
References: <1568135676-9328-1-git-send-email-thara.gopinath@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568135676-9328-1-git-send-email-thara.gopinath@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: edubezval@gmail.com, rui.zhang@intel.com, ulf.hansson@linaro.org, daniel.lezcano@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc: amit.kucheria@verdurent.com, mark.rutland@arm.com, rjw@rjwysocki.net, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add binding to define power domains as thermal warming
devices.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 .../bindings/thermal/pwr-domain-warming.txt        | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt

diff --git a/Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt b/Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt
new file mode 100644
index 0000000..25fc568
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt
@@ -0,0 +1,32 @@
+* Generic power domain based thermal warming device.
+
+This binding describes the power domains that can be used as a
+thermal warming device.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be "thermal-power-domain-wdev"
+
+- #temp-reg-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: Must be 2
+
+- power-domains:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to power-domains that match power-domain-names
+
+- power-domain-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: The power-domains that can behave as warming devices
+
+Example 1
+thermal_wdev: rpmhpd_mx_wdev {
+		compatible = "thermal-power-domain-wdev";
+		#cooling-cells = <2>;
+		power-domains =  <&rpmhpd SDM845_MX>;
+		power-domain-names = "mx";
+	};
-- 
2.1.4
