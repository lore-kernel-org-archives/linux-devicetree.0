From: <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: imx6q-cm-fx6: fix the operation points
Date: Sun, 12 Jun 2016 15:20:45 +0200
Message-ID: <6b48c849983548f29259b42d69c5224c@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>

Fix the cm-fx6 operation points. Remove settings for 1.2GHz.
The current ldo settings do not allow 1.2GHz cpu frequency.

Signed-off-by: Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
[christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org: rebased on upstream and adapted
 commit title]
Signed-off-by: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-cm-fx6.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-cm-fx6.dts b/arch/arm/boot/dts/imx6q-cm-fx6.dts
index 6d8d5e9..c912d58 100644
--- a/arch/arm/boot/dts/imx6q-cm-fx6.dts
+++ b/arch/arm/boot/dts/imx6q-cm-fx6.dts
@@ -91,6 +91,23 @@
 	};
 };
 
+&cpu0 {
+	operating-points = <
+		/* kHz	uV */
+		996000	1250000
+		852000	1250000
+		792000	1150000
+		396000	975000
+	>;
+	fsl,soc-operating-points = <
+		/* ARM kHz	SOC-PU uV */
+		996000		1250000
+		852000		1250000
+		792000		1175000
+		396000		1175000
+	>;
+};
+
 &ecspi1 {
 	fsl,spi-num-chipselects = <2>;
 	cs-gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>, <&gpio3 19 GPIO_ACTIVE_HIGH>;
-- 
2.8.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
