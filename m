From: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v3 18/28] dt-bindings: display: sunxi: add DT binding for Allwinner H6 DW HDMI
Date: Sun,  4 Nov 2018 19:26:55 +0100
Message-ID: <20181104182705.18047-19-jernej.skrabec@siol.net>
References: <20181104182705.18047-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181104182705.18047-1-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, wens@csie.org
Cc: robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, airlied@linux.ie, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, jernej.skrabec@siol.net, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy@aosc.io>

The Allwinner H6 SoC uses a v2.12a DesignWare HDMI controller, with
dedicated CEC and HDCP clocks added; the PHY connected is a standard
DesignWare HDMI PHY.

Add binding for it.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
[added HDCP clock and reset]
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../devicetree/bindings/display/sunxi/sun4i-drm.txt   | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.tx=
t b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index 62c83b351344..478b288eebd9 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -79,6 +79,7 @@ Required properties:
   - compatible: value must be one of:
     * "allwinner,sun8i-a83t-dw-hdmi"
     * "allwinner,sun50i-a64-dw-hdmi", "allwinner,sun8i-a83t-dw-hdmi"
+    * "allwinner,sun50i-h6-dw-hdmi"
   - reg: base address and size of memory-mapped region
   - reg-io-width: See dw_hdmi.txt. Shall be 1.
   - interrupts: HDMI interrupt number
@@ -86,9 +87,14 @@ Required properties:
     * iahb: the HDMI bus clock
     * isfr: the HDMI register clock
     * tmds: TMDS clock
+    * cec: HDMI CEC clock (H6 only)
+    * hdcp: HDCP clock (H6 only)
+    * hdcp-bus: HDCP bus clock (H6 only)
   - clock-names: the clock names mentioned above
-  - resets: phandle to the reset controller
-  - reset-names: must be "ctrl"
+  - resets:
+    * ctrl: HDMI controller reset
+    * hdcp: HDCP reset (H6 only)
+  - reset-names: reset names mentioned above
   - phys: phandle to the DWC HDMI PHY
   - phy-names: must be "phy"
=20
@@ -109,6 +115,7 @@ Required properties:
     * allwinner,sun8i-h3-hdmi-phy
     * allwinner,sun8i-r40-hdmi-phy
     * allwinner,sun50i-a64-hdmi-phy
+    * allwinner,sun50i-h6-hdmi-phy
   - reg: base address and size of memory-mapped region
   - clocks: phandles to the clocks feeding the HDMI PHY
     * bus: the HDMI PHY interface clock
--=20
2.19.1
