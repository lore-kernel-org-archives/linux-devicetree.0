From: Rob Herring <robh@kernel.org>
Subject: [PATCH 1/8] dt-bindings: consolidate display related bindings
Date: Thu,  1 Oct 2015 17:12:27 -0500
Message-ID: <1443737554-10352-2-git-send-email-robh@kernel.org>
References: <1443737554-10352-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443737554-10352-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This is a quite large renaming to consolidate display related bindings
into a single "display" directory from various scattered locations of
video, drm, gpu, fb, mipi, and panel. The prior location was somewhat
based on the Linux driver location, but bindings should be independent
of that.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
---
 Documentation/devicetree/bindings/{video => display}/arm,pl11x.txt        | 0
 .../devicetree/bindings/{drm => display}/armada/marvell,dove-lcd.txt      | 0
 Documentation/devicetree/bindings/{video => display}/atmel,lcdc.txt       | 0
 Documentation/devicetree/bindings/{drm => display}/atmel/hlcdc-dc.txt     | 0
 .../devicetree/bindings/{video => display/bridge}/adi,adv7123.txt         | 0
 .../devicetree/bindings/{video => display/bridge}/adi,adv7511.txt         | 0
 Documentation/devicetree/bindings/{drm => display}/bridge/dw_hdmi.txt     | 0
 Documentation/devicetree/bindings/{video => display}/bridge/ps8622.txt    | 0
 Documentation/devicetree/bindings/{video => display}/bridge/ptn3460.txt   | 0
 Documentation/devicetree/bindings/{drm/i2c => display/bridge}/tda998x.txt | 0
 .../{video/thine,thc63lvdm83d => display/bridge/thine,thc63lvdm83d.txt}   | 0
 .../devicetree/bindings/{video => display}/cirrus,clps711x-fb.txt         | 0
 .../bindings/{video => display/connector}/analog-tv-connector.txt         | 0
 .../devicetree/bindings/{video => display/connector}/dvi-connector.txt    | 0
 .../devicetree/bindings/{video => display/connector}/hdmi-connector.txt   | 0
 .../devicetree/bindings/{video => display/connector}/vga-connector.txt    | 0
 .../devicetree/bindings/{video => display/exynos}/exynos-mic.txt          | 0
 .../devicetree/bindings/{video => display/exynos}/exynos5433-decon.txt    | 0
 .../devicetree/bindings/{video => display/exynos}/exynos7-decon.txt       | 0
 Documentation/devicetree/bindings/{video => display/exynos}/exynos_dp.txt | 0
 .../devicetree/bindings/{video => display/exynos}/exynos_dsim.txt         | 0
 .../devicetree/bindings/{video => display/exynos}/exynos_hdmi.txt         | 0
 .../devicetree/bindings/{video => display/exynos}/exynos_hdmiddc.txt      | 0
 .../devicetree/bindings/{video => display/exynos}/exynos_hdmiphy.txt      | 0
 .../devicetree/bindings/{video => display/exynos}/exynos_mixer.txt        | 0
 .../devicetree/bindings/{video => display/exynos}/samsung-fimd.txt        | 0
 Documentation/devicetree/bindings/{video => display}/fsl,dcu.txt          | 0
 Documentation/devicetree/bindings/{video => display/imx}/fsl,imx-fb.txt   | 0
 Documentation/devicetree/bindings/{drm => display}/imx/fsl-imx-drm.txt    | 0
 Documentation/devicetree/bindings/{drm => display}/imx/hdmi.txt           | 0
 Documentation/devicetree/bindings/{drm => display}/imx/ldb.txt            | 0
 Documentation/devicetree/bindings/{mipi/dsi => display}/mipi-dsi-bus.txt  | 0
 Documentation/devicetree/bindings/{drm => display}/msm/dsi.txt            | 0
 Documentation/devicetree/bindings/{drm => display}/msm/edp.txt            | 0
 Documentation/devicetree/bindings/{drm => display}/msm/gpu.txt            | 0
 Documentation/devicetree/bindings/{drm => display}/msm/hdmi.txt           | 0
 Documentation/devicetree/bindings/{drm => display}/msm/mdp.txt            | 0
 Documentation/devicetree/bindings/{fb => display}/mxsfb.txt               | 0
 .../devicetree/bindings/{ => display}/panel/ampire,am800480r3tmqwa1h.txt  | 0
 Documentation/devicetree/bindings/{ => display}/panel/auo,b080uan01.txt   | 0
 Documentation/devicetree/bindings/{ => display}/panel/auo,b101aw03.txt    | 0
 Documentation/devicetree/bindings/{ => display}/panel/auo,b101ean01.txt   | 0
 Documentation/devicetree/bindings/{ => display}/panel/auo,b101xtn01.txt   | 0
 Documentation/devicetree/bindings/{ => display}/panel/auo,b116xw03.txt    | 0
 Documentation/devicetree/bindings/{ => display}/panel/auo,b133htn01.txt   | 0
 Documentation/devicetree/bindings/{ => display}/panel/auo,b133xtn01.txt   | 0
 Documentation/devicetree/bindings/{ => display}/panel/avic,tm070ddh03.txt | 0
 .../devicetree/bindings/{ => display}/panel/chunghwa,claa101wa01a.txt     | 0
 .../devicetree/bindings/{ => display}/panel/chunghwa,claa101wb03.txt      | 0
 .../devicetree/bindings/{video => display/panel}/display-timing.txt       | 0
 Documentation/devicetree/bindings/{ => display}/panel/edt,et057090dhu.txt | 0
 Documentation/devicetree/bindings/{ => display}/panel/edt,et070080dh6.txt | 0
 .../devicetree/bindings/{ => display}/panel/edt,etm0700g0dh6.txt          | 0
 .../devicetree/bindings/{ => display}/panel/foxlink,fl500wvr00-a0t.txt    | 0
 .../devicetree/bindings/{ => display}/panel/giantplus,gpg482739qs5.txt    | 0
 .../devicetree/bindings/{ => display}/panel/hannstar,hsd070pww1.txt       | 0
 .../devicetree/bindings/{ => display}/panel/hannstar,hsd100pxn1.txt       | 0
 .../devicetree/bindings/{ => display}/panel/hit,tx23d38vm0caa.txt         | 0
 .../devicetree/bindings/{ => display}/panel/innolux,at043tn24.txt         | 0
 .../devicetree/bindings/{ => display}/panel/innolux,g121i1-l01.txt        | 0
 Documentation/devicetree/bindings/{ => display}/panel/innolux,n116bge.txt | 0
 .../devicetree/bindings/{ => display}/panel/innolux,n156bge-l21.txt       | 0
 .../devicetree/bindings/{ => display}/panel/innolux,zj070na-01p.txt       | 0
 Documentation/devicetree/bindings/{ => display}/panel/lg,lb070wv8.txt     | 0
 .../devicetree/bindings/{ => display}/panel/lg,ld070wx3-sl01.txt          | 0
 Documentation/devicetree/bindings/{ => display}/panel/lg,lg4573.txt       | 0
 .../devicetree/bindings/{ => display}/panel/lg,lh500wx1-sd03.txt          | 0
 Documentation/devicetree/bindings/{ => display}/panel/lg,lp129qe.txt      | 0
 .../devicetree/bindings/{video => display/panel}/lgphilips,lb035q02.txt   | 0
 .../devicetree/bindings/{ => display}/panel/nec,nl4827hc19-05b.txt        | 0
 .../devicetree/bindings/{ => display}/panel/okaya,rs800480t-7x0gp.txt     | 0
 .../devicetree/bindings/{ => display}/panel/ortustech,com43h4m85ulc.txt   | 0
 .../devicetree/bindings/{ => display}/panel/panasonic,vvx10f004b00.txt    | 0
 Documentation/devicetree/bindings/{video => display/panel}/panel-dpi.txt  | 0
 .../devicetree/bindings/{video => display/panel}/panel-dsi-cm.txt         | 0
 Documentation/devicetree/bindings/{ => display}/panel/samsung,ld9040.txt  | 0
 .../devicetree/bindings/{ => display}/panel/samsung,ltn101nt05.txt        | 0
 .../devicetree/bindings/{ => display}/panel/samsung,ltn140at29-301.txt    | 0
 Documentation/devicetree/bindings/{ => display}/panel/samsung,s6e8aa0.txt | 0
 .../devicetree/bindings/{ => display}/panel/sharp,lq101r1sx01.txt         | 0
 .../devicetree/bindings/{video => display/panel}/sharp,ls037v7dw01.txt    | 0
 .../devicetree/bindings/{ => display}/panel/shelly,sca07010-bfn-lnn.txt   | 0
 Documentation/devicetree/bindings/{ => display}/panel/simple-panel.txt    | 0
 .../devicetree/bindings/{video => display/panel}/sony,acx565akm.txt       | 0
 .../devicetree/bindings/{video => display/panel}/toppoly,td028ttec1.txt   | 0
 .../devicetree/bindings/{video => display/panel}/tpo,td043mtea1.txt       | 0
 Documentation/devicetree/bindings/{video => display}/renesas,du.txt       | 0
 .../devicetree/bindings/{video => display/rockchip}/dw_hdmi-rockchip.txt  | 0
 .../devicetree/bindings/{video => display/rockchip}/rockchip-drm.txt      | 0
 .../devicetree/bindings/{video => display/rockchip}/rockchip-vop.txt      | 0
 .../devicetree/bindings/{video => display}/simple-framebuffer-sunxi.txt   | 0
 .../devicetree/bindings/{video => display}/simple-framebuffer.txt         | 0
 Documentation/devicetree/bindings/{fb => display}/sm501fb.txt             | 0
 Documentation/devicetree/bindings/{video => display}/ssd1289fb.txt        | 0
 Documentation/devicetree/bindings/{video => display}/ssd1307fb.txt        | 0
 Documentation/devicetree/bindings/{gpu => display}/st,stih4xx.txt         | 0
 .../devicetree/bindings/{mipi => display/tegra}/nvidia,tegra114-mipi.txt  | 0
 .../devicetree/bindings/{gpu => display/tegra}/nvidia,tegra20-host1x.txt  | 0
 Documentation/devicetree/bindings/{video => display/ti}/ti,dra7-dss.txt   | 0
 Documentation/devicetree/bindings/{video => display/ti}/ti,omap-dss.txt   | 0
 Documentation/devicetree/bindings/{video => display/ti}/ti,omap2-dss.txt  | 0
 Documentation/devicetree/bindings/{video => display/ti}/ti,omap3-dss.txt  | 0
 Documentation/devicetree/bindings/{video => display/ti}/ti,omap4-dss.txt  | 0
 Documentation/devicetree/bindings/{video => display/ti}/ti,omap5-dss.txt  | 0
 Documentation/devicetree/bindings/{video => display/ti}/ti,opa362.txt     | 0
 Documentation/devicetree/bindings/{video => display/ti}/ti,tfp410.txt     | 0
 Documentation/devicetree/bindings/{video => display/ti}/ti,tpd12s015.txt  | 0
 Documentation/devicetree/bindings/{drm => display}/tilcdc/panel.txt       | 0
 Documentation/devicetree/bindings/{drm => display}/tilcdc/tfp410.txt      | 0
 Documentation/devicetree/bindings/{drm => display}/tilcdc/tilcdc.txt      | 0
 Documentation/devicetree/bindings/{video => display}/via,vt8500-fb.txt    | 0
 Documentation/devicetree/bindings/{video => display}/wm,prizm-ge-rops.txt | 0
 Documentation/devicetree/bindings/{video => display}/wm,wm8505-fb.txt     | 0
 113 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{video => display}/arm,pl11x.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/armada/marvell,dove-lcd.txt (100%)
 rename Documentation/devicetree/bindings/{video => display}/atmel,lcdc.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/atmel/hlcdc-dc.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/bridge}/adi,adv7123.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/bridge}/adi,adv7511.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/bridge/dw_hdmi.txt (100%)
 rename Documentation/devicetree/bindings/{video => display}/bridge/ps8622.txt (100%)
 rename Documentation/devicetree/bindings/{video => display}/bridge/ptn3460.txt (100%)
 rename Documentation/devicetree/bindings/{drm/i2c => display/bridge}/tda998x.txt (100%)
 rename Documentation/devicetree/bindings/{video/thine,thc63lvdm83d => display/bridge/thine,thc63lvdm83d.txt} (100%)
 rename Documentation/devicetree/bindings/{video => display}/cirrus,clps711x-fb.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/connector}/analog-tv-connector.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/connector}/dvi-connector.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/connector}/hdmi-connector.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/connector}/vga-connector.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/exynos}/exynos-mic.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/exynos}/exynos5433-decon.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/exynos}/exynos7-decon.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/exynos}/exynos_dp.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/exynos}/exynos_dsim.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/exynos}/exynos_hdmi.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/exynos}/exynos_hdmiddc.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/exynos}/exynos_hdmiphy.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/exynos}/exynos_mixer.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/exynos}/samsung-fimd.txt (100%)
 rename Documentation/devicetree/bindings/{video => display}/fsl,dcu.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/imx}/fsl,imx-fb.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/imx/fsl-imx-drm.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/imx/hdmi.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/imx/ldb.txt (100%)
 rename Documentation/devicetree/bindings/{mipi/dsi => display}/mipi-dsi-bus.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/msm/dsi.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/msm/edp.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/msm/gpu.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/msm/hdmi.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/msm/mdp.txt (100%)
 rename Documentation/devicetree/bindings/{fb => display}/mxsfb.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/ampire,am800480r3tmqwa1h.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/auo,b080uan01.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/auo,b101aw03.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/auo,b101ean01.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/auo,b101xtn01.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/auo,b116xw03.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/auo,b133htn01.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/auo,b133xtn01.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/avic,tm070ddh03.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/chunghwa,claa101wa01a.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/chunghwa,claa101wb03.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/panel}/display-timing.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/edt,et057090dhu.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/edt,et070080dh6.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/edt,etm0700g0dh6.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/foxlink,fl500wvr00-a0t.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/giantplus,gpg482739qs5.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/hannstar,hsd070pww1.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/hannstar,hsd100pxn1.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/hit,tx23d38vm0caa.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/innolux,at043tn24.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/innolux,g121i1-l01.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/innolux,n116bge.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/innolux,n156bge-l21.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/innolux,zj070na-01p.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/lg,lb070wv8.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/lg,ld070wx3-sl01.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/lg,lg4573.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/lg,lh500wx1-sd03.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/lg,lp129qe.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/panel}/lgphilips,lb035q02.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/nec,nl4827hc19-05b.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/okaya,rs800480t-7x0gp.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/ortustech,com43h4m85ulc.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/panasonic,vvx10f004b00.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/panel}/panel-dpi.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/panel}/panel-dsi-cm.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/samsung,ld9040.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/samsung,ltn101nt05.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/samsung,ltn140at29-301.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/samsung,s6e8aa0.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/sharp,lq101r1sx01.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/panel}/sharp,ls037v7dw01.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/shelly,sca07010-bfn-lnn.txt (100%)
 rename Documentation/devicetree/bindings/{ => display}/panel/simple-panel.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/panel}/sony,acx565akm.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/panel}/toppoly,td028ttec1.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/panel}/tpo,td043mtea1.txt (100%)
 rename Documentation/devicetree/bindings/{video => display}/renesas,du.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/rockchip}/dw_hdmi-rockchip.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/rockchip}/rockchip-drm.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/rockchip}/rockchip-vop.txt (100%)
 rename Documentation/devicetree/bindings/{video => display}/simple-framebuffer-sunxi.txt (100%)
 rename Documentation/devicetree/bindings/{video => display}/simple-framebuffer.txt (100%)
 rename Documentation/devicetree/bindings/{fb => display}/sm501fb.txt (100%)
 rename Documentation/devicetree/bindings/{video => display}/ssd1289fb.txt (100%)
 rename Documentation/devicetree/bindings/{video => display}/ssd1307fb.txt (100%)
 rename Documentation/devicetree/bindings/{gpu => display}/st,stih4xx.txt (100%)
 rename Documentation/devicetree/bindings/{mipi => display/tegra}/nvidia,tegra114-mipi.txt (100%)
 rename Documentation/devicetree/bindings/{gpu => display/tegra}/nvidia,tegra20-host1x.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/ti}/ti,dra7-dss.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/ti}/ti,omap-dss.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/ti}/ti,omap2-dss.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/ti}/ti,omap3-dss.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/ti}/ti,omap4-dss.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/ti}/ti,omap5-dss.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/ti}/ti,opa362.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/ti}/ti,tfp410.txt (100%)
 rename Documentation/devicetree/bindings/{video => display/ti}/ti,tpd12s015.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/tilcdc/panel.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/tilcdc/tfp410.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/tilcdc/tilcdc.txt (100%)
 rename Documentation/devicetree/bindings/{video => display}/via,vt8500-fb.txt (100%)
 rename Documentation/devicetree/bindings/{video => display}/wm,prizm-ge-rops.txt (100%)
 rename Documentation/devicetree/bindings/{video => display}/wm,wm8505-fb.txt (100%)

