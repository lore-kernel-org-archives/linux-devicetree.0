From: Andy Gross <andy.gross@linaro.org>
Subject: [Patch v2 1/8] dt/bindings: firmware: Add Qualcomm SCM binding
Date: Mon, 25 Apr 2016 18:08:38 -0500
Message-ID: <1461625725-32425-2-git-send-email-andy.gross@linaro.org>
References: <1461625725-32425-1-git-send-email-andy.gross@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1461625725-32425-1-git-send-email-andy.gross@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, jilai wang <jilaiw@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds the device tree support for the Qualcomm SCM firmware.

Signed-off-by: Andy Gross <andy.gross@linaro.org>
---
 .../devicetree/bindings/firmware/qcom,scm.txt      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/qcom,scm.txt

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
new file mode 100644
index 0000000..a679a87
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -0,0 +1,28 @@
+QCOM Secure Channel Manager (SCM)
+
+Qualcomm processors include an interface to communicate to the secure firmware.
+This interface allows for clients to request different types of actions.  These
+can include CPU power up/down, HDCP requests, loading of firmware, and other
+assorted actions.
+
+Required properties:
+- compatible: must contain one of the following:
+ * "qcom,scm-apq8064" for APQ8064
+ * "qcom,scm-apq8084" for APQ8084
+ * "qcom,scm-msm8916" for MSM8916
+ * "qcom,scm-msm8974" for MSM8974
+- clocks: One to three clocks may be required based on compatible.
+ * Only core clock required for "qcom,scm-apq8064"
+ * Core, iface, and bus clocks required for all other compatibles.
+- clock-names: Must contain "core" for the core clock, "iface" for the interface
+  clock and "bus" for the bus clock per the requirements of the compatible.
+
+Example for MSM8916:
+
+	firmware {
+		scm {
+			compatible = "qcom,scm-msm8916";
+			clocks = <&gcc GCC_CRYPTO_CLK> , <&gcc GCC_CRYPTO_AXI_CLK>, <&gcc GCC_CRYPTO_AHB_CLK>;
+			clock-names = "core", "bus", "iface";
+		};
+	};
-- 
1.9.1
