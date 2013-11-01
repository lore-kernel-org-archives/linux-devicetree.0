From: Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH 03/11] devicetree: bindings: Document qcom,kpss-acc
Date: Fri,  1 Nov 2013 15:08:51 -0700
Message-ID: <1383343739-23080-4-git-send-email-sboyd@codeaurora.org>
References: <1383343739-23080-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1383343739-23080-1-git-send-email-sboyd@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, David Brown <davidb@codeaurora.org>, Rohit Vaswani <rvaswani@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The kpss acc binding describes the clock, reset, and power domain
controller for a Krait CPU.

Cc: <devicetree@vger.kernel.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 .../devicetree/bindings/arm/msm/qcom,kpss-acc.txt   | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.txt

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.txt b/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.txt
new file mode 100644
index 0000000..ed4a9c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.txt
@@ -0,0 +1,21 @@
+* Krait Processor Sub-system (KPSS) Application Clock Controller (ACC)
+
+The KPSS ACC provides clock, power domain, and reset control to a Krait CPU.
+There is one ACC register region per CPU within the KPSS remaped region as
+well as an alias register region that remaps accesses to the ACC associated
+with the CPU accessing the region.
+
+Required Properties:
+
+- compatible : Shall contain "qcom,kpss-acc-v1" or "qcom,kpss-acc-v2".
+- reg: Specifies the base address and size of the banked register region.
+- cpu-offset : per-cpu offset used when the device is accessed without the
+		CPU remapping facilities.
+		The offset is cpu-offset + (0x10000 * cpu-nr).
+
+Example:
+
+	clock-controller@2008000 {
+		compatible = "qcom,kpss-acc-v2";
+		reg = <0x02008000 0x1000>;
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
