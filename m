From: Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH v2 2/9] devicetree: bindings: Document qcom,kpss-acc
Date: Mon, 23 Dec 2013 16:39:46 -0800
Message-ID: <1387845593-10050-3-git-send-email-sboyd@codeaurora.org>
References: <1387845593-10050-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1387845593-10050-1-git-send-email-sboyd@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, Rohit Vaswani <rvaswani@codeaurora.org>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, David Brown <davidb@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The kpss acc binding describes the clock, reset, and power domain
controller for a Krait CPU.

Cc: <devicetree@vger.kernel.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 .../devicetree/bindings/arm/msm/qcom,kpss-acc.txt  | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.txt

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.txt b/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.txt
new file mode 100644
index 0000000..1333db9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.txt
@@ -0,0 +1,30 @@
+Krait Processor Sub-system (KPSS) Application Clock Controller (ACC)
+
+The KPSS ACC provides clock, power domain, and reset control to a Krait CPU.
+There is one ACC register region per CPU within the KPSS remapped region as
+well as an alias register region that remaps accesses to the ACC associated
+with the CPU accessing the region.
+
+PROPERTIES
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: should be one of:
+			"qcom,kpss-acc-v1"
+			"qcom,kpss-acc-v2"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: the first element specifies the base address and size of
+		    the register region. An optional second element specifies
+		    the base address and size of the alias register region.
+
+Example:
+
+	clock-controller@2088000 {
+		compatible = "qcom,kpss-acc-v2";
+		reg = <0x02088000 0x1000>,
+		      <0x02008000 0x1000>;
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