diff --git a/Documentation/devicetree/bindings/video/arm,pl11x.txt b/Documentation/devicetree/bindings/display/arm,pl11x.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/arm,pl11x.txt
rename to Documentation/devicetree/bindings/display/arm,pl11x.txt
diff --git a/Documentation/devicetree/bindings/drm/armada/marvell,dove-lcd.txt b/Documentation/devicetree/bindings/display/armada/marvell,dove-lcd.txt
similarity index 100%
rename from Documentation/devicetree/bindings/drm/armada/marvell,dove-lcd.txt
rename to Documentation/devicetree/bindings/display/armada/marvell,dove-lcd.txt
diff --git a/Documentation/devicetree/bindings/video/atmel,lcdc.txt b/Documentation/devicetree/bindings/display/atmel,lcdc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/atmel,lcdc.txt
rename to Documentation/devicetree/bindings/display/atmel,lcdc.txt
diff --git a/Documentation/devicetree/bindings/drm/atmel/hlcdc-dc.txt b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/drm/atmel/hlcdc-dc.txt
rename to Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
diff --git a/Documentation/devicetree/bindings/video/adi,adv7123.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/adi,adv7123.txt
rename to Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
diff --git a/Documentation/devicetree/bindings/video/adi,adv7511.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/adi,adv7511.txt
rename to Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
diff --git a/Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt b/Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
similarity index 100%
rename from Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt
rename to Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
diff --git a/Documentation/devicetree/bindings/video/bridge/ps8622.txt b/Documentation/devicetree/bindings/display/bridge/ps8622.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/bridge/ps8622.txt
rename to Documentation/devicetree/bindings/display/bridge/ps8622.txt
diff --git a/Documentation/devicetree/bindings/video/bridge/ptn3460.txt b/Documentation/devicetree/bindings/display/bridge/ptn3460.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/bridge/ptn3460.txt
rename to Documentation/devicetree/bindings/display/bridge/ptn3460.txt
diff --git a/Documentation/devicetree/bindings/drm/i2c/tda998x.txt b/Documentation/devicetree/bindings/display/bridge/tda998x.txt
similarity index 100%
rename from Documentation/devicetree/bindings/drm/i2c/tda998x.txt
rename to Documentation/devicetree/bindings/display/bridge/tda998x.txt
diff --git a/Documentation/devicetree/bindings/video/thine,thc63lvdm83d b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/thine,thc63lvdm83d
rename to Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
diff --git a/Documentation/devicetree/bindings/video/cirrus,clps711x-fb.txt b/Documentation/devicetree/bindings/display/cirrus,clps711x-fb.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/cirrus,clps711x-fb.txt
rename to Documentation/devicetree/bindings/display/cirrus,clps711x-fb.txt
diff --git a/Documentation/devicetree/bindings/video/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/analog-tv-connector.txt
rename to Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
diff --git a/Documentation/devicetree/bindings/video/dvi-connector.txt b/Documentation/devicetree/bindings/display/connector/dvi-connector.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/dvi-connector.txt
rename to Documentation/devicetree/bindings/display/connector/dvi-connector.txt
diff --git a/Documentation/devicetree/bindings/video/hdmi-connector.txt b/Documentation/devicetree/bindings/display/connector/hdmi-connector.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/hdmi-connector.txt
rename to Documentation/devicetree/bindings/display/connector/hdmi-connector.txt
diff --git a/Documentation/devicetree/bindings/video/vga-connector.txt b/Documentation/devicetree/bindings/display/connector/vga-connector.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/vga-connector.txt
rename to Documentation/devicetree/bindings/display/connector/vga-connector.txt
diff --git a/Documentation/devicetree/bindings/video/exynos-mic.txt b/Documentation/devicetree/bindings/display/exynos/exynos-mic.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/exynos-mic.txt
rename to Documentation/devicetree/bindings/display/exynos/exynos-mic.txt
diff --git a/Documentation/devicetree/bindings/video/exynos5433-decon.txt b/Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/exynos5433-decon.txt
rename to Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt
diff --git a/Documentation/devicetree/bindings/video/exynos7-decon.txt b/Documentation/devicetree/bindings/display/exynos/exynos7-decon.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/exynos7-decon.txt
rename to Documentation/devicetree/bindings/display/exynos/exynos7-decon.txt
diff --git a/Documentation/devicetree/bindings/video/exynos_dp.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/exynos_dp.txt
rename to Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/exynos_dsim.txt
rename to Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/display/exynos/exynos_hdmi.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/exynos_hdmi.txt
rename to Documentation/devicetree/bindings/display/exynos/exynos_hdmi.txt
diff --git a/Documentation/devicetree/bindings/video/exynos_hdmiddc.txt b/Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/exynos_hdmiddc.txt
rename to Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt
diff --git a/Documentation/devicetree/bindings/video/exynos_hdmiphy.txt b/Documentation/devicetree/bindings/display/exynos/exynos_hdmiphy.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/exynos_hdmiphy.txt
rename to Documentation/devicetree/bindings/display/exynos/exynos_hdmiphy.txt
diff --git a/Documentation/devicetree/bindings/video/exynos_mixer.txt b/Documentation/devicetree/bindings/display/exynos/exynos_mixer.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/exynos_mixer.txt
rename to Documentation/devicetree/bindings/display/exynos/exynos_mixer.txt
diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/samsung-fimd.txt
rename to Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt
diff --git a/Documentation/devicetree/bindings/video/fsl,dcu.txt b/Documentation/devicetree/bindings/display/fsl,dcu.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/fsl,dcu.txt
rename to Documentation/devicetree/bindings/display/fsl,dcu.txt
diff --git a/Documentation/devicetree/bindings/video/fsl,imx-fb.txt b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/fsl,imx-fb.txt
rename to Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
diff --git a/Documentation/devicetree/bindings/drm/imx/fsl-imx-drm.txt b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
similarity index 100%
rename from Documentation/devicetree/bindings/drm/imx/fsl-imx-drm.txt
rename to Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
diff --git a/Documentation/devicetree/bindings/drm/imx/hdmi.txt b/Documentation/devicetree/bindings/display/imx/hdmi.txt
similarity index 100%
rename from Documentation/devicetree/bindings/drm/imx/hdmi.txt
rename to Documentation/devicetree/bindings/display/imx/hdmi.txt
diff --git a/Documentation/devicetree/bindings/drm/imx/ldb.txt b/Documentation/devicetree/bindings/display/imx/ldb.txt
similarity index 100%
rename from Documentation/devicetree/bindings/drm/imx/ldb.txt
rename to Documentation/devicetree/bindings/display/imx/ldb.txt
diff --git a/Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt b/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
similarity index 100%
rename from Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt
rename to Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
diff --git a/Documentation/devicetree/bindings/drm/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
similarity index 100%
rename from Documentation/devicetree/bindings/drm/msm/dsi.txt
rename to Documentation/devicetree/bindings/display/msm/dsi.txt
diff --git a/Documentation/devicetree/bindings/drm/msm/edp.txt b/Documentation/devicetree/bindings/display/msm/edp.txt
similarity index 100%
rename from Documentation/devicetree/bindings/drm/msm/edp.txt
rename to Documentation/devicetree/bindings/display/msm/edp.txt
diff --git a/Documentation/devicetree/bindings/drm/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
similarity index 100%
rename from Documentation/devicetree/bindings/drm/msm/gpu.txt
rename to Documentation/devicetree/bindings/display/msm/gpu.txt
diff --git a/Documentation/devicetree/bindings/drm/msm/hdmi.txt b/Documentation/devicetree/bindings/display/msm/hdmi.txt
similarity index 100%
rename from Documentation/devicetree/bindings/drm/msm/hdmi.txt
rename to Documentation/devicetree/bindings/display/msm/hdmi.txt
diff --git a/Documentation/devicetree/bindings/drm/msm/mdp.txt b/Documentation/devicetree/bindings/display/msm/mdp.txt
similarity index 100%
rename from Documentation/devicetree/bindings/drm/msm/mdp.txt
rename to Documentation/devicetree/bindings/display/msm/mdp.txt
diff --git a/Documentation/devicetree/bindings/fb/mxsfb.txt b/Documentation/devicetree/bindings/display/mxsfb.txt
similarity index 100%
rename from Documentation/devicetree/bindings/fb/mxsfb.txt
rename to Documentation/devicetree/bindings/display/mxsfb.txt
diff --git a/Documentation/devicetree/bindings/panel/ampire,am800480r3tmqwa1h.txt b/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/ampire,am800480r3tmqwa1h.txt
rename to Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
diff --git a/Documentation/devicetree/bindings/panel/auo,b080uan01.txt b/Documentation/devicetree/bindings/display/panel/auo,b080uan01.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/auo,b080uan01.txt
rename to Documentation/devicetree/bindings/display/panel/auo,b080uan01.txt
diff --git a/Documentation/devicetree/bindings/panel/auo,b101aw03.txt b/Documentation/devicetree/bindings/display/panel/auo,b101aw03.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/auo,b101aw03.txt
rename to Documentation/devicetree/bindings/display/panel/auo,b101aw03.txt
diff --git a/Documentation/devicetree/bindings/panel/auo,b101ean01.txt b/Documentation/devicetree/bindings/display/panel/auo,b101ean01.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/auo,b101ean01.txt
rename to Documentation/devicetree/bindings/display/panel/auo,b101ean01.txt
diff --git a/Documentation/devicetree/bindings/panel/auo,b101xtn01.txt b/Documentation/devicetree/bindings/display/panel/auo,b101xtn01.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/auo,b101xtn01.txt
rename to Documentation/devicetree/bindings/display/panel/auo,b101xtn01.txt
diff --git a/Documentation/devicetree/bindings/panel/auo,b116xw03.txt b/Documentation/devicetree/bindings/display/panel/auo,b116xw03.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/auo,b116xw03.txt
rename to Documentation/devicetree/bindings/display/panel/auo,b116xw03.txt
diff --git a/Documentation/devicetree/bindings/panel/auo,b133htn01.txt b/Documentation/devicetree/bindings/display/panel/auo,b133htn01.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/auo,b133htn01.txt
rename to Documentation/devicetree/bindings/display/panel/auo,b133htn01.txt
diff --git a/Documentation/devicetree/bindings/panel/auo,b133xtn01.txt b/Documentation/devicetree/bindings/display/panel/auo,b133xtn01.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/auo,b133xtn01.txt
rename to Documentation/devicetree/bindings/display/panel/auo,b133xtn01.txt
diff --git a/Documentation/devicetree/bindings/panel/avic,tm070ddh03.txt b/Documentation/devicetree/bindings/display/panel/avic,tm070ddh03.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/avic,tm070ddh03.txt
rename to Documentation/devicetree/bindings/display/panel/avic,tm070ddh03.txt
diff --git a/Documentation/devicetree/bindings/panel/chunghwa,claa101wa01a.txt b/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wa01a.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/chunghwa,claa101wa01a.txt
rename to Documentation/devicetree/bindings/display/panel/chunghwa,claa101wa01a.txt
diff --git a/Documentation/devicetree/bindings/panel/chunghwa,claa101wb03.txt b/Documentation/devicetree/bindings/display/panel/chunghwa,claa101wb03.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/chunghwa,claa101wb03.txt
rename to Documentation/devicetree/bindings/display/panel/chunghwa,claa101wb03.txt
diff --git a/Documentation/devicetree/bindings/video/display-timing.txt b/Documentation/devicetree/bindings/display/panel/display-timing.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/display-timing.txt
rename to Documentation/devicetree/bindings/display/panel/display-timing.txt
diff --git a/Documentation/devicetree/bindings/panel/edt,et057090dhu.txt b/Documentation/devicetree/bindings/display/panel/edt,et057090dhu.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/edt,et057090dhu.txt
rename to Documentation/devicetree/bindings/display/panel/edt,et057090dhu.txt
diff --git a/Documentation/devicetree/bindings/panel/edt,et070080dh6.txt b/Documentation/devicetree/bindings/display/panel/edt,et070080dh6.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/edt,et070080dh6.txt
rename to Documentation/devicetree/bindings/display/panel/edt,et070080dh6.txt
diff --git a/Documentation/devicetree/bindings/panel/edt,etm0700g0dh6.txt b/Documentation/devicetree/bindings/display/panel/edt,etm0700g0dh6.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/edt,etm0700g0dh6.txt
rename to Documentation/devicetree/bindings/display/panel/edt,etm0700g0dh6.txt
diff --git a/Documentation/devicetree/bindings/panel/foxlink,fl500wvr00-a0t.txt b/Documentation/devicetree/bindings/display/panel/foxlink,fl500wvr00-a0t.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/foxlink,fl500wvr00-a0t.txt
rename to Documentation/devicetree/bindings/display/panel/foxlink,fl500wvr00-a0t.txt
diff --git a/Documentation/devicetree/bindings/panel/giantplus,gpg482739qs5.txt b/Documentation/devicetree/bindings/display/panel/giantplus,gpg482739qs5.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/giantplus,gpg482739qs5.txt
rename to Documentation/devicetree/bindings/display/panel/giantplus,gpg482739qs5.txt
diff --git a/Documentation/devicetree/bindings/panel/hannstar,hsd070pww1.txt b/Documentation/devicetree/bindings/display/panel/hannstar,hsd070pww1.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/hannstar,hsd070pww1.txt
rename to Documentation/devicetree/bindings/display/panel/hannstar,hsd070pww1.txt
diff --git a/Documentation/devicetree/bindings/panel/hannstar,hsd100pxn1.txt b/Documentation/devicetree/bindings/display/panel/hannstar,hsd100pxn1.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/hannstar,hsd100pxn1.txt
rename to Documentation/devicetree/bindings/display/panel/hannstar,hsd100pxn1.txt
diff --git a/Documentation/devicetree/bindings/panel/hit,tx23d38vm0caa.txt b/Documentation/devicetree/bindings/display/panel/hit,tx23d38vm0caa.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/hit,tx23d38vm0caa.txt
rename to Documentation/devicetree/bindings/display/panel/hit,tx23d38vm0caa.txt
diff --git a/Documentation/devicetree/bindings/panel/innolux,at043tn24.txt b/Documentation/devicetree/bindings/display/panel/innolux,at043tn24.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/innolux,at043tn24.txt
rename to Documentation/devicetree/bindings/display/panel/innolux,at043tn24.txt
diff --git a/Documentation/devicetree/bindings/panel/innolux,g121i1-l01.txt b/Documentation/devicetree/bindings/display/panel/innolux,g121i1-l01.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/innolux,g121i1-l01.txt
rename to Documentation/devicetree/bindings/display/panel/innolux,g121i1-l01.txt
diff --git a/Documentation/devicetree/bindings/panel/innolux,n116bge.txt b/Documentation/devicetree/bindings/display/panel/innolux,n116bge.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/innolux,n116bge.txt
rename to Documentation/devicetree/bindings/display/panel/innolux,n116bge.txt
diff --git a/Documentation/devicetree/bindings/panel/innolux,n156bge-l21.txt b/Documentation/devicetree/bindings/display/panel/innolux,n156bge-l21.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/innolux,n156bge-l21.txt
rename to Documentation/devicetree/bindings/display/panel/innolux,n156bge-l21.txt
diff --git a/Documentation/devicetree/bindings/panel/innolux,zj070na-01p.txt b/Documentation/devicetree/bindings/display/panel/innolux,zj070na-01p.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/innolux,zj070na-01p.txt
rename to Documentation/devicetree/bindings/display/panel/innolux,zj070na-01p.txt
diff --git a/Documentation/devicetree/bindings/panel/lg,lb070wv8.txt b/Documentation/devicetree/bindings/display/panel/lg,lb070wv8.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/lg,lb070wv8.txt
rename to Documentation/devicetree/bindings/display/panel/lg,lb070wv8.txt
diff --git a/Documentation/devicetree/bindings/panel/lg,ld070wx3-sl01.txt b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/lg,ld070wx3-sl01.txt
rename to Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.txt
diff --git a/Documentation/devicetree/bindings/panel/lg,lg4573.txt b/Documentation/devicetree/bindings/display/panel/lg,lg4573.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/lg,lg4573.txt
rename to Documentation/devicetree/bindings/display/panel/lg,lg4573.txt
diff --git a/Documentation/devicetree/bindings/panel/lg,lh500wx1-sd03.txt b/Documentation/devicetree/bindings/display/panel/lg,lh500wx1-sd03.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/lg,lh500wx1-sd03.txt
rename to Documentation/devicetree/bindings/display/panel/lg,lh500wx1-sd03.txt
diff --git a/Documentation/devicetree/bindings/panel/lg,lp129qe.txt b/Documentation/devicetree/bindings/display/panel/lg,lp129qe.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/lg,lp129qe.txt
rename to Documentation/devicetree/bindings/display/panel/lg,lp129qe.txt
diff --git a/Documentation/devicetree/bindings/video/lgphilips,lb035q02.txt b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/lgphilips,lb035q02.txt
rename to Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.txt
diff --git a/Documentation/devicetree/bindings/panel/nec,nl4827hc19-05b.txt b/Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/nec,nl4827hc19-05b.txt
rename to Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.txt
diff --git a/Documentation/devicetree/bindings/panel/okaya,rs800480t-7x0gp.txt b/Documentation/devicetree/bindings/display/panel/okaya,rs800480t-7x0gp.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/okaya,rs800480t-7x0gp.txt
rename to Documentation/devicetree/bindings/display/panel/okaya,rs800480t-7x0gp.txt
diff --git a/Documentation/devicetree/bindings/panel/ortustech,com43h4m85ulc.txt b/Documentation/devicetree/bindings/display/panel/ortustech,com43h4m85ulc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/ortustech,com43h4m85ulc.txt
rename to Documentation/devicetree/bindings/display/panel/ortustech,com43h4m85ulc.txt
diff --git a/Documentation/devicetree/bindings/panel/panasonic,vvx10f004b00.txt b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f004b00.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/panasonic,vvx10f004b00.txt
rename to Documentation/devicetree/bindings/display/panel/panasonic,vvx10f004b00.txt
diff --git a/Documentation/devicetree/bindings/video/panel-dpi.txt b/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/panel-dpi.txt
rename to Documentation/devicetree/bindings/display/panel/panel-dpi.txt
diff --git a/Documentation/devicetree/bindings/video/panel-dsi-cm.txt b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/panel-dsi-cm.txt
rename to Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
diff --git a/Documentation/devicetree/bindings/panel/samsung,ld9040.txt b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/samsung,ld9040.txt
rename to Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt
diff --git a/Documentation/devicetree/bindings/panel/samsung,ltn101nt05.txt b/Documentation/devicetree/bindings/display/panel/samsung,ltn101nt05.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/samsung,ltn101nt05.txt
rename to Documentation/devicetree/bindings/display/panel/samsung,ltn101nt05.txt
diff --git a/Documentation/devicetree/bindings/panel/samsung,ltn140at29-301.txt b/Documentation/devicetree/bindings/display/panel/samsung,ltn140at29-301.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/samsung,ltn140at29-301.txt
rename to Documentation/devicetree/bindings/display/panel/samsung,ltn140at29-301.txt
diff --git a/Documentation/devicetree/bindings/panel/samsung,s6e8aa0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/samsung,s6e8aa0.txt
rename to Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
diff --git a/Documentation/devicetree/bindings/panel/sharp,lq101r1sx01.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/sharp,lq101r1sx01.txt
rename to Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
diff --git a/Documentation/devicetree/bindings/video/sharp,ls037v7dw01.txt b/Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/sharp,ls037v7dw01.txt
rename to Documentation/devicetree/bindings/display/panel/sharp,ls037v7dw01.txt
diff --git a/Documentation/devicetree/bindings/panel/shelly,sca07010-bfn-lnn.txt b/Documentation/devicetree/bindings/display/panel/shelly,sca07010-bfn-lnn.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/shelly,sca07010-bfn-lnn.txt
rename to Documentation/devicetree/bindings/display/panel/shelly,sca07010-bfn-lnn.txt
diff --git a/Documentation/devicetree/bindings/panel/simple-panel.txt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
similarity index 100%
rename from Documentation/devicetree/bindings/panel/simple-panel.txt
rename to Documentation/devicetree/bindings/display/panel/simple-panel.txt
diff --git a/Documentation/devicetree/bindings/video/sony,acx565akm.txt b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/sony,acx565akm.txt
rename to Documentation/devicetree/bindings/display/panel/sony,acx565akm.txt
diff --git a/Documentation/devicetree/bindings/video/toppoly,td028ttec1.txt b/Documentation/devicetree/bindings/display/panel/toppoly,td028ttec1.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/toppoly,td028ttec1.txt
rename to Documentation/devicetree/bindings/display/panel/toppoly,td028ttec1.txt
diff --git a/Documentation/devicetree/bindings/video/tpo,td043mtea1.txt b/Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/tpo,td043mtea1.txt
rename to Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt
diff --git a/Documentation/devicetree/bindings/video/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/renesas,du.txt
rename to Documentation/devicetree/bindings/display/renesas,du.txt
diff --git a/Documentation/devicetree/bindings/video/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/dw_hdmi-rockchip.txt
rename to Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
diff --git a/Documentation/devicetree/bindings/video/rockchip-drm.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/rockchip-drm.txt
rename to Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
diff --git a/Documentation/devicetree/bindings/video/rockchip-vop.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/rockchip-vop.txt
rename to Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
diff --git a/Documentation/devicetree/bindings/video/simple-framebuffer-sunxi.txt b/Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/simple-framebuffer-sunxi.txt
rename to Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt
diff --git a/Documentation/devicetree/bindings/video/simple-framebuffer.txt b/Documentation/devicetree/bindings/display/simple-framebuffer.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/simple-framebuffer.txt
rename to Documentation/devicetree/bindings/display/simple-framebuffer.txt
diff --git a/Documentation/devicetree/bindings/fb/sm501fb.txt b/Documentation/devicetree/bindings/display/sm501fb.txt
similarity index 100%
rename from Documentation/devicetree/bindings/fb/sm501fb.txt
rename to Documentation/devicetree/bindings/display/sm501fb.txt
diff --git a/Documentation/devicetree/bindings/video/ssd1289fb.txt b/Documentation/devicetree/bindings/display/ssd1289fb.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/ssd1289fb.txt
rename to Documentation/devicetree/bindings/display/ssd1289fb.txt
diff --git a/Documentation/devicetree/bindings/video/ssd1307fb.txt b/Documentation/devicetree/bindings/display/ssd1307fb.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/ssd1307fb.txt
rename to Documentation/devicetree/bindings/display/ssd1307fb.txt
diff --git a/Documentation/devicetree/bindings/gpu/st,stih4xx.txt b/Documentation/devicetree/bindings/display/st,stih4xx.txt
similarity index 100%
rename from Documentation/devicetree/bindings/gpu/st,stih4xx.txt
rename to Documentation/devicetree/bindings/display/st,stih4xx.txt
diff --git a/Documentation/devicetree/bindings/mipi/nvidia,tegra114-mipi.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.txt
similarity index 100%
rename from Documentation/devicetree/bindings/mipi/nvidia,tegra114-mipi.txt
rename to Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.txt
diff --git a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
similarity index 100%
rename from Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
rename to Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
diff --git a/Documentation/devicetree/bindings/video/ti,dra7-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/ti,dra7-dss.txt
rename to Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt
diff --git a/Documentation/devicetree/bindings/video/ti,omap-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/ti,omap-dss.txt
rename to Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
diff --git a/Documentation/devicetree/bindings/video/ti,omap2-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,omap2-dss.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/ti,omap2-dss.txt
rename to Documentation/devicetree/bindings/display/ti/ti,omap2-dss.txt
diff --git a/Documentation/devicetree/bindings/video/ti,omap3-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,omap3-dss.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/ti,omap3-dss.txt
rename to Documentation/devicetree/bindings/display/ti/ti,omap3-dss.txt
diff --git a/Documentation/devicetree/bindings/video/ti,omap4-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,omap4-dss.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/ti,omap4-dss.txt
rename to Documentation/devicetree/bindings/display/ti/ti,omap4-dss.txt
diff --git a/Documentation/devicetree/bindings/video/ti,omap5-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/ti,omap5-dss.txt
rename to Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
diff --git a/Documentation/devicetree/bindings/video/ti,opa362.txt b/Documentation/devicetree/bindings/display/ti/ti,opa362.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/ti,opa362.txt
rename to Documentation/devicetree/bindings/display/ti/ti,opa362.txt
diff --git a/Documentation/devicetree/bindings/video/ti,tfp410.txt b/Documentation/devicetree/bindings/display/ti/ti,tfp410.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/ti,tfp410.txt
rename to Documentation/devicetree/bindings/display/ti/ti,tfp410.txt
diff --git a/Documentation/devicetree/bindings/video/ti,tpd12s015.txt b/Documentation/devicetree/bindings/display/ti/ti,tpd12s015.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/ti,tpd12s015.txt
rename to Documentation/devicetree/bindings/display/ti/ti,tpd12s015.txt
diff --git a/Documentation/devicetree/bindings/drm/tilcdc/panel.txt b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
similarity index 100%
rename from Documentation/devicetree/bindings/drm/tilcdc/panel.txt
rename to Documentation/devicetree/bindings/display/tilcdc/panel.txt
diff --git a/Documentation/devicetree/bindings/drm/tilcdc/tfp410.txt b/Documentation/devicetree/bindings/display/tilcdc/tfp410.txt
similarity index 100%
rename from Documentation/devicetree/bindings/drm/tilcdc/tfp410.txt
rename to Documentation/devicetree/bindings/display/tilcdc/tfp410.txt
diff --git a/Documentation/devicetree/bindings/drm/tilcdc/tilcdc.txt b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/drm/tilcdc/tilcdc.txt
rename to Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
diff --git a/Documentation/devicetree/bindings/video/via,vt8500-fb.txt b/Documentation/devicetree/bindings/display/via,vt8500-fb.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/via,vt8500-fb.txt
rename to Documentation/devicetree/bindings/display/via,vt8500-fb.txt
diff --git a/Documentation/devicetree/bindings/video/wm,prizm-ge-rops.txt b/Documentation/devicetree/bindings/display/wm,prizm-ge-rops.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/wm,prizm-ge-rops.txt
rename to Documentation/devicetree/bindings/display/wm,prizm-ge-rops.txt
diff --git a/Documentation/devicetree/bindings/video/wm,wm8505-fb.txt b/Documentation/devicetree/bindings/display/wm,wm8505-fb.txt
similarity index 100%
rename from Documentation/devicetree/bindings/video/wm,wm8505-fb.txt
rename to Documentation/devicetree/bindings/display/wm,wm8505-fb.txt
-- 
2.1.4
