From: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v3 05/28] dt-bindings: clock: sun8i-de2: Add H6 DE3 clock description
Date: Sun,  4 Nov 2018 19:26:42 +0100
Message-ID: <20181104182705.18047-6-jernej.skrabec@siol.net>
References: <20181104182705.18047-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181104182705.18047-1-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, wens@csie.org
Cc: robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, airlied@linux.ie, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, jernej.skrabec@siol.net
List-Id: devicetree@vger.kernel.org

This commit adds necessary description and dt includes for H6 DE3 clock.
It is very similar to others, but memory region has some additional
registers not found in DE2.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 Documentation/devicetree/bindings/clock/sun8i-de2.txt | 5 +++--
 include/dt-bindings/clock/sun8i-de2.h                 | 3 +++
 include/dt-bindings/reset/sun8i-de2.h                 | 1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/sun8i-de2.txt b/Docu=
mentation/devicetree/bindings/clock/sun8i-de2.txt
index e94582e8b8a9..41a52c2acffd 100644
--- a/Documentation/devicetree/bindings/clock/sun8i-de2.txt
+++ b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
@@ -1,5 +1,5 @@
-Allwinner Display Engine 2.0 Clock Control Binding
---------------------------------------------------
+Allwinner Display Engine 2.0/3.0 Clock Control Binding
+------------------------------------------------------
=20
 Required properties :
 - compatible: must contain one of the following compatibles:
@@ -8,6 +8,7 @@ Required properties :
 		- "allwinner,sun8i-v3s-de2-clk"
 		- "allwinner,sun50i-a64-de2-clk"
 		- "allwinner,sun50i-h5-de2-clk"
+		- "allwinner,sun50i-h6-de3-clk"
=20
 - reg: Must contain the registers base address and length
 - clocks: phandle to the clocks feeding the display engine subsystem.
diff --git a/include/dt-bindings/clock/sun8i-de2.h b/include/dt-bindings/=
clock/sun8i-de2.h
index 3bed63b524aa..7768f73b051e 100644
--- a/include/dt-bindings/clock/sun8i-de2.h
+++ b/include/dt-bindings/clock/sun8i-de2.h
@@ -15,4 +15,7 @@
 #define CLK_MIXER1		7
 #define CLK_WB			8
=20
+#define CLK_BUS_ROT		9
+#define CLK_ROT			10
+
 #endif /* _DT_BINDINGS_CLOCK_SUN8I_DE2_H_ */
diff --git a/include/dt-bindings/reset/sun8i-de2.h b/include/dt-bindings/=
reset/sun8i-de2.h
index 9526017432f0..1c36a6ac86d6 100644
--- a/include/dt-bindings/reset/sun8i-de2.h
+++ b/include/dt-bindings/reset/sun8i-de2.h
@@ -10,5 +10,6 @@
 #define RST_MIXER0	0
 #define RST_MIXER1	1
 #define RST_WB		2
+#define RST_ROT		3
=20
 #endif /* _DT_BINDINGS_RESET_SUN8I_DE2_H_ */
--=20
2.19.1
