From: Josh Cartwright <joshc@codeaurora.org>
Subject: [PATCH v3 2/3] watchdog: qcom: document device tree bindings
Date: Thu, 25 Sep 2014 12:48:52 -0500
Message-ID: <f49033de078aff9112fb8fa6fa4331e16998edf2.1411667144.git.joshc@codeaurora.org>
References: <cover.1411667144.git.joshc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1411667144.git.joshc@codeaurora.org>
In-Reply-To: <cover.1411667144.git.joshc@codeaurora.org>
References: <cover.1411667144.git.joshc@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-arm-msm@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

The Qualcomm Krait Processor Sub-system (KPSS) contains one or more
instances of the WDT.  Provide documentation on how to describe these in
the device tree.

Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
---
 .../devicetree/bindings/watchdog/qcom-wdt.txt      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
new file mode 100644
index 0000000..c75566e
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
@@ -0,0 +1,22 @@
+Qualcomm Krait Processor Sub-system (KPSS) Watchdog
+---------------------------------------------------
+
+Required properties :
+- compatible : shall contain only one of the following:
+
+			"qcom,kpss-wdt-msm8960"
+			"qcom,kpss-wdt-apq8064"
+			"qcom,kpss-wdt-ipq8064"
+
+- reg : shall contain base register location and length
+- clocks : shall contain the input clock
+- timeout-sec : shall contain the default watchdog timeout in seconds,
+                if unset, the default timeout is 30 seconds
+
+Example:
+	watchdog@208a038 {
+		compatible = "qcom,kpss-wdt-ipq8064";
+		reg = <0x0208a038 0x40>;
+		clocks = <&sleep_clk>;
+		timeout-sec = <10>;
+	};
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
