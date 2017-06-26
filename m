From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 3/4] dt-bindings: Document the Broadcom STB wake-up timer node
Date: Mon, 26 Jun 2017 15:32:46 -0700
Message-ID: <20170626223248.14199-7-f.fainelli@gmail.com>
References: <20170626223248.14199-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170626223248.14199-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Markus Mayer <mmayer@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Eric Anholt <eric@anholt.net>, Justin Chen <justinpopo6@gmail.com>, Doug Berger <opendmb@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:BROADCOM BCM47XX MIPS ARCHITEC" <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

Document the binding for the Broadcom STB SoCs wake-up timer node
allowing the system to generate alarms and exit low power states.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../bindings/rtc/brcm,brcmstb-waketimer.txt        | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/brcm,brcmstb-waketimer.txt

diff --git a/Documentation/devicetree/bindings/rtc/brcm,brcmstb-waketimer.txt b/Documentation/devicetree/bindings/rtc/brcm,brcmstb-waketimer.txt
new file mode 100644
index 000000000000..1d990bcc0baf
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/brcm,brcmstb-waketimer.txt
@@ -0,0 +1,22 @@
+Broadcom STB wake-up Timer
+
+The Broadcom STB wake-up timer provides a 27Mhz resolution timer, with the
+ability to wake up the system from low-power suspend/standby modes.
+
+Required properties:
+- compatible     : should contain "brcm,brcmstb-waketimer"
+- reg            : the register start and length for the WKTMR block
+- interrupts     : The TIMER interrupt
+- interrupt-parent: The phandle to the Always-On (AON) Power Management (PM) L2
+                    interrupt controller node
+- clocks	 : The phandle to the UPG fixed clock (27Mhz domain)
+
+Example:
+
+waketimer@f0411580 {
+	compatible = "brcm,brcmstb-waketimer";
+	reg = <0xf0411580 0x14>;
+	interrupts = <0x3>;
+	interrupt-parent = <&aon_pm_l2_intc>;
+	clocks = <&upg_fixed>;
+};
-- 
2.9.3
