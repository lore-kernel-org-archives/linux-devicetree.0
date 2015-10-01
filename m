From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/8] DT binding doc reorganization
Date: Thu,  1 Oct 2015 17:12:26 -0500
Message-ID: <1443737554-10352-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The DT binding docs are in need of some love. To start with, there are 
various bindings which are not grouped with other similar classes of 
hardware. The display related bindings are the worst with several 
choices of location somewhat aligned to kernel subsystems (e.g. drm and 
video). This series consolidates various bindings to common locations. 
No doubt, more work is needed from here.

I don't think this will cause much issue in the merge window since 
binding docs don't change often, are not built, and any new files can be 
moved after the merge window.

Rob

Rob Herring (8):
  dt-bindings: consolidate display related bindings
  dt-bindings: move backlight bindings under leds
  dt-bindings: consolidate eeprom bindings
  dt-bindings: consolidate RNG bindings
  dt-bindings: consolidate various misc bindings
  dt-bindings: consolidate USB PHYs in bindings/phy
  dt-bindings: move Calxeda bindings to appropriate subsystems
  dt-bindings: merge ina209 binding into ina2xx binding

 .../bindings/{nvec => arm/tegra}/nvidia,nvec.txt   |   0
 .../bindings/{video => display}/arm,pl11x.txt      |   0
 .../{drm => display}/armada/marvell,dove-lcd.txt   |   0
 .../bindings/{video => display}/atmel,lcdc.txt     |   0
 .../bindings/{drm => display}/atmel/hlcdc-dc.txt   |   0
 .../{video => display/bridge}/adi,adv7123.txt      |   0
 .../{video => display/bridge}/adi,adv7511.txt      |   0
 .../bindings/{drm => display}/bridge/dw_hdmi.txt   |   0
 .../bindings/{video => display}/bridge/ps8622.txt  |   0
 .../bindings/{video => display}/bridge/ptn3460.txt |   0
 .../{drm/i2c => display/bridge}/tda998x.txt        |   0
 .../bridge/thine,thc63lvdm83d.txt}                 |   0
 .../{video => display}/cirrus,clps711x-fb.txt      |   0
 .../connector}/analog-tv-connector.txt             |   0
 .../{video => display/connector}/dvi-connector.txt |   0
 .../connector}/hdmi-connector.txt                  |   0
 .../{video => display/connector}/vga-connector.txt |   0
 .../{video => display/exynos}/exynos-mic.txt       |   0
 .../{video => display/exynos}/exynos5433-decon.txt |   0
 .../{video => display/exynos}/exynos7-decon.txt    |   0
 .../{video => display/exynos}/exynos_dp.txt        |   0
 .../{video => display/exynos}/exynos_dsim.txt      |   0
 .../{video => display/exynos}/exynos_hdmi.txt      |   0
 .../{video => display/exynos}/exynos_hdmiddc.txt   |   0
 .../{video => display/exynos}/exynos_hdmiphy.txt   |   0
 .../{video => display/exynos}/exynos_mixer.txt     |   0
 .../{video => display/exynos}/samsung-fimd.txt     |   0
 .../bindings/{video => display}/fsl,dcu.txt        |   0
 .../bindings/{video => display/imx}/fsl,imx-fb.txt |   0
 .../bindings/{drm => display}/imx/fsl-imx-drm.txt  |   0
 .../bindings/{drm => display}/imx/hdmi.txt         |   0
 .../bindings/{drm => display}/imx/ldb.txt          |   0
 .../{mipi/dsi => display}/mipi-dsi-bus.txt         |   0
 .../bindings/{drm => display}/msm/dsi.txt          |   0
 .../bindings/{drm => display}/msm/edp.txt          |   0
 .../bindings/{drm => display}/msm/gpu.txt          |   0
 .../bindings/{drm => display}/msm/hdmi.txt         |   0
 .../bindings/{drm => display}/msm/mdp.txt          |   0
 .../devicetree/bindings/{fb => display}/mxsfb.txt  |   0
 .../panel/ampire,am800480r3tmqwa1h.txt             |   0
 .../bindings/{ => display}/panel/auo,b080uan01.txt |   0
 .../bindings/{ => display}/panel/auo,b101aw03.txt  |   0
 .../bindings/{ => display}/panel/auo,b101ean01.txt |   0
 .../bindings/{ => display}/panel/auo,b101xtn01.txt |   0
 .../bindings/{ => display}/panel/auo,b116xw03.txt  |   0
 .../bindings/{ => display}/panel/auo,b133htn01.txt |   0
 .../bindings/{ => display}/panel/auo,b133xtn01.txt |   0
 .../{ => display}/panel/avic,tm070ddh03.txt        |   0
 .../{ => display}/panel/chunghwa,claa101wa01a.txt  |   0
 .../{ => display}/panel/chunghwa,claa101wb03.txt   |   0
 .../{video => display/panel}/display-timing.txt    |   0
 .../{ => display}/panel/edt,et057090dhu.txt        |   0
 .../{ => display}/panel/edt,et070080dh6.txt        |   0
 .../{ => display}/panel/edt,etm0700g0dh6.txt       |   0
 .../{ => display}/panel/foxlink,fl500wvr00-a0t.txt |   0
 .../{ => display}/panel/giantplus,gpg482739qs5.txt |   0
 .../{ => display}/panel/hannstar,hsd070pww1.txt    |   0
 .../{ => display}/panel/hannstar,hsd100pxn1.txt    |   0
 .../{ => display}/panel/hit,tx23d38vm0caa.txt      |   0
 .../{ => display}/panel/innolux,at043tn24.txt      |   0
 .../{ => display}/panel/innolux,g121i1-l01.txt     |   0
 .../{ => display}/panel/innolux,n116bge.txt        |   0
 .../{ => display}/panel/innolux,n156bge-l21.txt    |   0
 .../{ => display}/panel/innolux,zj070na-01p.txt    |   0
 .../bindings/{ => display}/panel/lg,lb070wv8.txt   |   0
 .../{ => display}/panel/lg,ld070wx3-sl01.txt       |   0
 .../bindings/{ => display}/panel/lg,lg4573.txt     |   0
 .../{ => display}/panel/lg,lh500wx1-sd03.txt       |   0
 .../bindings/{ => display}/panel/lg,lp129qe.txt    |   0
 .../panel}/lgphilips,lb035q02.txt                  |   0
 .../{ => display}/panel/nec,nl4827hc19-05b.txt     |   0
 .../{ => display}/panel/okaya,rs800480t-7x0gp.txt  |   0
 .../panel/ortustech,com43h4m85ulc.txt              |   0
 .../{ => display}/panel/panasonic,vvx10f004b00.txt |   0
 .../{video => display/panel}/panel-dpi.txt         |   0
 .../{video => display/panel}/panel-dsi-cm.txt      |   0
 .../{ => display}/panel/samsung,ld9040.txt         |   0
 .../{ => display}/panel/samsung,ltn101nt05.txt     |   0
 .../{ => display}/panel/samsung,ltn140at29-301.txt |   0
 .../{ => display}/panel/samsung,s6e8aa0.txt        |   0
 .../{ => display}/panel/sharp,lq101r1sx01.txt      |   0
 .../{video => display/panel}/sharp,ls037v7dw01.txt |   0
 .../panel/shelly,sca07010-bfn-lnn.txt              |   0
 .../bindings/{ => display}/panel/simple-panel.txt  |   0
 .../{video => display/panel}/sony,acx565akm.txt    |   0
 .../panel}/toppoly,td028ttec1.txt                  |   0
 .../{video => display/panel}/tpo,td043mtea1.txt    |   0
 .../bindings/{video => display}/renesas,du.txt     |   0
 .../rockchip}/dw_hdmi-rockchip.txt                 |   0
 .../{video => display/rockchip}/rockchip-drm.txt   |   0
 .../{video => display/rockchip}/rockchip-vop.txt   |   0
 .../simple-framebuffer-sunxi.txt                   |   0
 .../{video => display}/simple-framebuffer.txt      |   0
 .../bindings/{fb => display}/sm501fb.txt           |   0
 .../bindings/{video => display}/ssd1289fb.txt      |   0
 .../bindings/{video => display}/ssd1307fb.txt      |   0
 .../bindings/{gpu => display}/st,stih4xx.txt       |   0
 .../tegra}/nvidia,tegra114-mipi.txt                |   0
 .../tegra}/nvidia,tegra20-host1x.txt               |   0
 .../bindings/{video => display/ti}/ti,dra7-dss.txt |   0
 .../bindings/{video => display/ti}/ti,omap-dss.txt |   0
 .../{video => display/ti}/ti,omap2-dss.txt         |   0
 .../{video => display/ti}/ti,omap3-dss.txt         |   0
 .../{video => display/ti}/ti,omap4-dss.txt         |   0
 .../{video => display/ti}/ti,omap5-dss.txt         |   0
 .../bindings/{video => display/ti}/ti,opa362.txt   |   0
 .../bindings/{video => display/ti}/ti,tfp410.txt   |   0
 .../{video => display/ti}/ti,tpd12s015.txt         |   0
 .../bindings/{drm => display}/tilcdc/panel.txt     |   0
 .../bindings/{drm => display}/tilcdc/tfp410.txt    |   0
 .../bindings/{drm => display}/tilcdc/tilcdc.txt    |   0
 .../bindings/{video => display}/via,vt8500-fb.txt  |   0
 .../{video => display}/wm,prizm-ge-rops.txt        |   0
 .../bindings/{video => display}/wm,wm8505-fb.txt   |   0
 .../devicetree/bindings/{misc => eeprom}/at25.txt  |   0
 .../devicetree/bindings/{ => eeprom}/eeprom.txt    |   0
 Documentation/devicetree/bindings/hwmon/ina209.txt |  18 ----
 Documentation/devicetree/bindings/hwmon/ina2xx.txt |   1 +
 .../bindings/{misc => iio/accel}/lis302.txt        |   0
 .../bindings/{misc => iio/dac}/ti,dac7512.txt      |   0
 .../bindings/{misc => iio/pressure}/bmp085.txt     |   0
 .../bindings/{hid => input}/hid-over-i2c.txt       |   0
 .../{ => interrupt-controller}/open-pic.txt        |   0
 .../{video => leds}/backlight/88pm860x.txt         |   0
 .../{video => leds}/backlight/gpio-backlight.txt   |   0
 .../bindings/{video => leds}/backlight/lp855x.txt  |   0
 .../backlight/max8925-backlight.txt                |   0
 .../{video => leds}/backlight/pm8941-wled.txt      |   0
 .../{video => leds}/backlight/pwm-backlight.txt    |   0
 .../backlight/sky81452-backlight.txt               |   0
 .../backlight/tps65217-backlight.txt               |   0
 .../calxeda-ddr-ctrlr.txt}                         |   0
 .../combophy.txt => phy/calxeda-combophy.txt}      |   0
 .../keystone-phy.txt => phy/keystone-usb-phy.txt}  |   0
 .../{usb/mxs-phy.txt => phy/mxs-usb-phy.txt}       |   0
 .../{usb => phy}/nvidia,tegra20-usb-phy.txt        |   0
 .../bindings/{usb => phy}/qcom,usb-8x16-phy.txt    |   0
 .../bindings/{hwrng => rng}/atmel-trng.txt         |   0
 .../bindings/{hwrng => rng}/brcm,iproc-rng200.txt  |   0
 .../bindings/{hwrng => rng}/omap_rng.txt           |   0
 .../bindings/{hwrng => rng}/timeriomem_rng.txt     |   0
 .../devicetree/bindings/usb/samsung-usbphy.txt     | 117 ---------------------
 142 files changed, 1 insertion(+), 135 deletions(-)
 rename Documentation/devicetree/bindings/{nvec => arm/tegra}/nvidia,nvec.txt (100%)
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
 rename Documentation/devicetree/bindings/{misc => eeprom}/at25.txt (100%)
 rename Documentation/devicetree/bindings/{ => eeprom}/eeprom.txt (100%)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/ina209.txt
 rename Documentation/devicetree/bindings/{misc => iio/accel}/lis302.txt (100%)
 rename Documentation/devicetree/bindings/{misc => iio/dac}/ti,dac7512.txt (100%)
 rename Documentation/devicetree/bindings/{misc => iio/pressure}/bmp085.txt (100%)
 rename Documentation/devicetree/bindings/{hid => input}/hid-over-i2c.txt (100%)
 rename Documentation/devicetree/bindings/{ => interrupt-controller}/open-pic.txt (100%)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/88pm860x.txt (100%)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/gpio-backlight.txt (100%)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/lp855x.txt (100%)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/max8925-backlight.txt (100%)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/pm8941-wled.txt (100%)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/pwm-backlight.txt (100%)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/sky81452-backlight.txt (100%)
 rename Documentation/devicetree/bindings/{video => leds}/backlight/tps65217-backlight.txt (100%)
 rename Documentation/devicetree/bindings/{arm/calxeda/mem-ctrlr.txt => memory-controllers/calxeda-ddr-ctrlr.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/calxeda/combophy.txt => phy/calxeda-combophy.txt} (100%)
 rename Documentation/devicetree/bindings/{usb/keystone-phy.txt => phy/keystone-usb-phy.txt} (100%)
 rename Documentation/devicetree/bindings/{usb/mxs-phy.txt => phy/mxs-usb-phy.txt} (100%)
 rename Documentation/devicetree/bindings/{usb => phy}/nvidia,tegra20-usb-phy.txt (100%)
 rename Documentation/devicetree/bindings/{usb => phy}/qcom,usb-8x16-phy.txt (100%)
 rename Documentation/devicetree/bindings/{hwrng => rng}/atmel-trng.txt (100%)
 rename Documentation/devicetree/bindings/{hwrng => rng}/brcm,iproc-rng200.txt (100%)
 rename Documentation/devicetree/bindings/{hwrng => rng}/omap_rng.txt (100%)
 rename Documentation/devicetree/bindings/{hwrng => rng}/timeriomem_rng.txt (100%)
 delete mode 100644 Documentation/devicetree/bindings/usb/samsung-usbphy.txt

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
