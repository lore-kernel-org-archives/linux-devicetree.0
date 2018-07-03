From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/3] dt-bindings: amlogic: Add Internal Clock Measurer bindings
Date: Tue,  3 Jul 2018 15:21:49 +0200
Message-ID: <1530624110-4687-3-git-send-email-narmstrong@baylibre.com>
References: <1530624110-4687-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1530624110-4687-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: khilman@baylibre.com, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

The Amlogic Meson GX SoCs embeds a clock measurer IP to measure the internal
clock paths frequencies.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/soc/amlogic/clk-measure.txt       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt

diff --git a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
new file mode 100644
index 0000000..ba9183a
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
@@ -0,0 +1,15 @@
+Amlogic Internal Clock Measurer
+===============================
+
+The Amlogic SoCs contains an IP to measure the internal clocks.
+The precision is multiple of MHz, useful to debug the clock states.
+
+Required properties:
+- compatible: Shall contain "amlogic,meson-gx-clk-measure"
+- reg: base address and size of the Clock Measurer register space.
+
+Example:
+	clock-measure@8758 {
+		compatible = "amlogic,meson-gx-clk-measure";
+		reg = <0x0 0x8758 0x0 0x10>;
+	};
-- 
2.7.4
