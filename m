From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: [PATCH v7 6/8] ARM: dts: sun8i-h3: add HDMI video nodes
Date: Tue, 29 Nov 2016 11:12:15 +0100
Message-ID: <431252931ed44a3bafaba80843bb4066ab73ed9e.1480414715.git.moinejf@free.fr>
References: <cover.1480414715.git.moinejf@free.fr>
Reply-To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBXWQ6XAQKGQE4RC6ISI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.1480414715.git.moinejf-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
---
Note 1:
 The DE clock is not set in the driver. Instead, it is set at system
 startup time by 'assigned-clocks', but there is a problem in sunxi-ng
 which uses readl_relaxed_poll_timeout(), and, as noticed by
 Ond=C5=99ej Jirman, this function is not available at startup time.
 The fix of this problem is not part of this patchset series.
Note 2:
 The DE clock is set to a high enough rate (432MHz). It seems that
 this is needed to handle 4K video.
 But, as the proposed DE driver does not treat yet 4K video, the clock
 could be set to a lower rate. For example, the default rate for the A83T
 is 250MHz (no 4K video).
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 65 +++++++++++++++++++++++++++++++++++++=
++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.d=
tsi
index fca66bf..1aa087d 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -140,6 +140,16 @@
 		#size-cells =3D <1>;
 		ranges;
=20
+		de: de-controller@01000000 {
+			compatible =3D "allwinner,sun8i-h3-display-engine";
+			reg =3D <0x01000000 0x400000>;
+			clocks =3D <&ccu CLK_BUS_DE>, <&ccu CLK_DE>;
+			clock-names =3D "bus", "clock";
+			resets =3D <&ccu RST_BUS_DE>;
+			ports =3D <&tcon0_p>, <&tcon1_p>;
+			status =3D "disabled";
+		};
+
 		dma: dma-controller@01c02000 {
 			compatible =3D "allwinner,sun8i-h3-dma";
 			reg =3D <0x01c02000 0x1000>;
@@ -149,6 +159,37 @@
 			#dma-cells =3D <1>;
 		};
=20
+		tcon0: lcd-controller@01c0c000 {
+			compatible =3D "allwinner,sun8i-a83t-tcon";
+			reg =3D <0x01c0c000 0x400>;
+			clocks =3D <&ccu CLK_BUS_TCON0>, <&ccu CLK_TCON0>;
+			clock-names =3D "bus", "clock";
+			resets =3D <&ccu RST_BUS_TCON0>;
+			interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			status =3D "disabled";
+			tcon0_p: port {
+				tcon0_hdmi: endpoint {
+					remote-endpoint =3D <&hdmi_tcon0>;
+				};
+			};
+		};
+
+		/* not used */
+		tcon1: lcd-controller@01c0d000 {
+			compatible =3D "allwinner,sun8i-h3-tcon";
+			reg =3D <0x01c0d000 0x400>;
+			clocks =3D <&ccu CLK_BUS_TCON1>,
+				 <&ccu CLK_TCON0>;	/* no clock */
+			clock-names =3D "bus", "clock";
+			interrupts =3D <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			status =3D "disabled";
+			tcon1_p: port {
+				endpoint {
+					/* empty */
+				};
+			};
+		};
+
 		mmc0: mmc@01c0f000 {
 			compatible =3D "allwinner,sun7i-a20-mmc";
 			reg =3D <0x01c0f000 0x1000>;
@@ -314,6 +355,11 @@
 			clock-names =3D "hosc", "losc";
 			#clock-cells =3D <1>;
 			#reset-cells =3D <1>;
+
+			assigned-clocks =3D <&ccu CLK_PLL_DE>,
+					  <&ccu CLK_DE>;
+			assigned-clock-rates =3D  <864000000>,
+						<432000000>;
 		};
=20
 		pio: pinctrl@01c20800 {
@@ -567,6 +613,25 @@
 			interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH=
)>;
 		};
=20
+		hdmi: hdmi@01ee0000 {
+			compatible =3D "allwinner,sun8i-h3-hdmi";
+			reg =3D <0x01ee0000 0x20000>;
+			clocks =3D <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI>,
+				 <&ccu CLK_HDMI_DDC>;
+			clock-names =3D "bus", "clock", "ddc-clock";
+			resets =3D <&ccu RST_BUS_HDMI0>, <&ccu RST_BUS_HDMI1>;
+			reset-names =3D "hdmi0", "hdmi1";
+			status =3D "disabled";
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			port@0 {			/* video */
+				reg =3D <0>;
+				hdmi_tcon0: endpoint {
+					remote-endpoint =3D <&tcon0_hdmi>;
+				};
+			};
+		};
+
 		rtc: rtc@01f00000 {
 			compatible =3D "allwinner,sun6i-a31-rtc";
 			reg =3D <0x01f00000 0x54>;
--=20
2.10.2

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
