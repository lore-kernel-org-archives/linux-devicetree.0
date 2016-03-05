From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/5] Documentation: dt: Add binding info for jz4740-rtc driver
Date: Sat,  5 Mar 2016 23:38:48 +0100
Message-ID: <1457217531-26064-2-git-send-email-paul@crapouillou.net>
References: <1457217531-26064-1-git-send-email-paul@crapouillou.net>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1457217531-26064-1-git-send-email-paul@crapouillou.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, Alessandro Zummo <a.zummo@towertech.it>, Paul Cercueil <paul@crapouillou.net>, Paul Burton <paul.burton@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, rtc-linux@googlegroups.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../devicetree/bindings/rtc/ingenic,jz4740-rtc.txt | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt b/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
new file mode 100644
index 0000000..71e4ad0
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
@@ -0,0 +1,38 @@
+JZ4740 and similar SoCs real-time clock driver
+
+Required properties:
+
+- compatible: One of:
+  - "ingenic,jz4740-rtc" - for use with the JZ4740 SoC
+  - "ingenic,jz4780-rtc" - for use with the JZ4780 SoC
+- reg: Address range of rtc register set
+- interrupts: IRQ number for the alarm interrupt
+- interrupt-parent: phandle of the interrupt controller
+- clocks: phandle to the "rtc" clock
+- clock-names: must be "rtc"
+
+Optional properties:
+- system-power-controller: To use this component as the
+  system power controller
+- reset-pin-assert-time: Reset pin low-level assertion time
+  after wakeup (default 60ms; range 0-125ms if RTC clock at 
+  32 kHz)
+- min-wakeup-pin-assert-time: Minimum wakeup pin assertion time
+  (default 100ms; range 0-2s if RTC clock at 32 kHz)
+
+Example:
+
+rtc@10003000 {
+	compatible = "ingenic,jz4740-rtc";
+	reg = <0x10003000 0x3F>;
+
+	interrupt-parent = <&intc>;
+	interrupts = <32>;
+
+	clocks = <&rtc_clock>;
+	clock-names = "rtc";
+
+	system-power-controller;
+	reset-pin-assert-time = <60>;
+	min-wakeup-pin-assert-time = <100>;
+};
-- 
2.7.0
