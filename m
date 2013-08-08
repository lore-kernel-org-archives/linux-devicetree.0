Return-Path: <devicetree-owner@vger.kernel.org>
Received: from nbd.name ([46.4.11.11]:34660 "EHLO nbd.name"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751336Ab3HHJtH (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Thu, 8 Aug 2013 05:49:07 -0400
From: John Crispin <blogic@openwrt.org>
Subject: [PATCH V2 1/2] DT: Add documentation for ralink-wdt
Date: Thu,  8 Aug 2013 11:41:59 +0200
Message-Id: <1375954919-30737-1-git-send-email-blogic@openwrt.org>
Sender: devicetree-owner@vger.kernel.org
To: Wim Van Sebroeck <wim@iguana.be>
Cc: John Crispin <blogic@openwrt.org>, linux-watchdog@vger.kernel.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Describe ralink-wdt binding.

Signed-off-by: John Crispin <blogic@openwrt.org>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org
---
V1 used the old devicetree list as Cc.

 .../devicetree/bindings/watchdog/ralink-wdt.txt     |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/ralink-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/ralink-wdt.txt b/Documentation/devicetree/bindings/watchdog/ralink-wdt.txt
new file mode 100644
index 0000000..a70f0e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/ralink-wdt.txt
@@ -0,0 +1,19 @@
+Ralink Watchdog Timers
+
+Required properties :
+- compatible: must be "ralink,rt2880-wdt"
+- reg: physical base address of the controller and length of the register range
+
+Optional properties :
+- interrupt-parent: phandle to the INTC device node
+- interrupts : Specify the INTC interrupt number
+
+Example:
+
+	watchdog@120 {
+		compatible = "ralink,mt7620a-wdt", "ralink,rt2880-wdt";
+		reg = <0x120 0x10>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <1>;
+	};
-- 
1.7.10.4

