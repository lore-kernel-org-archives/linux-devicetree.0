From: <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: [PATCH v2 1/2] ARM: dts: imx6q-cm-fx6: fix the operation points
Date: Sun, 12 Jun 2016 17:19:21 +0200
Message-ID: <cd3010c3a4144ec38f2cfd1bfbd1b2ad@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>

The current ldo settings of the cm-fx6 do not allow 1.2GHz cpu
frequency. At this frequency the module behaves unstable.

But the imx6q fuse indicates that 1.2GHz operation is possible.
Hence, remove the 1.2GHz operation point in the device tree.

Signed-off-by: Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
[christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org: enhanced commit message and adjust
 remaining operation points to match the ones in imx6q.dtsi]
Signed-off-by: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
---

Notes:
    Changes since v1:
     - Enhance commit message to explain that we cannot rely on the imx6q
       fuse to restrict the frequency
     - put the same information into a comment in the device tree
     - fix the remaining operation points to match the ones given in
       imx6q.dtsi

 arch/arm/boot/dts/imx6q-cm-fx6.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-cm-fx6.dts b/arch/arm/boot/dts/imx6q-cm-fx6.dts
index 6d8d5e9..0038f0e 100644
--- a/arch/arm/boot/dts/imx6q-cm-fx6.dts
+++ b/arch/arm/boot/dts/imx6q-cm-fx6.dts
@@ -91,6 +91,27 @@
 	};
 };
 
+&cpu0 {
+	/* Although the imx6q fuse indicates that 1.2GHz operation is possible,
+	 * the module behaves unstable at this frequency. Hence, remove the
+	 * 1.2GHz operation point here.
+	 */
+	operating-points = <
+		/* kHz	uV */
+		996000	1250000
+		852000	1250000
+		792000	1175000
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
