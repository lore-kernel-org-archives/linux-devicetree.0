From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/8] arm64: dts: allwinner: Add ARM Mali GPU
 node for H6
Date: Thu, 11 Apr 2019 01:25:39 +0200
Message-ID: <20190410232543.13297-5-peron.clem@gmail.com>
References: <20190410232543.13297-1-peron.clem@gmail.com>
Reply-To: peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCELXIX7UICBBF7SXHSQKGQE4VUGEPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190410232543.13297-1-peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the mali gpu node to the H6 device-tree.

Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 80 ++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot=
/dts/allwinner/sun50i-h6.dtsi
index e0dc4a05c1ba..152b2128aadf 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -17,6 +17,71 @@
 	#address-cells =3D <1>;
 	#size-cells =3D <1>;
=20
+	gpu_opp_table: opp_table1 {
+		compatible =3D "operating-points-v2";
+
+		opp@756000000 {
+			opp-hz =3D /bits/ 64 <756000000>;
+			opp-microvolt =3D <1040000>;
+		};
+		opp@624000000 {
+			opp-hz =3D /bits/ 64 <624000000>;
+			opp-microvolt =3D <950000>;
+		};
+		opp@576000000 {
+			opp-hz =3D /bits/ 64 <576000000>;
+			opp-microvolt =3D <930000>;
+		};
+		opp@540000000 {
+			opp-hz =3D /bits/ 64 <540000000>;
+			opp-microvolt =3D <910000>;
+		};
+		opp@504000000 {
+			opp-hz =3D /bits/ 64 <504000000>;
+			opp-microvolt =3D <890000>;
+		};
+		opp@456000000 {
+			opp-hz =3D /bits/ 64 <456000000>;
+			opp-microvolt =3D <870000>;
+		};
+		opp@432000000 {
+			opp-hz =3D /bits/ 64 <432000000>;
+			opp-microvolt =3D <860000>;
+		};
+		opp@420000000 {
+			opp-hz =3D /bits/ 64 <420000000>;
+			opp-microvolt =3D <850000>;
+		};
+		opp@408000000 {
+			opp-hz =3D /bits/ 64 <408000000>;
+			opp-microvolt =3D <840000>;
+		};
+		opp@384000000 {
+			opp-hz =3D /bits/ 64 <384000000>;
+			opp-microvolt =3D <830000>;
+		};
+		opp@360000000 {
+			opp-hz =3D /bits/ 64 <360000000>;
+			opp-microvolt =3D <820000>;
+		};
+		opp@336000000 {
+			opp-hz =3D /bits/ 64 <336000000>;
+			opp-microvolt =3D <810000>;
+		};
+		opp@312000000 {
+			opp-hz =3D /bits/ 64 <312000000>;
+			opp-microvolt =3D <810000>;
+		};
+		opp@264000000 {
+			opp-hz =3D /bits/ 64 <264000000>;
+			opp-microvolt =3D <810000>;
+		};
+		opp@216000000 {
+			opp-hz =3D /bits/ 64 <216000000>;
+			opp-microvolt =3D <810000>;
+		};
+	};
+
 	cpus {
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
@@ -157,6 +222,21 @@
 			allwinner,sram =3D <&ve_sram 1>;
 		};
=20
+		gpu: gpu@1800000 {
+			compatible =3D "allwinner,sun50i-h6-mali",
+				     "arm,mali-t720";
+			reg =3D <0x01800000 0x4000>;
+			interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names =3D "job", "mmu", "gpu";
+			clocks =3D <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
+			clock-names =3D "core", "bus";
+			resets =3D <&ccu RST_BUS_GPU>;
+			operating-points-v2 =3D <&gpu_opp_table>;
+			status =3D "disabled";
+		};
+
 		syscon: syscon@3000000 {
 			compatible =3D "allwinner,sun50i-h6-system-control",
 				     "allwinner,sun50i-a64-system-control";
--=20
2.17.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
