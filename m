From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/3] dt-bindings: chosen: Add clocksource and clockevent selection
Date: Wed, 13 Dec 2017 19:53:11 +0100
Message-ID: <20171213185313.20017-2-alexandre.belloni@free-electrons.com>
References: <20171213185313.20017-1-alexandre.belloni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171213185313.20017-1-alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The clocksource and clockevent timer are probed early in the boot process.
At that time it is difficult for linux to know whether a particular timer
can be used as the clocksource or the clockevent or by another driver,
especially when they are all identical or have similar features.

Until now, multiple strategies have been used to solve that:
 - use Kconfig option as MXC_USE_EPIT or ATMEL_TCB_CLKSRC_BLOCK
 - use a kernel parameter as the "clocksource" early_param in mach-omap2
 - registering the first seen timer as a clockevent and the second one as
 a clocksource as in rk_timer_init or dw_apb_timer_init

Add a linux,clocksource and a linux,clockevent node in chosen with a timer
property pointing to the timer to use. Other properties, like the targeted
precision may be added later.

Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 Documentation/devicetree/bindings/chosen.txt | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index e3b13ea7d2ae..c7ee3ecb5276 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -120,3 +120,23 @@ e.g.
 While this property does not represent a real hardware, the address
 and the size are expressed in #address-cells and #size-cells,
 respectively, of the root node.
+
+linux,clocksource and linux,clockevent
+--------------------------------------
+
+Those nodes have a timer property. This property is a phandle to the timer to be
+chosen as the clocksource or clockevent. This is only useful when the platform
+has multiple identical timers and it is not possible to let linux make the
+correct choice.
+
+/ {
+	chosen {
+		linux,clocksource {
+			timer = <&timer0>;
+		};
+
+		linux,clockevent {
+			timer = <&timer1>;
+		};
+	};
+};
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
