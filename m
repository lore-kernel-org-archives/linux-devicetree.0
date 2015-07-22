From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v7 5/5] clk: dt: Introduce binding for critical clock support
Date: Wed, 22 Jul 2015 14:04:15 +0100
Message-ID: <1437570255-21049-6-git-send-email-lee.jones@linaro.org>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, mturquette@linaro.org, kernel@stlinux.com, s.hauer@pengutronix.de, sboyd@codeaurora.org, geert@linux-m68k.org, maxime.ripard@free-electrons.com, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../devicetree/bindings/clock/clock-bindings.txt   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index 06fc6d5..4137034 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -44,6 +44,45 @@ For example:
   clocks by index. The names should reflect the clock output signal
   names for the device.
 
+critical-clock:	Some hardware contains bunches of clocks which, in normal
+		circumstances, must never be turned off.  If drivers a) fail to
+		obtain a reference to any of these or b) give up a previously
+		obtained reference during suspend, it is possible that some
+		Operating Systems might attempt to disable them to save power.
+		If this happens a platform can fail irrecoverably as a result.
+		Usually the only way to recover from these failures is to
+		reboot.
+
+		To avoid either of these two scenarios from catastrophically
+		disabling an otherwise perfectly healthy running system,
+		clocks can be identified as 'critical' using this property from
+		inside a clocksource's node.
+
+		This property is not to be abused.  It is only to be used to
+		protect platforms from being crippled by gated clocks, NOT as a
+		convenience function to avoid using the framework correctly
+		inside device drivers.
+
+		Expected values are hardware clock indices.  If the
+		clock-indices property (see below) is used, then supplied
+		values must correspond to one of the listed identifiers.
+		Using the clock-indices example below, hardware clock <2>
+		is missing, therefore it is considered invalid to then
+		list clock <2> as a critical clock.
+
+For example:
+
+    oscillator {
+	#clock-cells = <1>;
+	clock-output-names = "ckil", "ckih";
+	critical-clock = <0>, <1>;
+    };
+
+- this node defines a device with two clock outputs, just as in the
+  example above.  The only difference being that 'ckil' and 'ckih'
+  are now identified as an critical clocks, so an OS will know to
+  never attempt to gate them.
+
 clock-indices:	   If the identifying number for the clocks in the node
 		   is not linear from zero, then this allows the mapping of
 		   identifiers into the clock-output-names array.
-- 
1.9.1
