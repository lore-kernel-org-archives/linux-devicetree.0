From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 19/19] ARM: dts: sun8i-a33: Add Video Engine
 and reserved memory nodes
Date: Mon, 18 Jun 2018 16:58:43 +0200
Message-ID: <20180618145843.14631-20-paul.kocialkowski@bootlin.com>
References: <20180618145843.14631-1-paul.kocialkowski@bootlin.com>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCOO3QWNR4KRBFMST7MQKGQE7WTDCNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180618145843.14631-1-paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tom Saeger <tom.saeger-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Smitha T Murthy <smitha.t-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds nodes for the Video Engine and the associated reserved memory
for the A33. Up to 96 MiB of memory are dedicated to the CMA pool.

The VPU can only map the first 256 MiB of DRAM, so the reserved memory
pool has to be located in that area. Following Allwinner's decision in
downstream software, the last 96 MiB of the first 256 MiB of RAM are
reserved for this purpose.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>

diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
index 97a976b3b1ef..c5c108a11285 100644
--- a/arch/arm/boot/dts/sun8i-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
@@ -181,6 +181,21 @@
 		reg = <0x40000000 0x80000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		/* Address must be kept in the lower 256 MiBs of DRAM for VE. */
+		cma_pool: cma@4a000000 {
+			compatible = "shared-dma-pool";
+			size = <0x6000000>;
+			alloc-ranges = <0x4a000000 0x6000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
 	sound: sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "sun8i-a33-audio";
@@ -262,6 +277,20 @@
 			};
 		};
 
+		vpu: video-codec@01c0e000 {
+			compatible = "allwinner,sun8i-a33-video-engine";
+			reg = <0x01c0e000 0x1000>;
+
+			clocks = <&ccu CLK_BUS_VE>, <&ccu CLK_VE>,
+				 <&ccu CLK_DRAM_VE>;
+			clock-names = "ahb", "mod", "ram";
+
+			resets = <&ccu RST_BUS_VE>;
+
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			allwinner,sram = <&ve_sram 1>;
+		};
+
 		crypto: crypto-engine@1c15000 {
 			compatible = "allwinner,sun4i-a10-crypto";
 			reg = <0x01c15000 0x1000>;
-- 
2.17.0
