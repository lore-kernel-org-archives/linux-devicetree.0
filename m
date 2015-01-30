From: Andy Gross <agross@codeaurora.org>
Subject: [Patch v2 2/6] mfd: qcom,tcsr: Add device tree binding for TCSR
Date: Fri, 30 Jan 2015 00:25:31 -0600
Message-ID: <1422599135-5588-3-git-send-email-agross@codeaurora.org>
References: <1422599135-5588-1-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1422599135-5588-1-git-send-email-agross@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, Andy Gross <agross@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Kumar Gala <galak@codeaurora.org>, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds the device tree binding for the Qualcomm Top Control and
Status Register device.  The TCSR is comprised of a set of registers that
provide various control and status functions for attached peripherals.

Signed-off-by: Andy Gross <agross@codeaurora.org>
---
 .../devicetree/bindings/mfd/qcom,tcsr.txt          |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,tcsr.txt

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.txt b/Documentation/devicetree/bindings/mfd/qcom,tcsr.txt
new file mode 100644
index 0000000..e90519d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.txt
@@ -0,0 +1,22 @@
+QCOM Top Control and Status Register
+
+Qualcomm devices have a set of registers that provide various control and status
+functions for their peripherals.  This node is intended to allow access to these
+registers via syscon.
+
+Required properties:
+- compatible:	Should contain:
+		"qcom,tcsr-ipq8064", "syscon" for IPQ8064
+		"qcom,tcsr-apq8064", "syscon" for APQ8064
+		"qcom,tcsr-msm8660", "syscon" for MSM8660
+		"qcom,tcsr-msm8960", "syscon" for MSM8960
+		"qcom,tcsr-msm8974", "syscon" for MSM8974
+		"qcom,tcsr-apq8084", "syscon" for APQ8084
+		"qcom,tcsr-msm8916", "syscon" for MSM8916
+- reg: Address range for TCSR registers
+
+Example:
+	tcsr: syscon@1a400000 {
+		compatible = "qcom,tcsr-msm8960", "syscon";
+		reg = <0x1a400000 0x100>;
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
