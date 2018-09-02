Return-Path: <SRS0=aBeZ=LQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.nic.cz ([217.31.204.67]:45943 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726978AbeICATD (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 2 Sep 2018 20:19:03 -0400
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH] dt-bindings: watchdog: Document armada-37xx-wdt binding
Date: Sun,  2 Sep 2018 21:59:52 +0200
Message-Id: <20180902195952.627-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
List-ID: <devicetree@vger.kernel.org>

This adds device tree binding documentation for the CPU watchdog found
on Armada 37xx SOCs (EspressoBin, Turris Mox).

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 .../bindings/watchdog/armada-37xx-wdt.txt          | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/armada-37xx-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/armada-37xx-wdt.txt b/Documentation/devicetree/bindings/watchdog/armada-37xx-wdt.txt
new file mode 100644
index 000000000000..4ba9e40ad386
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/armada-37xx-wdt.txt
@@ -0,0 +1,23 @@
+* Armada 37xx CPU Watchdog Timer Controller
+
+Required properties:
+- compatible : must be "marvell,armada-3700-wdt"
+- reg : base physical address of the controller and length of memory mapped
+	region.
+- clocks : the clock feeding the watchdog timer. See clock-bindings.txt
+- marvell,system-controller : reference to syscon node for the CPU Miscellaneous
+	Registers
+
+Example:
+
+	cpu_misc: system-controller@d000 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0xd000 0x1000>;
+	};
+
+	wdt: watchdog-timer@8300 {
+		compatible = "marvell,armada-3700-wdt";
+		reg = <0x8300 0x40>;
+		marvell,system-controller = <&cpu_misc>;
+		clocks = <&xtalclk>;
+	};
-- 
2.16.4
