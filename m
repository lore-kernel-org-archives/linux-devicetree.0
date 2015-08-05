From: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] Documentation: dt: binding: atmel-sama5d4-wdt: for SAMA5D4 watchdog driver
Date: Wed, 5 Aug 2015 10:35:30 +0800
Message-ID: <1438742130-2089-3-git-send-email-wenyou.yang@atmel.com>
References: <1438742130-2089-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438742130-2089-1-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The compatible "atmel,sama5d4-wdt" supports the SAMA5D4 watchdog driver
and the watchdog's WDT_MR register can be written more than once.

Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 .../bindings/watchdog/atmel-sama5d4-wdt.txt        |   35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt b/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
new file mode 100644
index 0000000..f7cc7c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
@@ -0,0 +1,35 @@
+* Atmel SAMA5D4 Watchdog Timer (WDT) Controller
+
+Required properties:
+- compatible: "atmel,sama5d4-wdt"
+- reg: base physical address and length of memory mapped region.
+
+Optional properties:
+- timeout-sec: watchdog timeout value (in seconds).
+- interrupts: interrupt number to the CPU.
+- atmel,watchdog-type: should be "hardware" or "software".
+	"hardware": enable watchdog fault reset. A watchdog fault triggers
+		    watchdog reset.
+	"software": enable watchdog fault interrupt. A watchdog fault asserts
+		    watchdog interrupt.
+- atmel,idle-halt: present if you want to stop the watchdog when the CPU is
+		   in idle state.
+	CAUTION: This property should be used with care, it actually makes the
+	watchdog not counting when the CPU is in idle state, therefore the
+	watchdog reset time depends on mean CPU usage and will not reset at all
+	if the CPU stop working while it is in idle state, which is probably
+	not what you want.
+- atmel,dbg-halt: present if you want to stop the watchdog when the CPU is
+		  in debug state.
+
+Example:
+	watchdog@fc068640 {
+		compatible = "atmel,sama5d4-wdt";
+		reg = <0xfc068640 0x10>;
+		interrupts = <4 IRQ_TYPE_LEVEL_HIGH 5>;
+		timeout-sec = <10>;
+		atmel,watchdog-type = "hardware";
+		atmel,dbg-halt;
+		atmel,idle-halt;
+		status = "okay";
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
