From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 05/17] dt-bindings: Add PLX Technology RPS Timer bindings
Date: Thu,  3 Mar 2016 12:39:58 +0100
Message-ID: <1457005210-18485-6-git-send-email-narmstrong@baylibre.com>
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
 .../devicetree/bindings/timer/plxtech,rps-timer.txt     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/plxtech,rps-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/plxtech,rps-timer.txt b/Documentation/devicetree/bindings/timer/plxtech,rps-timer.txt
new file mode 100644
index 0000000..bc7cb33
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/plxtech,rps-timer.txt
@@ -0,0 +1,17 @@
+PLX Technology OXNAS SoCs Family RPS Timer
+==========================================
+
+Required properties:
+- compatible: Should be "plxtech,nas782x-rps-timer"
+- reg : Specifies base physical address and size of the registers.
+- interrupts : The interrupt of the first timer
+- clocks : The phandle of the timer clock source
+
+example:
+
+timer0: timer@200 {
+	compatible = "plxtech,nas782x-rps-timer";
+	reg = <0x200 0x40>;
+	clocks = <&rpsclk>;
+	interrupts = <4 5>;
+};
-- 
1.9.1
