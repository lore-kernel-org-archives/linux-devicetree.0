From: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH] arm64: dts: ls1046a: Add dis_rxdet_inp3_quirk property to
 USB3 node
Date: Wed, 5 Jul 2017 03:15:19 +0000
Message-ID: <AM3PR04MB1489D79BAAC1C8AC3823BDB1F1D40@AM3PR04MB1489.eurprd04.prod.outlook.com>
References: <1496370600-31442-1-git-send-email-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496370600-31442-1-git-send-email-ran.wang_1-3arQi8VN3Tc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?iso-8859-2?Q?Horia_Geant=E3?= <horia.geanta-3arQi8VN3Tc@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mihai Emilian Bantea <mihai.bantea-3arQi8VN3Tc@public.gmane.org>, Jia Hongtao <hongtao.jia-3arQi8VN3Tc@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Gang Liu <gang.liu-3arQi8VN3Tc@public.gmane.org>, York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Sir,
    How is the review result of this patch. I am waiting for it be merged, =
thanks.

BR
Ran

-----Original Message-----
From: Ran Wang [mailto:ran.wang_1-3arQi8VN3Tc@public.gmane.org]=20
Sent: Friday, June 02, 2017 10:30 AM
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>; =
Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>; Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org=
>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>; Horia G=
eant=E3 <horia.geanta-3arQi8VN3Tc@public.gmane.org>; Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>; Mihai =
Emilian Bantea <mihai.bantea-3arQi8VN3Tc@public.gmane.org>; Jia Hongtao <hongtao.jia-3arQi8VN3Tc@public.gmane.org>; S=
cott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>; Gang Liu <gang.liu-3arQi8VN3Tc@public.gmane.org>; york sun <york.s=
un-3arQi8VN3Tc@public.gmane.org>; open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <de=
vicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>; moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)=
 <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>; open list <linux-kernel-u79uwXL29TZNg+MwTxZMZA@public.gmane.org=
l.org>; Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] arm64: dts: ls1046a: Add dis_rxdet_inp3_quirk property to =
USB3 node

Add "dis_rxdet_inp3_quirk" boolean property to USB3 node. This property is =
used to disable rx detection in P3 PHY mode.

Signed-off-by: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1046a.dtsi
index f4b8b7e..9137280 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -567,6 +567,7 @@
 			interrupts =3D <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode =3D "host";
 			snps,quirk-frame-length-adjustment =3D <0x20>;
+			snps,dis_rxdet_inp3_quirk;
 		};
=20
 		usb1: usb@3000000 {
@@ -575,6 +576,7 @@
 			interrupts =3D <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode =3D "host";
 			snps,quirk-frame-length-adjustment =3D <0x20>;
+			snps,dis_rxdet_inp3_quirk;
 		};
=20
 		usb2: usb@3100000 {
@@ -583,6 +585,7 @@
 			interrupts =3D <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode =3D "host";
 			snps,quirk-frame-length-adjustment =3D <0x20>;
+			snps,dis_rxdet_inp3_quirk;
 		};
=20
 		sata: sata@3200000 {
--
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
