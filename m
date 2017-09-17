From: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: [PATCH v2 10/10] arm64: allwinner: a64: add dma
 controller references to spi nodes
Date: Sun, 17 Sep 2017 05:19:56 +0200
Message-ID: <20170917031956.28010-11-stefan.bruens@rwth-aachen.de>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRB36T67GQKGQEPNFFOUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170917031956.28010-1-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The spi controller nodes omit the dma controller/channel references, add
it.

This does not yet enable DMA for SPI transfers, as the spi-sun6i driver
lacks support for DMA, but always uses PIO to the FIFO.

Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boo=
t/dts/allwinner/sun50i-a64.dtsi
index 4f060ecdb061..ec71c48b393d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -476,6 +476,8 @@
 			interrupts =3D <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 			clocks =3D <&ccu CLK_BUS_SPI0>, <&ccu CLK_SPI0>;
 			clock-names =3D "ahb", "mod";
+			dmas =3D <&dma 23>, <&dma 23>;
+			dma-names =3D "rx", "tx";
 			pinctrl-names =3D "default";
 			pinctrl-0 =3D <&spi0_pins>;
 			resets =3D <&ccu RST_BUS_SPI0>;
@@ -491,6 +493,8 @@
 			interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
 			clocks =3D <&ccu CLK_BUS_SPI1>, <&ccu CLK_SPI1>;
 			clock-names =3D "ahb", "mod";
+			dmas =3D <&dma 24>, <&dma 24>;
+			dma-names =3D "rx", "tx";
 			pinctrl-names =3D "default";
 			pinctrl-0 =3D <&spi1_pins>;
 			resets =3D <&ccu RST_BUS_SPI1>;
--=20
2.14.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
