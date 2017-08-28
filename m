From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] ARM: dts: keystone-k2g: Add McASP nodes
Date: Mon, 28 Aug 2017 10:19:57 +0300
Message-ID: <20170828071957.9597-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=EF=BB=BFAdd three McASP nodes present on 66AK2G device.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
---
Hi Santosh,

There is no driver change dependency for McASP to work on 66AK2G, only the =
nodes
need to be in place.

Regards,
Peter

 arch/arm/boot/dts/keystone-k2g.dtsi | 48 +++++++++++++++++++++++++++++++++=
++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keysto=
ne-k2g.dtsi
index 826b286665e6..5fcd2c6da46d 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -343,5 +343,53 @@
 			clock-names =3D "fck", "mmchsdb_fck";
 			status =3D "disabled";
 		};
+
+		mcasp0: mcasp@02340000 {
+			compatible =3D "ti,am33xx-mcasp-audio";
+			reg =3D <0x02340000 0x2000>,
+			      <0x21804000 0x1000>;
+			reg-names =3D "mpu","dat";
+			interrupts =3D <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names =3D "tx", "rx";
+			dmas =3D <&edma0 24 1>, <&edma0 25 1>;
+			dma-names =3D "tx", "rx";
+			power-domains =3D <&k2g_pds 0x4>;
+			clocks =3D <&k2g_clks 0x4 0>;
+			clock-names =3D "fck";
+			status =3D "disabled";
+		};
+
+		mcasp1: mcasp@02342000 {
+			compatible =3D "ti,am33xx-mcasp-audio";
+			reg =3D <0x02342000 0x2000>,
+			      <0x21804400 0x1000>;
+			reg-names =3D "mpu","dat";
+			interrupts =3D <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names =3D "tx", "rx";
+			dmas =3D <&edma1 48 1>, <&edma1 49 1>;
+			dma-names =3D "tx", "rx";
+			power-domains =3D <&k2g_pds 0x5>;
+			clocks =3D <&k2g_clks 0x5 0>;
+			clock-names =3D "fck";
+			status =3D "disabled";
+		};
+
+		mcasp2: mcasp@02344000 {
+			compatible =3D "ti,am33xx-mcasp-audio";
+			reg =3D <0x02344000 0x2000>,
+			      <0x21804800 0x1000>;
+			reg-names =3D "mpu","dat";
+			interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names =3D "tx", "rx";
+			dmas =3D <&edma1 50 1>, <&edma1 51 1>;
+			dma-names =3D "tx", "rx";
+			power-domains =3D <&k2g_pds 0x6>;
+			clocks =3D <&k2g_clks 0x6 0>;
+			clock-names =3D "fck";
+			status =3D "disabled";
+		};
 	};
 };
--=20
2.14.1


Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
