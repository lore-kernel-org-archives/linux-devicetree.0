From: Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH 3/4] watchdog: Add brcm,bcm6345-wdt device tree binding
Date: Sat, 21 Nov 2015 19:04:39 +0000
Message-ID: <5650C047.6040303@simon.arlott.org.uk>
References: <5650BFD6.5030700@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5650BFD6.5030700@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Wim Van Sebroeck <wim@iguana.be>, Miguel Gaio <miguel.gaio@efixo.com>, Maxime Bizon <mbizon@freebox.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mips@linux-mips.org, linux-watchdog@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add device tree binding for the BCM6345 watchdog.

This uses the BCM6345 timer for its warning interrupt.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
 .../bindings/watchdog/brcm,bcm6345-wdt.txt         | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm6345-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm6345-wdt.txt b/Documentation/devicetree/bindings/watchdog/brcm,bcm6345-wdt.txt
new file mode 100644
index 0000000..9d852d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm6345-wdt.txt
@@ -0,0 +1,35 @@
+BCM6345 Watchdog timer
+
+Required properties:
+
+- compatible: should be "brcm,bcm63<soc>-wdt", "brcm,bcm6345-wdt"
+- reg: Specifies base physical address and size of the registers.
+- clocks: Specify the clock used for timing
+
+Optional properties:
+
+- interrupt-parent: phandle to the interrupt controller
+- interrupts: Specify the interrupt used for the watchdog timout warning
+- timeout-sec: Contains the default watchdog timeout in seconds
+
+Example:
+
+watchdog {
+	compatible = "brcm,bcm63168-wdt", "brcm,bcm6345-wdt";
+	reg = <0x1000009c 0x0c>;
+	clocks = <&periph_clk>;
+
+	interrupt-parent = <&timer>;
+	interrupts = <3>;
+	timeout-sec = <30>;
+};
+
+watchdog {
+	compatible = "brcm,bcm6318-wdt", "brcm,bcm6345-wdt";
+	reg = <0x10000068 0x0c>;
+	clocks = <&periph_clk>;
+
+	interrupt-parent = <&timer>;
+	interrupts = <3>;
+	timeout-sec = <30>;
+};
-- 
2.1.4

-- 
Simon Arlott
