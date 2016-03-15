From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Subject: [PATCHv2 27/31] ARM: dts: r8a7794: Reference both DMA controllers in HSCIF nodes
Date: Tue, 15 Mar 2016 13:42:04 +0100
Message-ID: <1458045728-4758-28-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1458045728-4758-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458045728-4758-1-git-send-email-niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

R-Car Gen2 have two DMA controllers, which are equivalent. Add
references to both dmac0 and dmac1 so the driver can fallback to the
later if the first one is unavailable.

Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
Acked-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/r8a7794.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794=
=2Edtsi
index ccf3061..bc65153 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -507,8 +507,9 @@
 		clocks =3D <&mstp7_clks R8A7794_CLK_HSCIF0>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x39>, <&dmac0 0x3a>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x39>, <&dmac0 0x3a>,
+		       <&dmac1 0x39>, <&dmac1 0x3a>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -521,8 +522,9 @@
 		clocks =3D <&mstp7_clks R8A7794_CLK_HSCIF1>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x4d>, <&dmac0 0x4e>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x4d>, <&dmac0 0x4e>,
+		       <&dmac1 0x4d>, <&dmac1 0x4e>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
@@ -535,8 +537,9 @@
 		clocks =3D <&mstp7_clks R8A7794_CLK_HSCIF2>, <&zs_clk>,
 			 <&scif_clk>;
 		clock-names =3D "fck", "brg_int", "scif_clk";
-		dmas =3D <&dmac0 0x3b>, <&dmac0 0x3c>;
-		dma-names =3D "tx", "rx";
+		dmas =3D <&dmac0 0x3b>, <&dmac0 0x3c>,
+		       <&dmac1 0x3b>, <&dmac1 0x3c>;
+		dma-names =3D "tx", "rx", "tx", "rx";
 		power-domains =3D <&cpg_clocks>;
 		status =3D "disabled";
 	};
--=20
2.7.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
