From: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: [PATCH 06/10] arm64: allwinner: a64: Add devicetree
 binding for DMA controller
Date: Mon, 4 Sep 2017 00:40:57 +0200
Message-ID: <20170903224100.17893-7-stefan.bruens@rwth-aachen.de>
References: <20170903224100.17893-1-stefan.bruens@rwth-aachen.de>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRBCMKWLGQKGQET74IQDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170903224100.17893-1-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The A64 is register compatible with the H3, but has a different number
of dma channels and request ports.

Attach additional properties to the node to allow future reuse of the
compatible for controllers with different number of channels/requests.

If dma-requests is not specified, the register layout defined maximum
of 32 is used.

Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
---
 .../devicetree/bindings/dma/sun6i-dma.txt          | 26 ++++++++++++++++++=
++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/sun6i-dma.txt b/Document=
ation/devicetree/bindings/dma/sun6i-dma.txt
index 6b267045f522..66195fb31296 100644
--- a/Documentation/devicetree/bindings/dma/sun6i-dma.txt
+++ b/Documentation/devicetree/bindings/dma/sun6i-dma.txt
@@ -26,6 +26,32 @@ Example:
 		#dma-cells =3D <1>;
 	};
=20
+--------------------------------------------------------------------------=
----
+For A64 DMA controller:
+
+Required properties:
+- compatible:	"allwinner,sun50i-a64-dma"
+- dma-channels: Number of DMA channels supported by the controller.
+		Refer to Documentation/devicetree/bindings/dma/dma.txt
+- all properties above, i.e. reg, interrupts, clocks, resets and #dma-cell=
s
+
+Optional properties:
+- dma-requests: Number of DMA request signals supported by the controller.
+		Refer to Documentation/devicetree/bindings/dma/dma.txt
+
+Example:
+	dma: dma-controller@01c02000 {
+		compatible =3D "allwinner,sun50i-a64-dma";
+		reg =3D <0x01c02000 0x1000>;
+		interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+		clocks =3D <&ccu CLK_BUS_DMA>;
+		dma-channels =3D <8>;
+		dma-requests =3D <27>;
+		resets =3D <&ccu RST_BUS_DMA>;
+		#dma-cells =3D <1>;
+	};
+--------------------------------------------------------------------------=
----
+
 Clients:
=20
 DMA clients connected to the A31 DMA controller must use the format
--=20
2.14.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
