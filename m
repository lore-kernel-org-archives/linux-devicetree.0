From: Justin Chen <justinpopo6@gmail.com>
Subject: [PATCH 1/2] watchdog: bcm7038: add device tree binding documentation
Date: Thu, 20 Aug 2015 10:41:25 -0700
Message-ID: <1440092486-16905-2-git-send-email-justinpopo6@gmail.com>
References: <1440092486-16905-1-git-send-email-justinpopo6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440092486-16905-1-git-send-email-justinpopo6@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: feedback-list@broadcom.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, wim@iguana.be, linux-watchdog@vger.kernel.org, Justin Chen <justinpopo6@gmail.com>
List-Id: devicetree@vger.kernel.org

Add device tree binding docmentation for the watchdog hardware block
on bcm7038 and newer SoCs.

Signed-off-by: Justin Chen <justinpopo6@gmail.com>
---
 .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
new file mode 100644
index 0000000..adb8260
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
@@ -0,0 +1,19 @@
+BCM7038 Watchdog timer
+
+Required properties:
+
+- compatible : should be "brcm,bcm7038-wdt"
+- reg : Specifies base physical address and size of the registers.
+
+Optional properties:
+
+- clocks: the clock running the watchdog
+- clock-frequency: the rate of the clock
+
+Example:
+
+watchdog {
+	compatible = "brcm,bcm7038-wdt";
+	clocks = <&upg_fixed>;
+	reg = <0xf040a7e8 0x16>;
+};
-- 
2.1.0
