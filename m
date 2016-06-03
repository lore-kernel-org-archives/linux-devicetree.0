From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/3] dt-bindings: watchdog: Add Meson GXBB Watchdog bindings
Date: Fri,  3 Jun 2016 10:36:46 +0200
Message-ID: <1464943007-18000-3-git-send-email-narmstrong@baylibre.com>
References: <1464943007-18000-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1464943007-18000-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/watchdog/meson-gxbb-wdt.txt      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt b/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
new file mode 100644
index 0000000..c7fe36f
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
@@ -0,0 +1,16 @@
+Meson GXBB SoCs Watchdog timer
+
+Required properties:
+
+- compatible : should be "amlogic,meson-gxbb-wdt"
+- reg : Specifies base physical address and size of the registers.
+- clocks : Should be a phandle to the Watchdog clock source, for GXBB the xtal
+	   is the default clock source.
+
+Example:
+
+wdt: watchdog@98d0 {
+	compatible = "amlogic,meson-gxbb-wdt";
+	reg = <0 0x98d0 0x0 0x10>;
+	clocks = <&xtal>;
+};
-- 
2.7.0
