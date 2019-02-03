From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 11/17 v1] clocksource/drivers/ixp4xx: Add DT bindings
Date: Sun,  3 Feb 2019 22:41:59 +0100
Message-ID: <20190203214205.13594-12-linus.walleij@linaro.org>
References: <20190203214205.13594-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190203214205.13594-1-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tim Harvey <tharvey@gateworks.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the Intel IXP4xx
timers.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Clocksource/timer maintainers: I am requesting an ACK for
this once you're happy with the bindings, as I intend to
merge all of this IXP4xx rework through ARM SoC.
---
 .../bindings/timer/intel,ixp4xx-timer.txt      | 18 ++++++++++++++++++
 MAINTAINERS                                    |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.txt b/Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.txt
new file mode 100644
index 000000000000..5b93477bb6ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.txt
@@ -0,0 +1,18 @@
+Intel IXP4xx XScale Networking Processors Timers
+
+This timer is found in the Intel IXP4xx processors.
+
+Required properties:
+
+- compatible : Must be
+  "intel,ixp4xx-timer"
+- reg : Should contain registers location and length
+- interrupts : Should contain the two timer interrupts
+
+Example:
+
+timer@c8005000 {
+	compatible = "intel,ixp4xx-timer";
+	reg = <0xc8005000 0x100>;
+	interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index ec318f09540c..775a623dc91d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1651,6 +1651,7 @@ M:	Krzysztof Halasa <khalasa@piap.pl>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.txt
+F:	Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.txt
 F:	arch/arm/mach-ixp4xx/
 F:	drivers/clocksource/timer-ixp4xx.c
 F:	drivers/gpio/gpio-ixp4xx.c
-- 
2.20.1
