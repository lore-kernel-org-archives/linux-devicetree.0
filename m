From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 2/4] ARM: dts: vf610-zii-dev-rev-b: fix interrupt for GPIO
 expander
Date: Wed, 20 Dec 2017 23:11:50 +0000
Message-ID: <E1eRnWg-0006VE-GI@rmk-PC.armlinux.org.uk>
References: <20171220231108.GJ10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171220231108.GJ10595-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The interrupt specification for the GPIO expander is wrong - the
expander is wired to PTB28, which is GPIO98.  GPIO98 is on gpio chip
3, not 2.

In addition, the device is missing a required property.  Interrupt
controllers must have the "interrupt-controller" property specified.
Add this.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
index acdf12ad0622..ede8649ba515 100644
--- a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
+++ b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
@@ -371,7 +371,8 @@
 		reg = <0x22>;
 		gpio-controller;
 		#gpio-cells = <2>;
-		interrupt-parent = <&gpio2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio3>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
