From: Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH 4/6] edac: Document Krait L1/L2 EDAC driver binding
Date: Mon, 28 Oct 2013 17:31:28 -0700
Message-ID: <1383006690-6754-5-git-send-email-sboyd@codeaurora.org>
References: <1383006690-6754-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1383006690-6754-1-git-send-email-sboyd@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-edac@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Krait L1/L2 error reporting device is made up of two
interrupts, one per-CPU interrupt for the L1 caches and one
interrupt for the L2 cache.

Cc: <devicetree@vger.kernel.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 .../devicetree/bindings/arm/qcom,krait-cache-erp.txt     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,krait-cache-erp.txt

diff --git a/Documentation/devicetree/bindings/arm/qcom,krait-cache-erp.txt b/Documentation/devicetree/bindings/arm/qcom,krait-cache-erp.txt
new file mode 100644
index 0000000..01fe8a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,krait-cache-erp.txt
@@ -0,0 +1,16 @@
+* Qualcomm Krait L1 / L2 cache error reporting
+
+Required properties:
+- compatible: Should be "qcom,krait-cache-erp"
+- interrupts: Should contain the L1/CPU error interrupt number and
+  then the L2 cache error interrupt number
+
+Optional properties:
+- interrupt-names: Should contain the interrupt names "l1_irq" and
+  "l2_irq"
+
+Example:
+	edac {
+		compatible = "qcom,krait-cache-erp";
+		interrupts = <1 9 0xf04>, <0 2 0x4>;
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
