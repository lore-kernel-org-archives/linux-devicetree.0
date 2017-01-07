From: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH] Documentation: display: fix wrong documentation paths
Date: Sat,  7 Jan 2017 22:14:45 +0100
Message-ID: <1483823686-9361-1-git-send-email-yegorslists@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/display/arm,pl11x.txt                 | 2 +-
 Documentation/devicetree/bindings/display/bridge/analogix_dp.txt        | 2 +-
 Documentation/devicetree/bindings/display/cirrus,clps711x-fb.txt        | 2 +-
 Documentation/devicetree/bindings/display/exynos/exynos7-decon.txt      | 2 +-
 Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt       | 2 +-
 Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt            | 2 +-
 Documentation/devicetree/bindings/display/imx/ldb.txt                   | 2 +-
 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt    | 2 +-
 Documentation/devicetree/bindings/display/msm/dsi.txt                   | 2 +-
 Documentation/devicetree/bindings/display/msm/edp.txt                   | 2 +-
 Documentation/devicetree/bindings/display/msm/hdmi.txt                  | 2 +-
 Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt      | 2 +-
 Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt     | 2 +-
 .../devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt       | 2 +-
 Documentation/devicetree/bindings/display/tilcdc/panel.txt              | 2 +-
 15 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/arm,pl11x.txt b/Documentation/devicetree/bindings/display/arm,pl11x.txt
index 3e3039a..ef89ab4 100644
--- a/Documentation/devicetree/bindings/display/arm,pl11x.txt
+++ b/Documentation/devicetree/bindings/display/arm,pl11x.txt
@@ -22,7 +22,7 @@ Required properties:
 
 - clocks: contains phandle and clock specifier pairs for the entries
 	in the clock-names property. See
-	Documentation/devicetree/binding/clock/clock-bindings.txt
+	Documentation/devicetree/bindings/clock/clock-bindings.txt
 
 Optional properties:
 
diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
index 4a0f4f7..0c7473dd 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
+++ b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
@@ -33,7 +33,7 @@ Optional properties for dp-controller:
 		in Documentation/devicetree/bindings/media/video-interfaces.txt,
 		please refer to the SoC specific binding document:
 		* Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
-		* Documentation/devicetree/bindings/video/analogix_dp-rockchip.txt
+		* Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
 
 [1]: Documentation/devicetree/bindings/media/video-interfaces.txt
 -------------------------------------------------------------------------------
diff --git a/Documentation/devicetree/bindings/display/cirrus,clps711x-fb.txt b/Documentation/devicetree/bindings/display/cirrus,clps711x-fb.txt
index e9c6574..b0e5066 100644
--- a/Documentation/devicetree/bindings/display/cirrus,clps711x-fb.txt
+++ b/Documentation/devicetree/bindings/display/cirrus,clps711x-fb.txt
@@ -6,7 +6,7 @@ Required properties:
               location and size of the framebuffer memory.
 - clocks    : phandle + clock specifier pair of the FB reference clock.
 - display   : phandle to a display node as described in
-              Documentation/devicetree/bindings/display/display-timing.txt.
+              Documentation/devicetree/bindings/display/panel/display-timing.txt.
               Additionally, the display node has to define properties:
   - bits-per-pixel: Bits per pixel.
   - ac-prescale   : LCD AC bias frequency. This frequency is the required
diff --git a/Documentation/devicetree/bindings/display/exynos/exynos7-decon.txt b/Documentation/devicetree/bindings/display/exynos/exynos7-decon.txt
index 3938caa..027d6c2 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos7-decon.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos7-decon.txt
@@ -38,7 +38,7 @@ Optional Properties:
 		Can be used in case timings cannot be provided otherwise
 		or to override timings provided by the panel.
 
