From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v3] ARM: dts: zynq: Add SPI
Date: Fri, 25 Jul 2014 13:12:31 +0200
Message-ID: <1406286752-8905-1-git-send-email-afaerber@suse.de>
References: <1cf9126b-c5e4-4ae7-a294-071584857d6c@BN1AFFO11FD052.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1cf9126b-c5e4-4ae7-a294-071584857d6c-reflc3kr++Mfl9YZzqd1IehlVc3/7hDbVaz/vdPVXQ4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, harini.katakam-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 v3: Split off from QSPI (Michal Simek).
=20
 arch/arm/boot/dts/zynq-7000.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-=
7000.dtsi
index cf0f3e4..ef11dab 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -140,6 +140,30 @@
 			interrupts =3D <0 50 4>;
 		};
=20
+		spi0: spi@e0006000 {
+			compatible =3D "xlnx,zynq-spi-r1p6";
+			reg =3D <0xe0006000 0x1000>;
+			status =3D "disabled";
+			interrupt-parent =3D <&intc>;
+			interrupts =3D <0 26 4>;
+			clocks =3D <&clkc 25>, <&clkc 34>;
+			clock-names =3D "ref_clk", "pclk";
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		spi1: spi@e0007000 {
+			compatible =3D "xlnx,zynq-spi-r1p6";
+			reg =3D <0xe0007000 0x1000>;
+			status =3D "disabled";
+			interrupt-parent =3D <&intc>;
+			interrupts =3D <0 49 4>;
+			clocks =3D <&clkc 26>, <&clkc 35>;
+			clock-names =3D "ref_clk", "pclk";
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
 		gem0: ethernet@e000b000 {
 			compatible =3D "cdns,gem";
 			reg =3D <0xe000b000 0x4000>;
--=20
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
