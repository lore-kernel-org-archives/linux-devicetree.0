From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 5/6] ARM: dts: hummingboard: add mSATA support for iMX6
 quad/dual HummingBoard
Date: Sat, 23 Aug 2014 10:11:42 +0100
Message-ID: <E1XL7MM-0002yT-2L@rmk-PC.arm.linux.org.uk>
References: <20140823091058.GO30401@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140823091058.GO30401-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Rabeeh Khoury <rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Initial patch from Rabeeh, but with the electrical properties added.

Signed-off-by: Rabeeh Khoury <rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>
Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-hummingboard.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-hummingboard.dts b/arch/arm/boot/dts/imx6q-hummingboard.dts
index 0a3574105165..c2bf8476ce45 100644
--- a/arch/arm/boot/dts/imx6q-hummingboard.dts
+++ b/arch/arm/boot/dts/imx6q-hummingboard.dts
@@ -11,3 +11,11 @@
 	model = "SolidRun HummingBoard Dual/Quad";
 	compatible = "solidrun,hummingboard/q", "fsl,imx6q";
 };
+
+&sata {
+	status = "okay";
+	fsl,transmit-level-mV = <1025>;
+	fsl,transmit-boost-mdB = <3330>;
+	fsl,transmit-atten-16ths = <9>;
+	fsl,receive-eq-mdB = <3000>;
+};
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
