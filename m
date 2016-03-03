From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 09/17] dt-bindings: Add PLX Technology OXNAS Standard Clocks
 bindings
Date: Thu,  3 Mar 2016 12:40:02 +0100
Message-ID: <1457005210-18485-10-git-send-email-narmstrong@baylibre.com>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/clock/plxtech,stdclk.txt   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/plxtech,stdclk.txt

diff --git a/Documentation/devicetree/bindings/clock/plxtech,stdclk.txt b/Documentation/devicetree/bindings/clock/plxtech,stdclk.txt
new file mode 100644
index 0000000..46465c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/plxtech,stdclk.txt
@@ -0,0 +1,24 @@
+PLX Technology OXNAS SoC Family Standard Clocks
+================================================
+
+Please also refer to clock-bindings.txt in this directory for common clock
+bindings usage.
+
+Required properties:
+- compatible: Should be "plxtech,ox810se-stdclk" or "plxtech,nas782x-stdclk"
+- #clock-cells: 1, see below
+
+Parent node should have the following properties :
+- compatible: Should be "plxtech,ox810se-sys-ctrl", "syscon", "simple-mfd"
+
+example:
+
+sys: sys-ctrl@000000 {
+	compatible = "plxtech,ox810se-sys-ctrl", "syscon", "simple-mfd";
+	reg = <0x000000 0x100000>;
+
+	stdclk: stdclk {
+		compatible = "plxtech,ox810se-stdclk", "plxtech,nas782x-stdclk";
+		#reset-cells = <1>;
+	};
+};
-- 
1.9.1
