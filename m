From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 07/17] dt-bindings: Add PLX Technology Reset Controller
 bindings
Date: Thu,  3 Mar 2016 12:40:00 +0100
Message-ID: <1457005210-18485-8-git-send-email-narmstrong@baylibre.com>
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
 .../devicetree/bindings/reset/plxtech,reset.txt    | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/plxtech,reset.txt

diff --git a/Documentation/devicetree/bindings/reset/plxtech,reset.txt b/Documentation/devicetree/bindings/reset/plxtech,reset.txt
new file mode 100644
index 0000000..e99648d
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/plxtech,reset.txt
@@ -0,0 +1,25 @@
+PLX Technology OXNAS SoC Family RESET Controller
+================================================
+
+Please also refer to reset.txt in this directory for common reset
+controller binding usage.
+
+Required properties:
+- compatible: Should be "plxtech,nas782x-reset"
+- #reset-cells: 1, see below
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
+	reset: reset-controller {
+		compatible = "plxtech,nas782x-reset";
+		#reset-cells = <1>;
+
+	};
+};
-- 
1.9.1