-[1]: Documentation/devicetree/bindings/display/display-timing.txt
+[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt b/Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt
index c7c6b9a..18645e0 100644
--- a/Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt
+++ b/Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt
@@ -83,7 +83,7 @@ in [2]. The following are properties specific to those nodes:
 		3 - for parallel output,
 		4 - for write-back interface
 
-[1]: Documentation/devicetree/bindings/display/display-timing.txt
+[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
 [2]: Documentation/devicetree/bindings/media/video-interfaces.txt
 
 Example:
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
index 00d5f8e..7a5c0e2 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
@@ -9,7 +9,7 @@ Required properties:
 
 Required nodes:
 - display: Phandle to a display node as described in
-	Documentation/devicetree/bindings/display/display-timing.txt
+	Documentation/devicetree/bindings/display/panel/display-timing.txt
 	Additional, the display node has to define properties:
 	- bits-per-pixel: Bits per pixel
 	- fsl,pcr: LCDC PCR value
diff --git a/Documentation/devicetree/bindings/display/imx/ldb.txt b/Documentation/devicetree/bindings/display/imx/ldb.txt
index a407462..38c637f 100644
--- a/Documentation/devicetree/bindings/display/imx/ldb.txt
+++ b/Documentation/devicetree/bindings/display/imx/ldb.txt
@@ -64,7 +64,7 @@ Required properties:
 Optional properties (required if display-timings are used):
  - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
  - display-timings : A node that describes the display timings as defined in
-   Documentation/devicetree/bindings/display/display-timing.txt.
+   Documentation/devicetree/bindings/display/panel/display-timing.txt.
  - fsl,data-mapping : should be "spwg" or "jeida"
                       This describes how the color bits are laid out in the
                       serialized LVDS signal.
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index db6e77e..708f566 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -55,7 +55,7 @@ Required properties (DMA function blocks):
 	"mediatek,<chip>-disp-rdma"
 	"mediatek,<chip>-disp-wdma"
 - larb: Should contain a phandle pointing to the local arbiter device as defined
-  in Documentation/devicetree/bindings/soc/mediatek/mediatek,smi-larb.txt
+  in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
 - iommus: Should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index 6b1cab1..fa00e62 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -108,7 +108,7 @@ Optional properties:
 - qcom,dsi-phy-regulator-ldo-mode: Boolean value indicating if the LDO mode PHY
   regulator is wanted.
 
-[1] Documentation/devicetree/bindings/clocks/clock-bindings.txt
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
 [2] Documentation/devicetree/bindings/graph.txt
 [3] Documentation/devicetree/bindings/media/video-interfaces.txt
 [4] Documentation/devicetree/bindings/display/panel/
diff --git a/Documentation/devicetree/bindings/display/msm/edp.txt b/Documentation/devicetree/bindings/display/msm/edp.txt
index 3a20f6e..e63032b 100644
--- a/Documentation/devicetree/bindings/display/msm/edp.txt
+++ b/Documentation/devicetree/bindings/display/msm/edp.txt
@@ -10,7 +10,7 @@ Required properties:
 - interrupts: The interrupt signal from the eDP block.
 - power-domains: Should be <&mmcc MDSS_GDSC>.
 - clocks: device clocks
-  See Documentation/devicetree/bindings/clocks/clock-bindings.txt for details.
+  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
 - clock-names: the following clocks are required:
   * "core_clk"
   * "iface_clk"
diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.txt b/Documentation/devicetree/bindings/display/msm/hdmi.txt
index 2ad5789..2d306f4 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.txt
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.txt
@@ -49,7 +49,7 @@ Required properties:
     * "hdmi_tx_l4"
 - power-domains: Should be <&mmcc MDSS_GDSC>.
 - clocks: device clocks
-  See Documentation/devicetree/bindings/clocks/clock-bindings.txt for details.
+  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
 - core-vdda-supply: phandle to vdda regulator device node
 
 Example:
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt
index fc595d9..354d4d1 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt
@@ -20,7 +20,7 @@ The device node can contain one 'port' child node with one child
 'endpoint' node, according to the bindings defined in [3]. This
 node should describe panel's video bus.
 
-[1]: Documentation/devicetree/bindings/display/display-timing.txt
+[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
 [2]: Documentation/devicetree/bindings/spi/spi-bus.txt
 [3]: Documentation/devicetree/bindings/media/video-interfaces.txt
 
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
index 25701c8..9e766c5 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
@@ -21,7 +21,7 @@ The device node can contain one 'port' child node with one child
 'endpoint' node, according to the bindings defined in [2]. This
 node should describe panel's video bus.
 
-[1]: Documentation/devicetree/bindings/display/display-timing.txt
+[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
 [2]: Documentation/devicetree/bindings/media/video-interfaces.txt
 
 Example:
diff --git a/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
index 01cced1..47665a1 100644
--- a/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
@@ -35,7 +35,7 @@ Optional property for different chips:
 	       Required elements: "grf"
 
 For the below properties, please refer to Analogix DP binding document:
- * Documentation/devicetree/bindings/drm/bridge/analogix_dp.txt
+ * Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
 - phys (required)
 - phy-names (required)
 - hpd-gpios (optional)
diff --git a/Documentation/devicetree/bindings/display/tilcdc/panel.txt b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
index f20b31c..8082163 100644
--- a/Documentation/devicetree/bindings/display/tilcdc/panel.txt
+++ b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
@@ -15,7 +15,7 @@ Required properties:
  - display-timings: typical videomode of lcd panel.  Multiple video modes
    can be listed if the panel supports multiple timings, but the 'native-mode'
    should be the preferred/default resolution.  Refer to
-   Documentation/devicetree/bindings/display/display-timing.txt for display
+   Documentation/devicetree/bindings/display/panel/display-timing.txt for display
    timing binding details.
 
 Optional properties:
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
