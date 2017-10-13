From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] arm: dts: fix unit-address leading 0s
Date: Fri, 13 Oct 2017 12:54:51 -0500
Message-ID: <20171013175452.1198-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix dtc warnings for 'simple_bus_reg' due to leading 0s. Converted using
the following command:

perl -p -i -e 's/\@0+([0-9a-f])/\@$1/g' `find arch/arm/boot/dts -type -f -name '*.dts*'

Dropped changes to ARM, Ltd. boards LED nodes and manually fixed up some
occurrences of uppercase hex.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/armada-370-synology-ds213j.dts   |  12 +-
 arch/arm/boot/dts/armada-385-synology-ds116.dts    |  12 +-
 arch/arm/boot/dts/armada-xp-synology-ds414.dts     |  12 +-
 arch/arm/boot/dts/aspeed-g4.dtsi                   |   2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   2 +-
 arch/arm/boot/dts/at91-ariag25.dts                 |   4 +-
 arch/arm/boot/dts/at91-ariettag25.dts              |   4 +-
 arch/arm/boot/dts/at91-cosino_mega2560.dts         |   4 +-
 arch/arm/boot/dts/at91-kizbox2.dts                 |   4 +-
 arch/arm/boot/dts/at91-kizboxmini.dts              |   4 +-
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts        |   6 +-
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |   6 +-
 arch/arm/boot/dts/at91-sama5d3_xplained.dts        |   6 +-
 arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts        |   6 +-
 arch/arm/boot/dts/at91-sama5d4_xplained.dts        |   6 +-
 arch/arm/boot/dts/at91-sama5d4ek.dts               |   6 +-
 arch/arm/boot/dts/at91-vinco.dts                   |   6 +-
 arch/arm/boot/dts/at91rm9200.dtsi                  |   4 +-
 arch/arm/boot/dts/at91rm9200ek.dts                 |   2 +-
 arch/arm/boot/dts/at91sam9260.dtsi                 |   2 +-
 arch/arm/boot/dts/at91sam9261.dtsi                 |   4 +-
 arch/arm/boot/dts/at91sam9261ek.dts                |   2 +-
 arch/arm/boot/dts/at91sam9263.dtsi                 |   6 +-
 arch/arm/boot/dts/at91sam9263ek.dts                |   2 +-
 arch/arm/boot/dts/at91sam9g20.dtsi                 |   4 +-
 arch/arm/boot/dts/at91sam9g45.dtsi                 |   6 +-
 arch/arm/boot/dts/at91sam9m10g45ek.dts             |   4 +-
 arch/arm/boot/dts/at91sam9n12.dtsi                 |   4 +-
 arch/arm/boot/dts/at91sam9n12ek.dts                |   2 +-
 arch/arm/boot/dts/at91sam9rl.dtsi                  |   4 +-
 arch/arm/boot/dts/at91sam9rlek.dts                 |   2 +-
 arch/arm/boot/dts/at91sam9x5.dtsi                  |   6 +-
 arch/arm/boot/dts/at91sam9x5ek.dtsi                |   4 +-
 arch/arm/boot/dts/at91sam9xe.dtsi                  |   4 +-
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |  10 +-
 arch/arm/boot/dts/bcm-nsp.dtsi                     |   8 +-
 arch/arm/boot/dts/bcm5301x.dtsi                    |   6 +-
 arch/arm/boot/dts/bcm53573.dtsi                    |   2 +-
 arch/arm/boot/dts/berlin2.dtsi                     |   6 +-
 arch/arm/boot/dts/berlin2cd.dtsi                   |   6 +-
 arch/arm/boot/dts/berlin2q.dtsi                    |   6 +-
 arch/arm/boot/dts/dove.dtsi                        |  14 +-
 arch/arm/boot/dts/ep7211-edb7211.dts               |   2 +-
 arch/arm/boot/dts/exynos3250-artik5.dtsi           |   2 +-
 arch/arm/boot/dts/exynos3250-monk.dts              |   2 +-
 arch/arm/boot/dts/exynos3250-rinato.dts            |   2 +-
 arch/arm/boot/dts/exynos3250.dtsi                  |   2 +-
 arch/arm/boot/dts/exynos4.dtsi                     |   4 +-
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi          |   2 +-
 arch/arm/boot/dts/exynos4210-universal_c210.dts    |   2 +-
 arch/arm/boot/dts/exynos4210.dtsi                  |   4 +-
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi    |   2 +-
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi    |   6 +-
 arch/arm/boot/dts/exynos4412-origen.dts            |   2 +-
 arch/arm/boot/dts/exynos4412-pinctrl.dtsi          |   2 +-
 arch/arm/boot/dts/exynos4412-trats2.dts            |   6 +-
 arch/arm/boot/dts/exynos4412.dtsi                  |   2 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |   2 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi      |   2 +-
 arch/arm/boot/dts/exynos5250.dtsi                  |   6 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts          |   6 +-
 arch/arm/boot/dts/exynos5410-smdk5410.dts          |   2 +-
 arch/arm/boot/dts/exynos5410.dtsi                  |   4 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      |   2 +-
 arch/arm/boot/dts/exynos5420.dtsi                  |   6 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |   2 +-
 arch/arm/boot/dts/exynos5440-ssdk5440.dts          |   2 +-
 arch/arm/boot/dts/exynos5440.dtsi                  |   2 +-
 arch/arm/boot/dts/exynos54xx.dtsi                  |   2 +-
 arch/arm/boot/dts/ge863-pro3.dtsi                  |   2 +-
 arch/arm/boot/dts/hip01.dtsi                       |   4 +-
 arch/arm/boot/dts/hip04-d01.dts                    |   2 +-
 arch/arm/boot/dts/hisi-x5hd2.dtsi                  |  30 +--
 arch/arm/boot/dts/imx1.dtsi                        |  44 ++--
 arch/arm/boot/dts/imx25-pdk.dts                    |   2 +-
 arch/arm/boot/dts/imx28-apx4devkit.dts             |   2 +-
 arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi       |   2 +-
 arch/arm/boot/dts/imx28-evk.dts                    |   2 +-
 arch/arm/boot/dts/imx28-m28evk.dts                 |   2 +-
 arch/arm/boot/dts/imx28-tx28.dts                   |   2 +-
 arch/arm/boot/dts/imx50.dtsi                       |   2 +-
 arch/arm/boot/dts/imx51-babbage.dts                |   2 +-
 arch/arm/boot/dts/imx53-m53evk.dts                 |   2 +-
 arch/arm/boot/dts/imx53-qsb-common.dtsi            |   2 +-
 arch/arm/boot/dts/imx53-smd.dts                    |   4 +-
 arch/arm/boot/dts/imx53-tx53-x03x.dts              |   2 +-
 arch/arm/boot/dts/imx53-tx53-x13x.dts              |   6 +-
 arch/arm/boot/dts/imx53-voipac-bsb.dts             |   2 +-
 arch/arm/boot/dts/imx53.dtsi                       |   2 +-
 arch/arm/boot/dts/imx6dl-riotboard.dts             |   4 +-
 arch/arm/boot/dts/imx6dl-tx6u-811x.dts             |   2 +-
 arch/arm/boot/dts/imx6dl-tx6u-81xx-mb7.dts         |   2 +-
 arch/arm/boot/dts/imx6dl.dtsi                      |  16 +-
 arch/arm/boot/dts/imx6q-bx50v3.dtsi                |   2 +-
 arch/arm/boot/dts/imx6q-dmo-edmqmx6.dts            |   2 +-
 arch/arm/boot/dts/imx6q-gw5400-a.dts               |   6 +-
 arch/arm/boot/dts/imx6q-h100.dts                   |   4 +-
 arch/arm/boot/dts/imx6q-icore-rqs.dts              |   2 +-
 arch/arm/boot/dts/imx6q-mccmon6.dts                |   2 +-
 arch/arm/boot/dts/imx6q-novena.dts                 |   4 +-
 arch/arm/boot/dts/imx6q-tbs2910.dts                |   2 +-
 arch/arm/boot/dts/imx6q-tx6q-1110.dts              |   2 +-
 arch/arm/boot/dts/imx6q-tx6q-11x0-mb7.dts          |   2 +-
 arch/arm/boot/dts/imx6q.dtsi                       |  16 +-
 arch/arm/boot/dts/imx6qdl-apalis.dtsi              |   4 +-
 arch/arm/boot/dts/imx6qdl-apf6dev.dtsi             |   2 +-
 arch/arm/boot/dts/imx6qdl-colibri.dtsi             |   4 +-
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi              |   4 +-
 arch/arm/boot/dts/imx6qdl-gw53xx.dtsi              |   4 +-
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi              |   6 +-
 arch/arm/boot/dts/imx6qdl-hummingboard.dtsi        |   2 +-
 arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi           |   4 +-
 arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi       |   4 +-
 arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi      |   4 +-
 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi          |   4 +-
 arch/arm/boot/dts/imx6qdl-rex.dtsi                 |   2 +-
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi           |   2 +-
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi           |   2 +-
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi             |   4 +-
 arch/arm/boot/dts/imx6qdl-tx6.dtsi                 |   2 +-
 arch/arm/boot/dts/imx6qdl-wandboard.dtsi           |   2 +-
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi            |   2 +-
 arch/arm/boot/dts/imx6qdl.dtsi                     | 174 ++++++++--------
 arch/arm/boot/dts/imx6qp.dtsi                      |   6 +-
 arch/arm/boot/dts/imx6sl-evk.dts                   |   2 +-
 arch/arm/boot/dts/imx6sl.dtsi                      | 134 ++++++------
 arch/arm/boot/dts/imx6sx-nitrogen6sx.dts           |   2 +-
 arch/arm/boot/dts/imx6sx-sdb-reva.dts              |   2 +-
 arch/arm/boot/dts/imx6sx-sdb.dts                   |   2 +-
 arch/arm/boot/dts/imx6sx-udoo-neo.dtsi             |   2 +-
 arch/arm/boot/dts/imx6sx.dtsi                      | 186 ++++++++---------
 arch/arm/boot/dts/imx6ul-pico-hobbit.dts           |   4 +-
 arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts       |   2 +-
 arch/arm/boot/dts/imx6ul-tx6ul.dtsi                |   2 +-
 arch/arm/boot/dts/imx6ul.dtsi                      | 142 ++++++-------
 arch/arm/boot/dts/imx7-colibri.dtsi                |   2 +-
 arch/arm/boot/dts/imx7d-nitrogen7.dts              |   2 +-
 arch/arm/boot/dts/imx7d-pico.dts                   |   4 +-
 arch/arm/boot/dts/imx7d-sdb.dts                    |   2 +-
 arch/arm/boot/dts/imx7s-warp.dts                   |   4 +-
 arch/arm/boot/dts/integrator.dtsi                  |  10 +-
 arch/arm/boot/dts/keystone-k2e.dtsi                |   6 +-
 arch/arm/boot/dts/keystone-k2g.dtsi                |  34 +--
 arch/arm/boot/dts/keystone-k2hk.dtsi               |   8 +-
 arch/arm/boot/dts/keystone-k2l.dtsi                |  12 +-
 arch/arm/boot/dts/keystone.dtsi                    |  12 +-
 arch/arm/boot/dts/kirkwood-synology.dtsi           |  12 +-
 arch/arm/boot/dts/kirkwood-ts219.dtsi              |  12 +-
 arch/arm/boot/dts/kirkwood.dtsi                    |   4 +-
 arch/arm/boot/dts/lpc3250-ea3250.dts               |   8 +-
 arch/arm/boot/dts/lpc3250-phy3250.dts              |  10 +-
 arch/arm/boot/dts/lpc32xx.dtsi                     |   2 +-
 arch/arm/boot/dts/mpa1600.dts                      |   2 +-
 arch/arm/boot/dts/mt6589.dtsi                      |   2 +-
 arch/arm/boot/dts/nspire.dtsi                      |   2 +-
 arch/arm/boot/dts/omap3-n900.dts                   |   2 +-
 arch/arm/boot/dts/ox810se.dtsi                     |   4 +-
 arch/arm/boot/dts/ox820.dtsi                       |   2 +-
 arch/arm/boot/dts/picoxcell-pc3x2.dtsi             |   2 +-
 arch/arm/boot/dts/picoxcell-pc3x3.dtsi             |   2 +-
 arch/arm/boot/dts/pm9g45.dts                       |   4 +-
 arch/arm/boot/dts/qcom-apq8060-dragonboard.dts     |  12 +-
 arch/arm/boot/dts/qcom-msm8660.dtsi                |  22 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |  16 +-
 arch/arm/boot/dts/rk3066a-rayeager.dts             |   2 +-
 arch/arm/boot/dts/rk3288-popmetal.dts              |   2 +-
 arch/arm/boot/dts/sama5d2.dtsi                     |  12 +-
 arch/arm/boot/dts/sama5d3.dtsi                     |   8 +-
 arch/arm/boot/dts/sama5d3xmb.dtsi                  |   6 +-
 arch/arm/boot/dts/sama5d3xmb_cmp.dtsi              |   2 +-
 arch/arm/boot/dts/sama5d4.dtsi                     |  10 +-
 arch/arm/boot/dts/ste-href-stuib.dtsi              |   2 +-
 arch/arm/boot/dts/ste-href-tvk1281618.dtsi         |   2 +-
 arch/arm/boot/dts/stih407-clock.dtsi               |   6 +-
 arch/arm/boot/dts/stih407-family.dtsi              |  18 +-
 arch/arm/boot/dts/stih407-pinctrl.dtsi             |  52 ++---
 arch/arm/boot/dts/stih410-b2120.dts                |   2 +-
 arch/arm/boot/dts/stih410-b2260.dts                |   4 +-
 arch/arm/boot/dts/stih410-clock.dtsi               |   6 +-
 arch/arm/boot/dts/stih410.dtsi                     |   2 +-
 arch/arm/boot/dts/stih418-b2199.dts                |   4 +-
 arch/arm/boot/dts/stih418-clock.dtsi               |   6 +-
 arch/arm/boot/dts/stih418.dtsi                     |   2 +-
 arch/arm/boot/dts/stihxxx-b2120.dtsi               |   6 +-
 arch/arm/boot/dts/sun4i-a10.dtsi                   | 194 +++++++++---------
 arch/arm/boot/dts/sun5i-a10s.dtsi                  |   6 +-
 arch/arm/boot/dts/sun5i-a13.dtsi                   |   4 +-
 arch/arm/boot/dts/sun5i-gr8.dtsi                   |   8 +-
 arch/arm/boot/dts/sun5i.dtsi                       |  86 ++++----
 arch/arm/boot/dts/sun6i-a31.dtsi                   | 108 +++++-----
 arch/arm/boot/dts/sun7i-a20.dtsi                   | 228 ++++++++++-----------
 arch/arm/boot/dts/sun8i-a23-a33.dtsi               |  62 +++---
 arch/arm/boot/dts/sun8i-a23.dtsi                   |   4 +-
 arch/arm/boot/dts/sun8i-a33.dtsi                   |  18 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                  |   4 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi                   |  32 +--
 arch/arm/boot/dts/sun9i-a80.dtsi                   |  86 ++++----
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 |  70 +++----
 arch/arm/boot/dts/tango4-common.dtsi               |   2 +-
 arch/arm/boot/dts/usb_a9263.dts                    |   2 +-
 arch/arm/boot/dts/vf610-twr.dts                    |   2 +-
 arch/arm/boot/dts/vf610-zii-dev-rev-c.dts          |   2 +-
 arch/arm/boot/dts/zx296702.dtsi                    |   4 +-
 203 files changed, 1249 insertions(+), 1249 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-synology-ds213j.dts b/arch/arm/boot/dts/armada-370-synology-ds213j.dts
index 4978011df5bd..95040810c094 100644
--- a/arch/arm/boot/dts/armada-370-synology-ds213j.dts
+++ b/arch/arm/boot/dts/armada-370-synology-ds213j.dts
@@ -316,32 +316,32 @@
 		 * change the default environment, unless you know
 		 * what you are doing.
 		 */
-		partition@00000000 { /* u-boot */
+		partition@0 { /* u-boot */
 			label = "RedBoot";
 			reg = <0x00000000 0x000c0000>; /* 768KB */
 		};
 
-		partition@000c0000 { /* uImage */
+		partition@c0000 { /* uImage */
 			label = "zImage";
 			reg = <0x000c0000 0x002d0000>; /* 2880KB */
 		};
 
-		partition@00390000 { /* uInitramfs */
+		partition@390000 { /* uInitramfs */
 			label = "rd.gz";
 			reg = <0x00390000 0x00440000>; /* 4250KB */
 		};
 
-		partition@007d0000 { /* MAC address and serial number */
+		partition@7d0000 { /* MAC address and serial number */
 			label = "vendor";
 			reg = <0x007d0000 0x00010000>; /* 64KB */
 		};
 
-		partition@007e0000 {
+		partition@7e0000 {
 			label = "RedBoot config";
 			reg = <0x007e0000 0x00010000>; /* 64KB */
 		};
 
-		partition@007f0000 {
+		partition@7f0000 {
 			label = "FIS directory";
 			reg = <0x007f0000 0x00010000>; /* 64KB */
 		};
diff --git a/arch/arm/boot/dts/armada-385-synology-ds116.dts b/arch/arm/boot/dts/armada-385-synology-ds116.dts
index 31510eb56f10..36ad571e76f3 100644
--- a/arch/arm/boot/dts/armada-385-synology-ds116.dts
+++ b/arch/arm/boot/dts/armada-385-synology-ds116.dts
@@ -267,35 +267,35 @@
 		 * enumerated. The MAC address and the serial number are listed
 		 * in the "vendor" partition.
 		 */
-		partition@00000000 {
+		partition@0 {
 			label = "RedBoot";
 			reg = <0x00000000 0x000f0000>;
 			read-only;
 		};
 
-		partition@000c0000 {
+		partition@c0000 {
 			label = "zImage";
 			reg = <0x000f0000 0x002d0000>;
 		};
 
-		partition@00390000 {
+		partition@390000 {
 			label = "rd.gz";
 			reg = <0x003c0000 0x00410000>;
 		};
 
-		partition@007d0000 {
+		partition@7d0000 {
 			label = "vendor";
 			reg = <0x007d0000 0x00010000>;
 			read-only;
 		};
 
-		partition@007e0000 {
+		partition@7e0000 {
 			label = "RedBoot config";
 			reg = <0x007e0000 0x00010000>;
 			read-only;
 		};
 
-		partition@007f0000 {
+		partition@7f0000 {
 			label = "FIS directory";
 			reg = <0x007f0000 0x00010000>;
 			read-only;
diff --git a/arch/arm/boot/dts/armada-xp-synology-ds414.dts b/arch/arm/boot/dts/armada-xp-synology-ds414.dts
index d8e05bab0cee..d7228a5461c8 100644
--- a/arch/arm/boot/dts/armada-xp-synology-ds414.dts
+++ b/arch/arm/boot/dts/armada-xp-synology-ds414.dts
@@ -332,32 +332,32 @@
 		 * change the default environment, unless you know
 		 * what you are doing.
 		 */
-		partition@00000000 { /* u-boot */
+		partition@0 { /* u-boot */
 			label = "RedBoot";
 			reg = <0x00000000 0x000d0000>; /* 832KB */
 		};
 
-		partition@000c0000 { /* uImage */
+		partition@c0000 { /* uImage */
 			label = "zImage";
 			reg = <0x000d0000 0x002d0000>; /* 2880KB */
 		};
 
-		partition@003a0000 { /* uInitramfs */
+		partition@3a0000 { /* uInitramfs */
 			label = "rd.gz";
 			reg = <0x003a0000 0x00430000>; /* 4250KB */
 		};
 
-		partition@007d0000 { /* MAC address and serial number */
+		partition@7d0000 { /* MAC address and serial number */
 			label = "vendor";
 			reg = <0x007d0000 0x00010000>; /* 64KB */
 		};
 
-		partition@007e0000 {
+		partition@7e0000 {
 			label = "RedBoot config";
 			reg = <0x007e0000 0x00010000>; /* 64KB */
 		};
 
-		partition@007f0000 {
+		partition@7f0000 {
 			label = "FIS directory";
 			reg = <0x007f0000 0x00010000>; /* 64KB */
 		};
diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 22b958537d31..7e1d0f501cb9 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -109,7 +109,7 @@
                                         clock-frequency = <192000000>;
                                 };
 
-                                clk_apb: clk_apb@08 {
+                                clk_apb: clk_apb@8 {
                                         #clock-cells = <0>;
                                         compatible = "aspeed,g4-apb-clock", "fixed-clock";
                                         reg = <0x08>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 9cffe347b828..4272819f1b15 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -144,7 +144,7 @@
 					clock-frequency = <198000000>;
 				};
 
-				clk_apb: clk_apb@08 {
+				clk_apb: clk_apb@8 {
 					#clock-cells = <0>;
 					compatible = "aspeed,g5-apb-clock", "fixed-clock";
 					reg = <0x08>;
diff --git a/arch/arm/boot/dts/at91-ariag25.dts b/arch/arm/boot/dts/at91-ariag25.dts
index 4da011a7a698..1c86537a42a0 100644
--- a/arch/arm/boot/dts/at91-ariag25.dts
+++ b/arch/arm/boot/dts/at91-ariag25.dts
@@ -147,12 +147,12 @@
 			};
 		};
 
-		usb0: ohci@00600000 {
+		usb0: ohci@600000 {
 			status = "okay";
 			num-ports = <3>;
 		};
 
-		usb1: ehci@00700000 {
+		usb1: ehci@700000 {
 			status = "okay";
 		};
 	};
diff --git a/arch/arm/boot/dts/at91-ariettag25.dts b/arch/arm/boot/dts/at91-ariettag25.dts
index c514502081d2..fc7984492b44 100644
--- a/arch/arm/boot/dts/at91-ariettag25.dts
+++ b/arch/arm/boot/dts/at91-ariettag25.dts
@@ -58,12 +58,12 @@
 			};
 		};
 
-		usb0: ohci@00600000 {
+		usb0: ohci@600000 {
 			status = "okay";
 			num-ports = <3>;
 		};
 
-		usb1: ehci@00700000 {
+		usb1: ehci@700000 {
 			status = "okay";
 		};
 	};
diff --git a/arch/arm/boot/dts/at91-cosino_mega2560.dts b/arch/arm/boot/dts/at91-cosino_mega2560.dts
index 27ebb0f722fd..c452654b843a 100644
--- a/arch/arm/boot/dts/at91-cosino_mega2560.dts
+++ b/arch/arm/boot/dts/at91-cosino_mega2560.dts
@@ -62,7 +62,7 @@
 			};
 		};
 
-		usb0: ohci@00600000 {
+		usb0: ohci@600000 {
 			status = "okay";
 			num-ports = <3>;
 			atmel,vbus-gpio = <0 /* &pioD 18 GPIO_ACTIVE_LOW */
@@ -71,7 +71,7 @@
 					  >;
 		};
 
-		usb1: ehci@00700000 {
+		usb1: ehci@700000 {
 			status = "okay";
 		};
 	};
diff --git a/arch/arm/boot/dts/at91-kizbox2.dts b/arch/arm/boot/dts/at91-kizbox2.dts
index 4372c0287c1c..ec6c28c521a5 100644
--- a/arch/arm/boot/dts/at91-kizbox2.dts
+++ b/arch/arm/boot/dts/at91-kizbox2.dts
@@ -133,11 +133,11 @@
 			};
 		};
 
-		usb1: ohci@00600000 {
+		usb1: ohci@600000 {
 			status = "okay";
 		};
 
-		usb2: ehci@00700000 {
+		usb2: ehci@700000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/at91-kizboxmini.dts b/arch/arm/boot/dts/at91-kizboxmini.dts
index 33238fcb6d0b..fe1bc0a59a98 100644
--- a/arch/arm/boot/dts/at91-kizboxmini.dts
+++ b/arch/arm/boot/dts/at91-kizboxmini.dts
@@ -59,12 +59,12 @@
 			};
 		};
 
-		usb0: ohci@00600000 {
+		usb0: ohci@600000 {
 			num-ports = <1>;
 			status = "okay";
 		};
 
-		usb1: ehci@00700000 {
+		usb1: ehci@700000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
index 60cb084a8d92..cfb1b6a23824 100644
--- a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
+++ b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
@@ -58,14 +58,14 @@
 	};
 
 	ahb {
-		usb0: gadget@00300000 {
+		usb0: gadget@300000 {
 			atmel,vbus-gpio = <&pioA PIN_PD20 GPIO_ACTIVE_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_usba_vbus>;
 			status = "okay";
 		};
 
-		usb1: ohci@00400000 {
+		usb1: ohci@400000 {
 			num-ports = <3>;
 			atmel,vbus-gpio = <0 /* &pioA PIN_PD20 GPIO_ACTIVE_HIGH */
 					   &pioA PIN_PA27 GPIO_ACTIVE_HIGH
@@ -76,7 +76,7 @@
 			status = "okay";
 		};
 
-		usb2: ehci@00500000 {
+		usb2: ehci@500000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
index c7e9ccf2bc87..b2b5a8534134 100644
--- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
@@ -67,14 +67,14 @@
 	};
 
 	ahb {
-		usb0: gadget@00300000 {
+		usb0: gadget@300000 {
 			atmel,vbus-gpio = <&pioA PIN_PA31 GPIO_ACTIVE_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_usba_vbus>;
 			status = "okay";
 		};
 
-		usb1: ohci@00400000 {
+		usb1: ohci@400000 {
 			num-ports = <3>;
 			atmel,vbus-gpio = <0 /* &pioA PIN_PB9 GPIO_ACTIVE_HIGH */
 					   &pioA PIN_PB10 GPIO_ACTIVE_HIGH
@@ -85,7 +85,7 @@
 			status = "okay";
 		};
 
-		usb2: ehci@00500000 {
+		usb2: ehci@500000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/at91-sama5d3_xplained.dts b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
index 3af088d2cba7..40879aded680 100644
--- a/arch/arm/boot/dts/at91-sama5d3_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
@@ -235,14 +235,14 @@
 			};
 		};
 
-		usb0: gadget@00500000 {
+		usb0: gadget@500000 {
 			atmel,vbus-gpio = <&pioE 9 GPIO_ACTIVE_HIGH>;	/* PE9, conflicts with A9 */
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_usba_vbus>;
 			status = "okay";
 		};
 
-		usb1: ohci@00600000 {
+		usb1: ohci@600000 {
 			num-ports = <3>;
 			atmel,vbus-gpio = <0
 					   &pioE 3 GPIO_ACTIVE_LOW
@@ -251,7 +251,7 @@
 			status = "okay";
 		};
 
-		usb2: ehci@00700000 {
+		usb2: ehci@700000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts b/arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts
index 84be29f38dae..fe05aaa7ac87 100644
--- a/arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts
+++ b/arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts
@@ -21,14 +21,14 @@
 	};
 
 	ahb {
-		usb0: gadget@00400000 {
+		usb0: gadget@400000 {
 			atmel,vbus-gpio = <&pioE 31 GPIO_ACTIVE_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_usba_vbus>;
 			status = "okay";
 		};
 
-		usb1: ohci@00500000 {
+		usb1: ohci@500000 {
 			num-ports = <3>;
 			atmel,vbus-gpio = <0
 					   &pioE 11 GPIO_ACTIVE_LOW
@@ -37,7 +37,7 @@
 			status = "okay";
 		};
 
-		usb2: ehci@00600000 {
+		usb2: ehci@600000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/at91-sama5d4_xplained.dts b/arch/arm/boot/dts/at91-sama5d4_xplained.dts
index cf712444b2c2..29ab17a97f9a 100644
--- a/arch/arm/boot/dts/at91-sama5d4_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d4_xplained.dts
@@ -170,14 +170,14 @@
 			};
 		};
 
-		usb0: gadget@00400000 {
+		usb0: gadget@400000 {
 			atmel,vbus-gpio = <&pioE 31 GPIO_ACTIVE_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_usba_vbus>;
 			status = "okay";
 		};
 
-		usb1: ohci@00500000 {
+		usb1: ohci@500000 {
 			num-ports = <3>;
 			atmel,vbus-gpio = <0
 					   &pioE 11 GPIO_ACTIVE_HIGH
@@ -186,7 +186,7 @@
 			status = "okay";
 		};
 
-		usb2: ehci@00600000 {
+		usb2: ehci@600000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/at91-sama5d4ek.dts b/arch/arm/boot/dts/at91-sama5d4ek.dts
index bae5248f126e..5b7ee92e32a7 100644
--- a/arch/arm/boot/dts/at91-sama5d4ek.dts
+++ b/arch/arm/boot/dts/at91-sama5d4ek.dts
@@ -216,14 +216,14 @@
 			};
 		};
 
-		usb0: gadget@00400000 {
+		usb0: gadget@400000 {
 			atmel,vbus-gpio = <&pioE 31 GPIO_ACTIVE_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_usba_vbus>;
 			status = "okay";
 		};
 
-		usb1: ohci@00500000 {
+		usb1: ohci@500000 {
 			num-ports = <3>;
 			atmel,vbus-gpio = <0 /* &pioE 10 GPIO_ACTIVE_LOW */
 					   &pioE 11 GPIO_ACTIVE_LOW
@@ -232,7 +232,7 @@
 			status = "okay";
 		};
 
-		usb2: ehci@00600000 {
+		usb2: ehci@600000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/at91-vinco.dts b/arch/arm/boot/dts/at91-vinco.dts
index e0c0b2897a49..9f6005708ea8 100644
--- a/arch/arm/boot/dts/at91-vinco.dts
+++ b/arch/arm/boot/dts/at91-vinco.dts
@@ -180,14 +180,14 @@
 			};
 		};
 
-		usb0: gadget@00400000 {
+		usb0: gadget@400000 {
 			atmel,vbus-gpio = <&pioE 31 GPIO_ACTIVE_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_usba_vbus>;
 			status = "disable";
 		};
 
-		usb1: ohci@00500000 {
+		usb1: ohci@500000 {
 			num-ports = <3>;
 			atmel,vbus-gpio = <0
 					   &pioE 11 GPIO_ACTIVE_LOW
@@ -196,7 +196,7 @@
 			status = "disable";
 		};
 
-		usb2: ehci@00600000 {
+		usb2: ehci@600000 {
 			/* 4G Modem */
 			status = "okay";
 		};
diff --git a/arch/arm/boot/dts/at91rm9200.dtsi b/arch/arm/boot/dts/at91rm9200.dtsi
index f057e0b15a6f..da622bf45b4a 100644
--- a/arch/arm/boot/dts/at91rm9200.dtsi
+++ b/arch/arm/boot/dts/at91rm9200.dtsi
@@ -66,7 +66,7 @@
 		};
 	};
 
-	sram: sram@00200000 {
+	sram: sram@200000 {
 		compatible = "mmio-sram";
 		reg = <0x00200000 0x4000>;
 	};
@@ -938,7 +938,7 @@
 			status = "disabled";
 		};
 
-		usb0: ohci@00300000 {
+		usb0: ohci@300000 {
 			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
 			reg = <0x00300000 0x100000>;
 			interrupts = <23 IRQ_TYPE_LEVEL_HIGH 2>;
diff --git a/arch/arm/boot/dts/at91rm9200ek.dts b/arch/arm/boot/dts/at91rm9200ek.dts
index f90e1c2d3caa..33192d0cefee 100644
--- a/arch/arm/boot/dts/at91rm9200ek.dts
+++ b/arch/arm/boot/dts/at91rm9200ek.dts
@@ -78,7 +78,7 @@
 			};
 		};
 
-		usb0: ohci@00300000 {
+		usb0: ohci@300000 {
 			num-ports = <2>;
 			status = "okay";
 		};
diff --git a/arch/arm/boot/dts/at91sam9260.dtsi b/arch/arm/boot/dts/at91sam9260.dtsi
index 6582f3cca929..bc655e7332d6 100644
--- a/arch/arm/boot/dts/at91sam9260.dtsi
+++ b/arch/arm/boot/dts/at91sam9260.dtsi
@@ -69,7 +69,7 @@
 		};
 	};
 
-	sram0: sram@002ff000 {
+	sram0: sram@2ff000 {
 		compatible = "mmio-sram";
 		reg = <0x002ff000 0x2000>;
 	};
diff --git a/arch/arm/boot/dts/at91sam9261.dtsi b/arch/arm/boot/dts/at91sam9261.dtsi
index a05353f96151..66876019101d 100644
--- a/arch/arm/boot/dts/at91sam9261.dtsi
+++ b/arch/arm/boot/dts/at91sam9261.dtsi
@@ -60,7 +60,7 @@
 		};
 	};
 
-	sram: sram@00300000 {
+	sram: sram@300000 {
 		compatible = "mmio-sram";
 		reg = <0x00300000 0x28000>;
 	};
@@ -71,7 +71,7 @@
 		#size-cells = <1>;
 		ranges;
 
-		usb0: ohci@00500000 {
+		usb0: ohci@500000 {
 			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
 			reg = <0x00500000 0x100000>;
 			interrupts = <20 IRQ_TYPE_LEVEL_HIGH 2>;
diff --git a/arch/arm/boot/dts/at91sam9261ek.dts b/arch/arm/boot/dts/at91sam9261ek.dts
index 157e1493e6eb..960d6940ebf6 100644
--- a/arch/arm/boot/dts/at91sam9261ek.dts
+++ b/arch/arm/boot/dts/at91sam9261ek.dts
@@ -32,7 +32,7 @@
 	};
 
 	ahb {
-		usb0: ohci@00500000 {
+		usb0: ohci@500000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/at91sam9263.dtsi b/arch/arm/boot/dts/at91sam9263.dtsi
index ed4b564f8de5..e54f14d36b6f 100644
--- a/arch/arm/boot/dts/at91sam9263.dtsi
+++ b/arch/arm/boot/dts/at91sam9263.dtsi
@@ -62,12 +62,12 @@
 		};
 	};
 
-	sram0: sram@00300000 {
+	sram0: sram@300000 {
 		compatible = "mmio-sram";
 		reg = <0x00300000 0x14000>;
 	};
 
-	sram1: sram@00500000 {
+	sram1: sram@500000 {
 		compatible = "mmio-sram";
 		reg = <0x00500000 0x4000>;
 	};
@@ -1010,7 +1010,7 @@
 			status = "disabled";
 		};
 
-		usb0: ohci@00a00000 {
+		usb0: ohci@a00000 {
 			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
 			reg = <0x00a00000 0x100000>;
 			interrupts = <29 IRQ_TYPE_LEVEL_HIGH 2>;
diff --git a/arch/arm/boot/dts/at91sam9263ek.dts b/arch/arm/boot/dts/at91sam9263ek.dts
index 10a0925da10e..5a2e1af793f5 100644
--- a/arch/arm/boot/dts/at91sam9263ek.dts
+++ b/arch/arm/boot/dts/at91sam9263ek.dts
@@ -191,7 +191,7 @@
 			};
 		};
 
-		usb0: ohci@00a00000 {
+		usb0: ohci@a00000 {
 			num-ports = <2>;
 			status = "okay";
 			atmel,vbus-gpio = <&pioA 24 GPIO_ACTIVE_HIGH
diff --git a/arch/arm/boot/dts/at91sam9g20.dtsi b/arch/arm/boot/dts/at91sam9g20.dtsi
index f59301618163..90705ee6008b 100644
--- a/arch/arm/boot/dts/at91sam9g20.dtsi
+++ b/arch/arm/boot/dts/at91sam9g20.dtsi
@@ -16,11 +16,11 @@
 		reg = <0x20000000 0x08000000>;
 	};
 
-	sram0: sram@002ff000 {
+	sram0: sram@2ff000 {
 		status = "disabled";
 	};
 
-	sram1: sram@002fc000 {
+	sram1: sram@2fc000 {
 		compatible = "mmio-sram";
 		reg = <0x002fc000 0x8000>;
 	};
diff --git a/arch/arm/boot/dts/at91sam9g45.dtsi b/arch/arm/boot/dts/at91sam9g45.dtsi
index 64fa3f9a39d3..2b127ca7aaa0 100644
--- a/arch/arm/boot/dts/at91sam9g45.dtsi
+++ b/arch/arm/boot/dts/at91sam9g45.dtsi
@@ -74,7 +74,7 @@
 		};
 	};
 
-	sram: sram@00300000 {
+	sram: sram@300000 {
 		compatible = "mmio-sram";
 		reg = <0x00300000 0x10000>;
 	};
@@ -1313,7 +1313,7 @@
 			status = "disabled";
 		};
 
-		usb0: ohci@00700000 {
+		usb0: ohci@700000 {
 			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
 			reg = <0x00700000 0x100000>;
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
@@ -1322,7 +1322,7 @@
 			status = "disabled";
 		};
 
-		usb1: ehci@00800000 {
+		usb1: ehci@800000 {
 			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
 			reg = <0x00800000 0x100000>;
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
diff --git a/arch/arm/boot/dts/at91sam9m10g45ek.dts b/arch/arm/boot/dts/at91sam9m10g45ek.dts
index 94c52c555f83..e922552a04cb 100644
--- a/arch/arm/boot/dts/at91sam9m10g45ek.dts
+++ b/arch/arm/boot/dts/at91sam9m10g45ek.dts
@@ -290,14 +290,14 @@
 			};
 		};
 
-		usb0: ohci@00700000 {
+		usb0: ohci@700000 {
 			status = "okay";
 			num-ports = <2>;
 			atmel,vbus-gpio = <&pioD 1 GPIO_ACTIVE_LOW
 					   &pioD 3 GPIO_ACTIVE_LOW>;
 		};
 
-		usb1: ehci@00800000 {
+		usb1: ehci@800000 {
 			status = "okay";
 		};
 	};
diff --git a/arch/arm/boot/dts/at91sam9n12.dtsi b/arch/arm/boot/dts/at91sam9n12.dtsi
index 06516d02d351..e0ac824e0785 100644
--- a/arch/arm/boot/dts/at91sam9n12.dtsi
+++ b/arch/arm/boot/dts/at91sam9n12.dtsi
@@ -64,7 +64,7 @@
 		};
 	};
 
-	sram: sram@00300000 {
+	sram: sram@300000 {
 		compatible = "mmio-sram";
 		reg = <0x00300000 0x8000>;
 	};
@@ -1018,7 +1018,7 @@
 			};
 		};
 
-		usb0: ohci@00500000 {
+		usb0: ohci@500000 {
 			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
 			reg = <0x00500000 0x00100000>;
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
diff --git a/arch/arm/boot/dts/at91sam9n12ek.dts b/arch/arm/boot/dts/at91sam9n12ek.dts
index 5bea8c59b115..212562aedf5e 100644
--- a/arch/arm/boot/dts/at91sam9n12ek.dts
+++ b/arch/arm/boot/dts/at91sam9n12ek.dts
@@ -169,7 +169,7 @@
 			};
 		};
 
-		usb0: ohci@00500000 {
+		usb0: ohci@500000 {
 			num-ports = <1>;
 			atmel,vbus-gpio = <&pioB 7 GPIO_ACTIVE_LOW>;
 			status = "okay";
diff --git a/arch/arm/boot/dts/at91sam9rl.dtsi b/arch/arm/boot/dts/at91sam9rl.dtsi
index 7768342a6638..52f0e9ef8f67 100644
--- a/arch/arm/boot/dts/at91sam9rl.dtsi
+++ b/arch/arm/boot/dts/at91sam9rl.dtsi
@@ -70,7 +70,7 @@
 		};
 	};
 
-	sram: sram@00300000 {
+	sram: sram@300000 {
 		compatible = "mmio-sram";
 		reg = <0x00300000 0x10000>;
 	};
@@ -81,7 +81,7 @@
 		#size-cells = <1>;
 		ranges;
 
-		fb0: fb@00500000 {
+		fb0: fb@500000 {
 			compatible = "atmel,at91sam9rl-lcdc";
 			reg = <0x00500000 0x1000>;
 			interrupts = <23 IRQ_TYPE_LEVEL_HIGH 3>;
diff --git a/arch/arm/boot/dts/at91sam9rlek.dts b/arch/arm/boot/dts/at91sam9rlek.dts
index 9047c168298a..ea6ed98960c9 100644
--- a/arch/arm/boot/dts/at91sam9rlek.dts
+++ b/arch/arm/boot/dts/at91sam9rlek.dts
@@ -32,7 +32,7 @@
 	};
 
 	ahb {
-		fb0: fb@00500000 {
+		fb0: fb@500000 {
 			display = <&display0>;
 			status = "okay";
 
diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91sam9x5.dtsi
index 57f307541d2e..ad779a7dfefd 100644
--- a/arch/arm/boot/dts/at91sam9x5.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5.dtsi
@@ -72,7 +72,7 @@
 		};
 	};
 
-	sram: sram@00300000 {
+	sram: sram@300000 {
 		compatible = "mmio-sram";
 		reg = <0x00300000 0x8000>;
 	};
@@ -1231,7 +1231,7 @@
 			};
 		};
 
-		usb0: ohci@00600000 {
+		usb0: ohci@600000 {
 			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
 			reg = <0x00600000 0x100000>;
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
@@ -1240,7 +1240,7 @@
 			status = "disabled";
 		};
 
-		usb1: ehci@00700000 {
+		usb1: ehci@700000 {
 			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
 			reg = <0x00700000 0x100000>;
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
diff --git a/arch/arm/boot/dts/at91sam9x5ek.dtsi b/arch/arm/boot/dts/at91sam9x5ek.dtsi
index 9d2bbc41a7b0..eb6dcc4c2bc3 100644
--- a/arch/arm/boot/dts/at91sam9x5ek.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5ek.dtsi
@@ -134,7 +134,7 @@
 			};
 		};
 
-		usb0: ohci@00600000 {
+		usb0: ohci@600000 {
 			status = "okay";
 			num-ports = <3>;
 			atmel,vbus-gpio = <0 /* &pioD 18 GPIO_ACTIVE_LOW *//* Activate to have access to port A */
@@ -143,7 +143,7 @@
 					  >;
 		};
 
-		usb1: ehci@00700000 {
+		usb1: ehci@700000 {
 			status = "okay";
 		};
 	};
diff --git a/arch/arm/boot/dts/at91sam9xe.dtsi b/arch/arm/boot/dts/at91sam9xe.dtsi
index 0278f63b2daf..1304452f0fae 100644
--- a/arch/arm/boot/dts/at91sam9xe.dtsi
+++ b/arch/arm/boot/dts/at91sam9xe.dtsi
@@ -49,11 +49,11 @@
 	model = "Atmel AT91SAM9XE family SoC";
 	compatible = "atmel,at91sam9xe", "atmel,at91sam9260";
 
-	sram0: sram@002ff000 {
+	sram0: sram@2ff000 {
 		status = "disabled";
 	};
 
-	sram1: sram@00300000 {
+	sram1: sram@300000 {
 		compatible = "mmio-sram";
 		reg = <0x00300000 0x4000>;
 	};
diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 7c957ea06c66..86e8c155d175 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -96,14 +96,14 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		otp: otp@0301c800 {
+		otp: otp@301c800 {
 			compatible = "brcm,ocotp";
 			reg = <0x0301c800 0x2c>;
 			brcm,ocotp-size = <2048>;
 			status = "disabled";
 		};
 
-		pcie_phy: phy@0301d0a0 {
+		pcie_phy: phy@301d0a0 {
 			compatible = "brcm,cygnus-pcie-phy";
 			reg = <0x0301d0a0 0x14>;
 			#address-cells = <1>;
@@ -120,7 +120,7 @@
 			};
 		};
 
-		pinctrl: pinctrl@0301d0c8 {
+		pinctrl: pinctrl@301d0c8 {
 			compatible = "brcm,cygnus-pinmux";
 			reg = <0x0301d0c8 0x30>,
 			      <0x0301d24c 0x2c>;
@@ -141,7 +141,7 @@
 			};
 		};
 
-		mailbox: mailbox@03024024 {
+		mailbox: mailbox@3024024 {
 			compatible = "brcm,iproc-mailbox";
 			reg = <0x03024024 0x40>;
 			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
@@ -150,7 +150,7 @@
 			#mbox-cells = <1>;
 		};
 
-		gpio_crmu: gpio@03024800 {
+		gpio_crmu: gpio@3024800 {
 			compatible = "brcm,cygnus-crmu-gpio";
 			reg = <0x03024800 0x50>,
 			      <0x03024008 0x18>;
diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index dff66974feed..528b9e3bc1da 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -75,7 +75,7 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		a9pll: arm_clk@00000 {
+		a9pll: arm_clk@0 {
 			#clock-cells = <0>;
 			compatible = "brcm,nsp-armpll";
 			clocks = <&osc>;
@@ -164,7 +164,7 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		gpioa: gpio@0020 {
+		gpioa: gpio@20 {
 			compatible = "brcm,nsp-gpio-a";
 			reg = <0x0020 0x70>,
 			      <0x3f1c4 0x1c>;
@@ -176,7 +176,7 @@
 			gpio-ranges = <&pinctrl 0 0 32>;
 		};
 
-		uart0: serial@0300 {
+		uart0: serial@300 {
 			compatible = "ns16550a";
 			reg = <0x0300 0x100>;
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
@@ -184,7 +184,7 @@
 			status = "disabled";
 		};
 
-		uart1: serial@0400 {
+		uart1: serial@400 {
 			compatible = "ns16550a";
 			reg = <0x0400 0x100>;
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
index 045b9bb857f9..9a076c409f4e 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -24,7 +24,7 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		uart0: serial@0300 {
+		uart0: serial@300 {
 			compatible = "ns16550";
 			reg = <0x0300 0x100>;
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
@@ -32,7 +32,7 @@
 			status = "disabled";
 		};
 
-		uart1: serial@0400 {
+		uart1: serial@400 {
 			compatible = "ns16550";
 			reg = <0x0400 0x100>;
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
@@ -47,7 +47,7 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		a9pll: arm_clk@00000 {
+		a9pll: arm_clk@0 {
 			#clock-cells = <0>;
 			compatible = "brcm,nsp-armpll";
 			clocks = <&osc>;
diff --git a/arch/arm/boot/dts/bcm53573.dtsi b/arch/arm/boot/dts/bcm53573.dtsi
index c698a565b8ae..16007d72c346 100644
--- a/arch/arm/boot/dts/bcm53573.dtsi
+++ b/arch/arm/boot/dts/bcm53573.dtsi
@@ -107,7 +107,7 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 
-			uart0: serial@0300 {
+			uart0: serial@300 {
 				compatible = "ns16550a";
 				reg = <0x0300 0x100>;
 				interrupt-parent = <&gic>;
diff --git a/arch/arm/boot/dts/berlin2.dtsi b/arch/arm/boot/dts/berlin2.dtsi
index 425c48971abe..d575823c5750 100644
--- a/arch/arm/boot/dts/berlin2.dtsi
+++ b/arch/arm/boot/dts/berlin2.dtsi
@@ -202,7 +202,7 @@
 			ranges = <0 0xe80000 0x10000>;
 			interrupt-parent = <&aic>;
 
-			gpio0: gpio@0400 {
+			gpio0: gpio@400 {
 				compatible = "snps,dw-apb-gpio";
 				reg = <0x0400 0x400>;
 				#address-cells = <1>;
@@ -220,7 +220,7 @@
 				};
 			};
 
-			gpio1: gpio@0800 {
+			gpio1: gpio@800 {
 				compatible = "snps,dw-apb-gpio";
 				reg = <0x0800 0x400>;
 				#address-cells = <1>;
@@ -238,7 +238,7 @@
 				};
 			};
 
-			gpio2: gpio@0c00 {
+			gpio2: gpio@c00 {
 				compatible = "snps,dw-apb-gpio";
 				reg = <0x0c00 0x400>;
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/berlin2cd.dtsi b/arch/arm/boot/dts/berlin2cd.dtsi
index 4fe1574d08c3..501c59d97eae 100644
--- a/arch/arm/boot/dts/berlin2cd.dtsi
+++ b/arch/arm/boot/dts/berlin2cd.dtsi
@@ -182,7 +182,7 @@
 			ranges = <0 0xe80000 0x10000>;
 			interrupt-parent = <&aic>;
 
-			gpio0: gpio@0400 {
+			gpio0: gpio@400 {
 				compatible = "snps,dw-apb-gpio";
 				reg = <0x0400 0x400>;
 				#address-cells = <1>;
@@ -200,7 +200,7 @@
 				};
 			};
 
-			gpio1: gpio@0800 {
+			gpio1: gpio@800 {
 				compatible = "snps,dw-apb-gpio";
 				reg = <0x0800 0x400>;
 				#address-cells = <1>;
@@ -218,7 +218,7 @@
 				};
 			};
 
-			gpio2: gpio@0c00 {
+			gpio2: gpio@c00 {
 				compatible = "snps,dw-apb-gpio";
 				reg = <0x0c00 0x400>;
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
index e548229697fc..bf3a6c9a1d34 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -234,7 +234,7 @@
 			ranges = <0 0xe80000 0x10000>;
 			interrupt-parent = <&aic>;
 
-			gpio0: gpio@0400 {
+			gpio0: gpio@400 {
 				compatible = "snps,dw-apb-gpio";
 				reg = <0x0400 0x400>;
 				#address-cells = <1>;
@@ -252,7 +252,7 @@
 				};
 			};
 
-			gpio1: gpio@0800 {
+			gpio1: gpio@800 {
 				compatible = "snps,dw-apb-gpio";
 				reg = <0x0800 0x400>;
 				#address-cells = <1>;
@@ -270,7 +270,7 @@
 				};
 			};
 
-			gpio2: gpio@0c00 {
+			gpio2: gpio@c00 {
 				compatible = "snps,dw-apb-gpio";
 				reg = <0x0c00 0x400>;
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
index 1475d3672e56..13e5b73707f6 100644
--- a/arch/arm/boot/dts/dove.dtsi
+++ b/arch/arm/boot/dts/dove.dtsi
@@ -456,25 +456,25 @@
 					};
 				};
 
-				thermal: thermal-diode@001c {
+				thermal: thermal-diode@1c {
 					compatible = "marvell,dove-thermal";
 					reg = <0x001c 0x0c>, <0x005c 0x08>;
 				};
 
-				gate_clk: clock-gating-ctrl@0038 {
+				gate_clk: clock-gating-ctrl@38 {
 					compatible = "marvell,dove-gating-clock";
 					reg = <0x0038 0x4>;
 					clocks = <&core_clk 0>;
 					#clock-cells = <1>;
 				};
 
-				divider_clk: core-clock@0064 {
+				divider_clk: core-clock@64 {
 					compatible = "marvell,dove-divider-clock";
 					reg = <0x0064 0x8>;
 					#clock-cells = <1>;
 				};
 
-				pinctrl: pin-ctrl@0200 {
+				pinctrl: pin-ctrl@200 {
 					compatible = "marvell,dove-pinctrl";
 					reg = <0x0200 0x14>,
 					      <0x0440 0x04>;
@@ -718,13 +718,13 @@
 					};
 				};
 
-				core_clk: core-clocks@0214 {
+				core_clk: core-clocks@214 {
 					compatible = "marvell,dove-core-clock";
 					reg = <0x0214 0x4>;
 					#clock-cells = <1>;
 				};
 
-				gpio0: gpio-ctrl@0400 {
+				gpio0: gpio-ctrl@400 {
 					compatible = "marvell,orion-gpio";
 					#gpio-cells = <2>;
 					gpio-controller;
@@ -736,7 +736,7 @@
 					interrupts = <12>, <13>, <14>, <60>;
 				};
 
-				gpio1: gpio-ctrl@0420 {
+				gpio1: gpio-ctrl@420 {
 					compatible = "marvell,orion-gpio";
 					#gpio-cells = <2>;
 					gpio-controller;
diff --git a/arch/arm/boot/dts/ep7211-edb7211.dts b/arch/arm/boot/dts/ep7211-edb7211.dts
index 9a134ed271eb..bc9d5b697452 100644
--- a/arch/arm/boot/dts/ep7211-edb7211.dts
+++ b/arch/arm/boot/dts/ep7211-edb7211.dts
@@ -75,7 +75,7 @@
 };
 
 &bus {
-	flash: nor@00000000 {
+	flash: nor@0 {
 		compatible = "cfi-flash";
 		reg = <0 0x00000000 0x02000000>;
 		bank-width = <2>;
diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
index 639c2e605f3c..152e0291d0da 100644
--- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
+++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
@@ -29,7 +29,7 @@
 		reg = <0x40000000 0x1ff00000>;
 	};
 
-	firmware@0205f000 {
+	firmware@205f000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x0205f000 0x1000>;
 	};
diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index bbdfcbc6e7d2..029eb18590cf 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -32,7 +32,7 @@
 		reg =  <0x40000000 0x1ff00000>;
 	};
 
-	firmware@0205F000 {
+	firmware@205f000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x0205F000 0x1000>;
 	};
diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 0b45467d77a8..14f931896657 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -32,7 +32,7 @@
 		reg =  <0x40000000 0x1ff00000>;
 	};
 
-	firmware@0205F000 {
+	firmware@205f000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x0205F000 0x1000>;
 	};
diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 590ee442d0ae..2bd3872221a1 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -122,7 +122,7 @@
 			};
 		};
 
-		sysram@02020000 {
+		sysram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x40000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 5739389f5bb8..4768b086ed67 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -55,7 +55,7 @@
 		serial3 = &serial_3;
 	};
 
-	clock_audss: clock-controller@03810000 {
+	clock_audss: clock-controller@3810000 {
 		compatible = "samsung,exynos4210-audss-clock";
 		reg = <0x03810000 0x0C>;
 		#clock-cells = <1>;
@@ -64,7 +64,7 @@
 		clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in";
 	};
 
-	i2s0: i2s@03830000 {
+	i2s0: i2s@3830000 {
 		compatible = "samsung,s5pv210-i2s";
 		reg = <0x03830000 0x100>;
 		clocks = <&clock_audss EXYNOS_I2S_BUS>,
diff --git a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
index f280954b260a..82c32d4d83d8 100644
--- a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
@@ -843,7 +843,7 @@
 		};
 	};
 
-	pinctrl@03860000 {
+	pinctrl@3860000 {
 		gpz: gpz {
 			gpio-controller;
 			#gpio-cells = <2>;
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 0c89ea99de54..acd2b2286ccb 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -31,7 +31,7 @@
 		stdout-path = &serial_2;
 	};
 
-	sysram@02020000 {
+	sysram@2020000 {
 		smp-sysram@0 {
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 768fb075b1fd..03dd61f64809 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -64,7 +64,7 @@
 		};
 	};
 
-	sysram: sysram@02020000 {
+	sysram: sysram@2020000 {
 		compatible = "mmio-sram";
 		reg = <0x02020000 0x20000>;
 		#address-cells = <1>;
@@ -151,7 +151,7 @@
 		};
 	};
 
-	pinctrl_2: pinctrl@03860000 {
+	pinctrl_2: pinctrl@3860000 {
 		compatible = "samsung,exynos4210-pinctrl";
 		reg = <0x03860000 0x1000>;
 	};
diff --git a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
index 14ce2c69bc0b..bda49b232f7b 100644
--- a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
+++ b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
@@ -26,7 +26,7 @@
 		reg = <0x40000000 0x40000000>;
 	};
 
-	firmware@0203F000 {
+	firmware@203f000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x0203F000 0x1000>;
 	};
diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 102acd78be15..f7678869481a 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -20,7 +20,7 @@
 		stdout-path = &serial_1;
 	};
 
-	firmware@0204F000 {
+	firmware@204f000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x0204F000 0x1000>;
 	};
@@ -253,7 +253,7 @@
 	samsung,i2c-max-bus-freq = <400000>;
 	status = "okay";
 
-	usb3503: usb3503@08 {
+	usb3503: usb3503@8 {
 		compatible = "smsc,usb3503";
 		reg = <0x08>;
 
@@ -263,7 +263,7 @@
 		initial-mode = <1>;
 	};
 
-	max77686: pmic@09 {
+	max77686: pmic@9 {
 		compatible = "maxim,max77686";
 		interrupt-parent = <&gpx3>;
 		interrupts = <2 IRQ_TYPE_NONE>;
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 8a89eb893d64..b0b5ec7903a5 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -32,7 +32,7 @@
 		stdout-path = &serial_2;
 	};
 
-	firmware@0203F000 {
+	firmware@203f000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x0203F000 0x1000>;
 	};
diff --git a/arch/arm/boot/dts/exynos4412-pinctrl.dtsi b/arch/arm/boot/dts/exynos4412-pinctrl.dtsi
index 1d27c28564e4..4eebd4721a5f 100644
--- a/arch/arm/boot/dts/exynos4412-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4412-pinctrl.dtsi
@@ -899,7 +899,7 @@
 		};
 	};
 
-	pinctrl_2: pinctrl@03860000 {
+	pinctrl_2: pinctrl@3860000 {
 		gpz: gpz {
 			gpio-controller;
 			#gpio-cells = <2>;
diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index bceb919ac637..d867888e7b35 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -40,7 +40,7 @@
 		stdout-path = &serial_2;
 	};
 
-	firmware@0204F000 {
+	firmware@204f000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x0204F000 0x1000>;
 	};
@@ -206,7 +206,7 @@
 		#size-cells = <0>;
 		status = "okay";
 
-		ak8975@0c {
+		ak8975@c {
 			compatible = "asahi-kasei,ak8975";
 			reg = <0x0c>;
 			gpios = <&gpj0 7 GPIO_ACTIVE_HIGH>;
@@ -587,7 +587,7 @@
 	pinctrl-names = "default";
 	status = "okay";
 
-	max77686: max77686_pmic@09 {
+	max77686: max77686_pmic@9 {
 		compatible = "maxim,max77686";
 		interrupt-parent = <&gpx0>;
 		interrupts = <7 IRQ_TYPE_NONE>;
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 7ff03a7e8fb9..b255ac55b1c1 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -150,7 +150,7 @@
 		};
 	};
 
-	sysram@02020000 {
+	sysram@2020000 {
 		compatible = "mmio-sram";
 		reg = <0x02020000 0x40000>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 062cba4c2c31..de6752596774 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -129,7 +129,7 @@
 		reg = <0x50>;
 	};
 
-	max77686@09 {
+	max77686@9 {
 		compatible = "maxim,max77686";
 		reg = <0x09>;
 		interrupt-parent = <&gpx3>;
diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
index 8788880e459d..6360cfb38da9 100644
--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
@@ -281,7 +281,7 @@
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <378000>;
 
-	max77686: max77686@09 {
+	max77686: max77686@9 {
 		compatible = "maxim,max77686";
 		interrupt-parent = <&gpx3>;
 		interrupts = <2 IRQ_TYPE_NONE>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 8dbeb873e99c..222e2fb6e589 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -93,7 +93,7 @@
 	};
 
 	soc: soc {
-		sysram@02020000 {
+		sysram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x30000>;
 			#address-cells = <1>;
@@ -219,7 +219,7 @@
 			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		pinctrl_3: pinctrl@03860000 {
+		pinctrl_3: pinctrl@3860000 {
 			compatible = "samsung,exynos5250-pinctrl";
 			reg = <0x03860000 0x1000>;
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
@@ -475,7 +475,7 @@
 			status = "disabled";
 		};
 
-		i2s0: i2s@03830000 {
+		i2s0: i2s@3830000 {
 			compatible = "samsung,s5pv210-i2s";
 			status = "disabled";
 			reg = <0x03830000 0x100>;
diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index c4de1353e5df..a45eaae33f8f 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -54,7 +54,7 @@
 		#clock-cells = <0>;
 	};
 
-	firmware@02073000 {
+	firmware@2073000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x02073000 0x1000>;
 	};
@@ -164,7 +164,7 @@
 	samsung,i2c-max-bus-freq = <400000>;
 	status = "okay";
 
-	usb3503: usb-hub@08 {
+	usb3503: usb-hub@8 {
 		compatible = "smsc,usb3503";
 		reg = <0x08>;
 
@@ -178,7 +178,7 @@
 		refclk-frequency = <24000000>;
 	};
 
-	max77802: pmic@09 {
+	max77802: pmic@9 {
 		compatible = "maxim,max77802";
 		reg = <0x9>;
 		interrupt-parent = <&gpx0>;
diff --git a/arch/arm/boot/dts/exynos5410-smdk5410.dts b/arch/arm/boot/dts/exynos5410-smdk5410.dts
index 9cb7726ef8d0..25f21e9e7d58 100644
--- a/arch/arm/boot/dts/exynos5410-smdk5410.dts
+++ b/arch/arm/boot/dts/exynos5410-smdk5410.dts
@@ -32,7 +32,7 @@
 		#clock-cells = <0>;
 	};
 
-	firmware@02037000 {
+	firmware@2037000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x02037000 0x1000>;
 	};
diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 7eab4bc07cec..06713ec86f0d 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -187,7 +187,7 @@
 			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		pinctrl_3: pinctrl@03860000 {
+		pinctrl_3: pinctrl@3860000 {
 			compatible = "samsung,exynos5410-pinctrl";
 			reg = <0x03860000 0x1000>;
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
@@ -223,7 +223,7 @@
 			};
 		};
 
-		audi2s0: i2s@03830000 {
+		audi2s0: i2s@3830000 {
 			compatible = "samsung,exynos5420-i2s";
 			reg = <0x03830000 0x100>;
 			dmas = <&pdma0 10
diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index ee1bb9b8b366..6531fbc3eeb7 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -30,7 +30,7 @@
 		bootargs = "console=ttySAC3,115200";
 	};
 
-	firmware@02073000 {
+	firmware@2073000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x02073000 0x1000>;
 	};
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 02d2f898efa6..b94425a26108 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -352,7 +352,7 @@
 			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		pinctrl_4: pinctrl@03860000 {
+		pinctrl_4: pinctrl@3860000 {
 			compatible = "samsung,exynos5420-pinctrl";
 			reg = <0x03860000 0x1000>;
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
@@ -365,7 +365,7 @@
 			interrupt-parent = <&gic>;
 			ranges;
 
-			adma: adma@03880000 {
+			adma: adma@3880000 {
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0x03880000 0x1000>;
 				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
@@ -429,7 +429,7 @@
 			};
 		};
 
-		i2s0: i2s@03830000 {
+		i2s0: i2s@3830000 {
 			compatible = "samsung,exynos5420-i2s";
 			reg = <0x03830000 0x100>;
 			dmas = <&adma 0
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index a183b56283f8..11aa39e50145 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -29,7 +29,7 @@
 		stdout-path = "serial2:115200n8";
 	};
 
-	firmware@02073000 {
+	firmware@2073000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x02073000 0x1000>;
 	};
diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
index 92bd2c6f7631..7eafad333bdb 100644
--- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
+++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
@@ -56,7 +56,7 @@
 			samsung,spi-feedback-delay = <0>;
 		};
 
-		partition@00000 {
+		partition@0 {
 			label = "BootLoader";
 			reg = <0x60000 0x80000>;
 			read-only;
diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 7a00be7ea6d7..9c3c75ae5e48 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -196,7 +196,7 @@
 		clock-names = "watchdog";
 	};
 
-	gmac: ethernet@00230000 {
+	gmac: ethernet@230000 {
 		compatible = "snps,dwmac-3.70a", "snps,dwmac";
 		reg = <0x00230000 0x8000>;
 		interrupt-parent = <&gic>;
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index 0389e8a10d0b..b2ea88181f1b 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -29,7 +29,7 @@
 	};
 
 	soc: soc {
-		sysram@02020000 {
+		sysram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x54000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/ge863-pro3.dtsi b/arch/arm/boot/dts/ge863-pro3.dtsi
index 8613944ea5c5..6a9fdc0760f0 100644
--- a/arch/arm/boot/dts/ge863-pro3.dtsi
+++ b/arch/arm/boot/dts/ge863-pro3.dtsi
@@ -50,7 +50,7 @@
 							reg = <0x0 0x7c0000>;
 						};
 
-						root@07c0000 {
+						root@7c0000 {
 							label = "root";
 							reg = <0x7c0000 0x7840000>;
 						};
diff --git a/arch/arm/boot/dts/hip01.dtsi b/arch/arm/boot/dts/hip01.dtsi
index 9d5fd5cfefa6..f7cf4f53e764 100644
--- a/arch/arm/boot/dts/hip01.dtsi
+++ b/arch/arm/boot/dts/hip01.dtsi
@@ -91,14 +91,14 @@
 			reboot-offset = <0x4>;
 		};
 
-		global_timer@0a000200 {
+		global_timer@a000200 {
 			compatible = "arm,cortex-a9-global-timer";
 			reg = <0x0a000200 0x100>;
 			interrupts = <1 11 0xf04>;
 			clocks = <&hisi_refclk144mhz>;
 		};
 
-		local_timer@0a000600 {
+		local_timer@a000600 {
 			compatible = "arm,cortex-a9-twd-timer";
 			reg = <0x0a000600 0x100>;
 			interrupts = <1 13 0xf04>;
diff --git a/arch/arm/boot/dts/hip04-d01.dts b/arch/arm/boot/dts/hip04-d01.dts
index 40a9e33c2654..ca48641d0f48 100644
--- a/arch/arm/boot/dts/hip04-d01.dts
+++ b/arch/arm/boot/dts/hip04-d01.dts
@@ -18,7 +18,7 @@
 	model = "Hisilicon D01 Development Board";
 	compatible = "hisilicon,hip04-d01";
 
-	memory@00000000,10000000 {
+	memory@0,10000000 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000 0x00000000 0xc0000000>,
 		      <0x00000004 0xc0000000 0x00000003 0x40000000>;
diff --git a/arch/arm/boot/dts/hisi-x5hd2.dtsi b/arch/arm/boot/dts/hisi-x5hd2.dtsi
index 6c712a97e1fe..50d3f8426da1 100644
--- a/arch/arm/boot/dts/hisi-x5hd2.dtsi
+++ b/arch/arm/boot/dts/hisi-x5hd2.dtsi
@@ -39,7 +39,7 @@
 			compatible = "simple-bus";
 			ranges;
 
-			timer0: timer@00002000 {
+			timer0: timer@2000 {
 				compatible = "arm,sp804", "arm,primecell";
 				reg = <0x00002000 0x1000>;
 				/* timer00 & timer01 */
@@ -48,7 +48,7 @@
 				status = "disabled";
 			};
 
-			timer1: timer@00a29000 {
+			timer1: timer@a29000 {
 				/*
 				 * Only used in NORMAL state, not available ins
 				 * SLOW or DOZE state.
@@ -62,7 +62,7 @@
 				status = "disabled";
 			};
 
-			timer2: timer@00a2a000 {
+			timer2: timer@a2a000 {
 				compatible = "arm,sp804", "arm,primecell";
 				reg = <0x00a2a000 0x1000>;
 				/* timer20 & timer21 */
@@ -71,7 +71,7 @@
 				status = "disabled";
 			};
 
-			timer3: timer@00a2b000 {
+			timer3: timer@a2b000 {
 				compatible = "arm,sp804", "arm,primecell";
 				reg = <0x00a2b000 0x1000>;
 				/* timer30 & timer31 */
@@ -80,7 +80,7 @@
 				status = "disabled";
 			};
 
-			timer4: timer@00a81000 {
+			timer4: timer@a81000 {
 				compatible = "arm,sp804", "arm,primecell";
 				reg = <0x00a81000 0x1000>;
 				/* timer30 & timer31 */
@@ -89,7 +89,7 @@
 				status = "disabled";
 			};
 
-			uart0: uart@00b00000 {
+			uart0: uart@b00000 {
 				compatible = "arm,pl011", "arm,primecell";
 				reg = <0x00b00000 0x1000>;
 				interrupts = <0 49 4>;
@@ -98,7 +98,7 @@
 				status = "disabled";
 			};
 
-			uart1: uart@00006000 {
+			uart1: uart@6000 {
 				compatible = "arm,pl011", "arm,primecell";
 				reg = <0x00006000 0x1000>;
 				interrupts = <0 50 4>;
@@ -107,7 +107,7 @@
 				status = "disabled";
 			};
 
-			uart2: uart@00b02000 {
+			uart2: uart@b02000 {
 				compatible = "arm,pl011", "arm,primecell";
 				reg = <0x00b02000 0x1000>;
 				interrupts = <0 51 4>;
@@ -116,7 +116,7 @@
 				status = "disabled";
 			};
 
-			uart3: uart@00b03000 {
+			uart3: uart@b03000 {
 				compatible = "arm,pl011", "arm,primecell";
 				reg = <0x00b03000 0x1000>;
 				interrupts = <0 52 4>;
@@ -125,7 +125,7 @@
 				status = "disabled";
 			};
 
-			uart4: uart@00b04000 {
+			uart4: uart@b04000 {
 				compatible = "arm,pl011", "arm,primecell";
 				reg = <0xb04000 0x1000>;
 				interrupts = <0 53 4>;
@@ -199,7 +199,7 @@
 				status = "disabled";
 			};
 
-			gpio5: gpio@004000 {
+			gpio5: gpio@4000 {
 				compatible = "arm,pl061", "arm,primecell";
 				reg = <0x004000 0x1000>;
 				interrupts = <0 113 0x4>;
@@ -378,7 +378,7 @@
 			};
 		};
 
-		local_timer@00a00600 {
+		local_timer@a00600 {
 			compatible = "arm,cortex-a9-twd-timer";
 			reg = <0x00a00600 0x20>;
 			interrupts = <1 13 0xf01>;
@@ -392,7 +392,7 @@
 			cache-level = <2>;
 		};
 
-		sysctrl: system-controller@00000000 {
+		sysctrl: system-controller@0 {
 			compatible = "hisilicon,sysctrl", "syscon";
 			reg = <0x00000000 0x1000>;
 		};
@@ -404,7 +404,7 @@
 			mask = <0xdeadbeef>;
 		};
 
-		cpuctrl@00a22000 {
+		cpuctrl@a22000 {
 			compatible = "hisilicon,cpuctrl";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -489,7 +489,7 @@
 			clocks = <&clock HIX5HD2_SATA_CLK>;
 		};
 
-		ir: ir@001000 {
+		ir: ir@1000 {
 			compatible = "hisilicon,hix5hd2-ir";
 			reg = <0x001000 0x1000>;
 			interrupts = <0 47 4>;
diff --git a/arch/arm/boot/dts/imx1.dtsi b/arch/arm/boot/dts/imx1.dtsi
index 38d712be5685..20f6565c337d 100644
--- a/arch/arm/boot/dts/imx1.dtsi
+++ b/arch/arm/boot/dts/imx1.dtsi
@@ -40,7 +40,7 @@
 		spi1 = &cspi2;
 	};
 
-	aitc: aitc-interrupt-controller@00223000 {
+	aitc: aitc-interrupt-controller@223000 {
 		compatible = "fsl,imx1-aitc", "fsl,avic";
 		interrupt-controller;
 		#interrupt-cells = <1>;
@@ -69,14 +69,14 @@
 		interrupt-parent = <&aitc>;
 		ranges;
 
-		aipi@00200000 {
+		aipi@200000 {
 			compatible = "fsl,aipi-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x00200000 0x10000>;
 			ranges;
 
-			gpt1: timer@00202000 {
+			gpt1: timer@202000 {
 				compatible = "fsl,imx1-gpt";
 				reg = <0x00202000 0x1000>;
 				interrupts = <59>;
@@ -85,7 +85,7 @@
 				clock-names = "ipg", "per";
 			};
 
-			gpt2: timer@00203000 {
+			gpt2: timer@203000 {
 				compatible = "fsl,imx1-gpt";
 				reg = <0x00203000 0x1000>;
 				interrupts = <58>;
@@ -94,7 +94,7 @@
 				clock-names = "ipg", "per";
 			};
 
-			fb: fb@00205000 {
+			fb: fb@205000 {
 				compatible = "fsl,imx1-fb";
 				reg = <0x00205000 0x1000>;
 				interrupts = <14>;
@@ -105,7 +105,7 @@
 				status = "disabled";
 			};
 
-			uart1: serial@00206000 {
+			uart1: serial@206000 {
 				compatible = "fsl,imx1-uart";
 				reg = <0x00206000 0x1000>;
 				interrupts = <30 29 26>;
@@ -115,7 +115,7 @@
 				status = "disabled";
 			};
 
-			uart2: serial@00207000 {
+			uart2: serial@207000 {
 				compatible = "fsl,imx1-uart";
 				reg = <0x00207000 0x1000>;
 				interrupts = <24 23 20>;
@@ -125,7 +125,7 @@
 				status = "disabled";
 			};
 
-			pwm: pwm@00208000 {
+			pwm: pwm@208000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx1-pwm";
 				reg = <0x00208000 0x1000>;
@@ -135,7 +135,7 @@
 				clock-names = "ipg", "per";
 			};
 
-			dma: dma@00209000 {
+			dma: dma@209000 {
 				compatible = "fsl,imx1-dma";
 				reg = <0x00209000 0x1000>;
 				interrupts = <61 60>;
@@ -145,7 +145,7 @@
 				#dma-cells = <1>;
 			};
 
-			uart3: serial@0020a000 {
+			uart3: serial@20a000 {
 				compatible = "fsl,imx1-uart";
 				reg = <0x0020a000 0x1000>;
 				interrupts = <54 4 1>;
@@ -156,14 +156,14 @@
 			};
 		};
 
-		aipi@00210000 {
+		aipi@210000 {
 			compatible = "fsl,aipi-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x00210000 0x10000>;
 			ranges;
 
-			cspi1: cspi@00213000 {
+			cspi1: cspi@213000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx1-cspi";
@@ -175,7 +175,7 @@
 				status = "disabled";
 			};
 
-			i2c: i2c@00217000 {
+			i2c: i2c@217000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx1-i2c";
@@ -185,7 +185,7 @@
 				status = "disabled";
 			};
 
-			cspi2: cspi@00219000 {
+			cspi2: cspi@219000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx1-cspi";
@@ -197,20 +197,20 @@
 				status = "disabled";
 			};
 
-			clks: ccm@0021b000 {
+			clks: ccm@21b000 {
 				compatible = "fsl,imx1-ccm";
 				reg = <0x0021b000 0x1000>;
 				#clock-cells = <1>;
 			};
 
-			iomuxc: iomuxc@0021c000 {
+			iomuxc: iomuxc@21c000 {
 				compatible = "fsl,imx1-iomuxc";
 				reg = <0x0021c000 0x1000>;
 				#address-cells = <1>;
 				#size-cells = <1>;
 				ranges;
 
-				gpio1: gpio@0021c000 {
+				gpio1: gpio@21c000 {
 					compatible = "fsl,imx1-gpio";
 					reg = <0x0021c000 0x100>;
 					interrupts = <11>;
@@ -220,7 +220,7 @@
 					#interrupt-cells = <2>;
 				};
 
-				gpio2: gpio@0021c100 {
+				gpio2: gpio@21c100 {
 					compatible = "fsl,imx1-gpio";
 					reg = <0x0021c100 0x100>;
 					interrupts = <12>;
@@ -230,7 +230,7 @@
 					#interrupt-cells = <2>;
 				};
 
-				gpio3: gpio@0021c200 {
+				gpio3: gpio@21c200 {
 					compatible = "fsl,imx1-gpio";
 					reg = <0x0021c200 0x100>;
 					interrupts = <13>;
@@ -240,7 +240,7 @@
 					#interrupt-cells = <2>;
 				};
 
-				gpio4: gpio@0021c300 {
+				gpio4: gpio@21c300 {
 					compatible = "fsl,imx1-gpio";
 					reg = <0x0021c300 0x100>;
 					interrupts = <62>;
@@ -252,7 +252,7 @@
 			};
 		};
 
-		weim: weim@00220000 {
+		weim: weim@220000 {
 			#address-cells = <2>;
 			#size-cells = <1>;
 			compatible = "fsl,imx1-weim";
@@ -269,7 +269,7 @@
 			status = "disabled";
 		};
 
-		esram: esram@00300000 {
+		esram: esram@300000 {
 			compatible = "mmio-sram";
 			reg = <0x00300000 0x20000>;
 		};
diff --git a/arch/arm/boot/dts/imx25-pdk.dts b/arch/arm/boot/dts/imx25-pdk.dts
index c52692821fb1..443e0dc2fd9e 100644
--- a/arch/arm/boot/dts/imx25-pdk.dts
+++ b/arch/arm/boot/dts/imx25-pdk.dts
@@ -135,7 +135,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		clocks = <&clks 129>;
diff --git a/arch/arm/boot/dts/imx28-apx4devkit.dts b/arch/arm/boot/dts/imx28-apx4devkit.dts
index 1092b761d7ac..31639d4cf069 100644
--- a/arch/arm/boot/dts/imx28-apx4devkit.dts
+++ b/arch/arm/boot/dts/imx28-apx4devkit.dts
@@ -142,7 +142,7 @@
 				pinctrl-0 = <&i2c0_pins_a>;
 				status = "okay";
 
-				sgtl5000: codec@0a {
+				sgtl5000: codec@a {
 					compatible = "fsl,sgtl5000";
 					reg = <0x0a>;
 					VDDA-supply = <&reg_3p3v>;
diff --git a/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi b/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi
index 581e85f4fd4c..49ab40838e69 100644
--- a/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi
+++ b/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi
@@ -148,7 +148,7 @@
 	pinctrl-0 = <&i2c0_pins_a>;
 	status = "okay";
 
-	sgtl5000: codec@0a {
+	sgtl5000: codec@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		VDDA-supply = <&reg_3p3v>;
diff --git a/arch/arm/boot/dts/imx28-evk.dts b/arch/arm/boot/dts/imx28-evk.dts
index 5309bb90d7d5..7f5b80402c54 100644
--- a/arch/arm/boot/dts/imx28-evk.dts
+++ b/arch/arm/boot/dts/imx28-evk.dts
@@ -194,7 +194,7 @@
 				pinctrl-0 = <&i2c0_pins_a>;
 				status = "okay";
 
-				sgtl5000: codec@0a {
+				sgtl5000: codec@a {
 					compatible = "fsl,sgtl5000";
 					reg = <0x0a>;
 					VDDA-supply = <&reg_3p3v>;
diff --git a/arch/arm/boot/dts/imx28-m28evk.dts b/arch/arm/boot/dts/imx28-m28evk.dts
index dbfb8aab505f..22aa025cab1e 100644
--- a/arch/arm/boot/dts/imx28-m28evk.dts
+++ b/arch/arm/boot/dts/imx28-m28evk.dts
@@ -137,7 +137,7 @@
 			};
 
 			i2c0: i2c@80058000 {
-				sgtl5000: codec@0a {
+				sgtl5000: codec@a {
 					compatible = "fsl,sgtl5000";
 					reg = <0x0a>;
 					VDDA-supply = <&reg_3p3v>;
diff --git a/arch/arm/boot/dts/imx28-tx28.dts b/arch/arm/boot/dts/imx28-tx28.dts
index 0ebbc83852d0..4e52be1aa2c3 100644
--- a/arch/arm/boot/dts/imx28-tx28.dts
+++ b/arch/arm/boot/dts/imx28-tx28.dts
@@ -298,7 +298,7 @@
 	clock-frequency = <400000>;
 	status = "okay";
 
-	sgtl5000: sgtl5000@0a {
+	sgtl5000: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		VDDA-supply = <&reg_2p5v>;
diff --git a/arch/arm/boot/dts/imx50.dtsi b/arch/arm/boot/dts/imx50.dtsi
index 3747d80104f4..d85034c0fb83 100644
--- a/arch/arm/boot/dts/imx50.dtsi
+++ b/arch/arm/boot/dts/imx50.dtsi
@@ -52,7 +52,7 @@
 		};
 	};
 
-	tzic: tz-interrupt-controller@0fffc000 {
+	tzic: tz-interrupt-controller@fffc000 {
 		compatible = "fsl,imx50-tzic", "fsl,imx53-tzic", "fsl,tzic";
 		interrupt-controller;
 		#interrupt-cells = <1>;
diff --git a/arch/arm/boot/dts/imx51-babbage.dts b/arch/arm/boot/dts/imx51-babbage.dts
index 873cf242679c..55f1de299cac 100644
--- a/arch/arm/boot/dts/imx51-babbage.dts
+++ b/arch/arm/boot/dts/imx51-babbage.dts
@@ -337,7 +337,7 @@
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	sgtl5000: codec@0a {
+	sgtl5000: codec@a {
 		compatible = "fsl,sgtl5000";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_clkcodec>;
diff --git a/arch/arm/boot/dts/imx53-m53evk.dts b/arch/arm/boot/dts/imx53-m53evk.dts
index 4347a321c782..2cb5d460f784 100644
--- a/arch/arm/boot/dts/imx53-m53evk.dts
+++ b/arch/arm/boot/dts/imx53-m53evk.dts
@@ -150,7 +150,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	sgtl5000: codec@0a {
+	sgtl5000: codec@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		VDDA-supply = <&reg_3p2v>;
diff --git a/arch/arm/boot/dts/imx53-qsb-common.dtsi b/arch/arm/boot/dts/imx53-qsb-common.dtsi
index 683dcbe27cbd..5e364a6672c0 100644
--- a/arch/arm/boot/dts/imx53-qsb-common.dtsi
+++ b/arch/arm/boot/dts/imx53-qsb-common.dtsi
@@ -314,7 +314,7 @@
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	sgtl5000: codec@0a {
+	sgtl5000: codec@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		VDDA-supply = <&reg_3p2v>;
diff --git a/arch/arm/boot/dts/imx53-smd.dts b/arch/arm/boot/dts/imx53-smd.dts
index 33cb64fc8372..51f4a42a55e2 100644
--- a/arch/arm/boot/dts/imx53-smd.dts
+++ b/arch/arm/boot/dts/imx53-smd.dts
@@ -232,12 +232,12 @@
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 	};
 
-	magnetometer: mag3110@0e {
+	magnetometer: mag3110@e {
 		compatible = "fsl,mag3110";
 		reg = <0x0e>;
 	};
diff --git a/arch/arm/boot/dts/imx53-tx53-x03x.dts b/arch/arm/boot/dts/imx53-tx53-x03x.dts
index 0ecb43d88522..96eb33c65c92 100644
--- a/arch/arm/boot/dts/imx53-tx53-x03x.dts
+++ b/arch/arm/boot/dts/imx53-tx53-x03x.dts
@@ -203,7 +203,7 @@
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
-	sgtl5000: codec@0a {
+	sgtl5000: codec@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		VDDA-supply = <&reg_2v5>;
diff --git a/arch/arm/boot/dts/imx53-tx53-x13x.dts b/arch/arm/boot/dts/imx53-tx53-x13x.dts
index 3cf682a681f4..be31c5d1db05 100644
--- a/arch/arm/boot/dts/imx53-tx53-x13x.dts
+++ b/arch/arm/boot/dts/imx53-tx53-x13x.dts
@@ -93,7 +93,7 @@
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	touchscreen2: eeti@04 {
+	touchscreen2: eeti@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		pinctrl-names = "default";
@@ -110,7 +110,7 @@
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
-	sgtl5000: codec@0a {
+	sgtl5000: codec@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		VDDA-supply = <&reg_2v5>;
@@ -118,7 +118,7 @@
 		clocks = <&mclk>;
 	};
 
-	touchscreen1: eeti@04 {
+	touchscreen1: eeti@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/imx53-voipac-bsb.dts b/arch/arm/boot/dts/imx53-voipac-bsb.dts
index fc51b87ad208..25c78f19826c 100644
--- a/arch/arm/boot/dts/imx53-voipac-bsb.dts
+++ b/arch/arm/boot/dts/imx53-voipac-bsb.dts
@@ -130,7 +130,7 @@
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
-	sgtl5000: codec@0a {
+	sgtl5000: codec@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		VDDA-supply = <&reg_3p3v>;
diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index 8bf0d89cdd35..690b1a049f7e 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -80,7 +80,7 @@
 		ports = <&ipu_di0>, <&ipu_di1>;
 	};
 
-	tzic: tz-interrupt-controller@0fffc000 {
+	tzic: tz-interrupt-controller@fffc000 {
 		compatible = "fsl,imx53-tzic", "fsl,tzic";
 		interrupt-controller;
 		#interrupt-cells = <1>;
diff --git a/arch/arm/boot/dts/imx6dl-riotboard.dts b/arch/arm/boot/dts/imx6dl-riotboard.dts
index 275c6c05219d..23e108204e1e 100644
--- a/arch/arm/boot/dts/imx6dl-riotboard.dts
+++ b/arch/arm/boot/dts/imx6dl-riotboard.dts
@@ -157,7 +157,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		clocks = <&clks IMX6QDL_CLK_CKO>;
@@ -165,7 +165,7 @@
 		VDDIO-supply = <&reg_3p3v>;
 	};
 
-	pmic: pf0100@08 {
+	pmic: pf0100@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
 		interrupt-parent = <&gpio5>;
diff --git a/arch/arm/boot/dts/imx6dl-tx6u-811x.dts b/arch/arm/boot/dts/imx6dl-tx6u-811x.dts
index 5e0c6bb49f37..94bf1c485740 100644
--- a/arch/arm/boot/dts/imx6dl-tx6u-811x.dts
+++ b/arch/arm/boot/dts/imx6dl-tx6u-811x.dts
@@ -99,7 +99,7 @@
 };
 
 &i2c3 {
-	polytouch2: eeti@04 {
+	polytouch2: eeti@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/imx6dl-tx6u-81xx-mb7.dts b/arch/arm/boot/dts/imx6dl-tx6u-81xx-mb7.dts
index b9a783f7160e..839ab8619bbd 100644
--- a/arch/arm/boot/dts/imx6dl-tx6u-81xx-mb7.dts
+++ b/arch/arm/boot/dts/imx6dl-tx6u-81xx-mb7.dts
@@ -107,7 +107,7 @@
 };
 
 &i2c3 {
-	polytouch1: eeti@04 {
+	polytouch1: eeti@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
index 8475e6cc59ac..4d693a75ce98 100644
--- a/arch/arm/boot/dts/imx6dl.dtsi
+++ b/arch/arm/boot/dts/imx6dl.dtsi
@@ -60,35 +60,35 @@
 	};
 
 	soc {
-		ocram: sram@00900000 {
+		ocram: sram@900000 {
 			compatible = "mmio-sram";
 			reg = <0x00900000 0x20000>;
 			clocks = <&clks IMX6QDL_CLK_OCRAM>;
 		};
 
-		aips1: aips-bus@02000000 {
-			iomuxc: iomuxc@020e0000 {
+		aips1: aips-bus@2000000 {
+			iomuxc: iomuxc@20e0000 {
 				compatible = "fsl,imx6dl-iomuxc";
 			};
 
-			pxp: pxp@020f0000 {
+			pxp: pxp@20f0000 {
 				reg = <0x020f0000 0x4000>;
 				interrupts = <0 98 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			epdc: epdc@020f4000 {
+			epdc: epdc@20f4000 {
 				reg = <0x020f4000 0x4000>;
 				interrupts = <0 97 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			lcdif: lcdif@020f8000 {
+			lcdif: lcdif@20f8000 {
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
-		aips2: aips-bus@02100000 {
-			i2c4: i2c@021f8000 {
+		aips2: aips-bus@2100000 {
+			i2c4: i2c@21f8000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6q-i2c", "fsl,imx21-i2c";
diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
index 1015e55ca8f7..b915837bbb5f 100644
--- a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
@@ -165,7 +165,7 @@
 			#size-cells = <0>;
 			reg = <0x3>;
 
-			sgtl5000: codec@0a {
+			sgtl5000: codec@a {
 				compatible = "fsl,sgtl5000";
 				reg = <0x0a>;
 				clocks = <&mclk>;
diff --git a/arch/arm/boot/dts/imx6q-dmo-edmqmx6.dts b/arch/arm/boot/dts/imx6q-dmo-edmqmx6.dts
index 33eb7f180995..f0316ea96898 100644
--- a/arch/arm/boot/dts/imx6q-dmo-edmqmx6.dts
+++ b/arch/arm/boot/dts/imx6q-dmo-edmqmx6.dts
@@ -139,7 +139,7 @@
 		     &pinctrl_pfuze>;
 	status = "okay";
 
-	pmic: pfuze100@08 {
+	pmic: pfuze100@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
 		interrupt-parent = <&gpio3>;
diff --git a/arch/arm/boot/dts/imx6q-gw5400-a.dts b/arch/arm/boot/dts/imx6q-gw5400-a.dts
index 9dbeea05a949..9573e5cb003d 100644
--- a/arch/arm/boot/dts/imx6q-gw5400-a.dts
+++ b/arch/arm/boot/dts/imx6q-gw5400-a.dts
@@ -211,7 +211,7 @@
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	pmic: pfuze100@08 {
+	pmic: pfuze100@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
 
@@ -322,7 +322,7 @@
 		reg = <0x1c>;
 	};
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		clocks = <&clks IMX6QDL_CLK_CKO>;
@@ -330,7 +330,7 @@
 		VDDIO-supply = <&reg_3p3v>;
 	};
 
-	touchscreen: egalax_ts@04 {
+	touchscreen: egalax_ts@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		interrupt-parent = <&gpio7>;
diff --git a/arch/arm/boot/dts/imx6q-h100.dts b/arch/arm/boot/dts/imx6q-h100.dts
index 8f9252889971..a3269f57df2b 100644
--- a/arch/arm/boot/dts/imx6q-h100.dts
+++ b/arch/arm/boot/dts/imx6q-h100.dts
@@ -185,7 +185,7 @@
 		reg = <0x68>;
 	};
 
-	sgtl5000: sgtl5000@0a {
+	sgtl5000: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		pinctrl-names = "default";
@@ -195,7 +195,7 @@
 		VDDIO-supply = <&reg_3p3v>;
 	};
 
-	tc358743: tc358743@0f {
+	tc358743: tc358743@f {
 		compatible = "toshiba,tc358743";
 		reg = <0x0f>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/imx6q-icore-rqs.dts b/arch/arm/boot/dts/imx6q-icore-rqs.dts
index e451b4ceb4d8..745bc2886a47 100644
--- a/arch/arm/boot/dts/imx6q-icore-rqs.dts
+++ b/arch/arm/boot/dts/imx6q-icore-rqs.dts
@@ -63,7 +63,7 @@
 };
 
 &i2c3 {
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		clocks = <&clks IMX6QDL_CLK_CKO>;
diff --git a/arch/arm/boot/dts/imx6q-mccmon6.dts b/arch/arm/boot/dts/imx6q-mccmon6.dts
index eedbe737420c..cab36f48d5f1 100644
--- a/arch/arm/boot/dts/imx6q-mccmon6.dts
+++ b/arch/arm/boot/dts/imx6q-mccmon6.dts
@@ -121,7 +121,7 @@
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	pfuze100: pmic@08 {
+	pfuze100: pmic@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
 
diff --git a/arch/arm/boot/dts/imx6q-novena.dts b/arch/arm/boot/dts/imx6q-novena.dts
index d83cfb6ec598..c130894951ee 100644
--- a/arch/arm/boot/dts/imx6q-novena.dts
+++ b/arch/arm/boot/dts/imx6q-novena.dts
@@ -255,7 +255,7 @@
 		reg = <0x68>;
 	};
 
-	sbs_battery: bq20z75@0b {
+	sbs_battery: bq20z75@b {
 		compatible = "sbs,sbs-battery";
 		reg = <0x0b>;
 		sbs,i2c-retry-count = <50>;
@@ -295,7 +295,7 @@
 	pinctrl-0 = <&pinctrl_i2c2_novena>;
 	status = "okay";
 
-	pmic: pfuze100@08 {
+	pmic: pfuze100@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
 
diff --git a/arch/arm/boot/dts/imx6q-tbs2910.dts b/arch/arm/boot/dts/imx6q-tbs2910.dts
index 06f492e17ca7..a3cd7afac20a 100644
--- a/arch/arm/boot/dts/imx6q-tbs2910.dts
+++ b/arch/arm/boot/dts/imx6q-tbs2910.dts
@@ -158,7 +158,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	sgtl5000: sgtl5000@0a {
+	sgtl5000: sgtl5000@a {
 		clocks = <&clks IMX6QDL_CLK_CKO>;
 		compatible = "fsl,sgtl5000";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/imx6q-tx6q-1110.dts b/arch/arm/boot/dts/imx6q-tx6q-1110.dts
index 0433e220a931..f4793dec5d9b 100644
--- a/arch/arm/boot/dts/imx6q-tx6q-1110.dts
+++ b/arch/arm/boot/dts/imx6q-tx6q-1110.dts
@@ -99,7 +99,7 @@
 };
 
 &i2c3 {
-	polytouch1: eeti@04 {
+	polytouch1: eeti@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/imx6q-tx6q-11x0-mb7.dts b/arch/arm/boot/dts/imx6q-tx6q-11x0-mb7.dts
index d78b129d01ea..7022704e79dc 100644
--- a/arch/arm/boot/dts/imx6q-tx6q-11x0-mb7.dts
+++ b/arch/arm/boot/dts/imx6q-tx6q-11x0-mb7.dts
@@ -108,7 +108,7 @@
 };
 
 &i2c3 {
-	polytouch1: eeti@04 {
+	polytouch1: eeti@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index 90a741732f60..bc581aa5cf17 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -79,15 +79,15 @@
 	};
 
 	soc {
-		ocram: sram@00900000 {
+		ocram: sram@900000 {
 			compatible = "mmio-sram";
 			reg = <0x00900000 0x40000>;
 			clocks = <&clks IMX6QDL_CLK_OCRAM>;
 		};
 
-		aips-bus@02000000 { /* AIPS1 */
-			spba-bus@02000000 {
-				ecspi5: ecspi@02018000 {
+		aips-bus@2000000 { /* AIPS1 */
+			spba-bus@2000000 {
+				ecspi5: ecspi@2018000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6q-ecspi", "fsl,imx51-ecspi";
@@ -102,12 +102,12 @@
 				};
 			};
 
-			iomuxc: iomuxc@020e0000 {
+			iomuxc: iomuxc@20e0000 {
 				compatible = "fsl,imx6q-iomuxc";
 			};
 		};
 
-		sata: sata@02200000 {
+		sata: sata@2200000 {
 			compatible = "fsl,imx6q-ahci";
 			reg = <0x02200000 0x4000>;
 			interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
@@ -118,7 +118,7 @@
 			status = "disabled";
 		};
 
-		gpu_vg: gpu@02204000 {
+		gpu_vg: gpu@2204000 {
 			compatible = "vivante,gc";
 			reg = <0x02204000 0x4000>;
 			interrupts = <0 11 IRQ_TYPE_LEVEL_HIGH>;
@@ -128,7 +128,7 @@
 			power-domains = <&pd_pu>;
 		};
 
-		ipu2: ipu@02800000 {
+		ipu2: ipu@2800000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "fsl,imx6q-ipu";
diff --git a/arch/arm/boot/dts/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
index ea339fa58f4a..e80fdca585f8 100644
--- a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
@@ -222,7 +222,7 @@
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	pmic: pfuze100@08 {
+	pmic: pfuze100@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
 
@@ -313,7 +313,7 @@
 		};
 	};
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		clocks = <&clks IMX6QDL_CLK_CKO>;
diff --git a/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi b/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
index 9cd2a7477ed7..f80d8eabe43e 100644
--- a/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
@@ -209,7 +209,7 @@
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		clocks = <&clks IMX6QDL_CLK_CKO>;
diff --git a/arch/arm/boot/dts/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
index ad84eddb6836..fc66bbfd6796 100644
--- a/arch/arm/boot/dts/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
@@ -167,7 +167,7 @@
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	pmic: pfuze100@08 {
+	pmic: pfuze100@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
 
@@ -248,7 +248,7 @@
 		};
 	};
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		clocks = <&clks IMX6QDL_CLK_CKO>;
diff --git a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
index 115d706228ef..07ff0cbf9e1f 100644
--- a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
@@ -303,7 +303,7 @@
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		clocks = <&clks IMX6QDL_CLK_CKO>;
@@ -311,7 +311,7 @@
 		VDDIO-supply = <&reg_3p3v>;
 	};
 
-	touchscreen: egalax_ts@04 {
+	touchscreen: egalax_ts@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		interrupt-parent = <&gpio7>;
diff --git a/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
index 24be7965056c..6f1be3f9dd2a 100644
--- a/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
@@ -294,7 +294,7 @@
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		clocks = <&clks IMX6QDL_CLK_CKO>;
@@ -302,7 +302,7 @@
 		VDDIO-supply = <&reg_3p3v>;
 	};
 
-	touchscreen: egalax_ts@04 {
+	touchscreen: egalax_ts@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		interrupt-parent = <&gpio1>;
diff --git a/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
index 4594b2279169..b27c9a1147bf 100644
--- a/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
@@ -223,7 +223,7 @@
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	pmic: pfuze100@08 {
+	pmic: pfuze100@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
 
@@ -331,7 +331,7 @@
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		clocks = <&clks IMX6QDL_CLK_CKO>;
@@ -339,7 +339,7 @@
 		VDDIO-supply = <&reg_3p3v>;
 	};
 
-	touchscreen: egalax_ts@04 {
+	touchscreen: egalax_ts@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		interrupt-parent = <&gpio7>;
diff --git a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
index 988334c889eb..37c07c0748aa 100644
--- a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
@@ -138,7 +138,7 @@
 	};
 
 	/* Pro baseboard model */
-	sgtl5000: sgtl5000@0a {
+	sgtl5000: sgtl5000@a {
 		clocks = <&clks IMX6QDL_CLK_CKO>;
 		compatible = "fsl,sgtl5000";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi b/arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi
index 6b81580623ff..4cc4e23cf99c 100644
--- a/arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi
@@ -255,7 +255,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_sgtl5000>;
@@ -279,7 +279,7 @@
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
-	touchscreen@04 {
+	touchscreen@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		interrupt-parent = <&gpio1>;
diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
index b63134e3b51a..d776fc63df91 100644
--- a/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
@@ -397,7 +397,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_sgtl5000>;
@@ -429,7 +429,7 @@
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
-	touchscreen@04 {
+	touchscreen@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		interrupt-parent = <&gpio1>;
diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi
index a24e4f1911ab..c770f6c85ba2 100644
--- a/arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi
@@ -315,7 +315,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_sgtl5000>;
@@ -347,7 +347,7 @@
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
-	touchscreen@04 {
+	touchscreen@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		interrupt-parent = <&gpio1>;
diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
index d309a4d0eb08..735823787117 100644
--- a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
@@ -313,7 +313,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		clocks = <&clks IMX6QDL_CLK_CKO>;
@@ -340,7 +340,7 @@
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
-	touchscreen@04 {
+	touchscreen@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		interrupt-parent = <&gpio1>;
diff --git a/arch/arm/boot/dts/imx6qdl-rex.dtsi b/arch/arm/boot/dts/imx6qdl-rex.dtsi
index 5cf90c24c707..6e9549ff11da 100644
--- a/arch/arm/boot/dts/imx6qdl-rex.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-rex.dtsi
@@ -121,7 +121,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		clocks = <&clks IMX6QDL_CLK_CKO>;
diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
index 6a7594e5d183..4fa2fac3877b 100644
--- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
@@ -244,7 +244,7 @@
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	pmic: pfuze100@08 {
+	pmic: pfuze100@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
 
diff --git a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
index 756c5054f047..356ac7666707 100644
--- a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
@@ -350,7 +350,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		clocks = <&clks IMX6QDL_CLK_CKO>;
diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
index b72b6fa47580..517f34b5a061 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -304,7 +304,7 @@
 		};
 	};
 
-	pmic: pfuze100@08 {
+	pmic: pfuze100@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
 
@@ -411,7 +411,7 @@
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
-	egalax_ts@04 {
+	egalax_ts@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		interrupt-parent = <&gpio6>;
diff --git a/arch/arm/boot/dts/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/imx6qdl-tx6.dtsi
index c6bec97fbeaf..25fe6aef797b 100644
--- a/arch/arm/boot/dts/imx6qdl-tx6.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-tx6.dtsi
@@ -293,7 +293,7 @@
 	clock-frequency = <400000>;
 	status = "okay";
 
-	sgtl5000: sgtl5000@0a {
+	sgtl5000: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		VDDA-supply = <&reg_2v5>;
diff --git a/arch/arm/boot/dts/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
index b4fa7f1d63da..ed96d7b5feab 100644
--- a/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
@@ -82,7 +82,7 @@
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		clocks = <&clks IMX6QDL_CLK_CKO>;
diff --git a/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi b/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
index eeb7679fd348..cbd652e38fe8 100644
--- a/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
@@ -390,7 +390,7 @@
 	clock-frequency = <100000>;
 	status = "okay";
 
-	pmic@08 {
+	pmic@8 {
 		compatible = "fsl,pfuze100";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pfuze100_irq>;
diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 8884b4a3cafb..222a7a4ef603 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -87,7 +87,7 @@
 		interrupt-parent = <&gpc>;
 		ranges;
 
-		dma_apbh: dma-apbh@00110000 {
+		dma_apbh: dma-apbh@110000 {
 			compatible = "fsl,imx6q-dma-apbh", "fsl,imx28-dma-apbh";
 			reg = <0x00110000 0x2000>;
 			interrupts = <0 13 IRQ_TYPE_LEVEL_HIGH>,
@@ -100,7 +100,7 @@
 			clocks = <&clks IMX6QDL_CLK_APBH_DMA>;
 		};
 
-		gpmi: gpmi-nand@00112000 {
+		gpmi: gpmi-nand@112000 {
 			compatible = "fsl,imx6q-gpmi-nand";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -120,7 +120,7 @@
 			status = "disabled";
 		};
 
-		hdmi: hdmi@0120000 {
+		hdmi: hdmi@120000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x00120000 0x9000>;
@@ -148,7 +148,7 @@
 			};
 		};
 
-		gpu_3d: gpu@00130000 {
+		gpu_3d: gpu@130000 {
 			compatible = "vivante,gc";
 			reg = <0x00130000 0x4000>;
 			interrupts = <0 9 IRQ_TYPE_LEVEL_HIGH>;
@@ -159,7 +159,7 @@
 			power-domains = <&pd_pu>;
 		};
 
-		gpu_2d: gpu@00134000 {
+		gpu_2d: gpu@134000 {
 			compatible = "vivante,gc";
 			reg = <0x00134000 0x4000>;
 			interrupts = <0 10 IRQ_TYPE_LEVEL_HIGH>;
@@ -169,7 +169,7 @@
 			power-domains = <&pd_pu>;
 		};
 
-		timer@00a00600 {
+		timer@a00600 {
 			compatible = "arm,cortex-a9-twd-timer";
 			reg = <0x00a00600 0x20>;
 			interrupts = <1 13 0xf01>;
@@ -177,7 +177,7 @@
 			clocks = <&clks IMX6QDL_CLK_TWD>;
 		};
 
-		intc: interrupt-controller@00a01000 {
+		intc: interrupt-controller@a01000 {
 			compatible = "arm,cortex-a9-gic";
 			#interrupt-cells = <3>;
 			interrupt-controller;
@@ -186,7 +186,7 @@
 			interrupt-parent = <&intc>;
 		};
 
-		L2: l2-cache@00a02000 {
+		L2: l2-cache@a02000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x00a02000 0x1000>;
 			interrupts = <0 92 IRQ_TYPE_LEVEL_HIGH>;
@@ -229,21 +229,21 @@
 			interrupts = <0 94 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		aips-bus@02000000 { /* AIPS1 */
+		aips-bus@2000000 { /* AIPS1 */
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x02000000 0x100000>;
 			ranges;
 
-			spba-bus@02000000 {
+			spba-bus@2000000 {
 				compatible = "fsl,spba-bus", "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <1>;
 				reg = <0x02000000 0x40000>;
 				ranges;
 
-				spdif: spdif@02004000 {
+				spdif: spdif@2004000 {
 					compatible = "fsl,imx35-spdif";
 					reg = <0x02004000 0x4000>;
 					interrupts = <0 52 IRQ_TYPE_LEVEL_HIGH>;
@@ -263,7 +263,7 @@
 					status = "disabled";
 				};
 
-				ecspi1: ecspi@02008000 {
+				ecspi1: ecspi@2008000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6q-ecspi", "fsl,imx51-ecspi";
@@ -277,7 +277,7 @@
 					status = "disabled";
 				};
 
-				ecspi2: ecspi@0200c000 {
+				ecspi2: ecspi@200c000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6q-ecspi", "fsl,imx51-ecspi";
@@ -291,7 +291,7 @@
 					status = "disabled";
 				};
 
-				ecspi3: ecspi@02010000 {
+				ecspi3: ecspi@2010000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6q-ecspi", "fsl,imx51-ecspi";
@@ -305,7 +305,7 @@
 					status = "disabled";
 				};
 
-				ecspi4: ecspi@02014000 {
+				ecspi4: ecspi@2014000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6q-ecspi", "fsl,imx51-ecspi";
@@ -319,7 +319,7 @@
 					status = "disabled";
 				};
 
-				uart1: serial@02020000 {
+				uart1: serial@2020000 {
 					compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 					reg = <0x02020000 0x4000>;
 					interrupts = <0 26 IRQ_TYPE_LEVEL_HIGH>;
@@ -331,7 +331,7 @@
 					status = "disabled";
 				};
 
-				esai: esai@02024000 {
+				esai: esai@2024000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx35-esai";
 					reg = <0x02024000 0x4000>;
@@ -347,7 +347,7 @@
 					status = "disabled";
 				};
 
-				ssi1: ssi@02028000 {
+				ssi1: ssi@2028000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6q-ssi",
 							"fsl,imx51-ssi";
@@ -363,7 +363,7 @@
 					status = "disabled";
 				};
 
-				ssi2: ssi@0202c000 {
+				ssi2: ssi@202c000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6q-ssi",
 							"fsl,imx51-ssi";
@@ -379,7 +379,7 @@
 					status = "disabled";
 				};
 
-				ssi3: ssi@02030000 {
+				ssi3: ssi@2030000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6q-ssi",
 							"fsl,imx51-ssi";
@@ -395,7 +395,7 @@
 					status = "disabled";
 				};
 
-				asrc: asrc@02034000 {
+				asrc: asrc@2034000 {
 					compatible = "fsl,imx53-asrc";
 					reg = <0x02034000 0x4000>;
 					interrupts = <0 50 IRQ_TYPE_LEVEL_HIGH>;
@@ -420,12 +420,12 @@
 					status = "okay";
 				};
 
-				spba@0203c000 {
+				spba@203c000 {
 					reg = <0x0203c000 0x4000>;
 				};
 			};
 
-			vpu: vpu@02040000 {
+			vpu: vpu@2040000 {
 				compatible = "cnm,coda960";
 				reg = <0x02040000 0x3c000>;
 				interrupts = <0 12 IRQ_TYPE_LEVEL_HIGH>,
@@ -439,11 +439,11 @@
 				iram = <&ocram>;
 			};
 
-			aipstz@0207c000 { /* AIPSTZ1 */
+			aipstz@207c000 { /* AIPSTZ1 */
 				reg = <0x0207c000 0x4000>;
 			};
 
-			pwm1: pwm@02080000 {
+			pwm1: pwm@2080000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx6q-pwm", "fsl,imx27-pwm";
 				reg = <0x02080000 0x4000>;
@@ -454,7 +454,7 @@
 				status = "disabled";
 			};
 
-			pwm2: pwm@02084000 {
+			pwm2: pwm@2084000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx6q-pwm", "fsl,imx27-pwm";
 				reg = <0x02084000 0x4000>;
@@ -465,7 +465,7 @@
 				status = "disabled";
 			};
 
-			pwm3: pwm@02088000 {
+			pwm3: pwm@2088000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx6q-pwm", "fsl,imx27-pwm";
 				reg = <0x02088000 0x4000>;
@@ -476,7 +476,7 @@
 				status = "disabled";
 			};
 
-			pwm4: pwm@0208c000 {
+			pwm4: pwm@208c000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx6q-pwm", "fsl,imx27-pwm";
 				reg = <0x0208c000 0x4000>;
@@ -487,7 +487,7 @@
 				status = "disabled";
 			};
 
-			can1: flexcan@02090000 {
+			can1: flexcan@2090000 {
 				compatible = "fsl,imx6q-flexcan";
 				reg = <0x02090000 0x4000>;
 				interrupts = <0 110 IRQ_TYPE_LEVEL_HIGH>;
@@ -497,7 +497,7 @@
 				status = "disabled";
 			};
 
-			can2: flexcan@02094000 {
+			can2: flexcan@2094000 {
 				compatible = "fsl,imx6q-flexcan";
 				reg = <0x02094000 0x4000>;
 				interrupts = <0 111 IRQ_TYPE_LEVEL_HIGH>;
@@ -507,7 +507,7 @@
 				status = "disabled";
 			};
 
-			gpt: gpt@02098000 {
+			gpt: gpt@2098000 {
 				compatible = "fsl,imx6q-gpt", "fsl,imx31-gpt";
 				reg = <0x02098000 0x4000>;
 				interrupts = <0 55 IRQ_TYPE_LEVEL_HIGH>;
@@ -517,7 +517,7 @@
 				clock-names = "ipg", "per", "osc_per";
 			};
 
-			gpio1: gpio@0209c000 {
+			gpio1: gpio@209c000 {
 				compatible = "fsl,imx6q-gpio", "fsl,imx35-gpio";
 				reg = <0x0209c000 0x4000>;
 				interrupts = <0 66 IRQ_TYPE_LEVEL_HIGH>,
@@ -528,7 +528,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			gpio2: gpio@020a0000 {
+			gpio2: gpio@20a0000 {
 				compatible = "fsl,imx6q-gpio", "fsl,imx35-gpio";
 				reg = <0x020a0000 0x4000>;
 				interrupts = <0 68 IRQ_TYPE_LEVEL_HIGH>,
@@ -539,7 +539,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			gpio3: gpio@020a4000 {
+			gpio3: gpio@20a4000 {
 				compatible = "fsl,imx6q-gpio", "fsl,imx35-gpio";
 				reg = <0x020a4000 0x4000>;
 				interrupts = <0 70 IRQ_TYPE_LEVEL_HIGH>,
@@ -550,7 +550,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			gpio4: gpio@020a8000 {
+			gpio4: gpio@20a8000 {
 				compatible = "fsl,imx6q-gpio", "fsl,imx35-gpio";
 				reg = <0x020a8000 0x4000>;
 				interrupts = <0 72 IRQ_TYPE_LEVEL_HIGH>,
@@ -561,7 +561,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			gpio5: gpio@020ac000 {
+			gpio5: gpio@20ac000 {
 				compatible = "fsl,imx6q-gpio", "fsl,imx35-gpio";
 				reg = <0x020ac000 0x4000>;
 				interrupts = <0 74 IRQ_TYPE_LEVEL_HIGH>,
@@ -572,7 +572,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			gpio6: gpio@020b0000 {
+			gpio6: gpio@20b0000 {
 				compatible = "fsl,imx6q-gpio", "fsl,imx35-gpio";
 				reg = <0x020b0000 0x4000>;
 				interrupts = <0 76 IRQ_TYPE_LEVEL_HIGH>,
@@ -583,7 +583,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			gpio7: gpio@020b4000 {
+			gpio7: gpio@20b4000 {
 				compatible = "fsl,imx6q-gpio", "fsl,imx35-gpio";
 				reg = <0x020b4000 0x4000>;
 				interrupts = <0 78 IRQ_TYPE_LEVEL_HIGH>,
@@ -594,7 +594,7 @@
 				#interrupt-cells = <2>;
 			};
 
-			kpp: kpp@020b8000 {
+			kpp: kpp@20b8000 {
 				compatible = "fsl,imx6q-kpp", "fsl,imx21-kpp";
 				reg = <0x020b8000 0x4000>;
 				interrupts = <0 82 IRQ_TYPE_LEVEL_HIGH>;
@@ -602,14 +602,14 @@
 				status = "disabled";
 			};
 
-			wdog1: wdog@020bc000 {
+			wdog1: wdog@20bc000 {
 				compatible = "fsl,imx6q-wdt", "fsl,imx21-wdt";
 				reg = <0x020bc000 0x4000>;
 				interrupts = <0 80 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6QDL_CLK_DUMMY>;
 			};
 
-			wdog2: wdog@020c0000 {
+			wdog2: wdog@20c0000 {
 				compatible = "fsl,imx6q-wdt", "fsl,imx21-wdt";
 				reg = <0x020c0000 0x4000>;
 				interrupts = <0 81 IRQ_TYPE_LEVEL_HIGH>;
@@ -617,7 +617,7 @@
 				status = "disabled";
 			};
 
-			clks: ccm@020c4000 {
+			clks: ccm@20c4000 {
 				compatible = "fsl,imx6q-ccm";
 				reg = <0x020c4000 0x4000>;
 				interrupts = <0 87 IRQ_TYPE_LEVEL_HIGH>,
@@ -625,7 +625,7 @@
 				#clock-cells = <1>;
 			};
 
-			anatop: anatop@020c8000 {
+			anatop: anatop@20c8000 {
 				compatible = "fsl,imx6q-anatop", "syscon", "simple-bus";
 				reg = <0x020c8000 0x1000>;
 				interrupts = <0 49 IRQ_TYPE_LEVEL_HIGH>,
@@ -737,7 +737,7 @@
 				clocks = <&clks IMX6QDL_CLK_PLL3_USB_OTG>;
 			};
 
-			usbphy1: usbphy@020c9000 {
+			usbphy1: usbphy@20c9000 {
 				compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
 				reg = <0x020c9000 0x1000>;
 				interrupts = <0 44 IRQ_TYPE_LEVEL_HIGH>;
@@ -745,7 +745,7 @@
 				fsl,anatop = <&anatop>;
 			};
 
-			usbphy2: usbphy@020ca000 {
+			usbphy2: usbphy@20ca000 {
 				compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
 				reg = <0x020ca000 0x1000>;
 				interrupts = <0 45 IRQ_TYPE_LEVEL_HIGH>;
@@ -753,7 +753,7 @@
 				fsl,anatop = <&anatop>;
 			};
 
-			snvs: snvs@020cc000 {
+			snvs: snvs@20cc000 {
 				compatible = "fsl,sec-v4.0-mon", "syscon", "simple-mfd";
 				reg = <0x020cc000 0x4000>;
 
@@ -775,17 +775,17 @@
 				};
 			};
 
-			epit1: epit@020d0000 { /* EPIT1 */
+			epit1: epit@20d0000 { /* EPIT1 */
 				reg = <0x020d0000 0x4000>;
 				interrupts = <0 56 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			epit2: epit@020d4000 { /* EPIT2 */
+			epit2: epit@20d4000 { /* EPIT2 */
 				reg = <0x020d4000 0x4000>;
 				interrupts = <0 57 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			src: src@020d8000 {
+			src: src@20d8000 {
 				compatible = "fsl,imx6q-src", "fsl,imx51-src";
 				reg = <0x020d8000 0x4000>;
 				interrupts = <0 91 IRQ_TYPE_LEVEL_HIGH>,
@@ -793,7 +793,7 @@
 				#reset-cells = <1>;
 			};
 
-			gpc: gpc@020dc000 {
+			gpc: gpc@20dc000 {
 				compatible = "fsl,imx6q-gpc";
 				reg = <0x020dc000 0x4000>;
 				interrupt-controller;
@@ -826,7 +826,7 @@
 				};
 			};
 
-			gpr: iomuxc-gpr@020e0000 {
+			gpr: iomuxc-gpr@20e0000 {
 				compatible = "fsl,imx6q-iomuxc-gpr", "syscon", "simple-mfd";
 				reg = <0x020e0000 0x38>;
 
@@ -836,7 +836,7 @@
 				};
 			};
 
-			iomuxc: iomuxc@020e0000 {
+			iomuxc: iomuxc@20e0000 {
 				compatible = "fsl,imx6dl-iomuxc", "fsl,imx6q-iomuxc";
 				reg = <0x020e0000 0x4000>;
 			};
@@ -895,17 +895,17 @@
 				};
 			};
 
-			dcic1: dcic@020e4000 {
+			dcic1: dcic@20e4000 {
 				reg = <0x020e4000 0x4000>;
 				interrupts = <0 124 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			dcic2: dcic@020e8000 {
+			dcic2: dcic@20e8000 {
 				reg = <0x020e8000 0x4000>;
 				interrupts = <0 125 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			sdma: sdma@020ec000 {
+			sdma: sdma@20ec000 {
 				compatible = "fsl,imx6q-sdma", "fsl,imx35-sdma";
 				reg = <0x020ec000 0x4000>;
 				interrupts = <0 2 IRQ_TYPE_LEVEL_HIGH>;
@@ -917,7 +917,7 @@
 			};
 		};
 
-		aips-bus@02100000 { /* AIPS2 */
+		aips-bus@2100000 { /* AIPS2 */
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -950,11 +950,11 @@
 				};
 			};
 
-			aipstz@0217c000 { /* AIPSTZ2 */
+			aipstz@217c000 { /* AIPSTZ2 */
 				reg = <0x0217c000 0x4000>;
 			};
 
-			usbotg: usb@02184000 {
+			usbotg: usb@2184000 {
 				compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
 				reg = <0x02184000 0x200>;
 				interrupts = <0 43 IRQ_TYPE_LEVEL_HIGH>;
@@ -967,7 +967,7 @@
 				status = "disabled";
 			};
 
-			usbh1: usb@02184200 {
+			usbh1: usb@2184200 {
 				compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
 				reg = <0x02184200 0x200>;
 				interrupts = <0 40 IRQ_TYPE_LEVEL_HIGH>;
@@ -981,7 +981,7 @@
 				status = "disabled";
 			};
 
-			usbh2: usb@02184400 {
+			usbh2: usb@2184400 {
 				compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
 				reg = <0x02184400 0x200>;
 				interrupts = <0 41 IRQ_TYPE_LEVEL_HIGH>;
@@ -994,7 +994,7 @@
 				status = "disabled";
 			};
 
-			usbh3: usb@02184600 {
+			usbh3: usb@2184600 {
 				compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
 				reg = <0x02184600 0x200>;
 				interrupts = <0 42 IRQ_TYPE_LEVEL_HIGH>;
@@ -1007,14 +1007,14 @@
 				status = "disabled";
 			};
 
-			usbmisc: usbmisc@02184800 {
+			usbmisc: usbmisc@2184800 {
 				#index-cells = <1>;
 				compatible = "fsl,imx6q-usbmisc";
 				reg = <0x02184800 0x200>;
 				clocks = <&clks IMX6QDL_CLK_USBOH3>;
 			};
 
-			fec: ethernet@02188000 {
+			fec: ethernet@2188000 {
 				compatible = "fsl,imx6q-fec";
 				reg = <0x02188000 0x4000>;
 				interrupts-extended =
@@ -1027,14 +1027,14 @@
 				status = "disabled";
 			};
 
-			mlb@0218c000 {
+			mlb@218c000 {
 				reg = <0x0218c000 0x4000>;
 				interrupts = <0 53 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 117 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 126 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			usdhc1: usdhc@02190000 {
+			usdhc1: usdhc@2190000 {
 				compatible = "fsl,imx6q-usdhc";
 				reg = <0x02190000 0x4000>;
 				interrupts = <0 22 IRQ_TYPE_LEVEL_HIGH>;
@@ -1046,7 +1046,7 @@
 				status = "disabled";
 			};
 
-			usdhc2: usdhc@02194000 {
+			usdhc2: usdhc@2194000 {
 				compatible = "fsl,imx6q-usdhc";
 				reg = <0x02194000 0x4000>;
 				interrupts = <0 23 IRQ_TYPE_LEVEL_HIGH>;
@@ -1058,7 +1058,7 @@
 				status = "disabled";
 			};
 
-			usdhc3: usdhc@02198000 {
+			usdhc3: usdhc@2198000 {
 				compatible = "fsl,imx6q-usdhc";
 				reg = <0x02198000 0x4000>;
 				interrupts = <0 24 IRQ_TYPE_LEVEL_HIGH>;
@@ -1070,7 +1070,7 @@
 				status = "disabled";
 			};
 
-			usdhc4: usdhc@0219c000 {
+			usdhc4: usdhc@219c000 {
 				compatible = "fsl,imx6q-usdhc";
 				reg = <0x0219c000 0x4000>;
 				interrupts = <0 25 IRQ_TYPE_LEVEL_HIGH>;
@@ -1082,7 +1082,7 @@
 				status = "disabled";
 			};
 
-			i2c1: i2c@021a0000 {
+			i2c1: i2c@21a0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6q-i2c", "fsl,imx21-i2c";
@@ -1092,7 +1092,7 @@
 				status = "disabled";
 			};
 
-			i2c2: i2c@021a4000 {
+			i2c2: i2c@21a4000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6q-i2c", "fsl,imx21-i2c";
@@ -1102,7 +1102,7 @@
 				status = "disabled";
 			};
 
-			i2c3: i2c@021a8000 {
+			i2c3: i2c@21a8000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6q-i2c", "fsl,imx21-i2c";
@@ -1112,20 +1112,20 @@
 				status = "disabled";
 			};
 
-			romcp@021ac000 {
+			romcp@21ac000 {
 				reg = <0x021ac000 0x4000>;
 			};
 
-			mmdc0: mmdc@021b0000 { /* MMDC0 */
+			mmdc0: mmdc@21b0000 { /* MMDC0 */
 				compatible = "fsl,imx6q-mmdc";
 				reg = <0x021b0000 0x4000>;
 			};
 
-			mmdc1: mmdc@021b4000 { /* MMDC1 */
+			mmdc1: mmdc@21b4000 { /* MMDC1 */
 				reg = <0x021b4000 0x4000>;
 			};
 
-			weim: weim@021b8000 {
+			weim: weim@21b8000 {
 				#address-cells = <2>;
 				#size-cells = <1>;
 				compatible = "fsl,imx6q-weim";
@@ -1136,29 +1136,29 @@
 				status = "disabled";
 			};
 
-			ocotp: ocotp@021bc000 {
+			ocotp: ocotp@21bc000 {
 				compatible = "fsl,imx6q-ocotp", "syscon";
 				reg = <0x021bc000 0x4000>;
 				clocks = <&clks IMX6QDL_CLK_IIM>;
 			};
 
-			tzasc@021d0000 { /* TZASC1 */
+			tzasc@21d0000 { /* TZASC1 */
 				reg = <0x021d0000 0x4000>;
 				interrupts = <0 108 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			tzasc@021d4000 { /* TZASC2 */
+			tzasc@21d4000 { /* TZASC2 */
 				reg = <0x021d4000 0x4000>;
 				interrupts = <0 109 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			audmux: audmux@021d8000 {
+			audmux: audmux@21d8000 {
 				compatible = "fsl,imx6q-audmux", "fsl,imx31-audmux";
 				reg = <0x021d8000 0x4000>;
 				status = "disabled";
 			};
 
-			mipi_csi: mipi@021dc000 {
+			mipi_csi: mipi@21dc000 {
 				compatible = "fsl,imx6-mipi-csi2";
 				reg = <0x021dc000 0x4000>;
 				#address-cells = <1>;
@@ -1171,7 +1171,7 @@
 				status = "disabled";
 			};
 
-			mipi_dsi: mipi@021e0000 {
+			mipi_dsi: mipi@21e0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <0x021e0000 0x4000>;
@@ -1199,14 +1199,14 @@
 				};
 			};
 
-			vdoa@021e4000 {
+			vdoa@21e4000 {
 				compatible = "fsl,imx6q-vdoa";
 				reg = <0x021e4000 0x4000>;
 				interrupts = <0 18 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6QDL_CLK_VDOA>;
 			};
 
-			uart2: serial@021e8000 {
+			uart2: serial@21e8000 {
 				compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021e8000 0x4000>;
 				interrupts = <0 27 IRQ_TYPE_LEVEL_HIGH>;
@@ -1218,7 +1218,7 @@
 				status = "disabled";
 			};
 
-			uart3: serial@021ec000 {
+			uart3: serial@21ec000 {
 				compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021ec000 0x4000>;
 				interrupts = <0 28 IRQ_TYPE_LEVEL_HIGH>;
@@ -1230,7 +1230,7 @@
 				status = "disabled";
 			};
 
-			uart4: serial@021f0000 {
+			uart4: serial@21f0000 {
 				compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021f0000 0x4000>;
 				interrupts = <0 29 IRQ_TYPE_LEVEL_HIGH>;
@@ -1242,7 +1242,7 @@
 				status = "disabled";
 			};
 
-			uart5: serial@021f4000 {
+			uart5: serial@21f4000 {
 				compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021f4000 0x4000>;
 				interrupts = <0 30 IRQ_TYPE_LEVEL_HIGH>;
@@ -1255,7 +1255,7 @@
 			};
 		};
 
-		ipu1: ipu@02400000 {
+		ipu1: ipu@2400000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "fsl,imx6q-ipu";
diff --git a/arch/arm/boot/dts/imx6qp.dtsi b/arch/arm/boot/dts/imx6qp.dtsi
index 299d863690c5..5f4fdce715c1 100644
--- a/arch/arm/boot/dts/imx6qp.dtsi
+++ b/arch/arm/boot/dts/imx6qp.dtsi
@@ -44,19 +44,19 @@
 
 / {
 	soc {
-		ocram2: sram@00940000 {
+		ocram2: sram@940000 {
 			compatible = "mmio-sram";
 			reg = <0x00940000 0x20000>;
 			clocks = <&clks IMX6QDL_CLK_OCRAM>;
 		};
 
-		ocram3: sram@00960000 {
+		ocram3: sram@960000 {
 			compatible = "mmio-sram";
 			reg = <0x00960000 0x20000>;
 			clocks = <&clks IMX6QDL_CLK_OCRAM>;
 		};
 
-		aips-bus@02100000 {
+		aips-bus@2100000 {
 			pre1: pre@21c8000 {
 				compatible = "fsl,imx6qp-pre";
 				reg = <0x021c8000 0x1000>;
diff --git a/arch/arm/boot/dts/imx6sl-evk.dts b/arch/arm/boot/dts/imx6sl-evk.dts
index 0a90eea17018..60600b4cf5fe 100644
--- a/arch/arm/boot/dts/imx6sl-evk.dts
+++ b/arch/arm/boot/dts/imx6sl-evk.dts
@@ -145,7 +145,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	pmic: pfuze100@08 {
+	pmic: pfuze100@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
 
diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index 3f76f980947e..3ea1a41893c8 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -76,7 +76,7 @@
 		};
 	};
 
-	intc: interrupt-controller@00a01000 {
+	intc: interrupt-controller@a01000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
@@ -109,13 +109,13 @@
 		interrupt-parent = <&gpc>;
 		ranges;
 
-		ocram: sram@00900000 {
+		ocram: sram@900000 {
 			compatible = "mmio-sram";
 			reg = <0x00900000 0x20000>;
 			clocks = <&clks IMX6SL_CLK_OCRAM>;
 		};
 
-		L2: l2-cache@00a02000 {
+		L2: l2-cache@a02000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x00a02000 0x1000>;
 			interrupts = <0 92 IRQ_TYPE_LEVEL_HIGH>;
@@ -130,21 +130,21 @@
 			interrupts = <0 94 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		aips1: aips-bus@02000000 {
+		aips1: aips-bus@2000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x02000000 0x100000>;
 			ranges;
 
-			spba: spba-bus@02000000 {
+			spba: spba-bus@2000000 {
 				compatible = "fsl,spba-bus", "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <1>;
 				reg = <0x02000000 0x40000>;
 				ranges;
 
-				spdif: spdif@02004000 {
+				spdif: spdif@2004000 {
 					compatible = "fsl,imx6sl-spdif",
 						"fsl,imx35-spdif";
 					reg = <0x02004000 0x4000>;
@@ -165,7 +165,7 @@
 					status = "disabled";
 				};
 
-				ecspi1: ecspi@02008000 {
+				ecspi1: ecspi@2008000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6sl-ecspi", "fsl,imx51-ecspi";
@@ -177,7 +177,7 @@
 					status = "disabled";
 				};
 
-				ecspi2: ecspi@0200c000 {
+				ecspi2: ecspi@200c000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6sl-ecspi", "fsl,imx51-ecspi";
@@ -189,7 +189,7 @@
 					status = "disabled";
 				};
 
-				ecspi3: ecspi@02010000 {
+				ecspi3: ecspi@2010000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6sl-ecspi", "fsl,imx51-ecspi";
@@ -201,7 +201,7 @@
 					status = "disabled";
 				};
 
-				ecspi4: ecspi@02014000 {
+				ecspi4: ecspi@2014000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6sl-ecspi", "fsl,imx51-ecspi";
@@ -213,7 +213,7 @@
 					status = "disabled";
 				};
 
-				uart5: serial@02018000 {
+				uart5: serial@2018000 {
 					compatible = "fsl,imx6sl-uart",
 						   "fsl,imx6q-uart", "fsl,imx21-uart";
 					reg = <0x02018000 0x4000>;
@@ -226,7 +226,7 @@
 					status = "disabled";
 				};
 
-				uart1: serial@02020000 {
+				uart1: serial@2020000 {
 					compatible = "fsl,imx6sl-uart",
 						   "fsl,imx6q-uart", "fsl,imx21-uart";
 					reg = <0x02020000 0x4000>;
@@ -239,7 +239,7 @@
 					status = "disabled";
 				};
 
-				uart2: serial@02024000 {
+				uart2: serial@2024000 {
 					compatible = "fsl,imx6sl-uart",
 						   "fsl,imx6q-uart", "fsl,imx21-uart";
 					reg = <0x02024000 0x4000>;
@@ -252,7 +252,7 @@
 					status = "disabled";
 				};
 
-				ssi1: ssi@02028000 {
+				ssi1: ssi@2028000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6sl-ssi",
 							"fsl,imx51-ssi";
@@ -268,7 +268,7 @@
 					status = "disabled";
 				};
 
-				ssi2: ssi@0202c000 {
+				ssi2: ssi@202c000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6sl-ssi",
 							"fsl,imx51-ssi";
@@ -284,7 +284,7 @@
 					status = "disabled";
 				};
 
-				ssi3: ssi@02030000 {
+				ssi3: ssi@2030000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6sl-ssi",
 							"fsl,imx51-ssi";
@@ -300,7 +300,7 @@
 					status = "disabled";
 				};
 
-				uart3: serial@02034000 {
+				uart3: serial@2034000 {
 					compatible = "fsl,imx6sl-uart",
 						   "fsl,imx6q-uart", "fsl,imx21-uart";
 					reg = <0x02034000 0x4000>;
@@ -313,7 +313,7 @@
 					status = "disabled";
 				};
 
-				uart4: serial@02038000 {
+				uart4: serial@2038000 {
 					compatible = "fsl,imx6sl-uart",
 						   "fsl,imx6q-uart", "fsl,imx21-uart";
 					reg = <0x02038000 0x4000>;
@@ -327,7 +327,7 @@
 				};
 			};
 
-			pwm1: pwm@02080000 {
+			pwm1: pwm@2080000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx6sl-pwm", "fsl,imx27-pwm";
 				reg = <0x02080000 0x4000>;
@@ -337,7 +337,7 @@
 				clock-names = "ipg", "per";
 			};
 
-			pwm2: pwm@02084000 {
+			pwm2: pwm@2084000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx6sl-pwm", "fsl,imx27-pwm";
 				reg = <0x02084000 0x4000>;
@@ -347,7 +347,7 @@
 				clock-names = "ipg", "per";
 			};
 
-			pwm3: pwm@02088000 {
+			pwm3: pwm@2088000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx6sl-pwm", "fsl,imx27-pwm";
 				reg = <0x02088000 0x4000>;
@@ -357,7 +357,7 @@
 				clock-names = "ipg", "per";
 			};
 
-			pwm4: pwm@0208c000 {
+			pwm4: pwm@208c000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx6sl-pwm", "fsl,imx27-pwm";
 				reg = <0x0208c000 0x4000>;
@@ -367,7 +367,7 @@
 				clock-names = "ipg", "per";
 			};
 
-			gpt: gpt@02098000 {
+			gpt: gpt@2098000 {
 				compatible = "fsl,imx6sl-gpt";
 				reg = <0x02098000 0x4000>;
 				interrupts = <0 55 IRQ_TYPE_LEVEL_HIGH>;
@@ -376,7 +376,7 @@
 				clock-names = "ipg", "per";
 			};
 
-			gpio1: gpio@0209c000 {
+			gpio1: gpio@209c000 {
 				compatible = "fsl,imx6sl-gpio", "fsl,imx35-gpio";
 				reg = <0x0209c000 0x4000>;
 				interrupts = <0 66 IRQ_TYPE_LEVEL_HIGH>,
@@ -393,7 +393,7 @@
 					      <&iomuxc 27 64 4>, <&iomuxc 31 52 1>;
 			};
 
-			gpio2: gpio@020a0000 {
+			gpio2: gpio@20a0000 {
 				compatible = "fsl,imx6sl-gpio", "fsl,imx35-gpio";
 				reg = <0x020a0000 0x4000>;
 				interrupts = <0 68 IRQ_TYPE_LEVEL_HIGH>,
@@ -411,7 +411,7 @@
 					      <&iomuxc 23 125 7>, <&iomuxc 30 110 2>;
 			};
 
-			gpio3: gpio@020a4000 {
+			gpio3: gpio@20a4000 {
 				compatible = "fsl,imx6sl-gpio", "fsl,imx35-gpio";
 				reg = <0x020a4000 0x4000>;
 				interrupts = <0 70 IRQ_TYPE_LEVEL_HIGH>,
@@ -430,7 +430,7 @@
 					      <&iomuxc 31 102 1>;
 			};
 
-			gpio4: gpio@020a8000 {
+			gpio4: gpio@20a8000 {
 				compatible = "fsl,imx6sl-gpio", "fsl,imx35-gpio";
 				reg = <0x020a8000 0x4000>;
 				interrupts = <0 72 IRQ_TYPE_LEVEL_HIGH>,
@@ -456,7 +456,7 @@
 					      <&iomuxc 30 152 1>, <&iomuxc 31 156 1>;
 			};
 
-			gpio5: gpio@020ac000 {
+			gpio5: gpio@20ac000 {
 				compatible = "fsl,imx6sl-gpio", "fsl,imx35-gpio";
 				reg = <0x020ac000 0x4000>;
 				interrupts = <0 74 IRQ_TYPE_LEVEL_HIGH>,
@@ -478,7 +478,7 @@
 					      <&iomuxc 21 161 1>;
 			};
 
-			kpp: kpp@020b8000 {
+			kpp: kpp@20b8000 {
 				compatible = "fsl,imx6sl-kpp", "fsl,imx21-kpp";
 				reg = <0x020b8000 0x4000>;
 				interrupts = <0 82 IRQ_TYPE_LEVEL_HIGH>;
@@ -486,14 +486,14 @@
 				status = "disabled";
 			};
 
-			wdog1: wdog@020bc000 {
+			wdog1: wdog@20bc000 {
 				compatible = "fsl,imx6sl-wdt", "fsl,imx21-wdt";
 				reg = <0x020bc000 0x4000>;
 				interrupts = <0 80 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_DUMMY>;
 			};
 
-			wdog2: wdog@020c0000 {
+			wdog2: wdog@20c0000 {
 				compatible = "fsl,imx6sl-wdt", "fsl,imx21-wdt";
 				reg = <0x020c0000 0x4000>;
 				interrupts = <0 81 IRQ_TYPE_LEVEL_HIGH>;
@@ -501,7 +501,7 @@
 				status = "disabled";
 			};
 
-			clks: ccm@020c4000 {
+			clks: ccm@20c4000 {
 				compatible = "fsl,imx6sl-ccm";
 				reg = <0x020c4000 0x4000>;
 				interrupts = <0 87 IRQ_TYPE_LEVEL_HIGH>,
@@ -509,7 +509,7 @@
 				#clock-cells = <1>;
 			};
 
-			anatop: anatop@020c8000 {
+			anatop: anatop@20c8000 {
 				compatible = "fsl,imx6sl-anatop",
 					     "fsl,imx6q-anatop",
 					     "syscon", "simple-bus";
@@ -623,7 +623,7 @@
 				clocks = <&clks IMX6SL_CLK_PLL3_USB_OTG>;
 			};
 
-			usbphy1: usbphy@020c9000 {
+			usbphy1: usbphy@20c9000 {
 				compatible = "fsl,imx6sl-usbphy", "fsl,imx23-usbphy";
 				reg = <0x020c9000 0x1000>;
 				interrupts = <0 44 IRQ_TYPE_LEVEL_HIGH>;
@@ -631,7 +631,7 @@
 				fsl,anatop = <&anatop>;
 			};
 
-			usbphy2: usbphy@020ca000 {
+			usbphy2: usbphy@20ca000 {
 				compatible = "fsl,imx6sl-usbphy", "fsl,imx23-usbphy";
 				reg = <0x020ca000 0x1000>;
 				interrupts = <0 45 IRQ_TYPE_LEVEL_HIGH>;
@@ -639,7 +639,7 @@
 				fsl,anatop = <&anatop>;
 			};
 
-			snvs: snvs@020cc000 {
+			snvs: snvs@20cc000 {
 				compatible = "fsl,sec-v4.0-mon", "syscon", "simple-mfd";
 				reg = <0x020cc000 0x4000>;
 
@@ -661,17 +661,17 @@
 				};
 			};
 
-			epit1: epit@020d0000 {
+			epit1: epit@20d0000 {
 				reg = <0x020d0000 0x4000>;
 				interrupts = <0 56 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			epit2: epit@020d4000 {
+			epit2: epit@20d4000 {
 				reg = <0x020d4000 0x4000>;
 				interrupts = <0 57 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			src: src@020d8000 {
+			src: src@20d8000 {
 				compatible = "fsl,imx6sl-src", "fsl,imx51-src";
 				reg = <0x020d8000 0x4000>;
 				interrupts = <0 91 IRQ_TYPE_LEVEL_HIGH>,
@@ -679,7 +679,7 @@
 				#reset-cells = <1>;
 			};
 
-			gpc: gpc@020dc000 {
+			gpc: gpc@20dc000 {
 				compatible = "fsl,imx6sl-gpc", "fsl,imx6q-gpc";
 				reg = <0x020dc000 0x4000>;
 				interrupt-controller;
@@ -692,28 +692,28 @@
 				#power-domain-cells = <1>;
 			};
 
-			gpr: iomuxc-gpr@020e0000 {
+			gpr: iomuxc-gpr@20e0000 {
 				compatible = "fsl,imx6sl-iomuxc-gpr",
 					     "fsl,imx6q-iomuxc-gpr", "syscon";
 				reg = <0x020e0000 0x38>;
 			};
 
-			iomuxc: iomuxc@020e0000 {
+			iomuxc: iomuxc@20e0000 {
 				compatible = "fsl,imx6sl-iomuxc";
 				reg = <0x020e0000 0x4000>;
 			};
 
-			csi: csi@020e4000 {
+			csi: csi@20e4000 {
 				reg = <0x020e4000 0x4000>;
 				interrupts = <0 7 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			spdc: spdc@020e8000 {
+			spdc: spdc@20e8000 {
 				reg = <0x020e8000 0x4000>;
 				interrupts = <0 6 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			sdma: sdma@020ec000 {
+			sdma: sdma@20ec000 {
 				compatible = "fsl,imx6sl-sdma", "fsl,imx6q-sdma";
 				reg = <0x020ec000 0x4000>;
 				interrupts = <0 2 IRQ_TYPE_LEVEL_HIGH>;
@@ -725,17 +725,17 @@
 				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx6q.bin";
 			};
 
-			pxp: pxp@020f0000 {
+			pxp: pxp@20f0000 {
 				reg = <0x020f0000 0x4000>;
 				interrupts = <0 98 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			epdc: epdc@020f4000 {
+			epdc: epdc@20f4000 {
 				reg = <0x020f4000 0x4000>;
 				interrupts = <0 97 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			lcdif: lcdif@020f8000 {
+			lcdif: lcdif@20f8000 {
 				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
@@ -746,7 +746,7 @@
 				status = "disabled";
 			};
 
-			dcp: dcp@020fc000 {
+			dcp: dcp@20fc000 {
 				compatible = "fsl,imx6sl-dcp", "fsl,imx28-dcp";
 				reg = <0x020fc000 0x4000>;
 				interrupts = <0 99 IRQ_TYPE_LEVEL_HIGH>,
@@ -755,14 +755,14 @@
 			};
 		};
 
-		aips2: aips-bus@02100000 {
+		aips2: aips-bus@2100000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x02100000 0x100000>;
 			ranges;
 
-			usbotg1: usb@02184000 {
+			usbotg1: usb@2184000 {
 				compatible = "fsl,imx6sl-usb", "fsl,imx27-usb";
 				reg = <0x02184000 0x200>;
 				interrupts = <0 43 IRQ_TYPE_LEVEL_HIGH>;
@@ -775,7 +775,7 @@
 				status = "disabled";
 			};
 
-			usbotg2: usb@02184200 {
+			usbotg2: usb@2184200 {
 				compatible = "fsl,imx6sl-usb", "fsl,imx27-usb";
 				reg = <0x02184200 0x200>;
 				interrupts = <0 42 IRQ_TYPE_LEVEL_HIGH>;
@@ -788,7 +788,7 @@
 				status = "disabled";
 			};
 
-			usbh: usb@02184400 {
+			usbh: usb@2184400 {
 				compatible = "fsl,imx6sl-usb", "fsl,imx27-usb";
 				reg = <0x02184400 0x200>;
 				interrupts = <0 40 IRQ_TYPE_LEVEL_HIGH>;
@@ -801,14 +801,14 @@
 				status = "disabled";
 			};
 
-			usbmisc: usbmisc@02184800 {
+			usbmisc: usbmisc@2184800 {
 				#index-cells = <1>;
 				compatible = "fsl,imx6sl-usbmisc", "fsl,imx6q-usbmisc";
 				reg = <0x02184800 0x200>;
 				clocks = <&clks IMX6SL_CLK_USBOH3>;
 			};
 
-			fec: ethernet@02188000 {
+			fec: ethernet@2188000 {
 				compatible = "fsl,imx6sl-fec", "fsl,imx25-fec";
 				reg = <0x02188000 0x4000>;
 				interrupts = <0 114 IRQ_TYPE_LEVEL_HIGH>;
@@ -818,7 +818,7 @@
 				status = "disabled";
 			};
 
-			usdhc1: usdhc@02190000 {
+			usdhc1: usdhc@2190000 {
 				compatible = "fsl,imx6sl-usdhc", "fsl,imx6q-usdhc";
 				reg = <0x02190000 0x4000>;
 				interrupts = <0 22 IRQ_TYPE_LEVEL_HIGH>;
@@ -830,7 +830,7 @@
 				status = "disabled";
 			};
 
-			usdhc2: usdhc@02194000 {
+			usdhc2: usdhc@2194000 {
 				compatible = "fsl,imx6sl-usdhc", "fsl,imx6q-usdhc";
 				reg = <0x02194000 0x4000>;
 				interrupts = <0 23 IRQ_TYPE_LEVEL_HIGH>;
@@ -842,7 +842,7 @@
 				status = "disabled";
 			};
 
-			usdhc3: usdhc@02198000 {
+			usdhc3: usdhc@2198000 {
 				compatible = "fsl,imx6sl-usdhc", "fsl,imx6q-usdhc";
 				reg = <0x02198000 0x4000>;
 				interrupts = <0 24 IRQ_TYPE_LEVEL_HIGH>;
@@ -854,7 +854,7 @@
 				status = "disabled";
 			};
 
-			usdhc4: usdhc@0219c000 {
+			usdhc4: usdhc@219c000 {
 				compatible = "fsl,imx6sl-usdhc", "fsl,imx6q-usdhc";
 				reg = <0x0219c000 0x4000>;
 				interrupts = <0 25 IRQ_TYPE_LEVEL_HIGH>;
@@ -866,7 +866,7 @@
 				status = "disabled";
 			};
 
-			i2c1: i2c@021a0000 {
+			i2c1: i2c@21a0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6sl-i2c", "fsl,imx21-i2c";
@@ -876,7 +876,7 @@
 				status = "disabled";
 			};
 
-			i2c2: i2c@021a4000 {
+			i2c2: i2c@21a4000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6sl-i2c", "fsl,imx21-i2c";
@@ -886,7 +886,7 @@
 				status = "disabled";
 			};
 
-			i2c3: i2c@021a8000 {
+			i2c3: i2c@21a8000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6sl-i2c", "fsl,imx21-i2c";
@@ -896,17 +896,17 @@
 				status = "disabled";
 			};
 
-			mmdc: mmdc@021b0000 {
+			mmdc: mmdc@21b0000 {
 				compatible = "fsl,imx6sl-mmdc", "fsl,imx6q-mmdc";
 				reg = <0x021b0000 0x4000>;
 			};
 
-			rngb: rngb@021b4000 {
+			rngb: rngb@21b4000 {
 				reg = <0x021b4000 0x4000>;
 				interrupts = <0 5 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			weim: weim@021b8000 {
+			weim: weim@21b8000 {
 				#address-cells = <2>;
 				#size-cells = <1>;
 				reg = <0x021b8000 0x4000>;
@@ -915,13 +915,13 @@
 				status = "disabled";
 			};
 
-			ocotp: ocotp@021bc000 {
+			ocotp: ocotp@21bc000 {
 				compatible = "fsl,imx6sl-ocotp", "syscon";
 				reg = <0x021bc000 0x4000>;
 				clocks = <&clks IMX6SL_CLK_OCOTP>;
 			};
 
-			audmux: audmux@021d8000 {
+			audmux: audmux@21d8000 {
 				compatible = "fsl,imx6sl-audmux", "fsl,imx31-audmux";
 				reg = <0x021d8000 0x4000>;
 				status = "disabled";
diff --git a/arch/arm/boot/dts/imx6sx-nitrogen6sx.dts b/arch/arm/boot/dts/imx6sx-nitrogen6sx.dts
index c5578d1c1ee4..f9d40ee14982 100644
--- a/arch/arm/boot/dts/imx6sx-nitrogen6sx.dts
+++ b/arch/arm/boot/dts/imx6sx-nitrogen6sx.dts
@@ -231,7 +231,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_sgtl5000>;
diff --git a/arch/arm/boot/dts/imx6sx-sdb-reva.dts b/arch/arm/boot/dts/imx6sx-sdb-reva.dts
index 71005478cdf0..e3533e74ccc8 100644
--- a/arch/arm/boot/dts/imx6sx-sdb-reva.dts
+++ b/arch/arm/boot/dts/imx6sx-sdb-reva.dts
@@ -18,7 +18,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	pmic: pfuze100@08 {
+	pmic: pfuze100@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
 
diff --git a/arch/arm/boot/dts/imx6sx-sdb.dts b/arch/arm/boot/dts/imx6sx-sdb.dts
index c0139d7e497a..6dd9bebfe027 100644
--- a/arch/arm/boot/dts/imx6sx-sdb.dts
+++ b/arch/arm/boot/dts/imx6sx-sdb.dts
@@ -18,7 +18,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	pmic: pfuze100@08 {
+	pmic: pfuze100@8 {
 		compatible = "fsl,pfuze200";
 		reg = <0x08>;
 
diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
index dcfc97591433..53b3eac94f0d 100644
--- a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
+++ b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
@@ -135,7 +135,7 @@
 	clock-frequency = <100000>;
 	status = "okay";
 
-	pmic: pmic@08 {
+	pmic: pmic@8 {
 		compatible = "fsl,pfuze3000";
 		reg = <0x08>;
 
diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 6c7eb54be9e2..32d71245b2a6 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -95,7 +95,7 @@
 		};
 	};
 
-	intc: interrupt-controller@00a01000 {
+	intc: interrupt-controller@a01000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
@@ -153,13 +153,13 @@
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		ocram: sram@00900000 {
+		ocram: sram@900000 {
 			compatible = "mmio-sram";
 			reg = <0x00900000 0x20000>;
 			clocks = <&clks IMX6SX_CLK_OCRAM>;
 		};
 
-		L2: l2-cache@00a02000 {
+		L2: l2-cache@a02000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x00a02000 0x1000>;
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
@@ -169,7 +169,7 @@
 			arm,data-latency = <4 2 3>;
 		};
 
-		gpu: gpu@01800000 {
+		gpu: gpu@1800000 {
 			compatible = "vivante,gc";
 			reg = <0x01800000 0x4000>;
 			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
@@ -179,7 +179,7 @@
 			clock-names = "bus", "core", "shader";
 		};
 
-		dma_apbh: dma-apbh@01804000 {
+		dma_apbh: dma-apbh@1804000 {
 			compatible = "fsl,imx6sx-dma-apbh", "fsl,imx28-dma-apbh";
 			reg = <0x01804000 0x2000>;
 			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
@@ -192,7 +192,7 @@
 			clocks = <&clks IMX6SX_CLK_APBH_DMA>;
 		};
 
-		gpmi: gpmi-nand@01806000{
+		gpmi: gpmi-nand@1806000{
 			compatible = "fsl,imx6sx-gpmi-nand";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -212,21 +212,21 @@
 			status = "disabled";
 		};
 
-		aips1: aips-bus@02000000 {
+		aips1: aips-bus@2000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x02000000 0x100000>;
 			ranges;
 
-			spba-bus@02000000 {
+			spba-bus@2000000 {
 				compatible = "fsl,spba-bus", "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <1>;
 				reg = <0x02000000 0x40000>;
 				ranges;
 
-				spdif: spdif@02004000 {
+				spdif: spdif@2004000 {
 					compatible = "fsl,imx6sx-spdif", "fsl,imx35-spdif";
 					reg = <0x02004000 0x4000>;
 					interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
@@ -248,7 +248,7 @@
 					status = "disabled";
 				};
 
-				ecspi1: ecspi@02008000 {
+				ecspi1: ecspi@2008000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6sx-ecspi", "fsl,imx51-ecspi";
@@ -260,7 +260,7 @@
 					status = "disabled";
 				};
 
-				ecspi2: ecspi@0200c000 {
+				ecspi2: ecspi@200c000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6sx-ecspi", "fsl,imx51-ecspi";
@@ -272,7 +272,7 @@
 					status = "disabled";
 				};
 
-				ecspi3: ecspi@02010000 {
+				ecspi3: ecspi@2010000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6sx-ecspi", "fsl,imx51-ecspi";
@@ -284,7 +284,7 @@
 					status = "disabled";
 				};
 
-				ecspi4: ecspi@02014000 {
+				ecspi4: ecspi@2014000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6sx-ecspi", "fsl,imx51-ecspi";
@@ -296,7 +296,7 @@
 					status = "disabled";
 				};
 
-				uart1: serial@02020000 {
+				uart1: serial@2020000 {
 					compatible = "fsl,imx6sx-uart",
 						     "fsl,imx6q-uart", "fsl,imx21-uart";
 					reg = <0x02020000 0x4000>;
@@ -309,7 +309,7 @@
 					status = "disabled";
 				};
 
-				esai: esai@02024000 {
+				esai: esai@2024000 {
 					reg = <0x02024000 0x4000>;
 					interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clks IMX6SX_CLK_ESAI_IPG>,
@@ -322,7 +322,7 @@
 					status = "disabled";
 				};
 
-				ssi1: ssi@02028000 {
+				ssi1: ssi@2028000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6sx-ssi", "fsl,imx51-ssi";
 					reg = <0x02028000 0x4000>;
@@ -336,7 +336,7 @@
 					status = "disabled";
 				};
 
-				ssi2: ssi@0202c000 {
+				ssi2: ssi@202c000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6sx-ssi", "fsl,imx51-ssi";
 					reg = <0x0202c000 0x4000>;
@@ -350,7 +350,7 @@
 					status = "disabled";
 				};
 
-				ssi3: ssi@02030000 {
+				ssi3: ssi@2030000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6sx-ssi", "fsl,imx51-ssi";
 					reg = <0x02030000 0x4000>;
@@ -364,7 +364,7 @@
 					status = "disabled";
 				};
 
-				asrc: asrc@02034000 {
+				asrc: asrc@2034000 {
 					reg = <0x02034000 0x4000>;
 					interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clks IMX6SX_CLK_ASRC_MEM>,
@@ -381,7 +381,7 @@
 				};
 			};
 
-			pwm1: pwm@02080000 {
+			pwm1: pwm@2080000 {
 				compatible = "fsl,imx6sx-pwm", "fsl,imx27-pwm";
 				reg = <0x02080000 0x4000>;
 				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
@@ -391,7 +391,7 @@
 				#pwm-cells = <2>;
 			};
 
-			pwm2: pwm@02084000 {
+			pwm2: pwm@2084000 {
 				compatible = "fsl,imx6sx-pwm", "fsl,imx27-pwm";
 				reg = <0x02084000 0x4000>;
 				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
@@ -401,7 +401,7 @@
 				#pwm-cells = <2>;
 			};
 
-			pwm3: pwm@02088000 {
+			pwm3: pwm@2088000 {
 				compatible = "fsl,imx6sx-pwm", "fsl,imx27-pwm";
 				reg = <0x02088000 0x4000>;
 				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
@@ -411,7 +411,7 @@
 				#pwm-cells = <2>;
 			};
 
-			pwm4: pwm@0208c000 {
+			pwm4: pwm@208c000 {
 				compatible = "fsl,imx6sx-pwm", "fsl,imx27-pwm";
 				reg = <0x0208c000 0x4000>;
 				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
@@ -421,7 +421,7 @@
 				#pwm-cells = <2>;
 			};
 
-			flexcan1: can@02090000 {
+			flexcan1: can@2090000 {
 				compatible = "fsl,imx6sx-flexcan", "fsl,imx6q-flexcan";
 				reg = <0x02090000 0x4000>;
 				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
@@ -431,7 +431,7 @@
 				status = "disabled";
 			};
 
-			flexcan2: can@02094000 {
+			flexcan2: can@2094000 {
 				compatible = "fsl,imx6sx-flexcan", "fsl,imx6q-flexcan";
 				reg = <0x02094000 0x4000>;
 				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
@@ -441,7 +441,7 @@
 				status = "disabled";
 			};
 
-			gpt: gpt@02098000 {
+			gpt: gpt@2098000 {
 				compatible = "fsl,imx6sx-gpt", "fsl,imx31-gpt";
 				reg = <0x02098000 0x4000>;
 				interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
@@ -450,7 +450,7 @@
 				clock-names = "ipg", "per";
 			};
 
-			gpio1: gpio@0209c000 {
+			gpio1: gpio@209c000 {
 				compatible = "fsl,imx6sx-gpio", "fsl,imx35-gpio";
 				reg = <0x0209c000 0x4000>;
 				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
@@ -462,7 +462,7 @@
 				gpio-ranges = <&iomuxc 0 5 26>;
 			};
 
-			gpio2: gpio@020a0000 {
+			gpio2: gpio@20a0000 {
 				compatible = "fsl,imx6sx-gpio", "fsl,imx35-gpio";
 				reg = <0x020a0000 0x4000>;
 				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
@@ -474,7 +474,7 @@
 				gpio-ranges = <&iomuxc 0 31 20>;
 			};
 
-			gpio3: gpio@020a4000 {
+			gpio3: gpio@20a4000 {
 				compatible = "fsl,imx6sx-gpio", "fsl,imx35-gpio";
 				reg = <0x020a4000 0x4000>;
 				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
@@ -486,7 +486,7 @@
 				gpio-ranges = <&iomuxc 0 51 29>;
 			};
 
-			gpio4: gpio@020a8000 {
+			gpio4: gpio@20a8000 {
 				compatible = "fsl,imx6sx-gpio", "fsl,imx35-gpio";
 				reg = <0x020a8000 0x4000>;
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
@@ -498,7 +498,7 @@
 				gpio-ranges = <&iomuxc 0 80 32>;
 			};
 
-			gpio5: gpio@020ac000 {
+			gpio5: gpio@20ac000 {
 				compatible = "fsl,imx6sx-gpio", "fsl,imx35-gpio";
 				reg = <0x020ac000 0x4000>;
 				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
@@ -510,7 +510,7 @@
 				gpio-ranges = <&iomuxc 0 112 24>;
 			};
 
-			gpio6: gpio@020b0000 {
+			gpio6: gpio@20b0000 {
 				compatible = "fsl,imx6sx-gpio", "fsl,imx35-gpio";
 				reg = <0x020b0000 0x4000>;
 				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
@@ -522,7 +522,7 @@
 				gpio-ranges = <&iomuxc 0 136 12>, <&iomuxc 12 158 11>;
 			};
 
-			gpio7: gpio@020b4000 {
+			gpio7: gpio@20b4000 {
 				compatible = "fsl,imx6sx-gpio", "fsl,imx35-gpio";
 				reg = <0x020b4000 0x4000>;
 				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
@@ -534,7 +534,7 @@
 				gpio-ranges = <&iomuxc 0 148 10>, <&iomuxc 10 169 2>;
 			};
 
-			kpp: kpp@020b8000 {
+			kpp: kpp@20b8000 {
 				compatible = "fsl,imx6sx-kpp", "fsl,imx21-kpp";
 				reg = <0x020b8000 0x4000>;
 				interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
@@ -542,14 +542,14 @@
 				status = "disabled";
 			};
 
-			wdog1: wdog@020bc000 {
+			wdog1: wdog@20bc000 {
 				compatible = "fsl,imx6sx-wdt", "fsl,imx21-wdt";
 				reg = <0x020bc000 0x4000>;
 				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SX_CLK_DUMMY>;
 			};
 
-			wdog2: wdog@020c0000 {
+			wdog2: wdog@20c0000 {
 				compatible = "fsl,imx6sx-wdt", "fsl,imx21-wdt";
 				reg = <0x020c0000 0x4000>;
 				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
@@ -557,7 +557,7 @@
 				status = "disabled";
 			};
 
-			clks: ccm@020c4000 {
+			clks: ccm@20c4000 {
 				compatible = "fsl,imx6sx-ccm";
 				reg = <0x020c4000 0x4000>;
 				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
@@ -567,7 +567,7 @@
 				clock-names = "ckil", "osc", "ipp_di0", "ipp_di1";
 			};
 
-			anatop: anatop@020c8000 {
+			anatop: anatop@20c8000 {
 				compatible = "fsl,imx6sx-anatop", "fsl,imx6q-anatop",
 					     "syscon", "simple-bus";
 				reg = <0x020c8000 0x1000>;
@@ -679,7 +679,7 @@
 				clocks = <&clks IMX6SX_CLK_PLL3_USB_OTG>;
 			};
 
-			usbphy1: usbphy@020c9000 {
+			usbphy1: usbphy@20c9000 {
 				compatible = "fsl,imx6sx-usbphy", "fsl,imx23-usbphy";
 				reg = <0x020c9000 0x1000>;
 				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
@@ -687,7 +687,7 @@
 				fsl,anatop = <&anatop>;
 			};
 
-			usbphy2: usbphy@020ca000 {
+			usbphy2: usbphy@20ca000 {
 				compatible = "fsl,imx6sx-usbphy", "fsl,imx23-usbphy";
 				reg = <0x020ca000 0x1000>;
 				interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
@@ -695,7 +695,7 @@
 				fsl,anatop = <&anatop>;
 			};
 
-			snvs: snvs@020cc000 {
+			snvs: snvs@20cc000 {
 				compatible = "fsl,sec-v4.0-mon", "syscon", "simple-mfd";
 				reg = <0x020cc000 0x4000>;
 
@@ -724,17 +724,17 @@
 				};
 			};
 
-			epit1: epit@020d0000 {
+			epit1: epit@20d0000 {
 				reg = <0x020d0000 0x4000>;
 				interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			epit2: epit@020d4000 {
+			epit2: epit@20d4000 {
 				reg = <0x020d4000 0x4000>;
 				interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			src: src@020d8000 {
+			src: src@20d8000 {
 				compatible = "fsl,imx6sx-src", "fsl,imx51-src";
 				reg = <0x020d8000 0x4000>;
 				interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
@@ -742,7 +742,7 @@
 				#reset-cells = <1>;
 			};
 
-			gpc: gpc@020dc000 {
+			gpc: gpc@20dc000 {
 				compatible = "fsl,imx6sx-gpc", "fsl,imx6q-gpc";
 				reg = <0x020dc000 0x4000>;
 				interrupt-controller;
@@ -751,18 +751,18 @@
 				interrupt-parent = <&intc>;
 			};
 
-			iomuxc: iomuxc@020e0000 {
+			iomuxc: iomuxc@20e0000 {
 				compatible = "fsl,imx6sx-iomuxc";
 				reg = <0x020e0000 0x4000>;
 			};
 
-			gpr: iomuxc-gpr@020e4000 {
+			gpr: iomuxc-gpr@20e4000 {
 				compatible = "fsl,imx6sx-iomuxc-gpr",
 					     "fsl,imx6q-iomuxc-gpr", "syscon";
 				reg = <0x020e4000 0x4000>;
 			};
 
-			sdma: sdma@020ec000 {
+			sdma: sdma@20ec000 {
 				compatible = "fsl,imx6sx-sdma", "fsl,imx6q-sdma";
 				reg = <0x020ec000 0x4000>;
 				interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
@@ -775,7 +775,7 @@
 			};
 		};
 
-		aips2: aips-bus@02100000 {
+		aips2: aips-bus@2100000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -809,7 +809,7 @@
 				};
 			};
 
-			usbotg1: usb@02184000 {
+			usbotg1: usb@2184000 {
 				compatible = "fsl,imx6sx-usb", "fsl,imx27-usb";
 				reg = <0x02184000 0x200>;
 				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
@@ -823,7 +823,7 @@
 				status = "disabled";
 			};
 
-			usbotg2: usb@02184200 {
+			usbotg2: usb@2184200 {
 				compatible = "fsl,imx6sx-usb", "fsl,imx27-usb";
 				reg = <0x02184200 0x200>;
 				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
@@ -836,7 +836,7 @@
 				status = "disabled";
 			};
 
-			usbh: usb@02184400 {
+			usbh: usb@2184400 {
 				compatible = "fsl,imx6sx-usb", "fsl,imx27-usb";
 				reg = <0x02184400 0x200>;
 				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
@@ -851,14 +851,14 @@
 				status = "disabled";
 			};
 
-			usbmisc: usbmisc@02184800 {
+			usbmisc: usbmisc@2184800 {
 				#index-cells = <1>;
 				compatible = "fsl,imx6sx-usbmisc", "fsl,imx6q-usbmisc";
 				reg = <0x02184800 0x200>;
 				clocks = <&clks IMX6SX_CLK_USBOH3>;
 			};
 
-			fec1: ethernet@02188000 {
+			fec1: ethernet@2188000 {
 				compatible = "fsl,imx6sx-fec", "fsl,imx6q-fec";
 				reg = <0x02188000 0x4000>;
 				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
@@ -875,7 +875,7 @@
 				status = "disabled";
 			};
 
-			mlb: mlb@0218c000 {
+			mlb: mlb@218c000 {
 				reg = <0x0218c000 0x4000>;
 				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
@@ -884,7 +884,7 @@
 				status = "disabled";
 			};
 
-			usdhc1: usdhc@02190000 {
+			usdhc1: usdhc@2190000 {
 				compatible = "fsl,imx6sx-usdhc", "fsl,imx6sl-usdhc";
 				reg = <0x02190000 0x4000>;
 				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
@@ -896,7 +896,7 @@
 				status = "disabled";
 			};
 
-			usdhc2: usdhc@02194000 {
+			usdhc2: usdhc@2194000 {
 				compatible = "fsl,imx6sx-usdhc", "fsl,imx6sl-usdhc";
 				reg = <0x02194000 0x4000>;
 				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
@@ -908,7 +908,7 @@
 				status = "disabled";
 			};
 
-			usdhc3: usdhc@02198000 {
+			usdhc3: usdhc@2198000 {
 				compatible = "fsl,imx6sx-usdhc", "fsl,imx6sl-usdhc";
 				reg = <0x02198000 0x4000>;
 				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
@@ -920,7 +920,7 @@
 				status = "disabled";
 			};
 
-			usdhc4: usdhc@0219c000 {
+			usdhc4: usdhc@219c000 {
 				compatible = "fsl,imx6sx-usdhc", "fsl,imx6sl-usdhc";
 				reg = <0x0219c000 0x4000>;
 				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
@@ -932,7 +932,7 @@
 				status = "disabled";
 			};
 
-			i2c1: i2c@021a0000 {
+			i2c1: i2c@21a0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6sx-i2c", "fsl,imx21-i2c";
@@ -942,7 +942,7 @@
 				status = "disabled";
 			};
 
-			i2c2: i2c@021a4000 {
+			i2c2: i2c@21a4000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6sx-i2c", "fsl,imx21-i2c";
@@ -952,7 +952,7 @@
 				status = "disabled";
 			};
 
-			i2c3: i2c@021a8000 {
+			i2c3: i2c@21a8000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6sx-i2c", "fsl,imx21-i2c";
@@ -962,12 +962,12 @@
 				status = "disabled";
 			};
 
-			mmdc: mmdc@021b0000 {
+			mmdc: mmdc@21b0000 {
 				compatible = "fsl,imx6sx-mmdc", "fsl,imx6q-mmdc";
 				reg = <0x021b0000 0x4000>;
 			};
 
-			fec2: ethernet@021b4000 {
+			fec2: ethernet@21b4000 {
 				compatible = "fsl,imx6sx-fec", "fsl,imx6q-fec";
 				reg = <0x021b4000 0x4000>;
 				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
@@ -982,7 +982,7 @@
 				status = "disabled";
 			};
 
-			weim: weim@021b8000 {
+			weim: weim@21b8000 {
 				#address-cells = <2>;
 				#size-cells = <1>;
 				compatible = "fsl,imx6sx-weim", "fsl,imx6q-weim";
@@ -993,13 +993,13 @@
 				status = "disabled";
 			};
 
-			ocotp: ocotp@021bc000 {
+			ocotp: ocotp@21bc000 {
 				compatible = "fsl,imx6sx-ocotp", "syscon";
 				reg = <0x021bc000 0x4000>;
 				clocks = <&clks IMX6SX_CLK_OCOTP>;
 			};
 
-			sai1: sai@021d4000 {
+			sai1: sai@21d4000 {
 				compatible = "fsl,imx6sx-sai";
 				reg = <0x021d4000 0x4000>;
 				interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
@@ -1012,13 +1012,13 @@
 				status = "disabled";
 			};
 
-			audmux: audmux@021d8000 {
+			audmux: audmux@21d8000 {
 				compatible = "fsl,imx6sx-audmux", "fsl,imx31-audmux";
 				reg = <0x021d8000 0x4000>;
 				status = "disabled";
 			};
 
-			sai2: sai@021dc000 {
+			sai2: sai@21dc000 {
 				compatible = "fsl,imx6sx-sai";
 				reg = <0x021dc000 0x4000>;
 				interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
@@ -1031,7 +1031,7 @@
 				status = "disabled";
 			};
 
-			qspi1: qspi@021e0000 {
+			qspi1: qspi@21e0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6sx-qspi";
@@ -1044,7 +1044,7 @@
 				status = "disabled";
 			};
 
-			qspi2: qspi@021e4000 {
+			qspi2: qspi@21e4000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6sx-qspi";
@@ -1057,7 +1057,7 @@
 				status = "disabled";
 			};
 
-			uart2: serial@021e8000 {
+			uart2: serial@21e8000 {
 				compatible = "fsl,imx6sx-uart",
 					     "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021e8000 0x4000>;
@@ -1070,7 +1070,7 @@
 				status = "disabled";
 			};
 
-			uart3: serial@021ec000 {
+			uart3: serial@21ec000 {
 				compatible = "fsl,imx6sx-uart",
 					     "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021ec000 0x4000>;
@@ -1083,7 +1083,7 @@
 				status = "disabled";
 			};
 
-			uart4: serial@021f0000 {
+			uart4: serial@21f0000 {
 				compatible = "fsl,imx6sx-uart",
 					     "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021f0000 0x4000>;
@@ -1096,7 +1096,7 @@
 				status = "disabled";
 			};
 
-			uart5: serial@021f4000 {
+			uart5: serial@21f4000 {
 				compatible = "fsl,imx6sx-uart",
 					     "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x021f4000 0x4000>;
@@ -1109,7 +1109,7 @@
 				status = "disabled";
 			};
 
-			i2c4: i2c@021f8000 {
+			i2c4: i2c@21f8000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6sx-i2c", "fsl,imx21-i2c";
@@ -1120,21 +1120,21 @@
 			};
 		};
 
-		aips3: aips-bus@02200000 {
+		aips3: aips-bus@2200000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x02200000 0x100000>;
 			ranges;
 
-			spba-bus@02200000 {
+			spba-bus@2200000 {
 				compatible = "fsl,spba-bus", "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <1>;
 				reg = <0x02240000 0x40000>;
 				ranges;
 
-				csi1: csi@02214000 {
+				csi1: csi@2214000 {
 					reg = <0x02214000 0x4000>;
 					interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clks IMX6SX_CLK_DISPLAY_AXI>,
@@ -1144,7 +1144,7 @@
 					status = "disabled";
 				};
 
-				pxp: pxp@02218000 {
+				pxp: pxp@2218000 {
 					reg = <0x02218000 0x4000>;
 					interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clks IMX6SX_CLK_PXP_AXI>,
@@ -1153,7 +1153,7 @@
 					status = "disabled";
 				};
 
-				csi2: csi@0221c000 {
+				csi2: csi@221c000 {
 					reg = <0x0221c000 0x4000>;
 					interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clks IMX6SX_CLK_DISPLAY_AXI>,
@@ -1163,7 +1163,7 @@
 					status = "disabled";
 				};
 
-				lcdif1: lcdif@02220000 {
+				lcdif1: lcdif@2220000 {
 					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
 					reg = <0x02220000 0x4000>;
 					interrupts = <GIC_SPI 5 IRQ_TYPE_EDGE_RISING>;
@@ -1174,7 +1174,7 @@
 					status = "disabled";
 				};
 
-				lcdif2: lcdif@02224000 {
+				lcdif2: lcdif@2224000 {
 					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
 					reg = <0x02224000 0x4000>;
 					interrupts = <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>;
@@ -1185,7 +1185,7 @@
 					status = "disabled";
 				};
 
-				vadc: vadc@02228000 {
+				vadc: vadc@2228000 {
 					reg = <0x02228000 0x4000>, <0x0222c000 0x4000>;
 					reg-names = "vadc-vafe", "vadc-vdec";
 					clocks = <&clks IMX6SX_CLK_VADC>,
@@ -1195,7 +1195,7 @@
 				};
 			};
 
-			adc1: adc@02280000 {
+			adc1: adc@2280000 {
 				compatible = "fsl,imx6sx-adc", "fsl,vf610-adc";
 				reg = <0x02280000 0x4000>;
 				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
@@ -1206,7 +1206,7 @@
 				status = "disabled";
 			};
 
-			adc2: adc@02284000 {
+			adc2: adc@2284000 {
 				compatible = "fsl,imx6sx-adc", "fsl,vf610-adc";
 				reg = <0x02284000 0x4000>;
 				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
@@ -1217,7 +1217,7 @@
 				status = "disabled";
 			};
 
-			wdog3: wdog@02288000 {
+			wdog3: wdog@2288000 {
 				compatible = "fsl,imx6sx-wdt", "fsl,imx21-wdt";
 				reg = <0x02288000 0x4000>;
 				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
@@ -1225,7 +1225,7 @@
 				status = "disabled";
 			};
 
-			ecspi5: ecspi@0228c000 {
+			ecspi5: ecspi@228c000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6sx-ecspi", "fsl,imx51-ecspi";
@@ -1237,7 +1237,7 @@
 				status = "disabled";
 			};
 
-			uart6: serial@022a0000 {
+			uart6: serial@22a0000 {
 				compatible = "fsl,imx6sx-uart",
 					     "fsl,imx6q-uart", "fsl,imx21-uart";
 				reg = <0x022a0000 0x4000>;
@@ -1250,7 +1250,7 @@
 				status = "disabled";
 			};
 
-			pwm5: pwm@022a4000 {
+			pwm5: pwm@22a4000 {
 				compatible = "fsl,imx6sx-pwm", "fsl,imx27-pwm";
 				reg = <0x022a4000 0x4000>;
 				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
@@ -1260,7 +1260,7 @@
 				#pwm-cells = <2>;
 			};
 
-			pwm6: pwm@022a8000 {
+			pwm6: pwm@22a8000 {
 				compatible = "fsl,imx6sx-pwm", "fsl,imx27-pwm";
 				reg = <0x022a8000 0x4000>;
 				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
@@ -1270,7 +1270,7 @@
 				#pwm-cells = <2>;
 			};
 
-			pwm7: pwm@022ac000 {
+			pwm7: pwm@22ac000 {
 				compatible = "fsl,imx6sx-pwm", "fsl,imx27-pwm";
 				reg = <0x022ac000 0x4000>;
 				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
@@ -1280,7 +1280,7 @@
 				#pwm-cells = <2>;
 			};
 
-			pwm8: pwm@0022b0000 {
+			pwm8: pwm@22b0000 {
 				compatible = "fsl,imx6sx-pwm", "fsl,imx27-pwm";
 				reg = <0x0022b0000 0x4000>;
 				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
index 7d7254b12a75..9a68fb0ed4ab 100644
--- a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
+++ b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
@@ -186,7 +186,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	pmic: pfuze3000@08 {
+	pmic: pfuze3000@8 {
 		compatible = "fsl,pfuze3000";
 		reg = <0x08>;
 
@@ -223,7 +223,7 @@
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		reg = <0x0a>;
 		compatible = "fsl,sgtl5000";
 		clocks = <&sys_mclk>;
diff --git a/arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts b/arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts
index 28d055e3f301..2d80f7b50bc0 100644
--- a/arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts
+++ b/arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dts
@@ -116,7 +116,7 @@
 };
 
 &i2c2 {
-	/delete-node/ codec@0a;
+	/delete-node/ codec@a;
 	/delete-node/ touchscreen@48;
 
 	rtc: mcp7940x@6f {
diff --git a/arch/arm/boot/dts/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/imx6ul-tx6ul.dtsi
index ec745eb3b6a8..7b844f4ef06a 100644
--- a/arch/arm/boot/dts/imx6ul-tx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul-tx6ul.dtsi
@@ -362,7 +362,7 @@
 	clock-frequency = <400000>;
 	status = "okay";
 
-	sgtl5000: codec@0a {
+	sgtl5000: codec@a {
 		compatible = "fsl,sgtl5000";
 		reg = <0x0a>;
 		#sound-dai-cells = <0>;
diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index f11a241a340d..2057ee695a66 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -98,7 +98,7 @@
 		};
 	};
 
-	intc: interrupt-controller@00a01000 {
+	intc: interrupt-controller@a01000 {
 		compatible = "arm,gic-400", "arm,cortex-a7-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
@@ -149,12 +149,12 @@
 			status = "disabled";
 		};
 
-		ocram: sram@00900000 {
+		ocram: sram@900000 {
 			compatible = "mmio-sram";
 			reg = <0x00900000 0x20000>;
 		};
 
-		dma_apbh: dma-apbh@01804000 {
+		dma_apbh: dma-apbh@1804000 {
 			compatible = "fsl,imx6q-dma-apbh", "fsl,imx28-dma-apbh";
 			reg = <0x01804000 0x2000>;
 			interrupts = <0 13 IRQ_TYPE_LEVEL_HIGH>,
@@ -167,7 +167,7 @@
 			clocks = <&clks IMX6UL_CLK_APBHDMA>;
 		};
 
-		gpmi: gpmi-nand@01806000         {
+		gpmi: gpmi-nand@1806000         {
 			compatible = "fsl,imx6q-gpmi-nand";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -187,21 +187,21 @@
 			status = "disabled";
 		};
 
-		aips1: aips-bus@02000000 {
+		aips1: aips-bus@2000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x02000000 0x100000>;
 			ranges;
 
-			spba-bus@02000000 {
+			spba-bus@2000000 {
 				compatible = "fsl,spba-bus", "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <1>;
 				reg = <0x02000000 0x40000>;
 				ranges;
 
-				ecspi1: ecspi@02008000 {
+				ecspi1: ecspi@2008000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6ul-ecspi", "fsl,imx51-ecspi";
@@ -213,7 +213,7 @@
 					status = "disabled";
 				};
 
-				ecspi2: ecspi@0200c000 {
+				ecspi2: ecspi@200c000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6ul-ecspi", "fsl,imx51-ecspi";
@@ -225,7 +225,7 @@
 					status = "disabled";
 				};
 
-				ecspi3: ecspi@02010000 {
+				ecspi3: ecspi@2010000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6ul-ecspi", "fsl,imx51-ecspi";
@@ -237,7 +237,7 @@
 					status = "disabled";
 				};
 
-				ecspi4: ecspi@02014000 {
+				ecspi4: ecspi@2014000 {
 					#address-cells = <1>;
 					#size-cells = <0>;
 					compatible = "fsl,imx6ul-ecspi", "fsl,imx51-ecspi";
@@ -249,7 +249,7 @@
 					status = "disabled";
 				};
 
-				uart7: serial@02018000 {
+				uart7: serial@2018000 {
 					compatible = "fsl,imx6ul-uart",
 						     "fsl,imx6q-uart";
 					reg = <0x02018000 0x4000>;
@@ -260,7 +260,7 @@
 					status = "disabled";
 				};
 
-				uart1: serial@02020000 {
+				uart1: serial@2020000 {
 					compatible = "fsl,imx6ul-uart",
 						     "fsl,imx6q-uart";
 					reg = <0x02020000 0x4000>;
@@ -271,7 +271,7 @@
 					status = "disabled";
 				};
 
-				uart8: serial@02024000 {
+				uart8: serial@2024000 {
 					compatible = "fsl,imx6ul-uart",
 						     "fsl,imx6q-uart";
 					reg = <0x02024000 0x4000>;
@@ -282,7 +282,7 @@
 					status = "disabled";
 				};
 
-				sai1: sai@02028000 {
+				sai1: sai@2028000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6ul-sai", "fsl,imx6sx-sai";
 					reg = <0x02028000 0x4000>;
@@ -297,7 +297,7 @@
 					status = "disabled";
 				};
 
-				sai2: sai@0202c000 {
+				sai2: sai@202c000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6ul-sai", "fsl,imx6sx-sai";
 					reg = <0x0202c000 0x4000>;
@@ -312,7 +312,7 @@
 					status = "disabled";
 				};
 
-				sai3: sai@02030000 {
+				sai3: sai@2030000 {
 					#sound-dai-cells = <0>;
 					compatible = "fsl,imx6ul-sai", "fsl,imx6sx-sai";
 					reg = <0x02030000 0x4000>;
@@ -328,7 +328,7 @@
 				};
 			};
 
-			tsc: tsc@02040000 {
+			tsc: tsc@2040000 {
 				compatible = "fsl,imx6ul-tsc";
 				reg = <0x02040000 0x4000>, <0x0219c000 0x4000>;
 				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
@@ -339,7 +339,7 @@
 				status = "disabled";
 			};
 
-			pwm1: pwm@02080000 {
+			pwm1: pwm@2080000 {
 				compatible = "fsl,imx6ul-pwm", "fsl,imx27-pwm";
 				reg = <0x02080000 0x4000>;
 				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
@@ -350,7 +350,7 @@
 				status = "disabled";
 			};
 
-			pwm2: pwm@02084000 {
+			pwm2: pwm@2084000 {
 				compatible = "fsl,imx6ul-pwm", "fsl,imx27-pwm";
 				reg = <0x02084000 0x4000>;
 				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
@@ -361,7 +361,7 @@
 				status = "disabled";
 			};
 
-			pwm3: pwm@02088000 {
+			pwm3: pwm@2088000 {
 				compatible = "fsl,imx6ul-pwm", "fsl,imx27-pwm";
 				reg = <0x02088000 0x4000>;
 				interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
@@ -372,7 +372,7 @@
 				status = "disabled";
 			};
 
-			pwm4: pwm@0208c000 {
+			pwm4: pwm@208c000 {
 				compatible = "fsl,imx6ul-pwm", "fsl,imx27-pwm";
 				reg = <0x0208c000 0x4000>;
 				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
@@ -383,7 +383,7 @@
 				status = "disabled";
 			};
 
-			can1: flexcan@02090000 {
+			can1: flexcan@2090000 {
 				compatible = "fsl,imx6ul-flexcan", "fsl,imx6q-flexcan";
 				reg = <0x02090000 0x4000>;
 				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
@@ -393,7 +393,7 @@
 				status = "disabled";
 			};
 
-			can2: flexcan@02094000 {
+			can2: flexcan@2094000 {
 				compatible = "fsl,imx6ul-flexcan", "fsl,imx6q-flexcan";
 				reg = <0x02094000 0x4000>;
 				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
@@ -403,7 +403,7 @@
 				status = "disabled";
 			};
 
-			gpt1: gpt@02098000 {
+			gpt1: gpt@2098000 {
 				compatible = "fsl,imx6ul-gpt", "fsl,imx6sx-gpt";
 				reg = <0x02098000 0x4000>;
 				interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
@@ -412,7 +412,7 @@
 				clock-names = "ipg", "per";
 			};
 
-			gpio1: gpio@0209c000 {
+			gpio1: gpio@209c000 {
 				compatible = "fsl,imx6ul-gpio", "fsl,imx35-gpio";
 				reg = <0x0209c000 0x4000>;
 				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
@@ -425,7 +425,7 @@
 					      <&iomuxc 16 33 16>;
 			};
 
-			gpio2: gpio@020a0000 {
+			gpio2: gpio@20a0000 {
 				compatible = "fsl,imx6ul-gpio", "fsl,imx35-gpio";
 				reg = <0x020a0000 0x4000>;
 				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
@@ -437,7 +437,7 @@
 				gpio-ranges = <&iomuxc 0 49 16>, <&iomuxc 16 111 6>;
 			};
 
-			gpio3: gpio@020a4000 {
+			gpio3: gpio@20a4000 {
 				compatible = "fsl,imx6ul-gpio", "fsl,imx35-gpio";
 				reg = <0x020a4000 0x4000>;
 				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
@@ -449,7 +449,7 @@
 				gpio-ranges = <&iomuxc 0 65 29>;
 			};
 
-			gpio4: gpio@020a8000 {
+			gpio4: gpio@20a8000 {
 				compatible = "fsl,imx6ul-gpio", "fsl,imx35-gpio";
 				reg = <0x020a8000 0x4000>;
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
@@ -461,7 +461,7 @@
 				gpio-ranges = <&iomuxc 0 94 17>, <&iomuxc 17 117 12>;
 			};
 
-			gpio5: gpio@020ac000 {
+			gpio5: gpio@20ac000 {
 				compatible = "fsl,imx6ul-gpio", "fsl,imx35-gpio";
 				reg = <0x020ac000 0x4000>;
 				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
@@ -473,7 +473,7 @@
 				gpio-ranges = <&iomuxc 0 7 10>, <&iomuxc 10 5 2>;
 			};
 
-			fec2: ethernet@020b4000 {
+			fec2: ethernet@20b4000 {
 				compatible = "fsl,imx6ul-fec", "fsl,imx6q-fec";
 				reg = <0x020b4000 0x4000>;
 				interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
@@ -490,7 +490,7 @@
 				status = "disabled";
 			};
 
-			kpp: kpp@020b8000 {
+			kpp: kpp@20b8000 {
 				compatible = "fsl,imx6ul-kpp", "fsl,imx6q-kpp", "fsl,imx21-kpp";
 				reg = <0x020b8000 0x4000>;
 				interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
@@ -498,14 +498,14 @@
 				status = "disabled";
 			};
 
-			wdog1: wdog@020bc000 {
+			wdog1: wdog@20bc000 {
 				compatible = "fsl,imx6ul-wdt", "fsl,imx21-wdt";
 				reg = <0x020bc000 0x4000>;
 				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6UL_CLK_WDOG1>;
 			};
 
-			wdog2: wdog@020c0000 {
+			wdog2: wdog@20c0000 {
 				compatible = "fsl,imx6ul-wdt", "fsl,imx21-wdt";
 				reg = <0x020c0000 0x4000>;
 				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
@@ -513,7 +513,7 @@
 				status = "disabled";
 			};
 
-			clks: ccm@020c4000 {
+			clks: ccm@20c4000 {
 				compatible = "fsl,imx6ul-ccm";
 				reg = <0x020c4000 0x4000>;
 				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
@@ -523,7 +523,7 @@
 				clock-names = "ckil", "osc", "ipp_di0", "ipp_di1";
 			};
 
-			anatop: anatop@020c8000 {
+			anatop: anatop@20c8000 {
 				compatible = "fsl,imx6ul-anatop", "fsl,imx6q-anatop",
 					     "syscon", "simple-bus";
 				reg = <0x020c8000 0x1000>;
@@ -580,7 +580,7 @@
 				};
 			};
 
-			usbphy1: usbphy@020c9000 {
+			usbphy1: usbphy@20c9000 {
 				compatible = "fsl,imx6ul-usbphy", "fsl,imx23-usbphy";
 				reg = <0x020c9000 0x1000>;
 				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
@@ -589,7 +589,7 @@
 				fsl,anatop = <&anatop>;
 			};
 
-			usbphy2: usbphy@020ca000 {
+			usbphy2: usbphy@20ca000 {
 				compatible = "fsl,imx6ul-usbphy", "fsl,imx23-usbphy";
 				reg = <0x020ca000 0x1000>;
 				interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
@@ -598,7 +598,7 @@
 				fsl,anatop = <&anatop>;
 			};
 
-			snvs: snvs@020cc000 {
+			snvs: snvs@20cc000 {
 				compatible = "fsl,sec-v4.0-mon", "syscon", "simple-mfd";
 				reg = <0x020cc000 0x4000>;
 
@@ -628,17 +628,17 @@
 				};
 			};
 
-			epit1: epit@020d0000 {
+			epit1: epit@20d0000 {
 				reg = <0x020d0000 0x4000>;
 				interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			epit2: epit@020d4000 {
+			epit2: epit@20d4000 {
 				reg = <0x020d4000 0x4000>;
 				interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			src: src@020d8000 {
+			src: src@20d8000 {
 				compatible = "fsl,imx6ul-src", "fsl,imx51-src";
 				reg = <0x020d8000 0x4000>;
 				interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
@@ -646,7 +646,7 @@
 				#reset-cells = <1>;
 			};
 
-			gpc: gpc@020dc000 {
+			gpc: gpc@20dc000 {
 				compatible = "fsl,imx6ul-gpc", "fsl,imx6q-gpc";
 				reg = <0x020dc000 0x4000>;
 				interrupt-controller;
@@ -655,18 +655,18 @@
 				interrupt-parent = <&intc>;
 			};
 
-			iomuxc: iomuxc@020e0000 {
+			iomuxc: iomuxc@20e0000 {
 				compatible = "fsl,imx6ul-iomuxc";
 				reg = <0x020e0000 0x4000>;
 			};
 
-			gpr: iomuxc-gpr@020e4000 {
+			gpr: iomuxc-gpr@20e4000 {
 				compatible = "fsl,imx6ul-iomuxc-gpr",
 					     "fsl,imx6q-iomuxc-gpr", "syscon";
 				reg = <0x020e4000 0x4000>;
 			};
 
-			gpt2: gpt@020e8000 {
+			gpt2: gpt@20e8000 {
 				compatible = "fsl,imx6ul-gpt", "fsl,imx6sx-gpt";
 				reg = <0x020e8000 0x4000>;
 				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
@@ -675,7 +675,7 @@
 				clock-names = "ipg", "per";
 			};
 
-			sdma: sdma@020ec000 {
+			sdma: sdma@20ec000 {
 				compatible = "fsl,imx6ul-sdma", "fsl,imx6q-sdma",
 					     "fsl,imx35-sdma";
 				reg = <0x020ec000 0x4000>;
@@ -687,7 +687,7 @@
 				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx6q.bin";
 			};
 
-			pwm5: pwm@020f0000 {
+			pwm5: pwm@20f0000 {
 				compatible = "fsl,imx6ul-pwm", "fsl,imx27-pwm";
 				reg = <0x020f0000 0x4000>;
 				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
@@ -698,7 +698,7 @@
 				status = "disabled";
 			};
 
-			pwm6: pwm@020f4000 {
+			pwm6: pwm@20f4000 {
 				compatible = "fsl,imx6ul-pwm", "fsl,imx27-pwm";
 				reg = <0x020f4000 0x4000>;
 				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
@@ -709,7 +709,7 @@
 				status = "disabled";
 			};
 
-			pwm7: pwm@020f8000 {
+			pwm7: pwm@20f8000 {
 				compatible = "fsl,imx6ul-pwm", "fsl,imx27-pwm";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
@@ -720,7 +720,7 @@
 				status = "disabled";
 			};
 
-			pwm8: pwm@020fc000 {
+			pwm8: pwm@20fc000 {
 				compatible = "fsl,imx6ul-pwm", "fsl,imx27-pwm";
 				reg = <0x020fc000 0x4000>;
 				interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
@@ -732,14 +732,14 @@
 			};
 		};
 
-		aips2: aips-bus@02100000 {
+		aips2: aips-bus@2100000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x02100000 0x100000>;
 			ranges;
 
-			usbotg1: usb@02184000 {
+			usbotg1: usb@2184000 {
 				compatible = "fsl,imx6ul-usb", "fsl,imx27-usb";
 				reg = <0x02184000 0x200>;
 				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
@@ -753,7 +753,7 @@
 				status = "disabled";
 			};
 
-			usbotg2: usb@02184200 {
+			usbotg2: usb@2184200 {
 				compatible = "fsl,imx6ul-usb", "fsl,imx27-usb";
 				reg = <0x02184200 0x200>;
 				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
@@ -766,13 +766,13 @@
 				status = "disabled";
 			};
 
-			usbmisc: usbmisc@02184800 {
+			usbmisc: usbmisc@2184800 {
 				#index-cells = <1>;
 				compatible = "fsl,imx6ul-usbmisc", "fsl,imx6q-usbmisc";
 				reg = <0x02184800 0x200>;
 			};
 
-			fec1: ethernet@02188000 {
+			fec1: ethernet@2188000 {
 				compatible = "fsl,imx6ul-fec", "fsl,imx6q-fec";
 				reg = <0x02188000 0x4000>;
 				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
@@ -789,7 +789,7 @@
 				status = "disabled";
 			};
 
-			usdhc1: usdhc@02190000 {
+			usdhc1: usdhc@2190000 {
 				compatible = "fsl,imx6ul-usdhc", "fsl,imx6sx-usdhc";
 				reg = <0x02190000 0x4000>;
 				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
@@ -801,7 +801,7 @@
 				status = "disabled";
 			};
 
-			usdhc2: usdhc@02194000 {
+			usdhc2: usdhc@2194000 {
 				compatible = "fsl,imx6ul-usdhc", "fsl,imx6sx-usdhc";
 				reg = <0x02194000 0x4000>;
 				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
@@ -813,7 +813,7 @@
 				status = "disabled";
 			};
 
-			adc1: adc@02198000 {
+			adc1: adc@2198000 {
 				compatible = "fsl,imx6ul-adc", "fsl,vf610-adc";
 				reg = <0x02198000 0x4000>;
 				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
@@ -825,7 +825,7 @@
 				status = "disabled";
 			};
 
-			i2c1: i2c@021a0000 {
+			i2c1: i2c@21a0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6ul-i2c", "fsl,imx21-i2c";
@@ -835,7 +835,7 @@
 				status = "disabled";
 			};
 
-			i2c2: i2c@021a4000 {
+			i2c2: i2c@21a4000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6ul-i2c", "fsl,imx21-i2c";
@@ -845,7 +845,7 @@
 				status = "disabled";
 			};
 
-			i2c3: i2c@021a8000 {
+			i2c3: i2c@21a8000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6ul-i2c", "fsl,imx21-i2c";
@@ -855,18 +855,18 @@
 				status = "disabled";
 			};
 
-			mmdc: mmdc@021b0000 {
+			mmdc: mmdc@21b0000 {
 				compatible = "fsl,imx6ul-mmdc", "fsl,imx6q-mmdc";
 				reg = <0x021b0000 0x4000>;
 			};
 
-			ocotp: ocotp-ctrl@021bc000 {
+			ocotp: ocotp-ctrl@21bc000 {
 				compatible = "fsl,imx6ul-ocotp", "syscon";
 				reg = <0x021bc000 0x4000>;
 				clocks = <&clks IMX6UL_CLK_OCOTP>;
 			};
 
-			lcdif: lcdif@021c8000 {
+			lcdif: lcdif@21c8000 {
 				compatible = "fsl,imx6ul-lcdif", "fsl,imx28-lcdif";
 				reg = <0x021c8000 0x4000>;
 				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
@@ -877,7 +877,7 @@
 				status = "disabled";
 			};
 
-			qspi: qspi@021e0000 {
+			qspi: qspi@21e0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6ul-qspi", "fsl,imx6sx-qspi";
@@ -890,7 +890,7 @@
 				status = "disabled";
 			};
 
-			uart2: serial@021e8000 {
+			uart2: serial@21e8000 {
 				compatible = "fsl,imx6ul-uart",
 					     "fsl,imx6q-uart";
 				reg = <0x021e8000 0x4000>;
@@ -901,7 +901,7 @@
 				status = "disabled";
 			};
 
-			uart3: serial@021ec000 {
+			uart3: serial@21ec000 {
 				compatible = "fsl,imx6ul-uart",
 					     "fsl,imx6q-uart";
 				reg = <0x021ec000 0x4000>;
@@ -912,7 +912,7 @@
 				status = "disabled";
 			};
 
-			uart4: serial@021f0000 {
+			uart4: serial@21f0000 {
 				compatible = "fsl,imx6ul-uart",
 					     "fsl,imx6q-uart";
 				reg = <0x021f0000 0x4000>;
@@ -923,7 +923,7 @@
 				status = "disabled";
 			};
 
-			uart5: serial@021f4000 {
+			uart5: serial@21f4000 {
 				compatible = "fsl,imx6ul-uart",
 					     "fsl,imx6q-uart";
 				reg = <0x021f4000 0x4000>;
@@ -934,7 +934,7 @@
 				status = "disabled";
 			};
 
-			i2c4: i2c@021f8000 {
+			i2c4: i2c@21f8000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,imx6ul-i2c", "fsl,imx21-i2c";
@@ -944,7 +944,7 @@
 				status = "disabled";
 			};
 
-			uart6: serial@021fc000 {
+			uart6: serial@21fc000 {
 				compatible = "fsl,imx6ul-uart",
 					     "fsl,imx6q-uart";
 				reg = <0x021fc000 0x4000>;
diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-colibri.dtsi
index 0a3915868aa3..bb5bf94f1a32 100644
--- a/arch/arm/boot/dts/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri.dtsi
@@ -121,7 +121,7 @@
 	pinctrl-0 = <&pinctrl_i2c1 &pinctrl_i2c1_int>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		compatible = "fsl,sgtl5000";
 		#sound-dai-cells = <0>;
 		reg = <0x0a>;
diff --git a/arch/arm/boot/dts/imx7d-nitrogen7.dts b/arch/arm/boot/dts/imx7d-nitrogen7.dts
index e7998308861f..2b05898bb3f6 100644
--- a/arch/arm/boot/dts/imx7d-nitrogen7.dts
+++ b/arch/arm/boot/dts/imx7d-nitrogen7.dts
@@ -181,7 +181,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	pmic: pfuze3000@08 {
+	pmic: pfuze3000@8 {
 		compatible = "fsl,pfuze3000";
 		reg = <0x08>;
 
diff --git a/arch/arm/boot/dts/imx7d-pico.dts b/arch/arm/boot/dts/imx7d-pico.dts
index e78c2c9cc28a..52a3df62b879 100644
--- a/arch/arm/boot/dts/imx7d-pico.dts
+++ b/arch/arm/boot/dts/imx7d-pico.dts
@@ -137,7 +137,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		#sound-dai-cells = <0>;
 		reg = <0x0a>;
 		compatible = "fsl,sgtl5000";
@@ -152,7 +152,7 @@
 	pinctrl-0 = <&pinctrl_i2c4>;
 	status = "okay";
 
-	pmic: pfuze3000@08 {
+	pmic: pfuze3000@8 {
 		compatible = "fsl,pfuze3000";
 		reg = <0x08>;
 
diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index 44637cabcc56..a7a5dc7b2700 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -241,7 +241,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	pmic: pfuze3000@08 {
+	pmic: pfuze3000@8 {
 		compatible = "fsl,pfuze3000";
 		reg = <0x08>;
 
diff --git a/arch/arm/boot/dts/imx7s-warp.dts b/arch/arm/boot/dts/imx7s-warp.dts
index 07b63f8b7314..9bdf121f7e43 100644
--- a/arch/arm/boot/dts/imx7s-warp.dts
+++ b/arch/arm/boot/dts/imx7s-warp.dts
@@ -122,7 +122,7 @@
 	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
-	pmic: pfuze3000@08 {
+	pmic: pfuze3000@8 {
 		compatible = "fsl,pfuze3000";
 		reg = <0x08>;
 
@@ -226,7 +226,7 @@
 	pinctrl-0 = <&pinctrl_i2c4>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 		#sound-dai-cells = <0>;
 		reg = <0x0a>;
 		compatible = "fsl,sgtl5000";
diff --git a/arch/arm/boot/dts/integrator.dtsi b/arch/arm/boot/dts/integrator.dtsi
index 6fe0dd1d3541..ba8d0ed885c6 100644
--- a/arch/arm/boot/dts/integrator.dtsi
+++ b/arch/arm/boot/dts/integrator.dtsi
@@ -10,7 +10,7 @@
 		reg = <0x10000000 0x200>;
 
 		/* Use core module LED to indicate CPU load */
-		led@0c.0 {
+		led@c.0 {
 			compatible = "register-bit-led";
 			offset = <0x0c>;
 			mask = <0x01>;
@@ -99,7 +99,7 @@
 			compatible = "syscon", "simple-mfd";
 			reg = <0x1a000000 0x10>;
 
-			led@04.0 {
+			led@4.0 {
 				compatible = "register-bit-led";
 				offset = <0x04>;
 				mask = <0x01>;
@@ -107,21 +107,21 @@
 				linux,default-trigger = "heartbeat";
 				default-state = "on";
 			};
-			led@04.1 {
+			led@4.1 {
 				compatible = "register-bit-led";
 				offset = <0x04>;
 				mask = <0x02>;
 				label = "integrator:yellow";
 				default-state = "off";
 			};
-			led@04.2 {
+			led@4.2 {
 				compatible = "register-bit-led";
 				offset = <0x04>;
 				mask = <0x04>;
 				label = "integrator:red";
 				default-state = "off";
 			};
-			led@04.3 {
+			led@4.3 {
 				compatible = "register-bit-led";
 				offset = <0x04>;
 				mask = <0x08>;
diff --git a/arch/arm/boot/dts/keystone-k2e.dtsi b/arch/arm/boot/dts/keystone-k2e.dtsi
index 819ab8345916..6b796b52ff4f 100644
--- a/arch/arm/boot/dts/keystone-k2e.dtsi
+++ b/arch/arm/boot/dts/keystone-k2e.dtsi
@@ -88,7 +88,7 @@
 			};
 		};
 
-		msm_ram: msmram@0c000000 {
+		msm_ram: msmram@c000000 {
 			compatible = "mmio-sram";
 			reg = <0x0c000000 0x200000>;
 			ranges = <0x0 0x0c000000 0x200000>;
@@ -100,7 +100,7 @@
 			};
 		};
 
-		psc: power-sleep-controller@02350000 {
+		psc: power-sleep-controller@2350000 {
 			pscrst: reset-controller {
 				compatible = "ti,k2e-pscrst", "ti,syscon-reset";
 				#reset-cells = <1>;
@@ -111,7 +111,7 @@
 			};
 		};
 
-		dspgpio0: keystone_dsp_gpio@02620240 {
+		dspgpio0: keystone_dsp_gpio@2620240 {
 			compatible = "ti,keystone-dsp-gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index 826b286665e6..a1ae69d712f7 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -42,7 +42,7 @@
 		};
 	};
 
-	gic: interrupt-controller@02561000 {
+	gic: interrupt-controller@2561000 {
 		compatible = "arm,gic-400", "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
@@ -80,7 +80,7 @@
 		ranges = <0x0 0x0 0x0 0xc0000000>;
 		dma-ranges = <0x80000000 0x8 0x00000000 0x80000000>;
 
-		msm_ram: msmram@0c000000 {
+		msm_ram: msmram@c000000 {
 			compatible = "mmio-sram";
 			reg = <0x0c000000 0x100000>;
 			ranges = <0x0 0x0c000000 0x100000>;
@@ -92,19 +92,19 @@
 			};
 		};
 
-		k2g_pinctrl: pinmux@02621000 {
+		k2g_pinctrl: pinmux@2621000 {
 			compatible = "pinctrl-single";
 			reg = <0x02621000 0x410>;
 			pinctrl-single,register-width = <32>;
 			pinctrl-single,function-mask = <0x001b0007>;
 		};
 
-		devctrl: device-state-control@02620000 {
+		devctrl: device-state-control@2620000 {
 			compatible = "ti,keystone-devctrl", "syscon";
 			reg = <0x02620000 0x1000>;
 		};
 
-		uart0: serial@02530c00 {
+		uart0: serial@2530c00 {
 			compatible = "ti,da830-uart", "ns16550a";
 			current-speed = <115200>;
 			reg-shift = <2>;
@@ -115,7 +115,7 @@
 			status = "disabled";
 		};
 
-		dcan0: can@0260B200 {
+		dcan0: can@260b200 {
 			compatible = "ti,am4372-d_can", "ti,am3352-d_can";
 			reg = <0x0260B200 0x200>;
 			interrupts = <GIC_SPI 190 IRQ_TYPE_EDGE_RISING>;
@@ -124,7 +124,7 @@
 			clocks = <&k2g_clks 0x0008 1>;
 		};
 
-		dcan1: can@0260B400 {
+		dcan1: can@260b400 {
 			compatible = "ti,am4372-d_can", "ti,am3352-d_can";
 			reg = <0x0260B400 0x200>;
 			interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
@@ -133,7 +133,7 @@
 			clocks = <&k2g_clks 0x0009 1>;
 		};
 
-		kirq0: keystone_irq@026202a0 {
+		kirq0: keystone_irq@26202a0 {
 			compatible = "ti,keystone-irq";
 			interrupts = <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>;
 			interrupt-controller;
@@ -141,7 +141,7 @@
 			ti,syscon-dev = <&devctrl 0x2a0>;
 		};
 
-		dspgpio0: keystone_dsp_gpio@02620240 {
+		dspgpio0: keystone_dsp_gpio@2620240 {
 			compatible = "ti,keystone-dsp-gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -164,7 +164,7 @@
 			status = "disabled";
 		};
 
-		msgmgr: msgmgr@02a00000 {
+		msgmgr: msgmgr@2a00000 {
 			compatible = "ti,k2g-message-manager";
 			#mbox-cells = <2>;
 			reg-names = "queue_proxy_region",
@@ -176,7 +176,7 @@
 				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		pmmc: pmmc@02921c00 {
+		pmmc: pmmc@2921c00 {
 			compatible = "ti,k2g-sci";
 			/*
 			 * In case of rare platforms that does not use k2g as
@@ -246,7 +246,7 @@
 			clock-names = "gpio";
 		};
 
-		edma0: edma@02700000 {
+		edma0: edma@2700000 {
 			compatible = "ti,k2g-edma3-tpcc", "ti,edma3-tpcc";
 			reg =	<0x02700000 0x8000>;
 			reg-names = "edma3_cc";
@@ -265,19 +265,19 @@
 			power-domains = <&k2g_pds 0x3f>;
 		};
 
-		edma0_tptc0: tptc@02760000 {
+		edma0_tptc0: tptc@2760000 {
 			compatible = "ti,k2g-edma3-tptc", "ti,edma3-tptc";
 			reg =	<0x02760000 0x400>;
 			power-domains = <&k2g_pds 0x3f>;
 		};
 
-		edma0_tptc1: tptc@02768000 {
+		edma0_tptc1: tptc@2768000 {
 			compatible = "ti,k2g-edma3-tptc", "ti,edma3-tptc";
 			reg =	<0x02768000 0x400>;
 			power-domains = <&k2g_pds 0x3f>;
 		};
 
-		edma1: edma@02728000 {
+		edma1: edma@2728000 {
 			compatible = "ti,k2g-edma3-tpcc", "ti,edma3-tpcc";
 			reg =	<0x02728000 0x8000>;
 			reg-names = "edma3_cc";
@@ -300,13 +300,13 @@
 			power-domains = <&k2g_pds 0x4f>;
 		};
 
-		edma1_tptc0: tptc@027b0000 {
+		edma1_tptc0: tptc@27b0000 {
 			compatible = "ti,k2g-edma3-tptc", "ti,edma3-tptc";
 			reg =	<0x027b0000 0x400>;
 			power-domains = <&k2g_pds 0x4f>;
 		};
 
-		edma1_tptc1: tptc@027b8000 {
+		edma1_tptc1: tptc@27b8000 {
 			compatible = "ti,k2g-edma3-tptc", "ti,edma3-tptc";
 			reg =	<0x027b8000 0x400>;
 			power-domains = <&k2g_pds 0x4f>;
diff --git a/arch/arm/boot/dts/keystone-k2hk.dtsi b/arch/arm/boot/dts/keystone-k2hk.dtsi
index 31dc00e4e5fd..7c486d9dc90e 100644
--- a/arch/arm/boot/dts/keystone-k2hk.dtsi
+++ b/arch/arm/boot/dts/keystone-k2hk.dtsi
@@ -59,7 +59,7 @@
 	soc {
 		/include/ "keystone-k2hk-clocks.dtsi"
 
-		msm_ram: msmram@0c000000 {
+		msm_ram: msmram@c000000 {
 			compatible = "mmio-sram";
 			reg = <0x0c000000 0x600000>;
 			ranges = <0x0 0x0c000000 0x600000>;
@@ -71,7 +71,7 @@
 			};
 		};
 
-		psc: power-sleep-controller@02350000 {
+		psc: power-sleep-controller@2350000 {
 			pscrst: reset-controller {
 				compatible = "ti,k2hk-pscrst", "ti,syscon-reset";
 				#reset-cells = <1>;
@@ -89,7 +89,7 @@
 			};
 		};
 
-		dspgpio0: keystone_dsp_gpio@02620240 {
+		dspgpio0: keystone_dsp_gpio@2620240 {
 			compatible = "ti,keystone-dsp-gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -273,7 +273,7 @@
 			status = "disabled";
 		};
 
-		mdio: mdio@02090300 {
+		mdio: mdio@2090300 {
 			compatible	= "ti,keystone_mdio", "ti,davinci_mdio";
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm/boot/dts/keystone-k2l.dtsi b/arch/arm/boot/dts/keystone-k2l.dtsi
index 4431310bc922..4370e6513aa4 100644
--- a/arch/arm/boot/dts/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/keystone-k2l.dtsi
@@ -43,7 +43,7 @@
 	soc {
 		/include/ "keystone-k2l-clocks.dtsi"
 
-		uart2: serial@02348400 {
+		uart2: serial@2348400 {
 			compatible = "ti,da830-uart", "ns16550a";
 			current-speed = <115200>;
 			reg-shift = <2>;
@@ -53,7 +53,7 @@
 			interrupts = <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		uart3:	serial@02348800 {
+		uart3:	serial@2348800 {
 			compatible = "ti,da830-uart", "ns16550a";
 			current-speed = <115200>;
 			reg-shift = <2>;
@@ -63,7 +63,7 @@
 			interrupts = <GIC_SPI 435 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		k2l_pmx: pinmux@02620690 {
+		k2l_pmx: pinmux@2620690 {
 			compatible = "pinctrl-single";
 			reg = <0x02620690 0xc>;
 			#address-cells = <1>;
@@ -213,7 +213,7 @@
 			};
 		};
 
-		msm_ram: msmram@0c000000 {
+		msm_ram: msmram@c000000 {
 			compatible = "mmio-sram";
 			reg = <0x0c000000 0x200000>;
 			ranges = <0x0 0x0c000000 0x200000>;
@@ -225,7 +225,7 @@
 			};
 		};
 
-		psc: power-sleep-controller@02350000 {
+		psc: power-sleep-controller@2350000 {
 			pscrst: reset-controller {
 				compatible = "ti,k2l-pscrst", "ti,syscon-reset";
 				#reset-cells = <1>;
@@ -247,7 +247,7 @@
 			clocks = <&clkosr>;
 		};
 
-		dspgpio0: keystone_dsp_gpio@02620240 {
+		dspgpio0: keystone_dsp_gpio@2620240 {
 			compatible = "ti,keystone-dsp-gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index 8dd74f48a6d3..06e10544f9b1 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -78,17 +78,17 @@
 		ranges = <0x0 0x0 0x0 0xc0000000>;
 		dma-ranges = <0x80000000 0x8 0x00000000 0x80000000>;
 
-		pllctrl: pll-controller@02310000 {
+		pllctrl: pll-controller@2310000 {
 			compatible = "ti,keystone-pllctrl", "syscon";
 			reg = <0x02310000 0x200>;
 		};
 
-		psc: power-sleep-controller@02350000 {
+		psc: power-sleep-controller@2350000 {
 			compatible = "syscon", "simple-mfd";
 			reg = <0x02350000 0x1000>;
 		};
 
-		devctrl: device-state-control@02620000 {
+		devctrl: device-state-control@2620000 {
 			compatible = "ti,keystone-devctrl", "syscon";
 			reg = <0x02620000 0x1000>;
 		};
@@ -102,7 +102,7 @@
 
 		/include/ "keystone-clocks.dtsi"
 
-		uart0: serial@02530c00 {
+		uart0: serial@2530c00 {
 			compatible = "ti,da830-uart", "ns16550a";
 			current-speed = <115200>;
 			reg-shift = <2>;
@@ -112,7 +112,7 @@
 			interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		uart1:	serial@02531000 {
+		uart1:	serial@2531000 {
 			compatible = "ti,da830-uart", "ns16550a";
 			current-speed = <115200>;
 			reg-shift = <2>;
@@ -214,7 +214,7 @@
 			};
 		};
 
-		wdt: wdt@022f0080 {
+		wdt: wdt@22f0080 {
 			compatible = "ti,keystone-wdt","ti,davinci-wdt";
 			reg = <0x022f0080 0x80>;
 			clocks = <&clkwdtimer0>;
diff --git a/arch/arm/boot/dts/kirkwood-synology.dtsi b/arch/arm/boot/dts/kirkwood-synology.dtsi
index 65e9524e852a..210d21a65bd1 100644
--- a/arch/arm/boot/dts/kirkwood-synology.dtsi
+++ b/arch/arm/boot/dts/kirkwood-synology.dtsi
@@ -208,32 +208,32 @@
 				spi-max-frequency = <20000000>;
 				mode = <0>;
 
-				partition@00000000 {
+				partition@0 {
 					reg = <0x00000000 0x00080000>;
 					label = "RedBoot";
 				};
 
-				partition@00080000 {
+				partition@80000 {
 					reg = <0x00080000 0x00200000>;
 					label = "zImage";
 				};
 
-				partition@00280000 {
+				partition@280000 {
 					reg = <0x00280000 0x00140000>;
 					label = "rd.gz";
 				};
 
-				partition@003c0000 {
+				partition@3c0000 {
 					reg = <0x003c0000 0x00010000>;
 					label = "vendor";
 				};
 
-				partition@003d0000 {
+				partition@3d0000 {
 					reg = <0x003d0000 0x00020000>;
 					label = "RedBoot config";
 				};
 
-				partition@003f0000 {
+				partition@3f0000 {
 					reg = <0x003f0000 0x00010000>;
 					label = "FIS directory";
 				};
diff --git a/arch/arm/boot/dts/kirkwood-ts219.dtsi b/arch/arm/boot/dts/kirkwood-ts219.dtsi
index 62e5e2d5c348..587eb71d72cb 100644
--- a/arch/arm/boot/dts/kirkwood-ts219.dtsi
+++ b/arch/arm/boot/dts/kirkwood-ts219.dtsi
@@ -44,29 +44,29 @@
 				spi-max-frequency = <20000000>;
 				mode = <0>;
 
-				partition@0000000 {
+				partition@0 {
 					reg = <0x00000000 0x00080000>;
 					label = "U-Boot";
 				};
 
-				partition@00200000 {
+				partition@200000 {
 					reg = <0x00200000 0x00200000>;
 					label = "Kernel";
 				};
 
-				partition@00400000 {
+				partition@400000 {
 					reg = <0x00400000 0x00900000>;
 					label = "RootFS1";
 				};
-				partition@00d00000 {
+				partition@d00000 {
 					reg = <0x00d00000 0x00300000>;
 					label = "RootFS2";
 				};
-				partition@00040000 {
+				partition@40000 {
 					reg = <0x00080000 0x00040000>;
 					label = "U-Boot Config";
 				};
-				partition@000c0000 {
+				partition@c0000 {
 					reg = <0x000c0000 0x00140000>;
 					label = "NAS Config";
 				};
diff --git a/arch/arm/boot/dts/kirkwood.dtsi b/arch/arm/boot/dts/kirkwood.dtsi
index 29b8bd7e0d93..6a90832dfe09 100644
--- a/arch/arm/boot/dts/kirkwood.dtsi
+++ b/arch/arm/boot/dts/kirkwood.dtsi
@@ -40,7 +40,7 @@
 		pcie-mem-aperture = <0xe0000000 0x10000000>; /* 256 MiB memory space */
 		pcie-io-aperture  = <0xf2000000 0x100000>;   /*   1 MiB    I/O space */
 
-		nand: nand@012f {
+		nand: nand@12f {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			cle = <0>;
@@ -56,7 +56,7 @@
 			status = "disabled";
 		};
 
-		crypto_sram: sa-sram@0301 {
+		crypto_sram: sa-sram@301 {
 			compatible = "mmio-sram";
 			reg = <MBUS_ID(0x03, 0x01) 0x0 0x800>;
 			clocks = <&gate_clk 17>;
diff --git a/arch/arm/boot/dts/lpc3250-ea3250.dts b/arch/arm/boot/dts/lpc3250-ea3250.dts
index 52b3ed10283a..c43adb7b4d7c 100644
--- a/arch/arm/boot/dts/lpc3250-ea3250.dts
+++ b/arch/arm/boot/dts/lpc3250-ea3250.dts
@@ -231,24 +231,24 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		mtd0@00000000 {
+		mtd0@0 {
 			label = "ea3250-boot";
 			reg = <0x00000000 0x00080000>;
 			read-only;
 		};
 
-		mtd1@00080000 {
+		mtd1@80000 {
 			label = "ea3250-uboot";
 			reg = <0x00080000 0x000c0000>;
 			read-only;
 		};
 
-		mtd2@00140000 {
+		mtd2@140000 {
 			label = "ea3250-kernel";
 			reg = <0x00140000 0x00400000>;
 		};
 
-		mtd3@00540000 {
+		mtd3@540000 {
 			label = "ea3250-rootfs";
 			reg = <0x00540000 0x07ac0000>;
 		};
diff --git a/arch/arm/boot/dts/lpc3250-phy3250.dts b/arch/arm/boot/dts/lpc3250-phy3250.dts
index fd95e2b10357..c72eb9845603 100644
--- a/arch/arm/boot/dts/lpc3250-phy3250.dts
+++ b/arch/arm/boot/dts/lpc3250-phy3250.dts
@@ -154,29 +154,29 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		mtd0@00000000 {
+		mtd0@0 {
 			label = "phy3250-boot";
 			reg = <0x00000000 0x00064000>;
 			read-only;
 		};
 
-		mtd1@00064000 {
+		mtd1@64000 {
 			label = "phy3250-uboot";
 			reg = <0x00064000 0x00190000>;
 			read-only;
 		};
 
-		mtd2@001f4000 {
+		mtd2@1f4000 {
 			label = "phy3250-ubt-prms";
 			reg = <0x001f4000 0x00010000>;
 		};
 
-		mtd3@00204000 {
+		mtd3@204000 {
 			label = "phy3250-kernel";
 			reg = <0x00204000 0x00400000>;
 		};
 
-		mtd4@00604000 {
+		mtd4@604000 {
 			label = "phy3250-rootfs";
 			reg = <0x00604000 0x039fc000>;
 		};
diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index d81fe433e3c8..abff7ef7c9cd 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -55,7 +55,7 @@
 			 <0x20000000 0x20000000 0x30000000>,
 			 <0xe0000000 0xe0000000 0x04000000>;
 
-		iram: sram@08000000 {
+		iram: sram@8000000 {
 			compatible = "mmio-sram";
 			reg = <0x08000000 0x20000>;
 
diff --git a/arch/arm/boot/dts/mpa1600.dts b/arch/arm/boot/dts/mpa1600.dts
index 116ce78bea4f..36cfa215620d 100644
--- a/arch/arm/boot/dts/mpa1600.dts
+++ b/arch/arm/boot/dts/mpa1600.dts
@@ -46,7 +46,7 @@
 			};
 		};
 
-		usb0: ohci@00300000 {
+		usb0: ohci@300000 {
 			num-ports = <1>;
 			status = "okay";
 		};
diff --git a/arch/arm/boot/dts/mt6589.dtsi b/arch/arm/boot/dts/mt6589.dtsi
index 0d6f60af7640..41df742d7891 100644
--- a/arch/arm/boot/dts/mt6589.dtsi
+++ b/arch/arm/boot/dts/mt6589.dtsi
@@ -139,7 +139,7 @@
 			status = "disabled";
 		};
 
-		wdt: watchdog@010000000 {
+		wdt: watchdog@10000000 {
 			compatible = "mediatek,mt6589-wdt";
 			reg = <0x10000000 0x44>;
 		};
diff --git a/arch/arm/boot/dts/nspire.dtsi b/arch/arm/boot/dts/nspire.dtsi
index ee5a0bb22354..ec2283b1a638 100644
--- a/arch/arm/boot/dts/nspire.dtsi
+++ b/arch/arm/boot/dts/nspire.dtsi
@@ -20,7 +20,7 @@
 		};
 	};
 
-	bootrom: bootrom@00000000 {
+	bootrom: bootrom@0 {
 		reg = <0x00000000 0x80000>;
 	};
 
diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index 4acd32a1c4ef..669c51c00c00 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -791,7 +791,7 @@
 	};
 
 	/* D/A converter for auto-focus */
-	ad5820: dac@0c {
+	ad5820: dac@c {
 		compatible = "adi,ad5820";
 		reg = <0x0c>;
 
diff --git a/arch/arm/boot/dts/ox810se.dtsi b/arch/arm/boot/dts/ox810se.dtsi
index 46aa6db8353a..c2b48a1838eb 100644
--- a/arch/arm/boot/dts/ox810se.dtsi
+++ b/arch/arm/boot/dts/ox810se.dtsi
@@ -207,7 +207,7 @@
 				};
 			};
 
-			gpio0: gpio@000000 {
+			gpio0: gpio@0 {
 				compatible = "oxsemi,ox810se-gpio";
 				reg = <0x000000 0x100000>;
 				interrupts = <21>;
@@ -296,7 +296,7 @@
 			compatible = "simple-bus";
 			ranges = <0 0x45000000 0x1000000>;
 
-			sys: sys-ctrl@000000 {
+			sys: sys-ctrl@0 {
 				compatible = "oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd";
 				reg = <0x000000 0x100000>;
 
diff --git a/arch/arm/boot/dts/ox820.dtsi b/arch/arm/boot/dts/ox820.dtsi
index 459207536a46..085bbd33eadc 100644
--- a/arch/arm/boot/dts/ox820.dtsi
+++ b/arch/arm/boot/dts/ox820.dtsi
@@ -173,7 +173,7 @@
 				};
 			};
 
-			gpio0: gpio@000000 {
+			gpio0: gpio@0 {
 				compatible = "oxsemi,ox820-gpio";
 				reg = <0x000000 0x100000>;
 				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/picoxcell-pc3x2.dtsi b/arch/arm/boot/dts/picoxcell-pc3x2.dtsi
index 533919e96eae..a1266cf8776c 100644
--- a/arch/arm/boot/dts/picoxcell-pc3x2.dtsi
+++ b/arch/arm/boot/dts/picoxcell-pc3x2.dtsi
@@ -124,7 +124,7 @@
 			#size-cells = <1>;
 			ranges = <0 0x200000 0x80000>;
 
-			rtc0: rtc@00000 {
+			rtc0: rtc@0 {
 				compatible = "picochip,pc3x2-rtc";
 				clock-freq = <200000000>;
 				reg = <0x00000 0xf>;
diff --git a/arch/arm/boot/dts/picoxcell-pc3x3.dtsi b/arch/arm/boot/dts/picoxcell-pc3x3.dtsi
index ab3e80085511..d78cd207eca1 100644
--- a/arch/arm/boot/dts/picoxcell-pc3x3.dtsi
+++ b/arch/arm/boot/dts/picoxcell-pc3x3.dtsi
@@ -223,7 +223,7 @@
 			#size-cells = <1>;
 			ranges = <0 0x200000 0x80000>;
 
-			rtc0: rtc@00000 {
+			rtc0: rtc@0 {
 				compatible = "picochip,pc3x2-rtc";
 				clock-freq = <200000000>;
 				reg = <0x00000 0xf>;
diff --git a/arch/arm/boot/dts/pm9g45.dts b/arch/arm/boot/dts/pm9g45.dts
index 3139221737ee..be5177221cbb 100644
--- a/arch/arm/boot/dts/pm9g45.dts
+++ b/arch/arm/boot/dts/pm9g45.dts
@@ -127,12 +127,12 @@
 			};
 		};
 
-		usb0: ohci@00700000 {
+		usb0: ohci@700000 {
 			status = "okay";
 			num-ports = <2>;
 		};
 
-		usb1: ehci@00800000 {
+		usb1: ehci@800000 {
 			status = "okay";
 		};
 	};
diff --git a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
index 9d725f983282..497bb065eb9d 100644
--- a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
@@ -397,23 +397,23 @@
 					xoadc-ref-supply = <&pm8058_l18>;
 
 					/* Board-specific channels */
-					mpp5@05 {
+					mpp5@5 {
 						/* Connected to AOUT of ALS sensor */
 						reg = <0x00 0x05>;
 					};
-					mpp6@06 {
+					mpp6@6 {
 						/* Connected to test point TP43 */
 						reg = <0x00 0x06>;
 					};
-					mpp7@07 {
+					mpp7@7 {
 						/* Connected to battery thermistor */
 						reg = <0x00 0x07>;
 					};
-					mpp8@08 {
+					mpp8@8 {
 						/* Connected to battery ID detector */
 						reg = <0x00 0x08>;
 					};
-					mpp9@09 {
+					mpp9@9 {
 						/* Connected to XO thermistor */
 						reg = <0x00 0x09>;
 					};
@@ -512,7 +512,7 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&dragon_gsbi12_i2c_pins>;
 
-				ak8975@0c {
+				ak8975@c {
 					compatible = "asahi-kasei,ak8975";
 					reg = <0x0c>;
 					/* FIXME: GPIO33 has interrupt 224 on the PM8058 */
diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 1b5d31b33b5e..a5fef54f4718 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -316,37 +316,37 @@
 					#size-cells = <0>;
 					#io-channel-cells = <2>;
 
-					vcoin: adc-channel@00 {
+					vcoin: adc-channel@0 {
 						reg = <0x00 0x00>;
 					};
-					vbat: adc-channel@01 {
+					vbat: adc-channel@1 {
 						reg = <0x00 0x01>;
 					};
-					dcin: adc-channel@02 {
+					dcin: adc-channel@2 {
 						reg = <0x00 0x02>;
 					};
-					ichg: adc-channel@03 {
+					ichg: adc-channel@3 {
 						reg = <0x00 0x03>;
 					};
-					vph_pwr: adc-channel@04 {
+					vph_pwr: adc-channel@4 {
 						reg = <0x00 0x04>;
 					};
-					usb_vbus: adc-channel@0a {
+					usb_vbus: adc-channel@a {
 						reg = <0x00 0x0a>;
 					};
-					die_temp: adc-channel@0b {
+					die_temp: adc-channel@b {
 						reg = <0x00 0x0b>;
 					};
-					ref_625mv: adc-channel@0c {
+					ref_625mv: adc-channel@c {
 						reg = <0x00 0x0c>;
 					};
-					ref_1250mv: adc-channel@0d {
+					ref_1250mv: adc-channel@d {
 						reg = <0x00 0x0d>;
 					};
-					ref_325mv: adc-channel@0e {
+					ref_325mv: adc-channel@e {
 						reg = <0x00 0x0e>;
 					};
-					ref_muxoff: adc-channel@0f {
+					ref_muxoff: adc-channel@f {
 						reg = <0x00 0x0f>;
 					};
 				};
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index a39207625354..0e3fffe30e57 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -17,27 +17,27 @@
 		#size-cells = <1>;
 		ranges;
 
-		mpss@08000000 {
+		mpss@8000000 {
 			reg = <0x08000000 0x5100000>;
 			no-map;
 		};
 
-		mba@00d100000 {
+		mba@d100000 {
 			reg = <0x0d100000 0x100000>;
 			no-map;
 		};
 
-		reserved@0d200000 {
+		reserved@d200000 {
 			reg = <0x0d200000 0xa00000>;
 			no-map;
 		};
 
-		adsp_region: adsp@0dc00000 {
+		adsp_region: adsp@dc00000 {
 			reg = <0x0dc00000 0x1900000>;
 			no-map;
 		};
 
-		venus@0f500000 {
+		venus@f500000 {
 			reg = <0x0f500000 0x500000>;
 			no-map;
 		};
@@ -47,17 +47,17 @@
 			no-map;
 		};
 
-		tz@0fc00000 {
+		tz@fc00000 {
 			reg = <0x0fc00000 0x160000>;
 			no-map;
 		};
 
-		rfsa@0fd60000 {
+		rfsa@fd60000 {
 			reg = <0x0fd60000 0x20000>;
 			no-map;
 		};
 
-		rmtfs@0fd80000 {
+		rmtfs@fd80000 {
 			reg = <0x0fd80000 0x180000>;
 			no-map;
 		};
diff --git a/arch/arm/boot/dts/rk3066a-rayeager.dts b/arch/arm/boot/dts/rk3066a-rayeager.dts
index 400cbf9609e3..cdf301f5778b 100644
--- a/arch/arm/boot/dts/rk3066a-rayeager.dts
+++ b/arch/arm/boot/dts/rk3066a-rayeager.dts
@@ -196,7 +196,7 @@
 	clock-frequency = <400000>;
 	status = "okay";
 
-	ak8963: ak8963@0d {
+	ak8963: ak8963@d {
 		compatible = "asahi-kasei,ak8975";
 		reg = <0x0d>;
 		interrupt-parent = <&gpio4>;
diff --git a/arch/arm/boot/dts/rk3288-popmetal.dts b/arch/arm/boot/dts/rk3288-popmetal.dts
index f084e0c8dcb3..c06d0f4ceb81 100644
--- a/arch/arm/boot/dts/rk3288-popmetal.dts
+++ b/arch/arm/boot/dts/rk3288-popmetal.dts
@@ -384,7 +384,7 @@
 	status = "okay";
 	clock-frequency = <400000>;
 
-	ak8963: ak8963@0d {
+	ak8963: ak8963@d {
 		compatible = "asahi-kasei,ak8975";
 		reg = <0x0d>;
 		interrupt-parent = <&gpio8>;
diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index 38d2216c7ead..a6a0435eed6e 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -124,7 +124,7 @@
 		};
 	};
 
-	ns_sram: sram@00200000 {
+	ns_sram: sram@200000 {
 		compatible = "mmio-sram";
 		reg = <0x00200000 0x20000>;
 	};
@@ -135,13 +135,13 @@
 		#size-cells = <1>;
 		ranges;
 
-		nfc_sram: sram@00100000 {
+		nfc_sram: sram@100000 {
 			compatible = "mmio-sram";
 			no-memory-wc;
 			reg = <0x00100000 0x2400>;
 		};
 
-		usb0: gadget@00300000 {
+		usb0: gadget@300000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "atmel,sama5d3-udc";
@@ -271,7 +271,7 @@
 			};
 		};
 
-		usb1: ohci@00400000 {
+		usb1: ohci@400000 {
 			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
 			reg = <0x00400000 0x100000>;
 			interrupts = <41 IRQ_TYPE_LEVEL_HIGH 2>;
@@ -280,7 +280,7 @@
 			status = "disabled";
 		};
 
-		usb2: ehci@00500000 {
+		usb2: ehci@500000 {
 			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
 			reg = <0x00500000 0x100000>;
 			interrupts = <41 IRQ_TYPE_LEVEL_HIGH 2>;
@@ -289,7 +289,7 @@
 			status = "disabled";
 		};
 
-		L2: cache-controller@00a00000 {
+		L2: cache-controller@a00000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x00a00000 0x1000>;
 			interrupts = <63 IRQ_TYPE_LEVEL_HIGH 4>;
diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index 554d0bdedc7a..1889b4dea066 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -79,7 +79,7 @@
 		};
 	};
 
-	sram: sram@00300000 {
+	sram: sram@300000 {
 		compatible = "mmio-sram";
 		reg = <0x00300000 0x20000>;
 	};
@@ -1408,7 +1408,7 @@
 			reg = <0x200000 0x2400>;
 		};
 
-		usb0: gadget@00500000 {
+		usb0: gadget@500000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "atmel,sama5d3-udc";
@@ -1525,7 +1525,7 @@
 			};
 		};
 
-		usb1: ohci@00600000 {
+		usb1: ohci@600000 {
 			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
 			reg = <0x00600000 0x100000>;
 			interrupts = <32 IRQ_TYPE_LEVEL_HIGH 2>;
@@ -1534,7 +1534,7 @@
 			status = "disabled";
 		};
 
-		usb2: ehci@00700000 {
+		usb2: ehci@700000 {
 			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
 			reg = <0x00700000 0x100000>;
 			interrupts = <32 IRQ_TYPE_LEVEL_HIGH 2>;
diff --git a/arch/arm/boot/dts/sama5d3xmb.dtsi b/arch/arm/boot/dts/sama5d3xmb.dtsi
index 6d252ad050f6..7f55050dd405 100644
--- a/arch/arm/boot/dts/sama5d3xmb.dtsi
+++ b/arch/arm/boot/dts/sama5d3xmb.dtsi
@@ -166,14 +166,14 @@
 			};
 		};
 
-		usb0: gadget@00500000 {
+		usb0: gadget@500000 {
 			atmel,vbus-gpio = <&pioD 29 GPIO_ACTIVE_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_usba_vbus>;
 			status = "okay";
 		};
 
-		usb1: ohci@00600000 {
+		usb1: ohci@600000 {
 			num-ports = <3>;
 			atmel,vbus-gpio = <&pioD 25 GPIO_ACTIVE_HIGH
 					   &pioD 26 GPIO_ACTIVE_LOW
@@ -182,7 +182,7 @@
 			status = "okay";
 		};
 
-		usb2: ehci@00700000 {
+		usb2: ehci@700000 {
 			status = "okay";
 		};
 	};
diff --git a/arch/arm/boot/dts/sama5d3xmb_cmp.dtsi b/arch/arm/boot/dts/sama5d3xmb_cmp.dtsi
index 252e0d35f846..83e3d3e08fd4 100644
--- a/arch/arm/boot/dts/sama5d3xmb_cmp.dtsi
+++ b/arch/arm/boot/dts/sama5d3xmb_cmp.dtsi
@@ -253,7 +253,7 @@
 			};
 		};
 
-		usb0: gadget@00500000 {
+		usb0: gadget@500000 {
 			atmel,vbus-gpio = <&pioD 29 GPIO_ACTIVE_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_usba_vbus>;
diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
index 2fa36c525957..b069644ed238 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -113,7 +113,7 @@
 		};
 	};
 
-	ns_sram: sram@00210000 {
+	ns_sram: sram@210000 {
 		compatible = "mmio-sram";
 		reg = <0x00210000 0x10000>;
 	};
@@ -130,7 +130,7 @@
 			reg = <0x100000 0x2400>;
 		};
 
-		usb0: gadget@00400000 {
+		usb0: gadget@400000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "atmel,sama5d3-udc";
@@ -260,7 +260,7 @@
 			};
 		};
 
-		usb1: ohci@00500000 {
+		usb1: ohci@500000 {
 			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
 			reg = <0x00500000 0x100000>;
 			interrupts = <46 IRQ_TYPE_LEVEL_HIGH 2>;
@@ -269,7 +269,7 @@
 			status = "disabled";
 		};
 
-		usb2: ehci@00600000 {
+		usb2: ehci@600000 {
 			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
 			reg = <0x00600000 0x100000>;
 			interrupts = <46 IRQ_TYPE_LEVEL_HIGH 2>;
@@ -278,7 +278,7 @@
 			status = "disabled";
 		};
 
-		L2: cache-controller@00a00000 {
+		L2: cache-controller@a00000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x00a00000 0x1000>;
 			interrupts = <67 IRQ_TYPE_LEVEL_HIGH 4>;
diff --git a/arch/arm/boot/dts/ste-href-stuib.dtsi b/arch/arm/boot/dts/ste-href-stuib.dtsi
index 6f720756057d..35e944d8b5c4 100644
--- a/arch/arm/boot/dts/ste-href-stuib.dtsi
+++ b/arch/arm/boot/dts/ste-href-stuib.dtsi
@@ -92,7 +92,7 @@
 				interrupts = <18 IRQ_TYPE_EDGE_RISING>,
 					     <19 IRQ_TYPE_EDGE_RISING>;
 			};
-			ak8974@0f {
+			ak8974@f {
 				/* Magnetometer */
 				compatible = "asahi-kasei,ak8974";
 				reg = <0x0f>;
diff --git a/arch/arm/boot/dts/ste-href-tvk1281618.dtsi b/arch/arm/boot/dts/ste-href-tvk1281618.dtsi
index 3c9f2f068c2f..0e7d77d719d7 100644
--- a/arch/arm/boot/dts/ste-href-tvk1281618.dtsi
+++ b/arch/arm/boot/dts/ste-href-tvk1281618.dtsi
@@ -143,7 +143,7 @@
 				interrupts = <18 IRQ_TYPE_EDGE_RISING>,
 					     <19 IRQ_TYPE_EDGE_RISING>;
 			};
-			ak8974@0f {
+			ak8974@f {
 				/* Magnetometer */
 				compatible = "asahi-kasei,ak8974";
 				reg = <0x0f>;
diff --git a/arch/arm/boot/dts/stih407-clock.dtsi b/arch/arm/boot/dts/stih407-clock.dtsi
index 34c119a66f14..d0a24d9e517a 100644
--- a/arch/arm/boot/dts/stih407-clock.dtsi
+++ b/arch/arm/boot/dts/stih407-clock.dtsi
@@ -90,7 +90,7 @@
 			clock-output-names = "clk-s-icn-reg-0";
 		};
 
-		clockgen-a@090ff000 {
+		clockgen-a@90ff000 {
 			compatible = "st,clkgen-c32";
 			reg = <0x90ff000 0x1000>;
 
@@ -131,7 +131,7 @@
 			clock-critical = <0>; /* clk-s-c0-fs0-ch0 */
 		};
 
-		clk_s_c0: clockgen-c@09103000 {
+		clk_s_c0: clockgen-c@9103000 {
 			compatible = "st,clkgen-c32";
 			reg = <0x9103000 0x1000>;
 
@@ -220,7 +220,7 @@
 					     "clk-s-d0-fs0-ch3";
 		};
 
-		clockgen-d0@09104000 {
+		clockgen-d0@9104000 {
 			compatible = "st,clkgen-c32";
 			reg = <0x9104000 0x1000>;
 
diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 12c0757594d7..cf3756976c39 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -72,19 +72,19 @@
 		};
 	};
 
-	intc: interrupt-controller@08761000 {
+	intc: interrupt-controller@8761000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x08761000 0x1000>, <0x08760100 0x100>;
 	};
 
-	scu@08760000 {
+	scu@8760000 {
 		compatible = "arm,cortex-a9-scu";
 		reg = <0x08760000 0x1000>;
 	};
 
-	timer@08760200 {
+	timer@8760200 {
 		interrupt-parent = <&intc>;
 		compatible = "arm,cortex-a9-global-timer";
 		reg = <0x08760200 0x100>;
@@ -555,7 +555,7 @@
 			status = "disabled";
 		};
 
-		mmc0: sdhci@09060000 {
+		mmc0: sdhci@9060000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09060000 0x7ff>, <0x9061008 0x20>;
@@ -570,7 +570,7 @@
 			bus-width = <8>;
 		};
 
-		mmc1: sdhci@09080000 {
+		mmc1: sdhci@9080000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09080000 0x7ff>;
@@ -715,14 +715,14 @@
 			status		= "disabled";
 		};
 
-		rng10: rng@08a89000 {
+		rng10: rng@8a89000 {
 			compatible      = "st,rng";
 			reg		= <0x08a89000 0x1000>;
 			clocks          = <&clk_sysin>;
 			status		= "okay";
 		};
 
-		rng11: rng@08a8a000 {
+		rng11: rng@8a8a000 {
 			compatible      = "st,rng";
 			reg		= <0x08a8a000 0x1000>;
 			clocks          = <&clk_sysin>;
@@ -756,14 +756,14 @@
 				 <&clk_s_c0_flexgen CLK_ETH_PHY>;
 		};
 
-		rng10: rng@08a89000 {
+		rng10: rng@8a89000 {
 			compatible      = "st,rng";
 			reg		= <0x08a89000 0x1000>;
 			clocks          = <&clk_sysin>;
 			status		= "okay";
 		};
 
-		rng11: rng@08a8a000 {
+		rng11: rng@8a8a000 {
 			compatible      = "st,rng";
 			reg		= <0x08a8a000 0x1000>;
 			clocks          = <&clk_sysin>;
diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index bd1a82e8fffe..a29090077fdf 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -56,7 +56,7 @@
 			interrupt-names = "irqmux";
 			ranges = <0 0x09610000 0x6000>;
 
-			pio0: gpio@09610000 {
+			pio0: gpio@9610000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -64,7 +64,7 @@
 				reg = <0x0 0x100>;
 				st,bank-name = "PIO0";
 			};
-			pio1: gpio@09611000 {
+			pio1: gpio@9611000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -72,7 +72,7 @@
 				reg = <0x1000 0x100>;
 				st,bank-name = "PIO1";
 			};
-			pio2: gpio@09612000 {
+			pio2: gpio@9612000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -80,7 +80,7 @@
 				reg = <0x2000 0x100>;
 				st,bank-name = "PIO2";
 			};
-			pio3: gpio@09613000 {
+			pio3: gpio@9613000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -88,7 +88,7 @@
 				reg = <0x3000 0x100>;
 				st,bank-name = "PIO3";
 			};
-			pio4: gpio@09614000 {
+			pio4: gpio@9614000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -97,7 +97,7 @@
 				st,bank-name = "PIO4";
 			};
 
-			pio5: gpio@09615000 {
+			pio5: gpio@9615000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -380,7 +380,7 @@
 			interrupt-names = "irqmux";
 			ranges = <0 0x09200000 0x10000>;
 
-			pio10: pio@09200000 {
+			pio10: pio@9200000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -388,7 +388,7 @@
 				reg = <0x0 0x100>;
 				st,bank-name = "PIO10";
 			};
-			pio11: pio@09201000 {
+			pio11: pio@9201000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -396,7 +396,7 @@
 				reg = <0x1000 0x100>;
 				st,bank-name = "PIO11";
 			};
-			pio12: pio@09202000 {
+			pio12: pio@9202000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -404,7 +404,7 @@
 				reg = <0x2000 0x100>;
 				st,bank-name = "PIO12";
 			};
-			pio13: pio@09203000 {
+			pio13: pio@9203000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -412,7 +412,7 @@
 				reg = <0x3000 0x100>;
 				st,bank-name = "PIO13";
 			};
-			pio14: pio@09204000 {
+			pio14: pio@9204000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -420,7 +420,7 @@
 				reg = <0x4000 0x100>;
 				st,bank-name = "PIO14";
 			};
-			pio15: pio@09205000 {
+			pio15: pio@9205000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -428,7 +428,7 @@
 				reg = <0x5000 0x100>;
 				st,bank-name = "PIO15";
 			};
-			pio16: pio@09206000 {
+			pio16: pio@9206000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -436,7 +436,7 @@
 				reg = <0x6000 0x100>;
 				st,bank-name = "PIO16";
 			};
-			pio17: pio@09207000 {
+			pio17: pio@9207000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -444,7 +444,7 @@
 				reg = <0x7000 0x100>;
 				st,bank-name = "PIO17";
 			};
-			pio18: pio@09208000 {
+			pio18: pio@9208000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -452,7 +452,7 @@
 				reg = <0x8000 0x100>;
 				st,bank-name = "PIO18";
 			};
-			pio19: pio@09209000 {
+			pio19: pio@9209000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -940,7 +940,7 @@
 			interrupt-names = "irqmux";
 			ranges = <0 0x09210000 0x10000>;
 
-			pio20: pio@09210000 {
+			pio20: pio@9210000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -973,7 +973,7 @@
 			interrupt-names = "irqmux";
 			ranges = <0 0x09220000 0x6000>;
 
-			pio30: gpio@09220000 {
+			pio30: gpio@9220000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -981,7 +981,7 @@
 				reg = <0x0 0x100>;
 				st,bank-name = "PIO30";
 			};
-			pio31: gpio@09221000 {
+			pio31: gpio@9221000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -989,7 +989,7 @@
 				reg = <0x1000 0x100>;
 				st,bank-name = "PIO31";
 			};
-			pio32: gpio@09222000 {
+			pio32: gpio@9222000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -997,7 +997,7 @@
 				reg = <0x2000 0x100>;
 				st,bank-name = "PIO32";
 			};
-			pio33: gpio@09223000 {
+			pio33: gpio@9223000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -1005,7 +1005,7 @@
 				reg = <0x3000 0x100>;
 				st,bank-name = "PIO33";
 			};
-			pio34: gpio@09224000 {
+			pio34: gpio@9224000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -1013,7 +1013,7 @@
 				reg = <0x4000 0x100>;
 				st,bank-name = "PIO34";
 			};
-			pio35: gpio@09225000 {
+			pio35: gpio@9225000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -1168,7 +1168,7 @@
 			interrupt-names = "irqmux";
 			ranges = <0 0x09230000 0x3000>;
 
-			pio40: gpio@09230000 {
+			pio40: gpio@9230000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -1176,7 +1176,7 @@
 				reg = <0 0x100>;
 				st,bank-name = "PIO40";
 			};
-			pio41: gpio@09231000 {
+			pio41: gpio@9231000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
@@ -1184,7 +1184,7 @@
 				reg = <0x1000 0x100>;
 				st,bank-name = "PIO41";
 			};
-			pio42: gpio@09232000 {
+			pio42: gpio@9232000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupt-controller;
diff --git a/arch/arm/boot/dts/stih410-b2120.dts b/arch/arm/boot/dts/stih410-b2120.dts
index 83313b51915d..9830be577433 100644
--- a/arch/arm/boot/dts/stih410-b2120.dts
+++ b/arch/arm/boot/dts/stih410-b2120.dts
@@ -30,7 +30,7 @@
 
 	soc {
 
-		mmc0: sdhci@09060000 {
+		mmc0: sdhci@9060000 {
 			max-frequency = <200000000>;
 			sd-uhs-sdr50;
 			sd-uhs-sdr104;
diff --git a/arch/arm/boot/dts/stih410-b2260.dts b/arch/arm/boot/dts/stih410-b2260.dts
index 93c14d183e29..c663b70c43a7 100644
--- a/arch/arm/boot/dts/stih410-b2260.dts
+++ b/arch/arm/boot/dts/stih410-b2260.dts
@@ -109,14 +109,14 @@
 			status = "okay";
 		};
 
-		mmc0: sdhci@09060000 {
+		mmc0: sdhci@9060000 {
 			pinctrl-0 = <&pinctrl_sd0>;
 			bus-width = <4>;
 			status = "okay";
 		};
 
 		/* high speed expansion connector */
-		mmc1: sdhci@09080000 {
+		mmc1: sdhci@9080000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/stih410-clock.dtsi b/arch/arm/boot/dts/stih410-clock.dtsi
index 07c8ef9d77f6..fde5df17f575 100644
--- a/arch/arm/boot/dts/stih410-clock.dtsi
+++ b/arch/arm/boot/dts/stih410-clock.dtsi
@@ -92,7 +92,7 @@
 			clock-output-names = "clk-s-icn-reg-0";
 		};
 
-		clockgen-a@090ff000 {
+		clockgen-a@90ff000 {
 			compatible = "st,clkgen-c32";
 			reg = <0x90ff000 0x1000>;
 
@@ -134,7 +134,7 @@
 			clock-critical = <0>; /* clk-s-c0-fs0-ch0 */
 		};
 
-		clk_s_c0: clockgen-c@09103000 {
+		clk_s_c0: clockgen-c@9103000 {
 			compatible = "st,clkgen-c32";
 			reg = <0x9103000 0x1000>;
 
@@ -230,7 +230,7 @@
 					     "clk-s-d0-fs0-ch3";
 		};
 
-		clockgen-d0@09104000 {
+		clockgen-d0@9104000 {
 			compatible = "st,clkgen-c32";
 			reg = <0x9104000 0x1000>;
 
diff --git a/arch/arm/boot/dts/stih410.dtsi b/arch/arm/boot/dts/stih410.dtsi
index 21fe72b183d8..cffa50db5d72 100644
--- a/arch/arm/boot/dts/stih410.dtsi
+++ b/arch/arm/boot/dts/stih410.dtsi
@@ -282,7 +282,7 @@
 				 <&clk_s_c0_flexgen CLK_FLASH_PROMIP>;
 		};
 
-		sti-cec@094a087c {
+		sti-cec@94a087c {
 			compatible = "st,stih-cec";
 			reg = <0x94a087c 0x64>;
 			clocks = <&clk_sysin>;
diff --git a/arch/arm/boot/dts/stih418-b2199.dts b/arch/arm/boot/dts/stih418-b2199.dts
index 438e54c585b1..4e6d915c85ff 100644
--- a/arch/arm/boot/dts/stih418-b2199.dts
+++ b/arch/arm/boot/dts/stih418-b2199.dts
@@ -75,11 +75,11 @@
 			st,i2c-min-sda-pulse-width-us = <5>;
 		};
 
-		mmc1: sdhci@09080000 {
+		mmc1: sdhci@9080000 {
 			status = "okay";
 		};
 
-		mmc0: sdhci@09060000 {
+		mmc0: sdhci@9060000 {
 			status = "okay";
 			max-frequency = <200000000>;
 			sd-uhs-sdr50;
diff --git a/arch/arm/boot/dts/stih418-clock.dtsi b/arch/arm/boot/dts/stih418-clock.dtsi
index ee6614b79f7d..9a157c1a99b1 100644
--- a/arch/arm/boot/dts/stih418-clock.dtsi
+++ b/arch/arm/boot/dts/stih418-clock.dtsi
@@ -92,7 +92,7 @@
 			clock-output-names = "clk-s-icn-reg-0";
 		};
 
-		clockgen-a@090ff000 {
+		clockgen-a@90ff000 {
 			compatible = "st,clkgen-c32";
 			reg = <0x90ff000 0x1000>;
 
@@ -131,7 +131,7 @@
 					     "clk-s-c0-fs0-ch3";
 		};
 
-		clk_s_c0: clockgen-c@09103000 {
+		clk_s_c0: clockgen-c@9103000 {
 			compatible = "st,clkgen-c32";
 			reg = <0x9103000 0x1000>;
 
@@ -223,7 +223,7 @@
 					     "clk-s-d0-fs0-ch3";
 		};
 
-		clockgen-d0@09104000 {
+		clockgen-d0@9104000 {
 			compatible = "st,clkgen-c32";
 			reg = <0x9104000 0x1000>;
 
diff --git a/arch/arm/boot/dts/stih418.dtsi b/arch/arm/boot/dts/stih418.dtsi
index 965f88160718..e6525ab4d9bb 100644
--- a/arch/arm/boot/dts/stih418.dtsi
+++ b/arch/arm/boot/dts/stih418.dtsi
@@ -100,7 +100,7 @@
 			phy-names = "usb";
 		};
 
-		mmc0: sdhci@09060000 {
+		mmc0: sdhci@9060000 {
 			assigned-clocks = <&clk_s_c0_flexgen CLK_MMC_0>;
 			assigned-clock-parents = <&clk_s_c0_pll1 0>;
 			assigned-clock-rates = <200000000>;
diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts/stihxxx-b2120.dtsi
index 4b8f62f89664..7f80c2c414c8 100644
--- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
+++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
@@ -62,12 +62,12 @@
 			status = "okay";
 		};
 
-		mmc0: sdhci@09060000 {
+		mmc0: sdhci@9060000 {
 			non-removable;
 			status = "okay";
 		};
 
-		mmc1: sdhci@09080000 {
+		mmc1: sdhci@9080000 {
 			status = "okay";
 		};
 
@@ -102,7 +102,7 @@
 			fixed-link = <0 1 1000 0 0>;
 		};
 
-		demux@08a20000 {
+		demux@8a20000 {
 			compatible	= "st,stih407-c8sectpfe";
 			status		= "okay";
 			reg		= <0x08a20000 0x10000>,
diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index 41c2579143fd..b9b138a36686 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -179,7 +179,7 @@
 			clock-frequency = <0>;
 		};
 
-		osc24M: clk@01c20050 {
+		osc24M: clk@1c20050 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-osc-clk";
 			reg = <0x01c20050 0x4>;
@@ -203,7 +203,7 @@
 			clock-output-names = "osc32k";
 		};
 
-		pll1: clk@01c20000 {
+		pll1: clk@1c20000 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-pll1-clk";
 			reg = <0x01c20000 0x4>;
@@ -211,7 +211,7 @@
 			clock-output-names = "pll1";
 		};
 
-		pll2: clk@01c20008 {
+		pll2: clk@1c20008 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-pll2-clk";
 			reg = <0x01c20008 0x8>;
@@ -220,7 +220,7 @@
 					     "pll2-4x", "pll2-8x";
 		};
 
-		pll3: clk@01c20010 {
+		pll3: clk@1c20010 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-pll3-clk";
 			reg = <0x01c20010 0x4>;
@@ -237,7 +237,7 @@
 			clock-output-names = "pll3-2x";
 		};
 
-		pll4: clk@01c20018 {
+		pll4: clk@1c20018 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-pll1-clk";
 			reg = <0x01c20018 0x4>;
@@ -245,7 +245,7 @@
 			clock-output-names = "pll4";
 		};
 
-		pll5: clk@01c20020 {
+		pll5: clk@1c20020 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-pll5-clk";
 			reg = <0x01c20020 0x4>;
@@ -253,7 +253,7 @@
 			clock-output-names = "pll5_ddr", "pll5_other";
 		};
 
-		pll6: clk@01c20028 {
+		pll6: clk@1c20028 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-pll6-clk";
 			reg = <0x01c20028 0x4>;
@@ -261,7 +261,7 @@
 			clock-output-names = "pll6_sata", "pll6_other", "pll6";
 		};
 
-		pll7: clk@01c20030 {
+		pll7: clk@1c20030 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-pll3-clk";
 			reg = <0x01c20030 0x4>;
@@ -279,7 +279,7 @@
 		};
 
 		/* dummy is 200M */
-		cpu: cpu@01c20054 {
+		cpu: cpu@1c20054 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-cpu-clk";
 			reg = <0x01c20054 0x4>;
@@ -287,7 +287,7 @@
 			clock-output-names = "cpu";
 		};
 
-		axi: axi@01c20054 {
+		axi: axi@1c20054 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-axi-clk";
 			reg = <0x01c20054 0x4>;
@@ -295,7 +295,7 @@
 			clock-output-names = "axi";
 		};
 
-		axi_gates: clk@01c2005c {
+		axi_gates: clk@1c2005c {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-axi-gates-clk";
 			reg = <0x01c2005c 0x4>;
@@ -304,7 +304,7 @@
 			clock-output-names = "axi_dram";
 		};
 
-		ahb: ahb@01c20054 {
+		ahb: ahb@1c20054 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-ahb-clk";
 			reg = <0x01c20054 0x4>;
@@ -312,7 +312,7 @@
 			clock-output-names = "ahb";
 		};
 
-		ahb_gates: clk@01c20060 {
+		ahb_gates: clk@1c20060 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-ahb-gates-clk";
 			reg = <0x01c20060 0x8>;
@@ -349,7 +349,7 @@
 					     "ahb_mp", "ahb_mali400";
 		};
 
-		apb0: apb0@01c20054 {
+		apb0: apb0@1c20054 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-apb0-clk";
 			reg = <0x01c20054 0x4>;
@@ -357,7 +357,7 @@
 			clock-output-names = "apb0";
 		};
 
-		apb0_gates: clk@01c20068 {
+		apb0_gates: clk@1c20068 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-apb0-gates-clk";
 			reg = <0x01c20068 0x4>;
@@ -372,7 +372,7 @@
 					     "apb0_ir1", "apb0_keypad";
 		};
 
-		apb1: clk@01c20058 {
+		apb1: clk@1c20058 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-apb1-clk";
 			reg = <0x01c20058 0x4>;
@@ -380,7 +380,7 @@
 			clock-output-names = "apb1";
 		};
 
-		apb1_gates: clk@01c2006c {
+		apb1_gates: clk@1c2006c {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-apb1-gates-clk";
 			reg = <0x01c2006c 0x4>;
@@ -403,7 +403,7 @@
 					     "apb1_uart7";
 		};
 
-		nand_clk: clk@01c20080 {
+		nand_clk: clk@1c20080 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c20080 0x4>;
@@ -411,7 +411,7 @@
 			clock-output-names = "nand";
 		};
 
-		ms_clk: clk@01c20084 {
+		ms_clk: clk@1c20084 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c20084 0x4>;
@@ -419,7 +419,7 @@
 			clock-output-names = "ms";
 		};
 
-		mmc0_clk: clk@01c20088 {
+		mmc0_clk: clk@1c20088 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-mmc-clk";
 			reg = <0x01c20088 0x4>;
@@ -429,7 +429,7 @@
 					     "mmc0_sample";
 		};
 
-		mmc1_clk: clk@01c2008c {
+		mmc1_clk: clk@1c2008c {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-mmc-clk";
 			reg = <0x01c2008c 0x4>;
@@ -439,7 +439,7 @@
 					     "mmc1_sample";
 		};
 
-		mmc2_clk: clk@01c20090 {
+		mmc2_clk: clk@1c20090 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-mmc-clk";
 			reg = <0x01c20090 0x4>;
@@ -449,7 +449,7 @@
 					     "mmc2_sample";
 		};
 
-		mmc3_clk: clk@01c20094 {
+		mmc3_clk: clk@1c20094 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-mmc-clk";
 			reg = <0x01c20094 0x4>;
@@ -459,7 +459,7 @@
 					     "mmc3_sample";
 		};
 
-		ts_clk: clk@01c20098 {
+		ts_clk: clk@1c20098 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c20098 0x4>;
@@ -467,7 +467,7 @@
 			clock-output-names = "ts";
 		};
 
-		ss_clk: clk@01c2009c {
+		ss_clk: clk@1c2009c {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c2009c 0x4>;
@@ -475,7 +475,7 @@
 			clock-output-names = "ss";
 		};
 
-		spi0_clk: clk@01c200a0 {
+		spi0_clk: clk@1c200a0 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200a0 0x4>;
@@ -483,7 +483,7 @@
 			clock-output-names = "spi0";
 		};
 
-		spi1_clk: clk@01c200a4 {
+		spi1_clk: clk@1c200a4 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200a4 0x4>;
@@ -491,7 +491,7 @@
 			clock-output-names = "spi1";
 		};
 
-		spi2_clk: clk@01c200a8 {
+		spi2_clk: clk@1c200a8 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200a8 0x4>;
@@ -499,7 +499,7 @@
 			clock-output-names = "spi2";
 		};
 
-		pata_clk: clk@01c200ac {
+		pata_clk: clk@1c200ac {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200ac 0x4>;
@@ -507,7 +507,7 @@
 			clock-output-names = "pata";
 		};
 
-		ir0_clk: clk@01c200b0 {
+		ir0_clk: clk@1c200b0 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200b0 0x4>;
@@ -515,7 +515,7 @@
 			clock-output-names = "ir0";
 		};
 
-		ir1_clk: clk@01c200b4 {
+		ir1_clk: clk@1c200b4 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200b4 0x4>;
@@ -523,7 +523,7 @@
 			clock-output-names = "ir1";
 		};
 
-		spdif_clk: clk@01c200c0 {
+		spdif_clk: clk@1c200c0 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod1-clk";
 			reg = <0x01c200c0 0x4>;
@@ -534,7 +534,7 @@
 			clock-output-names = "spdif";
 		};
 
-		usb_clk: clk@01c200cc {
+		usb_clk: clk@1c200cc {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			compatible = "allwinner,sun4i-a10-usb-clk";
@@ -544,7 +544,7 @@
 					     "usb_phy";
 		};
 
-		spi3_clk: clk@01c200d4 {
+		spi3_clk: clk@1c200d4 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200d4 0x4>;
@@ -552,7 +552,7 @@
 			clock-output-names = "spi3";
 		};
 
-		dram_gates: clk@01c20100 {
+		dram_gates: clk@1c20100 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-dram-gates-clk";
 			reg = <0x01c20100 0x4>;
@@ -577,7 +577,7 @@
 					     "dram_de_mp", "dram_ace";
 		};
 
-		de_be0_clk: clk@01c20104 {
+		de_be0_clk: clk@1c20104 {
 			#clock-cells = <0>;
 			#reset-cells = <0>;
 			compatible = "allwinner,sun4i-a10-display-clk";
@@ -586,7 +586,7 @@
 			clock-output-names = "de-be0";
 		};
 
-		de_be1_clk: clk@01c20108 {
+		de_be1_clk: clk@1c20108 {
 			#clock-cells = <0>;
 			#reset-cells = <0>;
 			compatible = "allwinner,sun4i-a10-display-clk";
@@ -595,7 +595,7 @@
 			clock-output-names = "de-be1";
 		};
 
-		de_fe0_clk: clk@01c2010c {
+		de_fe0_clk: clk@1c2010c {
 			#clock-cells = <0>;
 			#reset-cells = <0>;
 			compatible = "allwinner,sun4i-a10-display-clk";
@@ -604,7 +604,7 @@
 			clock-output-names = "de-fe0";
 		};
 
-		de_fe1_clk: clk@01c20110 {
+		de_fe1_clk: clk@1c20110 {
 			#clock-cells = <0>;
 			#reset-cells = <0>;
 			compatible = "allwinner,sun4i-a10-display-clk";
@@ -614,7 +614,7 @@
 		};
 
 
-		tcon0_ch0_clk: clk@01c20118 {
+		tcon0_ch0_clk: clk@1c20118 {
 			#clock-cells = <0>;
 			#reset-cells = <1>;
 			compatible = "allwinner,sun4i-a10-tcon-ch0-clk";
@@ -624,7 +624,7 @@
 
 		};
 
-		tcon1_ch0_clk: clk@01c2011c {
+		tcon1_ch0_clk: clk@1c2011c {
 			#clock-cells = <0>;
 			#reset-cells = <1>;
 			compatible = "allwinner,sun4i-a10-tcon-ch1-clk";
@@ -634,7 +634,7 @@
 
 		};
 
-		tcon0_ch1_clk: clk@01c2012c {
+		tcon0_ch1_clk: clk@1c2012c {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-tcon-ch0-clk";
 			reg = <0x01c2012c 0x4>;
@@ -643,7 +643,7 @@
 
 		};
 
-		tcon1_ch1_clk: clk@01c20130 {
+		tcon1_ch1_clk: clk@1c20130 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-tcon-ch1-clk";
 			reg = <0x01c20130 0x4>;
@@ -652,7 +652,7 @@
 
 		};
 
-		ve_clk: clk@01c2013c {
+		ve_clk: clk@1c2013c {
 			#clock-cells = <0>;
 			#reset-cells = <0>;
 			compatible = "allwinner,sun4i-a10-ve-clk";
@@ -661,7 +661,7 @@
 			clock-output-names = "ve";
 		};
 
-		codec_clk: clk@01c20140 {
+		codec_clk: clk@1c20140 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-codec-clk";
 			reg = <0x01c20140 0x4>;
@@ -670,20 +670,20 @@
 		};
 	};
 
-	soc@01c00000 {
+	soc@1c00000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
 
-		sram-controller@01c00000 {
+		sram-controller@1c00000 {
 			compatible = "allwinner,sun4i-a10-sram-controller";
 			reg = <0x01c00000 0x30>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
 
-			sram_a: sram@00000000 {
+			sram_a: sram@0 {
 				compatible = "mmio-sram";
 				reg = <0x00000000 0xc000>;
 				#address-cells = <1>;
@@ -697,14 +697,14 @@
 				};
 			};
 
-			sram_d: sram@00010000 {
+			sram_d: sram@10000 {
 				compatible = "mmio-sram";
 				reg = <0x00010000 0x1000>;
 				#address-cells = <1>;
 				#size-cells = <1>;
 				ranges = <0 0x00010000 0x1000>;
 
-				otg_sram: sram-section@0000 {
+				otg_sram: sram-section@0 {
 					compatible = "allwinner,sun4i-a10-sram-d";
 					reg = <0x0000 0x1000>;
 					status = "disabled";
@@ -712,7 +712,7 @@
 			};
 		};
 
-		dma: dma-controller@01c02000 {
+		dma: dma-controller@1c02000 {
 			compatible = "allwinner,sun4i-a10-dma";
 			reg = <0x01c02000 0x1000>;
 			interrupts = <27>;
@@ -720,7 +720,7 @@
 			#dma-cells = <2>;
 		};
 
-		nfc: nand@01c03000 {
+		nfc: nand@1c03000 {
 			compatible = "allwinner,sun4i-a10-nand";
 			reg = <0x01c03000 0x1000>;
 			interrupts = <37>;
@@ -733,7 +733,7 @@
 			#size-cells = <0>;
 		};
 
-		spi0: spi@01c05000 {
+		spi0: spi@1c05000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c05000 0x1000>;
 			interrupts = <10>;
@@ -747,7 +747,7 @@
 			#size-cells = <0>;
 		};
 
-		spi1: spi@01c06000 {
+		spi1: spi@1c06000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c06000 0x1000>;
 			interrupts = <11>;
@@ -761,7 +761,7 @@
 			#size-cells = <0>;
 		};
 
-		emac: ethernet@01c0b000 {
+		emac: ethernet@1c0b000 {
 			compatible = "allwinner,sun4i-a10-emac";
 			reg = <0x01c0b000 0x1000>;
 			interrupts = <55>;
@@ -770,7 +770,7 @@
 			status = "disabled";
 		};
 
-		mdio: mdio@01c0b080 {
+		mdio: mdio@1c0b080 {
 			compatible = "allwinner,sun4i-a10-mdio";
 			reg = <0x01c0b080 0x14>;
 			status = "disabled";
@@ -778,7 +778,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc0: mmc@01c0f000 {
+		mmc0: mmc@1c0f000 {
 			compatible = "allwinner,sun4i-a10-mmc";
 			reg = <0x01c0f000 0x1000>;
 			clocks = <&ahb_gates 8>,
@@ -795,7 +795,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc1: mmc@01c10000 {
+		mmc1: mmc@1c10000 {
 			compatible = "allwinner,sun4i-a10-mmc";
 			reg = <0x01c10000 0x1000>;
 			clocks = <&ahb_gates 9>,
@@ -812,7 +812,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc2: mmc@01c11000 {
+		mmc2: mmc@1c11000 {
 			compatible = "allwinner,sun4i-a10-mmc";
 			reg = <0x01c11000 0x1000>;
 			clocks = <&ahb_gates 10>,
@@ -829,7 +829,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc3: mmc@01c12000 {
+		mmc3: mmc@1c12000 {
 			compatible = "allwinner,sun4i-a10-mmc";
 			reg = <0x01c12000 0x1000>;
 			clocks = <&ahb_gates 11>,
@@ -846,7 +846,7 @@
 			#size-cells = <0>;
 		};
 
-		usb_otg: usb@01c13000 {
+		usb_otg: usb@1c13000 {
 			compatible = "allwinner,sun4i-a10-musb";
 			reg = <0x01c13000 0x0400>;
 			clocks = <&ahb_gates 0>;
@@ -859,7 +859,7 @@
 			status = "disabled";
 		};
 
-		usbphy: phy@01c13400 {
+		usbphy: phy@1c13400 {
 			#phy-cells = <1>;
 			compatible = "allwinner,sun4i-a10-usb-phy";
 			reg = <0x01c13400 0x10 0x01c14800 0x4 0x01c1c800 0x4>;
@@ -871,7 +871,7 @@
 			status = "disabled";
 		};
 
-		ehci0: usb@01c14000 {
+		ehci0: usb@1c14000 {
 			compatible = "allwinner,sun4i-a10-ehci", "generic-ehci";
 			reg = <0x01c14000 0x100>;
 			interrupts = <39>;
@@ -881,7 +881,7 @@
 			status = "disabled";
 		};
 
-		ohci0: usb@01c14400 {
+		ohci0: usb@1c14400 {
 			compatible = "allwinner,sun4i-a10-ohci", "generic-ohci";
 			reg = <0x01c14400 0x100>;
 			interrupts = <64>;
@@ -891,7 +891,7 @@
 			status = "disabled";
 		};
 
-		crypto: crypto-engine@01c15000 {
+		crypto: crypto-engine@1c15000 {
 			compatible = "allwinner,sun4i-a10-crypto";
 			reg = <0x01c15000 0x1000>;
 			interrupts = <86>;
@@ -899,7 +899,7 @@
 			clock-names = "ahb", "mod";
 		};
 
-		spi2: spi@01c17000 {
+		spi2: spi@1c17000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c17000 0x1000>;
 			interrupts = <12>;
@@ -913,7 +913,7 @@
 			#size-cells = <0>;
 		};
 
-		ahci: sata@01c18000 {
+		ahci: sata@1c18000 {
 			compatible = "allwinner,sun4i-a10-ahci";
 			reg = <0x01c18000 0x1000>;
 			interrupts = <56>;
@@ -921,7 +921,7 @@
 			status = "disabled";
 		};
 
-		ehci1: usb@01c1c000 {
+		ehci1: usb@1c1c000 {
 			compatible = "allwinner,sun4i-a10-ehci", "generic-ehci";
 			reg = <0x01c1c000 0x100>;
 			interrupts = <40>;
@@ -931,7 +931,7 @@
 			status = "disabled";
 		};
 
-		ohci1: usb@01c1c400 {
+		ohci1: usb@1c1c400 {
 			compatible = "allwinner,sun4i-a10-ohci", "generic-ohci";
 			reg = <0x01c1c400 0x100>;
 			interrupts = <65>;
@@ -941,7 +941,7 @@
 			status = "disabled";
 		};
 
-		spi3: spi@01c1f000 {
+		spi3: spi@1c1f000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c1f000 0x1000>;
 			interrupts = <50>;
@@ -955,14 +955,14 @@
 			#size-cells = <0>;
 		};
 
-		intc: interrupt-controller@01c20400 {
+		intc: interrupt-controller@1c20400 {
 			compatible = "allwinner,sun4i-a10-ic";
 			reg = <0x01c20400 0x400>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
 		};
 
-		pio: pinctrl@01c20800 {
+		pio: pinctrl@1c20800 {
 			compatible = "allwinner,sun4i-a10-pinctrl";
 			reg = <0x01c20800 0x400>;
 			interrupts = <28>;
@@ -1112,25 +1112,25 @@
 			};
 		};
 
-		timer@01c20c00 {
+		timer@1c20c00 {
 			compatible = "allwinner,sun4i-a10-timer";
 			reg = <0x01c20c00 0x90>;
 			interrupts = <22>;
 			clocks = <&osc24M>;
 		};
 
-		wdt: watchdog@01c20c90 {
+		wdt: watchdog@1c20c90 {
 			compatible = "allwinner,sun4i-a10-wdt";
 			reg = <0x01c20c90 0x10>;
 		};
 
-		rtc: rtc@01c20d00 {
+		rtc: rtc@1c20d00 {
 			compatible = "allwinner,sun4i-a10-rtc";
 			reg = <0x01c20d00 0x20>;
 			interrupts = <24>;
 		};
 
-		pwm: pwm@01c20e00 {
+		pwm: pwm@1c20e00 {
 			compatible = "allwinner,sun4i-a10-pwm";
 			reg = <0x01c20e00 0xc>;
 			clocks = <&osc24M>;
@@ -1138,7 +1138,7 @@
 			status = "disabled";
 		};
 
-		spdif: spdif@01c21000 {
+		spdif: spdif@1c21000 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun4i-a10-spdif";
 			reg = <0x01c21000 0x400>;
@@ -1151,7 +1151,7 @@
 			status = "disabled";
 		};
 
-		ir0: ir@01c21800 {
+		ir0: ir@1c21800 {
 			compatible = "allwinner,sun4i-a10-ir";
 			clocks = <&apb0_gates 6>, <&ir0_clk>;
 			clock-names = "apb", "ir";
@@ -1160,7 +1160,7 @@
 			status = "disabled";
 		};
 
-		ir1: ir@01c21c00 {
+		ir1: ir@1c21c00 {
 			compatible = "allwinner,sun4i-a10-ir";
 			clocks = <&apb0_gates 7>, <&ir1_clk>;
 			clock-names = "apb", "ir";
@@ -1169,14 +1169,14 @@
 			status = "disabled";
 		};
 
-		lradc: lradc@01c22800 {
+		lradc: lradc@1c22800 {
 			compatible = "allwinner,sun4i-a10-lradc-keys";
 			reg = <0x01c22800 0x100>;
 			interrupts = <31>;
 			status = "disabled";
 		};
 
-		codec: codec@01c22c00 {
+		codec: codec@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun4i-a10-codec";
 			reg = <0x01c22c00 0x40>;
@@ -1189,19 +1189,19 @@
 			status = "disabled";
 		};
 
-		sid: eeprom@01c23800 {
+		sid: eeprom@1c23800 {
 			compatible = "allwinner,sun4i-a10-sid";
 			reg = <0x01c23800 0x10>;
 		};
 
-		rtp: rtp@01c25000 {
+		rtp: rtp@1c25000 {
 			compatible = "allwinner,sun4i-a10-ts";
 			reg = <0x01c25000 0x100>;
 			interrupts = <29>;
 			#thermal-sensor-cells = <0>;
 		};
 
-		uart0: serial@01c28000 {
+		uart0: serial@1c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
 			interrupts = <1>;
@@ -1211,7 +1211,7 @@
 			status = "disabled";
 		};
 
-		uart1: serial@01c28400 {
+		uart1: serial@1c28400 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28400 0x400>;
 			interrupts = <2>;
@@ -1221,7 +1221,7 @@
 			status = "disabled";
 		};
 
-		uart2: serial@01c28800 {
+		uart2: serial@1c28800 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28800 0x400>;
 			interrupts = <3>;
@@ -1231,7 +1231,7 @@
 			status = "disabled";
 		};
 
-		uart3: serial@01c28c00 {
+		uart3: serial@1c28c00 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28c00 0x400>;
 			interrupts = <4>;
@@ -1241,7 +1241,7 @@
 			status = "disabled";
 		};
 
-		uart4: serial@01c29000 {
+		uart4: serial@1c29000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c29000 0x400>;
 			interrupts = <17>;
@@ -1251,7 +1251,7 @@
 			status = "disabled";
 		};
 
-		uart5: serial@01c29400 {
+		uart5: serial@1c29400 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c29400 0x400>;
 			interrupts = <18>;
@@ -1261,7 +1261,7 @@
 			status = "disabled";
 		};
 
-		uart6: serial@01c29800 {
+		uart6: serial@1c29800 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c29800 0x400>;
 			interrupts = <19>;
@@ -1271,7 +1271,7 @@
 			status = "disabled";
 		};
 
-		uart7: serial@01c29c00 {
+		uart7: serial@1c29c00 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c29c00 0x400>;
 			interrupts = <20>;
@@ -1281,7 +1281,7 @@
 			status = "disabled";
 		};
 
-		ps20: ps2@01c2a000 {
+		ps20: ps2@1c2a000 {
 			compatible = "allwinner,sun4i-a10-ps2";
 			reg = <0x01c2a000 0x400>;
 			interrupts = <62>;
@@ -1289,7 +1289,7 @@
 			status = "disabled";
 		};
 
-		ps21: ps2@01c2a400 {
+		ps21: ps2@1c2a400 {
 			compatible = "allwinner,sun4i-a10-ps2";
 			reg = <0x01c2a400 0x400>;
 			interrupts = <63>;
@@ -1297,7 +1297,7 @@
 			status = "disabled";
 		};
 
-		i2c0: i2c@01c2ac00 {
+		i2c0: i2c@1c2ac00 {
 			compatible = "allwinner,sun4i-a10-i2c";
 			reg = <0x01c2ac00 0x400>;
 			interrupts = <7>;
@@ -1307,7 +1307,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c1: i2c@01c2b000 {
+		i2c1: i2c@1c2b000 {
 			compatible = "allwinner,sun4i-a10-i2c";
 			reg = <0x01c2b000 0x400>;
 			interrupts = <8>;
@@ -1317,7 +1317,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c2: i2c@01c2b400 {
+		i2c2: i2c@1c2b400 {
 			compatible = "allwinner,sun4i-a10-i2c";
 			reg = <0x01c2b400 0x400>;
 			interrupts = <9>;
@@ -1327,7 +1327,7 @@
 			#size-cells = <0>;
 		};
 
-		can0: can@01c2bc00 {
+		can0: can@1c2bc00 {
 			compatible = "allwinner,sun4i-a10-can";
 			reg = <0x01c2bc00 0x400>;
 			interrupts = <26>;
diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
index 18f25c5e75ae..6ae4d95e230e 100644
--- a/arch/arm/boot/dts/sun5i-a10s.dtsi
+++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
@@ -76,8 +76,8 @@
 		allwinner,pipelines = <&fe0>;
 	};
 
-	soc@01c00000 {
-		hdmi: hdmi@01c16000 {
+	soc@1c00000 {
+		hdmi: hdmi@1c16000 {
 			compatible = "allwinner,sun5i-a10s-hdmi";
 			reg = <0x01c16000 0x1000>;
 			interrupts = <58>;
@@ -111,7 +111,7 @@
 			};
 		};
 
-		pwm: pwm@01c20e00 {
+		pwm: pwm@1c20e00 {
 			compatible = "allwinner,sun5i-a10s-pwm";
 			reg = <0x01c20e00 0xc>;
 			clocks = <&ccu CLK_HOSC>;
diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
index 6436bad94404..4e830f5cb7f1 100644
--- a/arch/arm/boot/dts/sun5i-a13.dtsi
+++ b/arch/arm/boot/dts/sun5i-a13.dtsi
@@ -88,8 +88,8 @@
 		allwinner,pipelines = <&fe0>;
 	};
 
-	soc@01c00000 {
-		pwm: pwm@01c20e00 {
+	soc@1c00000 {
+		pwm: pwm@1c20e00 {
 			compatible = "allwinner,sun5i-a13-pwm";
 			reg = <0x01c20e00 0xc>;
 			clocks = <&ccu CLK_HOSC>;
diff --git a/arch/arm/boot/dts/sun5i-gr8.dtsi b/arch/arm/boot/dts/sun5i-gr8.dtsi
index 3eb56cad0cea..ef0b7446a99d 100644
--- a/arch/arm/boot/dts/sun5i-gr8.dtsi
+++ b/arch/arm/boot/dts/sun5i-gr8.dtsi
@@ -54,8 +54,8 @@
 		allwinner,pipelines = <&fe0>;
 	};
 
-	soc@01c00000 {
-		pwm: pwm@01c20e00 {
+	soc@1c00000 {
+		pwm: pwm@1c20e00 {
 			compatible = "allwinner,sun5i-a10s-pwm";
 			reg = <0x01c20e00 0xc>;
 			clocks = <&ccu CLK_HOSC>;
@@ -63,7 +63,7 @@
 			status = "disabled";
 		};
 
-		spdif: spdif@01c21000 {
+		spdif: spdif@1c21000 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun4i-a10-spdif";
 			reg = <0x01c21000 0x400>;
@@ -76,7 +76,7 @@
 			status = "disabled";
 		};
 
-		i2s0: i2s@01c22400 {
+		i2s0: i2s@1c22400 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun4i-a10-i2s";
 			reg = <0x01c22400 0x400>;
diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 98cc00341b00..07f2248ed5f8 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -93,7 +93,7 @@
 		#size-cells = <1>;
 		ranges;
 
-		osc24M: clk@01c20050 {
+		osc24M: clk@1c20050 {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <24000000>;
@@ -108,20 +108,20 @@
 		};
 	};
 
-	soc@01c00000 {
+	soc@1c00000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
 
-		sram-controller@01c00000 {
+		sram-controller@1c00000 {
 			compatible = "allwinner,sun4i-a10-sram-controller";
 			reg = <0x01c00000 0x30>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
 
-			sram_a: sram@00000000 {
+			sram_a: sram@0 {
 				compatible = "mmio-sram";
 				reg = <0x00000000 0xc000>;
 				#address-cells = <1>;
@@ -135,14 +135,14 @@
 				status = "disabled";
 			};
 
-			sram_d: sram@00010000 {
+			sram_d: sram@10000 {
 				compatible = "mmio-sram";
 				reg = <0x00010000 0x1000>;
 				#address-cells = <1>;
 				#size-cells = <1>;
 				ranges = <0 0x00010000 0x1000>;
 
-				otg_sram: sram-section@0000 {
+				otg_sram: sram-section@0 {
 					compatible = "allwinner,sun4i-a10-sram-d";
 					reg = <0x0000 0x1000>;
 					status = "disabled";
@@ -150,7 +150,7 @@
 			};
 		};
 
-		dma: dma-controller@01c02000 {
+		dma: dma-controller@1c02000 {
 			compatible = "allwinner,sun4i-a10-dma";
 			reg = <0x01c02000 0x1000>;
 			interrupts = <27>;
@@ -158,7 +158,7 @@
 			#dma-cells = <2>;
 		};
 
-		nfc: nand@01c03000 {
+		nfc: nand@1c03000 {
 			compatible = "allwinner,sun4i-a10-nand";
 			reg = <0x01c03000 0x1000>;
 			interrupts = <37>;
@@ -171,7 +171,7 @@
 			#size-cells = <0>;
 		};
 
-		spi0: spi@01c05000 {
+		spi0: spi@1c05000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c05000 0x1000>;
 			interrupts = <10>;
@@ -185,7 +185,7 @@
 			#size-cells = <0>;
 		};
 
-		spi1: spi@01c06000 {
+		spi1: spi@1c06000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c06000 0x1000>;
 			interrupts = <11>;
@@ -199,7 +199,7 @@
 			#size-cells = <0>;
 		};
 
-		tve0: tv-encoder@01c0a000 {
+		tve0: tv-encoder@1c0a000 {
 			compatible = "allwinner,sun4i-a10-tv-encoder";
 			reg = <0x01c0a000 0x1000>;
 			clocks = <&ccu CLK_AHB_TVE>;
@@ -217,7 +217,7 @@
 			};
 		};
 
-		emac: ethernet@01c0b000 {
+		emac: ethernet@1c0b000 {
 			compatible = "allwinner,sun4i-a10-emac";
 			reg = <0x01c0b000 0x1000>;
 			interrupts = <55>;
@@ -226,7 +226,7 @@
 			status = "disabled";
 		};
 
-		mdio: mdio@01c0b080 {
+		mdio: mdio@1c0b080 {
 			compatible = "allwinner,sun4i-a10-mdio";
 			reg = <0x01c0b080 0x14>;
 			status = "disabled";
@@ -234,7 +234,7 @@
 			#size-cells = <0>;
 		};
 
-		tcon0: lcd-controller@01c0c000 {
+		tcon0: lcd-controller@1c0c000 {
 			compatible = "allwinner,sun5i-a13-tcon";
 			reg = <0x01c0c000 0x1000>;
 			interrupts = <44>;
@@ -278,7 +278,7 @@
 			};
 		};
 
-		mmc0: mmc@01c0f000 {
+		mmc0: mmc@1c0f000 {
 			compatible = "allwinner,sun5i-a13-mmc";
 			reg = <0x01c0f000 0x1000>;
 			clocks = <&ccu CLK_AHB_MMC0>, <&ccu CLK_MMC0>;
@@ -289,7 +289,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc1: mmc@01c10000 {
+		mmc1: mmc@1c10000 {
 			compatible = "allwinner,sun5i-a13-mmc";
 			reg = <0x01c10000 0x1000>;
 			clocks = <&ccu CLK_AHB_MMC1>, <&ccu CLK_MMC1>;
@@ -300,7 +300,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc2: mmc@01c11000 {
+		mmc2: mmc@1c11000 {
 			compatible = "allwinner,sun5i-a13-mmc";
 			reg = <0x01c11000 0x1000>;
 			clocks = <&ccu CLK_AHB_MMC2>, <&ccu CLK_MMC2>;
@@ -311,7 +311,7 @@
 			#size-cells = <0>;
 		};
 
-		usb_otg: usb@01c13000 {
+		usb_otg: usb@1c13000 {
 			compatible = "allwinner,sun4i-a10-musb";
 			reg = <0x01c13000 0x0400>;
 			clocks = <&ccu CLK_AHB_OTG>;
@@ -324,7 +324,7 @@
 			status = "disabled";
 		};
 
-		usbphy: phy@01c13400 {
+		usbphy: phy@1c13400 {
 			#phy-cells = <1>;
 			compatible = "allwinner,sun5i-a13-usb-phy";
 			reg = <0x01c13400 0x10 0x01c14800 0x4>;
@@ -336,7 +336,7 @@
 			status = "disabled";
 		};
 
-		ehci0: usb@01c14000 {
+		ehci0: usb@1c14000 {
 			compatible = "allwinner,sun5i-a13-ehci", "generic-ehci";
 			reg = <0x01c14000 0x100>;
 			interrupts = <39>;
@@ -346,7 +346,7 @@
 			status = "disabled";
 		};
 
-		ohci0: usb@01c14400 {
+		ohci0: usb@1c14400 {
 			compatible = "allwinner,sun5i-a13-ohci", "generic-ohci";
 			reg = <0x01c14400 0x100>;
 			interrupts = <40>;
@@ -356,7 +356,7 @@
 			status = "disabled";
 		};
 
-		crypto: crypto-engine@01c15000 {
+		crypto: crypto-engine@1c15000 {
 			compatible = "allwinner,sun5i-a13-crypto",
 				     "allwinner,sun4i-a10-crypto";
 			reg = <0x01c15000 0x1000>;
@@ -365,7 +365,7 @@
 			clock-names = "ahb", "mod";
 		};
 
-		spi2: spi@01c17000 {
+		spi2: spi@1c17000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c17000 0x1000>;
 			interrupts = <12>;
@@ -379,7 +379,7 @@
 			#size-cells = <0>;
 		};
 
-		ccu: clock@01c20000 {
+		ccu: clock@1c20000 {
 			reg = <0x01c20000 0x400>;
 			clocks = <&osc24M>, <&osc32k>;
 			clock-names = "hosc", "losc";
@@ -387,14 +387,14 @@
 			#reset-cells = <1>;
 		};
 
-		intc: interrupt-controller@01c20400 {
+		intc: interrupt-controller@1c20400 {
 			compatible = "allwinner,sun4i-a10-ic";
 			reg = <0x01c20400 0x400>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
 		};
 
-		pio: pinctrl@01c20800 {
+		pio: pinctrl@1c20800 {
 			reg = <0x01c20800 0x400>;
 			interrupts = <28>;
 			clocks = <&ccu CLK_APB0_PIO>, <&osc24M>, <&osc32k>;
@@ -538,19 +538,19 @@
 			};
 		};
 
-		timer@01c20c00 {
+		timer@1c20c00 {
 			compatible = "allwinner,sun4i-a10-timer";
 			reg = <0x01c20c00 0x90>;
 			interrupts = <22>;
 			clocks = <&ccu CLK_HOSC>;
 		};
 
-		wdt: watchdog@01c20c90 {
+		wdt: watchdog@1c20c90 {
 			compatible = "allwinner,sun4i-a10-wdt";
 			reg = <0x01c20c90 0x10>;
 		};
 
-		ir0: ir@01c21800 {
+		ir0: ir@1c21800 {
 			compatible = "allwinner,sun4i-a10-ir";
 			clocks = <&ccu CLK_APB0_IR>, <&ccu CLK_IR>;
 			clock-names = "apb", "ir";
@@ -559,14 +559,14 @@
 			status = "disabled";
 		};
 
-		lradc: lradc@01c22800 {
+		lradc: lradc@1c22800 {
 			compatible = "allwinner,sun4i-a10-lradc-keys";
 			reg = <0x01c22800 0x100>;
 			interrupts = <31>;
 			status = "disabled";
 		};
 
-		codec: codec@01c22c00 {
+		codec: codec@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun4i-a10-codec";
 			reg = <0x01c22c00 0x40>;
@@ -579,19 +579,19 @@
 			status = "disabled";
 		};
 
-		sid: eeprom@01c23800 {
+		sid: eeprom@1c23800 {
 			compatible = "allwinner,sun4i-a10-sid";
 			reg = <0x01c23800 0x10>;
 		};
 
-		rtp: rtp@01c25000 {
+		rtp: rtp@1c25000 {
 			compatible = "allwinner,sun5i-a13-ts";
 			reg = <0x01c25000 0x100>;
 			interrupts = <29>;
 			#thermal-sensor-cells = <0>;
 		};
 
-		uart0: serial@01c28000 {
+		uart0: serial@1c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
 			interrupts = <1>;
@@ -601,7 +601,7 @@
 			status = "disabled";
 		};
 
-		uart1: serial@01c28400 {
+		uart1: serial@1c28400 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28400 0x400>;
 			interrupts = <2>;
@@ -611,7 +611,7 @@
 			status = "disabled";
 		};
 
-		uart2: serial@01c28800 {
+		uart2: serial@1c28800 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28800 0x400>;
 			interrupts = <3>;
@@ -621,7 +621,7 @@
 			status = "disabled";
 		};
 
-		uart3: serial@01c28c00 {
+		uart3: serial@1c28c00 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28c00 0x400>;
 			interrupts = <4>;
@@ -631,7 +631,7 @@
 			status = "disabled";
 		};
 
-		i2c0: i2c@01c2ac00 {
+		i2c0: i2c@1c2ac00 {
 			compatible = "allwinner,sun4i-a10-i2c";
 			reg = <0x01c2ac00 0x400>;
 			interrupts = <7>;
@@ -641,7 +641,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c1: i2c@01c2b000 {
+		i2c1: i2c@1c2b000 {
 			compatible = "allwinner,sun4i-a10-i2c";
 			reg = <0x01c2b000 0x400>;
 			interrupts = <8>;
@@ -651,7 +651,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c2: i2c@01c2b400 {
+		i2c2: i2c@1c2b400 {
 			compatible = "allwinner,sun4i-a10-i2c";
 			reg = <0x01c2b400 0x400>;
 			interrupts = <9>;
@@ -661,14 +661,14 @@
 			#size-cells = <0>;
 		};
 
-		timer@01c60000 {
+		timer@1c60000 {
 			compatible = "allwinner,sun5i-a13-hstimer";
 			reg = <0x01c60000 0x1000>;
 			interrupts = <82>, <83>;
 			clocks = <&ccu CLK_AHB_HSTIMER>;
 		};
 
-		fe0: display-frontend@01e00000 {
+		fe0: display-frontend@1e00000 {
 			compatible = "allwinner,sun5i-a13-display-frontend";
 			reg = <0x01e00000 0x20000>;
 			interrupts = <47>;
@@ -696,7 +696,7 @@
 			};
 		};
 
-		be0: display-backend@01e60000 {
+		be0: display-backend@1e60000 {
 			compatible = "allwinner,sun5i-a13-display-backend";
 			reg = <0x01e60000 0x10000>;
 			interrupts = <47>;
diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index b147cb0dc14b..6baf5913eb1f 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -221,7 +221,7 @@
 			clock-output-names = "gmac_int_tx";
 		};
 
-		gmac_tx_clk: clk@01c200d0 {
+		gmac_tx_clk: clk@1c200d0 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun7i-a20-gmac-clk";
 			reg = <0x01c200d0 0x4>;
@@ -236,13 +236,13 @@
 		status = "disabled";
 	};
 
-	soc@01c00000 {
+	soc@1c00000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
 
-		dma: dma-controller@01c02000 {
+		dma: dma-controller@1c02000 {
 			compatible = "allwinner,sun6i-a31-dma";
 			reg = <0x01c02000 0x1000>;
 			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
@@ -251,7 +251,7 @@
 			#dma-cells = <1>;
 		};
 
-		tcon0: lcd-controller@01c0c000 {
+		tcon0: lcd-controller@1c0c000 {
 			compatible = "allwinner,sun6i-a31-tcon";
 			reg = <0x01c0c000 0x1000>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
@@ -288,7 +288,7 @@
 			};
 		};
 
-		tcon1: lcd-controller@01c0d000 {
+		tcon1: lcd-controller@1c0d000 {
 			compatible = "allwinner,sun6i-a31-tcon";
 			reg = <0x01c0d000 0x1000>;
 			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
@@ -325,7 +325,7 @@
 			};
 		};
 
-		mmc0: mmc@01c0f000 {
+		mmc0: mmc@1c0f000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c0f000 0x1000>;
 			clocks = <&ccu CLK_AHB1_MMC0>,
@@ -344,7 +344,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc1: mmc@01c10000 {
+		mmc1: mmc@1c10000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c10000 0x1000>;
 			clocks = <&ccu CLK_AHB1_MMC1>,
@@ -363,7 +363,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc2: mmc@01c11000 {
+		mmc2: mmc@1c11000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c11000 0x1000>;
 			clocks = <&ccu CLK_AHB1_MMC2>,
@@ -382,7 +382,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc3: mmc@01c12000 {
+		mmc3: mmc@1c12000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c12000 0x1000>;
 			clocks = <&ccu CLK_AHB1_MMC3>,
@@ -401,7 +401,7 @@
 			#size-cells = <0>;
 		};
 
-		usb_otg: usb@01c19000 {
+		usb_otg: usb@1c19000 {
 			compatible = "allwinner,sun6i-a31-musb";
 			reg = <0x01c19000 0x0400>;
 			clocks = <&ccu CLK_AHB1_OTG>;
@@ -414,7 +414,7 @@
 			status = "disabled";
 		};
 
-		usbphy: phy@01c19400 {
+		usbphy: phy@1c19400 {
 			compatible = "allwinner,sun6i-a31-usb-phy";
 			reg = <0x01c19400 0x10>,
 			      <0x01c1a800 0x4>,
@@ -438,7 +438,7 @@
 			#phy-cells = <1>;
 		};
 
-		ehci0: usb@01c1a000 {
+		ehci0: usb@1c1a000 {
 			compatible = "allwinner,sun6i-a31-ehci", "generic-ehci";
 			reg = <0x01c1a000 0x100>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
@@ -449,7 +449,7 @@
 			status = "disabled";
 		};
 
-		ohci0: usb@01c1a400 {
+		ohci0: usb@1c1a400 {
 			compatible = "allwinner,sun6i-a31-ohci", "generic-ohci";
 			reg = <0x01c1a400 0x100>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
@@ -460,7 +460,7 @@
 			status = "disabled";
 		};
 
-		ehci1: usb@01c1b000 {
+		ehci1: usb@1c1b000 {
 			compatible = "allwinner,sun6i-a31-ehci", "generic-ehci";
 			reg = <0x01c1b000 0x100>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
@@ -471,7 +471,7 @@
 			status = "disabled";
 		};
 
-		ohci1: usb@01c1b400 {
+		ohci1: usb@1c1b400 {
 			compatible = "allwinner,sun6i-a31-ohci", "generic-ohci";
 			reg = <0x01c1b400 0x100>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
@@ -482,7 +482,7 @@
 			status = "disabled";
 		};
 
-		ohci2: usb@01c1c400 {
+		ohci2: usb@1c1c400 {
 			compatible = "allwinner,sun6i-a31-ohci", "generic-ohci";
 			reg = <0x01c1c400 0x100>;
 			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
@@ -491,7 +491,7 @@
 			status = "disabled";
 		};
 
-		ccu: clock@01c20000 {
+		ccu: clock@1c20000 {
 			compatible = "allwinner,sun6i-a31-ccu";
 			reg = <0x01c20000 0x400>;
 			clocks = <&osc24M>, <&osc32k>;
@@ -500,7 +500,7 @@
 			#reset-cells = <1>;
 		};
 
-		pio: pinctrl@01c20800 {
+		pio: pinctrl@1c20800 {
 			compatible = "allwinner,sun6i-a31-pinctrl";
 			reg = <0x01c20800 0x400>;
 			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
@@ -633,7 +633,7 @@
 			};
 		};
 
-		timer@01c20c00 {
+		timer@1c20c00 {
 			compatible = "allwinner,sun4i-a10-timer";
 			reg = <0x01c20c00 0xa0>;
 			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
@@ -644,12 +644,12 @@
 			clocks = <&osc24M>;
 		};
 
-		wdt1: watchdog@01c20ca0 {
+		wdt1: watchdog@1c20ca0 {
 			compatible = "allwinner,sun6i-a31-wdt";
 			reg = <0x01c20ca0 0x20>;
 		};
 
-		spdif: spdif@01c21000 {
+		spdif: spdif@1c21000 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun6i-a31-spdif";
 			reg = <0x01c21000 0x400>;
@@ -662,21 +662,21 @@
 			status = "disabled";
 		};
 
-		lradc: lradc@01c22800 {
+		lradc: lradc@1c22800 {
 			compatible = "allwinner,sun4i-a10-lradc-keys";
 			reg = <0x01c22800 0x100>;
 			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
-		rtp: rtp@01c25000 {
+		rtp: rtp@1c25000 {
 			compatible = "allwinner,sun6i-a31-ts";
 			reg = <0x01c25000 0x100>;
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 			#thermal-sensor-cells = <0>;
 		};
 
-		uart0: serial@01c28000 {
+		uart0: serial@1c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
@@ -689,7 +689,7 @@
 			status = "disabled";
 		};
 
-		uart1: serial@01c28400 {
+		uart1: serial@1c28400 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
@@ -702,7 +702,7 @@
 			status = "disabled";
 		};
 
-		uart2: serial@01c28800 {
+		uart2: serial@1c28800 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
@@ -715,7 +715,7 @@
 			status = "disabled";
 		};
 
-		uart3: serial@01c28c00 {
+		uart3: serial@1c28c00 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
@@ -728,7 +728,7 @@
 			status = "disabled";
 		};
 
-		uart4: serial@01c29000 {
+		uart4: serial@1c29000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c29000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
@@ -741,7 +741,7 @@
 			status = "disabled";
 		};
 
-		uart5: serial@01c29400 {
+		uart5: serial@1c29400 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c29400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
@@ -754,7 +754,7 @@
 			status = "disabled";
 		};
 
-		i2c0: i2c@01c2ac00 {
+		i2c0: i2c@1c2ac00 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x01c2ac00 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
@@ -765,7 +765,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c1: i2c@01c2b000 {
+		i2c1: i2c@1c2b000 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x01c2b000 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -776,7 +776,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c2: i2c@01c2b400 {
+		i2c2: i2c@1c2b400 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x01c2b400 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
@@ -787,7 +787,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c3: i2c@01c2b800 {
+		i2c3: i2c@1c2b800 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x01c2b800 0x400>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
@@ -798,7 +798,7 @@
 			#size-cells = <0>;
 		};
 
-		gmac: ethernet@01c30000 {
+		gmac: ethernet@1c30000 {
 			compatible = "allwinner,sun7i-a20-gmac";
 			reg = <0x01c30000 0x1054>;
 			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
@@ -815,7 +815,7 @@
 			#size-cells = <0>;
 		};
 
-		crypto: crypto-engine@01c15000 {
+		crypto: crypto-engine@1c15000 {
 			compatible = "allwinner,sun6i-a31-crypto",
 				     "allwinner,sun4i-a10-crypto";
 			reg = <0x01c15000 0x1000>;
@@ -826,7 +826,7 @@
 			reset-names = "ahb";
 		};
 
-		codec: codec@01c22c00 {
+		codec: codec@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun6i-a31-codec";
 			reg = <0x01c22c00 0x400>;
@@ -839,7 +839,7 @@
 			status = "disabled";
 		};
 
-		timer@01c60000 {
+		timer@1c60000 {
 			compatible = "allwinner,sun6i-a31-hstimer",
 				     "allwinner,sun7i-a20-hstimer";
 			reg = <0x01c60000 0x1000>;
@@ -851,7 +851,7 @@
 			resets = <&ccu RST_AHB1_HSTIMER>;
 		};
 
-		spi0: spi@01c68000 {
+		spi0: spi@1c68000 {
 			compatible = "allwinner,sun6i-a31-spi";
 			reg = <0x01c68000 0x1000>;
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
@@ -863,7 +863,7 @@
 			status = "disabled";
 		};
 
-		spi1: spi@01c69000 {
+		spi1: spi@1c69000 {
 			compatible = "allwinner,sun6i-a31-spi";
 			reg = <0x01c69000 0x1000>;
 			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
@@ -875,7 +875,7 @@
 			status = "disabled";
 		};
 
-		spi2: spi@01c6a000 {
+		spi2: spi@1c6a000 {
 			compatible = "allwinner,sun6i-a31-spi";
 			reg = <0x01c6a000 0x1000>;
 			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
@@ -887,7 +887,7 @@
 			status = "disabled";
 		};
 
-		spi3: spi@01c6b000 {
+		spi3: spi@1c6b000 {
 			compatible = "allwinner,sun6i-a31-spi";
 			reg = <0x01c6b000 0x1000>;
 			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
@@ -899,7 +899,7 @@
 			status = "disabled";
 		};
 
-		gic: interrupt-controller@01c81000 {
+		gic: interrupt-controller@1c81000 {
 			compatible = "arm,cortex-a7-gic", "arm,cortex-a15-gic";
 			reg = <0x01c81000 0x1000>,
 			      <0x01c82000 0x2000>,
@@ -910,7 +910,7 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
-		fe0: display-frontend@01e00000 {
+		fe0: display-frontend@1e00000 {
 			compatible = "allwinner,sun6i-a31-display-frontend";
 			reg = <0x01e00000 0x20000>;
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
@@ -942,7 +942,7 @@
 			};
 		};
 
-		fe1: display-frontend@01e20000 {
+		fe1: display-frontend@1e20000 {
 			compatible = "allwinner,sun6i-a31-display-frontend";
 			reg = <0x01e20000 0x20000>;
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
@@ -974,7 +974,7 @@
 			};
 		};
 
-		be1: display-backend@01e40000 {
+		be1: display-backend@1e40000 {
 			compatible = "allwinner,sun6i-a31-display-backend";
 			reg = <0x01e40000 0x10000>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
@@ -1020,7 +1020,7 @@
 			};
 		};
 
-		drc1: drc@01e50000 {
+		drc1: drc@1e50000 {
 			compatible = "allwinner,sun6i-a31-drc";
 			reg = <0x01e50000 0x10000>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
@@ -1061,7 +1061,7 @@
 			};
 		};
 
-		be0: display-backend@01e60000 {
+		be0: display-backend@1e60000 {
 			compatible = "allwinner,sun6i-a31-display-backend";
 			reg = <0x01e60000 0x10000>;
 			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
@@ -1107,7 +1107,7 @@
 			};
 		};
 
-		drc0: drc@01e70000 {
+		drc0: drc@1e70000 {
 			compatible = "allwinner,sun6i-a31-drc";
 			reg = <0x01e70000 0x10000>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
@@ -1148,7 +1148,7 @@
 			};
 		};
 
-		rtc: rtc@01f00000 {
+		rtc: rtc@1f00000 {
 			compatible = "allwinner,sun6i-a31-rtc";
 			reg = <0x01f00000 0x54>;
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
@@ -1163,7 +1163,7 @@
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		prcm@01f01400 {
+		prcm@1f01400 {
 			compatible = "allwinner,sun6i-a31-prcm";
 			reg = <0x01f01400 0x200>;
 
@@ -1215,12 +1215,12 @@
 			};
 		};
 
-		cpucfg@01f01c00 {
+		cpucfg@1f01c00 {
 			compatible = "allwinner,sun6i-a31-cpuconfig";
 			reg = <0x01f01c00 0x300>;
 		};
 
-		ir: ir@01f02000 {
+		ir: ir@1f02000 {
 			compatible = "allwinner,sun5i-a13-ir";
 			clocks = <&apb0_gates 1>, <&ir_clk>;
 			clock-names = "apb", "ir";
@@ -1230,7 +1230,7 @@
 			status = "disabled";
 		};
 
-		r_pio: pinctrl@01f02c00 {
+		r_pio: pinctrl@1f02c00 {
 			compatible = "allwinner,sun6i-a31-r-pinctrl";
 			reg = <0x01f02c00 0x400>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
@@ -1255,7 +1255,7 @@
 			};
 		};
 
-		p2wi: i2c@01f03400 {
+		p2wi: i2c@1f03400 {
 			compatible = "allwinner,sun6i-a31-p2wi";
 			reg = <0x01f03400 0x400>;
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 96bee776e145..08bea4f5616d 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -181,7 +181,7 @@
 		#size-cells = <1>;
 		ranges;
 
-		osc24M: clk@01c20050 {
+		osc24M: clk@1c20050 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-osc-clk";
 			reg = <0x01c20050 0x4>;
@@ -205,7 +205,7 @@
 			clock-output-names = "osc32k";
 		};
 
-		pll1: clk@01c20000 {
+		pll1: clk@1c20000 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-pll1-clk";
 			reg = <0x01c20000 0x4>;
@@ -213,7 +213,7 @@
 			clock-output-names = "pll1";
 		};
 
-		pll2: clk@01c20008 {
+		pll2: clk@1c20008 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-pll2-clk";
 			reg = <0x01c20008 0x8>;
@@ -222,7 +222,7 @@
 					     "pll2-4x", "pll2-8x";
 		};
 
-		pll3: clk@01c20010 {
+		pll3: clk@1c20010 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-pll3-clk";
 			reg = <0x01c20010 0x4>;
@@ -239,7 +239,7 @@
 			clock-output-names = "pll3-2x";
 		};
 
-		pll4: clk@01c20018 {
+		pll4: clk@1c20018 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun7i-a20-pll4-clk";
 			reg = <0x01c20018 0x4>;
@@ -247,7 +247,7 @@
 			clock-output-names = "pll4";
 		};
 
-		pll5: clk@01c20020 {
+		pll5: clk@1c20020 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-pll5-clk";
 			reg = <0x01c20020 0x4>;
@@ -255,7 +255,7 @@
 			clock-output-names = "pll5_ddr", "pll5_other";
 		};
 
-		pll6: clk@01c20028 {
+		pll6: clk@1c20028 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-pll6-clk";
 			reg = <0x01c20028 0x4>;
@@ -264,7 +264,7 @@
 					     "pll6_div_4";
 		};
 
-		pll7: clk@01c20030 {
+		pll7: clk@1c20030 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-pll3-clk";
 			reg = <0x01c20030 0x4>;
@@ -281,7 +281,7 @@
 			clock-output-names = "pll7-2x";
 		};
 
-		pll8: clk@01c20040 {
+		pll8: clk@1c20040 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun7i-a20-pll4-clk";
 			reg = <0x01c20040 0x4>;
@@ -289,7 +289,7 @@
 			clock-output-names = "pll8";
 		};
 
-		cpu: cpu@01c20054 {
+		cpu: cpu@1c20054 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-cpu-clk";
 			reg = <0x01c20054 0x4>;
@@ -297,7 +297,7 @@
 			clock-output-names = "cpu";
 		};
 
-		axi: axi@01c20054 {
+		axi: axi@1c20054 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-axi-clk";
 			reg = <0x01c20054 0x4>;
@@ -305,7 +305,7 @@
 			clock-output-names = "axi";
 		};
 
-		ahb: ahb@01c20054 {
+		ahb: ahb@1c20054 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun5i-a13-ahb-clk";
 			reg = <0x01c20054 0x4>;
@@ -319,7 +319,7 @@
 			assigned-clock-parents = <&pll6 3>;
 		};
 
-		ahb_gates: clk@01c20060 {
+		ahb_gates: clk@1c20060 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun7i-a20-ahb-gates-clk";
 			reg = <0x01c20060 0x8>;
@@ -352,7 +352,7 @@
 				"ahb_mali";
 		};
 
-		apb0: apb0@01c20054 {
+		apb0: apb0@1c20054 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-apb0-clk";
 			reg = <0x01c20054 0x4>;
@@ -360,7 +360,7 @@
 			clock-output-names = "apb0";
 		};
 
-		apb0_gates: clk@01c20068 {
+		apb0_gates: clk@1c20068 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun7i-a20-apb0-gates-clk";
 			reg = <0x01c20068 0x4>;
@@ -375,7 +375,7 @@
 				"apb0_i2s2", "apb0_keypad";
 		};
 
-		apb1: clk@01c20058 {
+		apb1: clk@1c20058 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-apb1-clk";
 			reg = <0x01c20058 0x4>;
@@ -383,7 +383,7 @@
 			clock-output-names = "apb1";
 		};
 
-		apb1_gates: clk@01c2006c {
+		apb1_gates: clk@1c2006c {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun7i-a20-apb1-gates-clk";
 			reg = <0x01c2006c 0x4>;
@@ -402,7 +402,7 @@
 				"apb1_uart5", "apb1_uart6", "apb1_uart7";
 		};
 
-		nand_clk: clk@01c20080 {
+		nand_clk: clk@1c20080 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c20080 0x4>;
@@ -410,7 +410,7 @@
 			clock-output-names = "nand";
 		};
 
-		ms_clk: clk@01c20084 {
+		ms_clk: clk@1c20084 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c20084 0x4>;
@@ -418,7 +418,7 @@
 			clock-output-names = "ms";
 		};
 
-		mmc0_clk: clk@01c20088 {
+		mmc0_clk: clk@1c20088 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-mmc-clk";
 			reg = <0x01c20088 0x4>;
@@ -428,7 +428,7 @@
 					     "mmc0_sample";
 		};
 
-		mmc1_clk: clk@01c2008c {
+		mmc1_clk: clk@1c2008c {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-mmc-clk";
 			reg = <0x01c2008c 0x4>;
@@ -438,7 +438,7 @@
 					     "mmc1_sample";
 		};
 
-		mmc2_clk: clk@01c20090 {
+		mmc2_clk: clk@1c20090 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-mmc-clk";
 			reg = <0x01c20090 0x4>;
@@ -448,7 +448,7 @@
 					     "mmc2_sample";
 		};
 
-		mmc3_clk: clk@01c20094 {
+		mmc3_clk: clk@1c20094 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-mmc-clk";
 			reg = <0x01c20094 0x4>;
@@ -458,7 +458,7 @@
 					     "mmc3_sample";
 		};
 
-		ts_clk: clk@01c20098 {
+		ts_clk: clk@1c20098 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c20098 0x4>;
@@ -466,7 +466,7 @@
 			clock-output-names = "ts";
 		};
 
-		ss_clk: clk@01c2009c {
+		ss_clk: clk@1c2009c {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c2009c 0x4>;
@@ -474,7 +474,7 @@
 			clock-output-names = "ss";
 		};
 
-		spi0_clk: clk@01c200a0 {
+		spi0_clk: clk@1c200a0 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200a0 0x4>;
@@ -482,7 +482,7 @@
 			clock-output-names = "spi0";
 		};
 
-		spi1_clk: clk@01c200a4 {
+		spi1_clk: clk@1c200a4 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200a4 0x4>;
@@ -490,7 +490,7 @@
 			clock-output-names = "spi1";
 		};
 
-		spi2_clk: clk@01c200a8 {
+		spi2_clk: clk@1c200a8 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200a8 0x4>;
@@ -498,7 +498,7 @@
 			clock-output-names = "spi2";
 		};
 
-		pata_clk: clk@01c200ac {
+		pata_clk: clk@1c200ac {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200ac 0x4>;
@@ -506,7 +506,7 @@
 			clock-output-names = "pata";
 		};
 
-		ir0_clk: clk@01c200b0 {
+		ir0_clk: clk@1c200b0 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200b0 0x4>;
@@ -514,7 +514,7 @@
 			clock-output-names = "ir0";
 		};
 
-		ir1_clk: clk@01c200b4 {
+		ir1_clk: clk@1c200b4 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200b4 0x4>;
@@ -522,7 +522,7 @@
 			clock-output-names = "ir1";
 		};
 
-		i2s0_clk: clk@01c200b8 {
+		i2s0_clk: clk@1c200b8 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod1-clk";
 			reg = <0x01c200b8 0x4>;
@@ -533,7 +533,7 @@
 			clock-output-names = "i2s0";
 		};
 
-		ac97_clk: clk@01c200bc {
+		ac97_clk: clk@1c200bc {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod1-clk";
 			reg = <0x01c200bc 0x4>;
@@ -544,7 +544,7 @@
 			clock-output-names = "ac97";
 		};
 
-		spdif_clk: clk@01c200c0 {
+		spdif_clk: clk@1c200c0 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod1-clk";
 			reg = <0x01c200c0 0x4>;
@@ -555,7 +555,7 @@
 			clock-output-names = "spdif";
 		};
 
-		keypad_clk: clk@01c200c4 {
+		keypad_clk: clk@1c200c4 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200c4 0x4>;
@@ -563,7 +563,7 @@
 			clock-output-names = "keypad";
 		};
 
-		usb_clk: clk@01c200cc {
+		usb_clk: clk@1c200cc {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			compatible = "allwinner,sun4i-a10-usb-clk";
@@ -573,7 +573,7 @@
 					     "usb_phy";
 		};
 
-		spi3_clk: clk@01c200d4 {
+		spi3_clk: clk@1c200d4 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
 			reg = <0x01c200d4 0x4>;
@@ -581,7 +581,7 @@
 			clock-output-names = "spi3";
 		};
 
-		i2s1_clk: clk@01c200d8 {
+		i2s1_clk: clk@1c200d8 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod1-clk";
 			reg = <0x01c200d8 0x4>;
@@ -592,7 +592,7 @@
 			clock-output-names = "i2s1";
 		};
 
-		i2s2_clk: clk@01c200dc {
+		i2s2_clk: clk@1c200dc {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod1-clk";
 			reg = <0x01c200dc 0x4>;
@@ -603,7 +603,7 @@
 			clock-output-names = "i2s2";
 		};
 
-		dram_gates: clk@01c20100 {
+		dram_gates: clk@1c20100 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-dram-gates-clk";
 			reg = <0x01c20100 0x4>;
@@ -628,7 +628,7 @@
 					     "dram_de_mp", "dram_ace";
 		};
 
-		de_be0_clk: clk@01c20104 {
+		de_be0_clk: clk@1c20104 {
 			#clock-cells = <0>;
 			#reset-cells = <0>;
 			compatible = "allwinner,sun4i-a10-display-clk";
@@ -637,7 +637,7 @@
 			clock-output-names = "de-be0";
 		};
 
-		de_be1_clk: clk@01c20108 {
+		de_be1_clk: clk@1c20108 {
 			#clock-cells = <0>;
 			#reset-cells = <0>;
 			compatible = "allwinner,sun4i-a10-display-clk";
@@ -646,7 +646,7 @@
 			clock-output-names = "de-be1";
 		};
 
-		de_fe0_clk: clk@01c2010c {
+		de_fe0_clk: clk@1c2010c {
 			#clock-cells = <0>;
 			#reset-cells = <0>;
 			compatible = "allwinner,sun4i-a10-display-clk";
@@ -655,7 +655,7 @@
 			clock-output-names = "de-fe0";
 		};
 
-		de_fe1_clk: clk@01c20110 {
+		de_fe1_clk: clk@1c20110 {
 			#clock-cells = <0>;
 			#reset-cells = <0>;
 			compatible = "allwinner,sun4i-a10-display-clk";
@@ -664,7 +664,7 @@
 			clock-output-names = "de-fe1";
 		};
 
-		tcon0_ch0_clk: clk@01c20118 {
+		tcon0_ch0_clk: clk@1c20118 {
 			#clock-cells = <0>;
 			#reset-cells = <1>;
 			compatible = "allwinner,sun4i-a10-tcon-ch0-clk";
@@ -674,7 +674,7 @@
 
 		};
 
-		tcon1_ch0_clk: clk@01c2011c {
+		tcon1_ch0_clk: clk@1c2011c {
 			#clock-cells = <0>;
 			#reset-cells = <1>;
 			compatible = "allwinner,sun4i-a10-tcon-ch1-clk";
@@ -684,7 +684,7 @@
 
 		};
 
-		tcon0_ch1_clk: clk@01c2012c {
+		tcon0_ch1_clk: clk@1c2012c {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-tcon-ch0-clk";
 			reg = <0x01c2012c 0x4>;
@@ -693,7 +693,7 @@
 
 		};
 
-		tcon1_ch1_clk: clk@01c20130 {
+		tcon1_ch1_clk: clk@1c20130 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-tcon-ch1-clk";
 			reg = <0x01c20130 0x4>;
@@ -702,7 +702,7 @@
 
 		};
 
-		ve_clk: clk@01c2013c {
+		ve_clk: clk@1c2013c {
 			#clock-cells = <0>;
 			#reset-cells = <0>;
 			compatible = "allwinner,sun4i-a10-ve-clk";
@@ -711,7 +711,7 @@
 			clock-output-names = "ve";
 		};
 
-		codec_clk: clk@01c20140 {
+		codec_clk: clk@1c20140 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-codec-clk";
 			reg = <0x01c20140 0x4>;
@@ -719,7 +719,7 @@
 			clock-output-names = "codec";
 		};
 
-		mbus_clk: clk@01c2015c {
+		mbus_clk: clk@1c2015c {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun5i-a13-mbus-clk";
 			reg = <0x01c2015c 0x4>;
@@ -750,7 +750,7 @@
 			clock-output-names = "gmac_int_tx";
 		};
 
-		gmac_tx_clk: clk@01c20164 {
+		gmac_tx_clk: clk@1c20164 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun7i-a20-gmac-clk";
 			reg = <0x01c20164 0x4>;
@@ -770,7 +770,7 @@
 			clock-output-names = "osc24M_32k";
 		};
 
-		clk_out_a: clk@01c201f0 {
+		clk_out_a: clk@1c201f0 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun7i-a20-out-clk";
 			reg = <0x01c201f0 0x4>;
@@ -778,7 +778,7 @@
 			clock-output-names = "clk_out_a";
 		};
 
-		clk_out_b: clk@01c201f4 {
+		clk_out_b: clk@1c201f4 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun7i-a20-out-clk";
 			reg = <0x01c201f4 0x4>;
@@ -787,20 +787,20 @@
 		};
 	};
 
-	soc@01c00000 {
+	soc@1c00000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
 
-		sram-controller@01c00000 {
+		sram-controller@1c00000 {
 			compatible = "allwinner,sun4i-a10-sram-controller";
 			reg = <0x01c00000 0x30>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
 
-			sram_a: sram@00000000 {
+			sram_a: sram@0 {
 				compatible = "mmio-sram";
 				reg = <0x00000000 0xc000>;
 				#address-cells = <1>;
@@ -814,14 +814,14 @@
 				};
 			};
 
-			sram_d: sram@00010000 {
+			sram_d: sram@10000 {
 				compatible = "mmio-sram";
 				reg = <0x00010000 0x1000>;
 				#address-cells = <1>;
 				#size-cells = <1>;
 				ranges = <0 0x00010000 0x1000>;
 
-				otg_sram: sram-section@0000 {
+				otg_sram: sram-section@0 {
 					compatible = "allwinner,sun4i-a10-sram-d";
 					reg = <0x0000 0x1000>;
 					status = "disabled";
@@ -829,7 +829,7 @@
 			};
 		};
 
-		nmi_intc: interrupt-controller@01c00030 {
+		nmi_intc: interrupt-controller@1c00030 {
 			compatible = "allwinner,sun7i-a20-sc-nmi";
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -837,7 +837,7 @@
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		dma: dma-controller@01c02000 {
+		dma: dma-controller@1c02000 {
 			compatible = "allwinner,sun4i-a10-dma";
 			reg = <0x01c02000 0x1000>;
 			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
@@ -845,7 +845,7 @@
 			#dma-cells = <2>;
 		};
 
-		nfc: nand@01c03000 {
+		nfc: nand@1c03000 {
 			compatible = "allwinner,sun4i-a10-nand";
 			reg = <0x01c03000 0x1000>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
@@ -858,7 +858,7 @@
 			#size-cells = <0>;
 		};
 
-		spi0: spi@01c05000 {
+		spi0: spi@1c05000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c05000 0x1000>;
 			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
@@ -873,7 +873,7 @@
 			num-cs = <4>;
 		};
 
-		spi1: spi@01c06000 {
+		spi1: spi@1c06000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c06000 0x1000>;
 			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
@@ -888,7 +888,7 @@
 			num-cs = <1>;
 		};
 
-		emac: ethernet@01c0b000 {
+		emac: ethernet@1c0b000 {
 			compatible = "allwinner,sun4i-a10-emac";
 			reg = <0x01c0b000 0x1000>;
 			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
@@ -897,7 +897,7 @@
 			status = "disabled";
 		};
 
-		mdio: mdio@01c0b080 {
+		mdio: mdio@1c0b080 {
 			compatible = "allwinner,sun4i-a10-mdio";
 			reg = <0x01c0b080 0x14>;
 			status = "disabled";
@@ -905,7 +905,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc0: mmc@01c0f000 {
+		mmc0: mmc@1c0f000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c0f000 0x1000>;
 			clocks = <&ahb_gates 8>,
@@ -922,7 +922,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc1: mmc@01c10000 {
+		mmc1: mmc@1c10000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c10000 0x1000>;
 			clocks = <&ahb_gates 9>,
@@ -939,7 +939,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc2: mmc@01c11000 {
+		mmc2: mmc@1c11000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c11000 0x1000>;
 			clocks = <&ahb_gates 10>,
@@ -956,7 +956,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc3: mmc@01c12000 {
+		mmc3: mmc@1c12000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c12000 0x1000>;
 			clocks = <&ahb_gates 11>,
@@ -973,7 +973,7 @@
 			#size-cells = <0>;
 		};
 
-		usb_otg: usb@01c13000 {
+		usb_otg: usb@1c13000 {
 			compatible = "allwinner,sun4i-a10-musb";
 			reg = <0x01c13000 0x0400>;
 			clocks = <&ahb_gates 0>;
@@ -986,7 +986,7 @@
 			status = "disabled";
 		};
 
-		usbphy: phy@01c13400 {
+		usbphy: phy@1c13400 {
 			#phy-cells = <1>;
 			compatible = "allwinner,sun7i-a20-usb-phy";
 			reg = <0x01c13400 0x10 0x01c14800 0x4 0x01c1c800 0x4>;
@@ -998,7 +998,7 @@
 			status = "disabled";
 		};
 
-		ehci0: usb@01c14000 {
+		ehci0: usb@1c14000 {
 			compatible = "allwinner,sun7i-a20-ehci", "generic-ehci";
 			reg = <0x01c14000 0x100>;
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
@@ -1008,7 +1008,7 @@
 			status = "disabled";
 		};
 
-		ohci0: usb@01c14400 {
+		ohci0: usb@1c14400 {
 			compatible = "allwinner,sun7i-a20-ohci", "generic-ohci";
 			reg = <0x01c14400 0x100>;
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
@@ -1018,7 +1018,7 @@
 			status = "disabled";
 		};
 
-		crypto: crypto-engine@01c15000 {
+		crypto: crypto-engine@1c15000 {
 			compatible = "allwinner,sun7i-a20-crypto",
 				     "allwinner,sun4i-a10-crypto";
 			reg = <0x01c15000 0x1000>;
@@ -1027,7 +1027,7 @@
 			clock-names = "ahb", "mod";
 		};
 
-		spi2: spi@01c17000 {
+		spi2: spi@1c17000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c17000 0x1000>;
 			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
@@ -1042,7 +1042,7 @@
 			num-cs = <1>;
 		};
 
-		ahci: sata@01c18000 {
+		ahci: sata@1c18000 {
 			compatible = "allwinner,sun4i-a10-ahci";
 			reg = <0x01c18000 0x1000>;
 			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
@@ -1050,7 +1050,7 @@
 			status = "disabled";
 		};
 
-		ehci1: usb@01c1c000 {
+		ehci1: usb@1c1c000 {
 			compatible = "allwinner,sun7i-a20-ehci", "generic-ehci";
 			reg = <0x01c1c000 0x100>;
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
@@ -1060,7 +1060,7 @@
 			status = "disabled";
 		};
 
-		ohci1: usb@01c1c400 {
+		ohci1: usb@1c1c400 {
 			compatible = "allwinner,sun7i-a20-ohci", "generic-ohci";
 			reg = <0x01c1c400 0x100>;
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
@@ -1070,7 +1070,7 @@
 			status = "disabled";
 		};
 
-		spi3: spi@01c1f000 {
+		spi3: spi@1c1f000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c1f000 0x1000>;
 			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
@@ -1085,7 +1085,7 @@
 			num-cs = <1>;
 		};
 
-		pio: pinctrl@01c20800 {
+		pio: pinctrl@1c20800 {
 			compatible = "allwinner,sun7i-a20-pinctrl";
 			reg = <0x01c20800 0x400>;
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
@@ -1324,7 +1324,7 @@
 			};
 		};
 
-		timer@01c20c00 {
+		timer@1c20c00 {
 			compatible = "allwinner,sun4i-a10-timer";
 			reg = <0x01c20c00 0x90>;
 			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
@@ -1336,18 +1336,18 @@
 			clocks = <&osc24M>;
 		};
 
-		wdt: watchdog@01c20c90 {
+		wdt: watchdog@1c20c90 {
 			compatible = "allwinner,sun4i-a10-wdt";
 			reg = <0x01c20c90 0x10>;
 		};
 
-		rtc: rtc@01c20d00 {
+		rtc: rtc@1c20d00 {
 			compatible = "allwinner,sun7i-a20-rtc";
 			reg = <0x01c20d00 0x20>;
 			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		pwm: pwm@01c20e00 {
+		pwm: pwm@1c20e00 {
 			compatible = "allwinner,sun7i-a20-pwm";
 			reg = <0x01c20e00 0xc>;
 			clocks = <&osc24M>;
@@ -1355,7 +1355,7 @@
 			status = "disabled";
 		};
 
-		spdif: spdif@01c21000 {
+		spdif: spdif@1c21000 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun4i-a10-spdif";
 			reg = <0x01c21000 0x400>;
@@ -1368,7 +1368,7 @@
 			status = "disabled";
 		};
 
-		ir0: ir@01c21800 {
+		ir0: ir@1c21800 {
 			compatible = "allwinner,sun4i-a10-ir";
 			clocks = <&apb0_gates 6>, <&ir0_clk>;
 			clock-names = "apb", "ir";
@@ -1377,7 +1377,7 @@
 			status = "disabled";
 		};
 
-		ir1: ir@01c21c00 {
+		ir1: ir@1c21c00 {
 			compatible = "allwinner,sun4i-a10-ir";
 			clocks = <&apb0_gates 7>, <&ir1_clk>;
 			clock-names = "apb", "ir";
@@ -1386,7 +1386,7 @@
 			status = "disabled";
 		};
 
-		i2s1: i2s@01c22000 {
+		i2s1: i2s@1c22000 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun4i-a10-i2s";
 			reg = <0x01c22000 0x400>;
@@ -1399,7 +1399,7 @@
 			status = "disabled";
 		};
 
-		i2s0: i2s@01c22400 {
+		i2s0: i2s@1c22400 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun4i-a10-i2s";
 			reg = <0x01c22400 0x400>;
@@ -1412,14 +1412,14 @@
 			status = "disabled";
 		};
 
-		lradc: lradc@01c22800 {
+		lradc: lradc@1c22800 {
 			compatible = "allwinner,sun4i-a10-lradc-keys";
 			reg = <0x01c22800 0x100>;
 			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
-		codec: codec@01c22c00 {
+		codec: codec@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun7i-a20-codec";
 			reg = <0x01c22c00 0x40>;
@@ -1432,12 +1432,12 @@
 			status = "disabled";
 		};
 
-		sid: eeprom@01c23800 {
+		sid: eeprom@1c23800 {
 			compatible = "allwinner,sun7i-a20-sid";
 			reg = <0x01c23800 0x200>;
 		};
 
-		i2s2: i2s@01c24400 {
+		i2s2: i2s@1c24400 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun4i-a10-i2s";
 			reg = <0x01c24400 0x400>;
@@ -1450,14 +1450,14 @@
 			status = "disabled";
 		};
 
-		rtp: rtp@01c25000 {
+		rtp: rtp@1c25000 {
 			compatible = "allwinner,sun5i-a13-ts";
 			reg = <0x01c25000 0x100>;
 			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 			#thermal-sensor-cells = <0>;
 		};
 
-		uart0: serial@01c28000 {
+		uart0: serial@1c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
@@ -1467,7 +1467,7 @@
 			status = "disabled";
 		};
 
-		uart1: serial@01c28400 {
+		uart1: serial@1c28400 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28400 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
@@ -1477,7 +1477,7 @@
 			status = "disabled";
 		};
 
-		uart2: serial@01c28800 {
+		uart2: serial@1c28800 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28800 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
@@ -1487,7 +1487,7 @@
 			status = "disabled";
 		};
 
-		uart3: serial@01c28c00 {
+		uart3: serial@1c28c00 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28c00 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
@@ -1497,7 +1497,7 @@
 			status = "disabled";
 		};
 
-		uart4: serial@01c29000 {
+		uart4: serial@1c29000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c29000 0x400>;
 			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
@@ -1507,7 +1507,7 @@
 			status = "disabled";
 		};
 
-		uart5: serial@01c29400 {
+		uart5: serial@1c29400 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c29400 0x400>;
 			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
@@ -1517,7 +1517,7 @@
 			status = "disabled";
 		};
 
-		uart6: serial@01c29800 {
+		uart6: serial@1c29800 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c29800 0x400>;
 			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -1527,7 +1527,7 @@
 			status = "disabled";
 		};
 
-		uart7: serial@01c29c00 {
+		uart7: serial@1c29c00 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c29c00 0x400>;
 			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
@@ -1537,7 +1537,7 @@
 			status = "disabled";
 		};
 
-		ps20: ps2@01c2a000 {
+		ps20: ps2@1c2a000 {
 			compatible = "allwinner,sun4i-a10-ps2";
 			reg = <0x01c2a000 0x400>;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
@@ -1545,7 +1545,7 @@
 			status = "disabled";
 		};
 
-		ps21: ps2@01c2a400 {
+		ps21: ps2@1c2a400 {
 			compatible = "allwinner,sun4i-a10-ps2";
 			reg = <0x01c2a400 0x400>;
 			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
@@ -1553,7 +1553,7 @@
 			status = "disabled";
 		};
 
-		i2c0: i2c@01c2ac00 {
+		i2c0: i2c@1c2ac00 {
 			compatible = "allwinner,sun7i-a20-i2c",
 				     "allwinner,sun4i-a10-i2c";
 			reg = <0x01c2ac00 0x400>;
@@ -1564,7 +1564,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c1: i2c@01c2b000 {
+		i2c1: i2c@1c2b000 {
 			compatible = "allwinner,sun7i-a20-i2c",
 				     "allwinner,sun4i-a10-i2c";
 			reg = <0x01c2b000 0x400>;
@@ -1575,7 +1575,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c2: i2c@01c2b400 {
+		i2c2: i2c@1c2b400 {
 			compatible = "allwinner,sun7i-a20-i2c",
 				     "allwinner,sun4i-a10-i2c";
 			reg = <0x01c2b400 0x400>;
@@ -1586,7 +1586,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c3: i2c@01c2b800 {
+		i2c3: i2c@1c2b800 {
 			compatible = "allwinner,sun7i-a20-i2c",
 				     "allwinner,sun4i-a10-i2c";
 			reg = <0x01c2b800 0x400>;
@@ -1597,7 +1597,7 @@
 			#size-cells = <0>;
 		};
 
-		can0: can@01c2bc00 {
+		can0: can@1c2bc00 {
 			compatible = "allwinner,sun7i-a20-can",
 				     "allwinner,sun4i-a10-can";
 			reg = <0x01c2bc00 0x400>;
@@ -1606,7 +1606,7 @@
 			status = "disabled";
 		};
 
-		i2c4: i2c@01c2c000 {
+		i2c4: i2c@1c2c000 {
 			compatible = "allwinner,sun7i-a20-i2c",
 				     "allwinner,sun4i-a10-i2c";
 			reg = <0x01c2c000 0x400>;
@@ -1617,7 +1617,7 @@
 			#size-cells = <0>;
 		};
 
-		gmac: ethernet@01c50000 {
+		gmac: ethernet@1c50000 {
 			compatible = "allwinner,sun7i-a20-gmac";
 			reg = <0x01c50000 0x10000>;
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
@@ -1632,7 +1632,7 @@
 			#size-cells = <0>;
 		};
 
-		hstimer@01c60000 {
+		hstimer@1c60000 {
 			compatible = "allwinner,sun7i-a20-hstimer";
 			reg = <0x01c60000 0x1000>;
 			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
@@ -1642,7 +1642,7 @@
 			clocks = <&ahb_gates 28>;
 		};
 
-		gic: interrupt-controller@01c81000 {
+		gic: interrupt-controller@1c81000 {
 			compatible = "arm,gic-400", "arm,cortex-a7-gic", "arm,cortex-a15-gic";
 			reg = <0x01c81000 0x1000>,
 			      <0x01c82000 0x2000>,
diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index ea50dda75adc..971f9be699a7 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -118,13 +118,13 @@
 		};
 	};
 
-	soc@01c00000 {
+	soc@1c00000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
 
-		dma: dma-controller@01c02000 {
+		dma: dma-controller@1c02000 {
 			compatible = "allwinner,sun8i-a23-dma";
 			reg = <0x01c02000 0x1000>;
 			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
@@ -133,7 +133,7 @@
 			#dma-cells = <1>;
 		};
 
-		mmc0: mmc@01c0f000 {
+		mmc0: mmc@1c0f000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c0f000 0x1000>;
 			clocks = <&ccu CLK_BUS_MMC0>,
@@ -152,7 +152,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc1: mmc@01c10000 {
+		mmc1: mmc@1c10000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c10000 0x1000>;
 			clocks = <&ccu CLK_BUS_MMC1>,
@@ -171,7 +171,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc2: mmc@01c11000 {
+		mmc2: mmc@1c11000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c11000 0x1000>;
 			clocks = <&ccu CLK_BUS_MMC2>,
@@ -190,7 +190,7 @@
 			#size-cells = <0>;
 		};
 
-		nfc: nand@01c03000 {
+		nfc: nand@1c03000 {
 			compatible = "allwinner,sun4i-a10-nand";
 			reg = <0x01c03000 0x1000>;
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
@@ -203,7 +203,7 @@
 			#size-cells = <0>;
 		};
 
-		usb_otg: usb@01c19000 {
+		usb_otg: usb@1c19000 {
 			/* compatible gets set in SoC specific dtsi file */
 			reg = <0x01c19000 0x0400>;
 			clocks = <&ccu CLK_BUS_OTG>;
@@ -216,7 +216,7 @@
 			status = "disabled";
 		};
 
-		usbphy: phy@01c19400 {
+		usbphy: phy@1c19400 {
 			/*
 			 * compatible and address regions get set in
 			 * SoC specific dtsi file
@@ -233,7 +233,7 @@
 			#phy-cells = <1>;
 		};
 
-		ehci0: usb@01c1a000 {
+		ehci0: usb@1c1a000 {
 			compatible = "allwinner,sun8i-a23-ehci", "generic-ehci";
 			reg = <0x01c1a000 0x100>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
@@ -244,7 +244,7 @@
 			status = "disabled";
 		};
 
-		ohci0: usb@01c1a400 {
+		ohci0: usb@1c1a400 {
 			compatible = "allwinner,sun8i-a23-ohci", "generic-ohci";
 			reg = <0x01c1a400 0x100>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
@@ -255,7 +255,7 @@
 			status = "disabled";
 		};
 
-		ccu: clock@01c20000 {
+		ccu: clock@1c20000 {
 			reg = <0x01c20000 0x400>;
 			clocks = <&osc24M>, <&rtc 0>;
 			clock-names = "hosc", "losc";
@@ -263,7 +263,7 @@
 			#reset-cells = <1>;
 		};
 
-		pio: pinctrl@01c20800 {
+		pio: pinctrl@1c20800 {
 			/* compatible gets set in SoC specific dtsi file */
 			reg = <0x01c20800 0x400>;
 			/* interrupts get set in SoC specific dtsi file */
@@ -344,7 +344,7 @@
 			};
 		};
 
-		timer@01c20c00 {
+		timer@1c20c00 {
 			compatible = "allwinner,sun4i-a10-timer";
 			reg = <0x01c20c00 0xa0>;
 			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
@@ -352,13 +352,13 @@
 			clocks = <&osc24M>;
 		};
 
-		wdt0: watchdog@01c20ca0 {
+		wdt0: watchdog@1c20ca0 {
 			compatible = "allwinner,sun6i-a31-wdt";
 			reg = <0x01c20ca0 0x20>;
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		pwm: pwm@01c21400 {
+		pwm: pwm@1c21400 {
 			compatible = "allwinner,sun7i-a20-pwm";
 			reg = <0x01c21400 0xc>;
 			clocks = <&osc24M>;
@@ -366,14 +366,14 @@
 			status = "disabled";
 		};
 
-		lradc: lradc@01c22800 {
+		lradc: lradc@1c22800 {
 			compatible = "allwinner,sun4i-a10-lradc-keys";
 			reg = <0x01c22800 0x100>;
 			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
-		uart0: serial@01c28000 {
+		uart0: serial@1c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
@@ -386,7 +386,7 @@
 			status = "disabled";
 		};
 
-		uart1: serial@01c28400 {
+		uart1: serial@1c28400 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
@@ -399,7 +399,7 @@
 			status = "disabled";
 		};
 
-		uart2: serial@01c28800 {
+		uart2: serial@1c28800 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
@@ -412,7 +412,7 @@
 			status = "disabled";
 		};
 
-		uart3: serial@01c28c00 {
+		uart3: serial@1c28c00 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
@@ -425,7 +425,7 @@
 			status = "disabled";
 		};
 
-		uart4: serial@01c29000 {
+		uart4: serial@1c29000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c29000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
@@ -438,7 +438,7 @@
 			status = "disabled";
 		};
 
-		i2c0: i2c@01c2ac00 {
+		i2c0: i2c@1c2ac00 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x01c2ac00 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
@@ -449,7 +449,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c1: i2c@01c2b000 {
+		i2c1: i2c@1c2b000 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x01c2b000 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -460,7 +460,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c2: i2c@01c2b400 {
+		i2c2: i2c@1c2b400 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x01c2b400 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
@@ -498,7 +498,7 @@
 			assigned-clock-rates = <384000000>;
 		};
 
-		gic: interrupt-controller@01c81000 {
+		gic: interrupt-controller@1c81000 {
 			compatible = "arm,cortex-a7-gic", "arm,cortex-a15-gic";
 			reg = <0x01c81000 0x1000>,
 			      <0x01c82000 0x2000>,
@@ -509,7 +509,7 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
-		rtc: rtc@01f00000 {
+		rtc: rtc@1f00000 {
 			compatible = "allwinner,sun6i-a31-rtc";
 			reg = <0x01f00000 0x54>;
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
@@ -527,7 +527,7 @@
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		prcm@01f01400 {
+		prcm@1f01400 {
 			compatible = "allwinner,sun8i-a23-prcm";
 			reg = <0x01f01400 0x200>;
 
@@ -575,12 +575,12 @@
 			};
 		};
 
-		cpucfg@01f01c00 {
+		cpucfg@1f01c00 {
 			compatible = "allwinner,sun8i-a23-cpuconfig";
 			reg = <0x01f01c00 0x300>;
 		};
 
-		r_uart: serial@01f02800 {
+		r_uart: serial@1f02800 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01f02800 0x400>;
 			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
@@ -591,7 +591,7 @@
 			status = "disabled";
 		};
 
-		r_pio: pinctrl@01f02c00 {
+		r_pio: pinctrl@1f02c00 {
 			compatible = "allwinner,sun8i-a23-r-pinctrl";
 			reg = <0x01f02c00 0x400>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
@@ -618,7 +618,7 @@
 			};
 		};
 
-		r_rsb: rsb@01f03400 {
+		r_rsb: rsb@1f03400 {
 			compatible = "allwinner,sun8i-a23-rsb";
 			reg = <0x01f03400 0x400>;
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/sun8i-a23.dtsi b/arch/arm/boot/dts/sun8i-a23.dtsi
index 4d1f929780a8..58e6585b504b 100644
--- a/arch/arm/boot/dts/sun8i-a23.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23.dtsi
@@ -49,8 +49,8 @@
 		reg = <0x40000000 0x40000000>;
 	};
 
-	soc@01c00000 {
-		codec: codec@01c22c00 {
+	soc@1c00000 {
+		codec: codec@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun8i-a23-codec";
 			reg = <0x01c22c00 0x400>;
diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
index 22660919bd08..50eb84fa246a 100644
--- a/arch/arm/boot/dts/sun8i-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
@@ -203,8 +203,8 @@
 		};
 	};
 
-	soc@01c00000 {
-		tcon0: lcd-controller@01c0c000 {
+	soc@1c00000 {
+		tcon0: lcd-controller@1c0c000 {
 			compatible = "allwinner,sun8i-a33-tcon";
 			reg = <0x01c0c000 0x1000>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
@@ -240,7 +240,7 @@
 			};
 		};
 
-		crypto: crypto-engine@01c15000 {
+		crypto: crypto-engine@1c15000 {
 			compatible = "allwinner,sun4i-a10-crypto";
 			reg = <0x01c15000 0x1000>;
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
@@ -250,7 +250,7 @@
 			reset-names = "ahb";
 		};
 
-		dai: dai@01c22c00 {
+		dai: dai@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun6i-a31-i2s";
 			reg = <0x01c22c00 0x200>;
@@ -263,7 +263,7 @@
 			status = "disabled";
 		};
 
-		codec: codec@01c22e00 {
+		codec: codec@1c22e00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun8i-a33-codec";
 			reg = <0x01c22e00 0x400>;
@@ -273,14 +273,14 @@
 			status = "disabled";
 		};
 
-		ths: ths@01c25000 {
+		ths: ths@1c25000 {
 			compatible = "allwinner,sun8i-a33-ths";
 			reg = <0x01c25000 0x100>;
 			#thermal-sensor-cells = <0>;
 			#io-channel-cells = <0>;
 		};
 
-		fe0: display-frontend@01e00000 {
+		fe0: display-frontend@1e00000 {
 			compatible = "allwinner,sun8i-a33-display-frontend";
 			reg = <0x01e00000 0x20000>;
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
@@ -308,7 +308,7 @@
 			};
 		};
 
-		be0: display-backend@01e60000 {
+		be0: display-backend@1e60000 {
 			compatible = "allwinner,sun8i-a33-display-backend";
 			reg = <0x01e60000 0x10000>, <0x01e80000 0x1000>;
 			reg-names = "be", "sat";
@@ -350,7 +350,7 @@
 			};
 		};
 
-		drc0: drc@01e70000 {
+		drc0: drc@1e70000 {
 			compatible = "allwinner,sun8i-a33-drc";
 			reg = <0x01e70000 0x10000>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index f996bd343e50..a25e9fffbea6 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -242,7 +242,7 @@
 			#size-cells = <0>;
 		};
 
-		usb_otg: usb@01c19000 {
+		usb_otg: usb@1c19000 {
 			compatible = "allwinner,sun8i-a83t-musb",
 				     "allwinner,sun8i-a33-musb";
 			reg = <0x01c19000 0x0400>;
@@ -404,7 +404,7 @@
 			status = "disabled";
 		};
 
-		uart0: serial@01c28000 {
+		uart0: serial@1c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index 3a06dc5b3746..443b083c6adc 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -178,7 +178,7 @@
 		};
 
 
-		mmc0: mmc@01c0f000 {
+		mmc0: mmc@1c0f000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c0f000 0x1000>;
 			clocks = <&ccu CLK_BUS_MMC0>,
@@ -197,7 +197,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc1: mmc@01c10000 {
+		mmc1: mmc@1c10000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c10000 0x1000>;
 			clocks = <&ccu CLK_BUS_MMC1>,
@@ -218,7 +218,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc2: mmc@01c11000 {
+		mmc2: mmc@1c11000 {
 			compatible = "allwinner,sun7i-a20-mmc";
 			reg = <0x01c11000 0x1000>;
 			clocks = <&ccu CLK_BUS_MMC2>,
@@ -237,7 +237,7 @@
 			#size-cells = <0>;
 		};
 
-		usb_otg: usb@01c19000 {
+		usb_otg: usb@1c19000 {
 			compatible = "allwinner,sun8i-h3-musb";
 			reg = <0x01c19000 0x0400>;
 			clocks = <&ccu CLK_BUS_OTG>;
@@ -250,7 +250,7 @@
 			status = "disabled";
 		};
 
-		usbphy: phy@01c19400 {
+		usbphy: phy@1c19400 {
 			compatible = "allwinner,sun8i-v3s-usb-phy";
 			reg = <0x01c19400 0x2c>,
 			      <0x01c1a800 0x4>;
@@ -264,7 +264,7 @@
 			#phy-cells = <1>;
 		};
 
-		ccu: clock@01c20000 {
+		ccu: clock@1c20000 {
 			compatible = "allwinner,sun8i-v3s-ccu";
 			reg = <0x01c20000 0x400>;
 			clocks = <&osc24M>, <&osc32k>;
@@ -273,14 +273,14 @@
 			#reset-cells = <1>;
 		};
 
-		rtc: rtc@01c20400 {
+		rtc: rtc@1c20400 {
 			compatible = "allwinner,sun6i-a31-rtc";
 			reg = <0x01c20400 0x54>;
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		pio: pinctrl@01c20800 {
+		pio: pinctrl@1c20800 {
 			compatible = "allwinner,sun8i-v3s-pinctrl";
 			reg = <0x01c20800 0x400>;
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
@@ -324,7 +324,7 @@
 			};
 		};
 
-		timer@01c20c00 {
+		timer@1c20c00 {
 			compatible = "allwinner,sun4i-a10-timer";
 			reg = <0x01c20c00 0xa0>;
 			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
@@ -332,7 +332,7 @@
 			clocks = <&osc24M>;
 		};
 
-		wdt0: watchdog@01c20ca0 {
+		wdt0: watchdog@1c20ca0 {
 			compatible = "allwinner,sun6i-a31-wdt";
 			reg = <0x01c20ca0 0x20>;
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
@@ -345,7 +345,7 @@
 			status = "disabled";
 		};
 
-		uart0: serial@01c28000 {
+		uart0: serial@1c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
@@ -356,7 +356,7 @@
 			status = "disabled";
 		};
 
-		uart1: serial@01c28400 {
+		uart1: serial@1c28400 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
@@ -367,7 +367,7 @@
 			status = "disabled";
 		};
 
-		uart2: serial@01c28800 {
+		uart2: serial@1c28800 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
@@ -378,7 +378,7 @@
 			status = "disabled";
 		};
 
-		i2c0: i2c@01c2ac00 {
+		i2c0: i2c@1c2ac00 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x01c2ac00 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
@@ -391,7 +391,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c1: i2c@01c2b000 {
+		i2c1: i2c@1c2b000 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x01c2b000 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -416,7 +416,7 @@
 			#size-cells = <0>;
 		};
 
-		gic: interrupt-controller@01c81000 {
+		gic: interrupt-controller@1c81000 {
 			compatible = "arm,cortex-a7-gic", "arm,cortex-a15-gic";
 			reg = <0x01c81000 0x1000>,
 			      <0x01c82000 0x1000>,
diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index 759a72317eb8..19b01d0bdc37 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -164,7 +164,7 @@
 			clock-output-names = "osc32k";
 		};
 
-		cpus_clk: clk@08001410 {
+		cpus_clk: clk@8001410 {
 			compatible = "allwinner,sun9i-a80-cpus-clk";
 			reg = <0x08001410 0x4>;
 			#clock-cells = <0>;
@@ -183,7 +183,7 @@
 			clock-output-names = "ahbs";
 		};
 
-		apbs: clk@0800141c {
+		apbs: clk@800141c {
 			compatible = "allwinner,sun8i-a23-apb0-clk";
 			reg = <0x0800141c 0x4>;
 			#clock-cells = <0>;
@@ -191,7 +191,7 @@
 			clock-output-names = "apbs";
 		};
 
-		apbs_gates: clk@08001428 {
+		apbs_gates: clk@8001428 {
 			compatible = "allwinner,sun9i-a80-apbs-gates-clk";
 			reg = <0x08001428 0x4>;
 			#clock-cells = <1>;
@@ -212,7 +212,7 @@
 					"apbs_i2s1", "apbs_twd";
 		};
 
-		r_1wire_clk: clk@08001450 {
+		r_1wire_clk: clk@8001450 {
 			reg = <0x08001450 0x4>;
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
@@ -220,7 +220,7 @@
 			clock-output-names = "r_1wire";
 		};
 
-		r_ir_clk: clk@08001454 {
+		r_ir_clk: clk@8001454 {
 			reg = <0x08001454 0x4>;
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-mod0-clk";
@@ -239,7 +239,7 @@
 		 */
 		ranges = <0 0 0 0x20000000>;
 
-		ehci0: usb@00a00000 {
+		ehci0: usb@a00000 {
 			compatible = "allwinner,sun9i-a80-ehci", "generic-ehci";
 			reg = <0x00a00000 0x100>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
@@ -250,7 +250,7 @@
 			status = "disabled";
 		};
 
-		ohci0: usb@00a00400 {
+		ohci0: usb@a00400 {
 			compatible = "allwinner,sun9i-a80-ohci", "generic-ohci";
 			reg = <0x00a00400 0x100>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
@@ -262,7 +262,7 @@
 			status = "disabled";
 		};
 
-		usbphy1: phy@00a00800 {
+		usbphy1: phy@a00800 {
 			compatible = "allwinner,sun9i-a80-usb-phy";
 			reg = <0x00a00800 0x4>;
 			clocks = <&usb_clocks CLK_USB0_PHY>;
@@ -273,7 +273,7 @@
 			#phy-cells = <0>;
 		};
 
-		ehci1: usb@00a01000 {
+		ehci1: usb@a01000 {
 			compatible = "allwinner,sun9i-a80-ehci", "generic-ehci";
 			reg = <0x00a01000 0x100>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
@@ -284,7 +284,7 @@
 			status = "disabled";
 		};
 
-		usbphy2: phy@00a01800 {
+		usbphy2: phy@a01800 {
 			compatible = "allwinner,sun9i-a80-usb-phy";
 			reg = <0x00a01800 0x4>;
 			clocks = <&usb_clocks CLK_USB1_HSIC>,
@@ -303,7 +303,7 @@
 			phy_type = "hsic";
 		};
 
-		ehci2: usb@00a02000 {
+		ehci2: usb@a02000 {
 			compatible = "allwinner,sun9i-a80-ehci", "generic-ehci";
 			reg = <0x00a02000 0x100>;
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
@@ -314,7 +314,7 @@
 			status = "disabled";
 		};
 
-		ohci2: usb@00a02400 {
+		ohci2: usb@a02400 {
 			compatible = "allwinner,sun9i-a80-ohci", "generic-ohci";
 			reg = <0x00a02400 0x100>;
 			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
@@ -326,7 +326,7 @@
 			status = "disabled";
 		};
 
-		usbphy3: phy@00a02800 {
+		usbphy3: phy@a02800 {
 			compatible = "allwinner,sun9i-a80-usb-phy";
 			reg = <0x00a02800 0x4>;
 			clocks = <&usb_clocks CLK_USB2_HSIC>,
@@ -343,7 +343,7 @@
 			#phy-cells = <0>;
 		};
 
-		usb_clocks: clock@00a08000 {
+		usb_clocks: clock@a08000 {
 			compatible = "allwinner,sun9i-a80-usb-clks";
 			reg = <0x00a08000 0x8>;
 			clocks = <&ccu CLK_BUS_USB>, <&osc24M>;
@@ -352,7 +352,7 @@
 			#reset-cells = <1>;
 		};
 
-		mmc0: mmc@01c0f000 {
+		mmc0: mmc@1c0f000 {
 			compatible = "allwinner,sun9i-a80-mmc";
 			reg = <0x01c0f000 0x1000>;
 			clocks = <&mmc_config_clk 0>, <&ccu CLK_MMC0>,
@@ -367,7 +367,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc1: mmc@01c10000 {
+		mmc1: mmc@1c10000 {
 			compatible = "allwinner,sun9i-a80-mmc";
 			reg = <0x01c10000 0x1000>;
 			clocks = <&mmc_config_clk 1>, <&ccu CLK_MMC1>,
@@ -382,7 +382,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc2: mmc@01c11000 {
+		mmc2: mmc@1c11000 {
 			compatible = "allwinner,sun9i-a80-mmc";
 			reg = <0x01c11000 0x1000>;
 			clocks = <&mmc_config_clk 2>, <&ccu CLK_MMC2>,
@@ -397,7 +397,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc3: mmc@01c12000 {
+		mmc3: mmc@1c12000 {
 			compatible = "allwinner,sun9i-a80-mmc";
 			reg = <0x01c12000 0x1000>;
 			clocks = <&mmc_config_clk 3>, <&ccu CLK_MMC3>,
@@ -412,7 +412,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc_config_clk: clk@01c13000 {
+		mmc_config_clk: clk@1c13000 {
 			compatible = "allwinner,sun9i-a80-mmc-config-clk";
 			reg = <0x01c13000 0x10>;
 			clocks = <&ccu CLK_BUS_MMC>;
@@ -425,7 +425,7 @@
 					     "mmc2_config", "mmc3_config";
 		};
 
-		gic: interrupt-controller@01c41000 {
+		gic: interrupt-controller@1c41000 {
 			compatible = "arm,cortex-a7-gic", "arm,cortex-a15-gic";
 			reg = <0x01c41000 0x1000>,
 			      <0x01c42000 0x2000>,
@@ -436,7 +436,7 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
-		de_clocks: clock@03000000 {
+		de_clocks: clock@3000000 {
 			compatible = "allwinner,sun9i-a80-de-clks";
 			reg = <0x03000000 0x30>;
 			clocks = <&ccu CLK_DE>,
@@ -450,7 +450,7 @@
 			#reset-cells = <1>;
 		};
 
-		ccu: clock@06000000 {
+		ccu: clock@6000000 {
 			compatible = "allwinner,sun9i-a80-ccu";
 			reg = <0x06000000 0x800>;
 			clocks = <&osc24M>, <&osc32k>;
@@ -459,7 +459,7 @@
 			#reset-cells = <1>;
 		};
 
-		timer@06000c00 {
+		timer@6000c00 {
 			compatible = "allwinner,sun4i-a10-timer";
 			reg = <0x06000c00 0xa0>;
 			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
@@ -472,13 +472,13 @@
 			clocks = <&osc24M>;
 		};
 
-		wdt: watchdog@06000ca0 {
+		wdt: watchdog@6000ca0 {
 			compatible = "allwinner,sun6i-a31-wdt";
 			reg = <0x06000ca0 0x20>;
 			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		pio: pinctrl@06000800 {
+		pio: pinctrl@6000800 {
 			compatible = "allwinner,sun9i-a80-pinctrl";
 			reg = <0x06000800 0x400>;
 			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
@@ -536,7 +536,7 @@
 			};
 		};
 
-		uart0: serial@07000000 {
+		uart0: serial@7000000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x07000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
@@ -547,7 +547,7 @@
 			status = "disabled";
 		};
 
-		uart1: serial@07000400 {
+		uart1: serial@7000400 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x07000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
@@ -558,7 +558,7 @@
 			status = "disabled";
 		};
 
-		uart2: serial@07000800 {
+		uart2: serial@7000800 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x07000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
@@ -569,7 +569,7 @@
 			status = "disabled";
 		};
 
-		uart3: serial@07000c00 {
+		uart3: serial@7000c00 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x07000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
@@ -580,7 +580,7 @@
 			status = "disabled";
 		};
 
-		uart4: serial@07001000 {
+		uart4: serial@7001000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x07001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
@@ -591,7 +591,7 @@
 			status = "disabled";
 		};
 
-		uart5: serial@07001400 {
+		uart5: serial@7001400 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x07001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
@@ -602,7 +602,7 @@
 			status = "disabled";
 		};
 
-		i2c0: i2c@07002800 {
+		i2c0: i2c@7002800 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x07002800 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
@@ -613,7 +613,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c1: i2c@07002c00 {
+		i2c1: i2c@7002c00 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x07002c00 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -624,7 +624,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c2: i2c@07003000 {
+		i2c2: i2c@7003000 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x07003000 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
@@ -635,7 +635,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c3: i2c@07003400 {
+		i2c3: i2c@7003400 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x07003400 0x400>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
@@ -646,7 +646,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c4: i2c@07003800 {
+		i2c4: i2c@7003800 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x07003800 0x400>;
 			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
@@ -657,19 +657,19 @@
 			#size-cells = <0>;
 		};
 
-		r_wdt: watchdog@08001000 {
+		r_wdt: watchdog@8001000 {
 			compatible = "allwinner,sun6i-a31-wdt";
 			reg = <0x08001000 0x20>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		apbs_rst: reset@080014b0 {
+		apbs_rst: reset@80014b0 {
 			reg = <0x080014b0 0x4>;
 			compatible = "allwinner,sun6i-a31-clock-reset";
 			#reset-cells = <1>;
 		};
 
-		nmi_intc: interrupt-controller@080015a0 {
+		nmi_intc: interrupt-controller@80015a0 {
 			compatible = "allwinner,sun9i-a80-nmi";
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -677,7 +677,7 @@
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		r_ir: ir@08002000 {
+		r_ir: ir@8002000 {
 			compatible = "allwinner,sun5i-a13-ir";
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
@@ -689,7 +689,7 @@
 			status = "disabled";
 		};
 
-		r_uart: serial@08002800 {
+		r_uart: serial@8002800 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x08002800 0x400>;
 			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
@@ -700,7 +700,7 @@
 			status = "disabled";
 		};
 
-		r_pio: pinctrl@08002c00 {
+		r_pio: pinctrl@8002c00 {
 			compatible = "allwinner,sun9i-a80-r-pinctrl";
 			reg = <0x08002c00 0x400>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
@@ -726,7 +726,7 @@
 			};
 		};
 
-		r_rsb: i2c@08003400 {
+		r_rsb: i2c@8003400 {
 			compatible = "allwinner,sun8i-a23-rsb";
 			reg = <0x08003400 0x400>;
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 11240a8313c2..f2dcf97a0d08 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -91,7 +91,7 @@
 			reg = <0x01c00000 0x1000>;
 		};
 
-		dma: dma-controller@01c02000 {
+		dma: dma-controller@1c02000 {
 			compatible = "allwinner,sun8i-h3-dma";
 			reg = <0x01c02000 0x1000>;
 			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
@@ -100,7 +100,7 @@
 			#dma-cells = <1>;
 		};
 
-		mmc0: mmc@01c0f000 {
+		mmc0: mmc@1c0f000 {
 			/* compatible and clocks are in per SoC .dtsi file */
 			reg = <0x01c0f000 0x1000>;
 			resets = <&ccu RST_BUS_MMC0>;
@@ -111,7 +111,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc1: mmc@01c10000 {
+		mmc1: mmc@1c10000 {
 			/* compatible and clocks are in per SoC .dtsi file */
 			reg = <0x01c10000 0x1000>;
 			resets = <&ccu RST_BUS_MMC1>;
@@ -122,7 +122,7 @@
 			#size-cells = <0>;
 		};
 
-		mmc2: mmc@01c11000 {
+		mmc2: mmc@1c11000 {
 			/* compatible and clocks are in per SoC .dtsi file */
 			reg = <0x01c11000 0x1000>;
 			resets = <&ccu RST_BUS_MMC2>;
@@ -133,7 +133,7 @@
 			#size-cells = <0>;
 		};
 
-		usb_otg: usb@01c19000 {
+		usb_otg: usb@1c19000 {
 			compatible = "allwinner,sun8i-h3-musb";
 			reg = <0x01c19000 0x400>;
 			clocks = <&ccu CLK_BUS_OTG>;
@@ -146,7 +146,7 @@
 			status = "disabled";
 		};
 
-		usbphy: phy@01c19400 {
+		usbphy: phy@1c19400 {
 			compatible = "allwinner,sun8i-h3-usb-phy";
 			reg = <0x01c19400 0x2c>,
 			      <0x01c1a800 0x4>,
@@ -178,7 +178,7 @@
 			#phy-cells = <1>;
 		};
 
-		ehci0: usb@01c1a000 {
+		ehci0: usb@1c1a000 {
 			compatible = "allwinner,sun8i-h3-ehci", "generic-ehci";
 			reg = <0x01c1a000 0x100>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
@@ -187,7 +187,7 @@
 			status = "disabled";
 		};
 
-		ohci0: usb@01c1a400 {
+		ohci0: usb@1c1a400 {
 			compatible = "allwinner,sun8i-h3-ohci", "generic-ohci";
 			reg = <0x01c1a400 0x100>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
@@ -197,7 +197,7 @@
 			status = "disabled";
 		};
 
-		ehci1: usb@01c1b000 {
+		ehci1: usb@1c1b000 {
 			compatible = "allwinner,sun8i-h3-ehci", "generic-ehci";
 			reg = <0x01c1b000 0x100>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
@@ -208,7 +208,7 @@
 			status = "disabled";
 		};
 
-		ohci1: usb@01c1b400 {
+		ohci1: usb@1c1b400 {
 			compatible = "allwinner,sun8i-h3-ohci", "generic-ohci";
 			reg = <0x01c1b400 0x100>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
@@ -220,7 +220,7 @@
 			status = "disabled";
 		};
 
-		ehci2: usb@01c1c000 {
+		ehci2: usb@1c1c000 {
 			compatible = "allwinner,sun8i-h3-ehci", "generic-ehci";
 			reg = <0x01c1c000 0x100>;
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
@@ -231,7 +231,7 @@
 			status = "disabled";
 		};
 
-		ohci2: usb@01c1c400 {
+		ohci2: usb@1c1c400 {
 			compatible = "allwinner,sun8i-h3-ohci", "generic-ohci";
 			reg = <0x01c1c400 0x100>;
 			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
@@ -243,7 +243,7 @@
 			status = "disabled";
 		};
 
-		ehci3: usb@01c1d000 {
+		ehci3: usb@1c1d000 {
 			compatible = "allwinner,sun8i-h3-ehci", "generic-ehci";
 			reg = <0x01c1d000 0x100>;
 			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
@@ -254,7 +254,7 @@
 			status = "disabled";
 		};
 
-		ohci3: usb@01c1d400 {
+		ohci3: usb@1c1d400 {
 			compatible = "allwinner,sun8i-h3-ohci", "generic-ohci";
 			reg = <0x01c1d400 0x100>;
 			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
@@ -266,7 +266,7 @@
 			status = "disabled";
 		};
 
-		ccu: clock@01c20000 {
+		ccu: clock@1c20000 {
 			/* compatible is in per SoC .dtsi file */
 			reg = <0x01c20000 0x400>;
 			clocks = <&osc24M>, <&osc32k>;
@@ -275,7 +275,7 @@
 			#reset-cells = <1>;
 		};
 
-		pio: pinctrl@01c20800 {
+		pio: pinctrl@1c20800 {
 			/* compatible is in per SoC .dtsi file */
 			reg = <0x01c20800 0x400>;
 			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
@@ -383,7 +383,7 @@
 			};
 		};
 
-		timer@01c20c00 {
+		timer@1c20c00 {
 			compatible = "allwinner,sun4i-a10-timer";
 			reg = <0x01c20c00 0xa0>;
 			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
@@ -391,7 +391,7 @@
 			clocks = <&osc24M>;
 		};
 
-		spi0: spi@01c68000 {
+		spi0: spi@1c68000 {
 			compatible = "allwinner,sun8i-h3-spi";
 			reg = <0x01c68000 0x1000>;
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
@@ -407,7 +407,7 @@
 			#size-cells = <0>;
 		};
 
-		spi1: spi@01c69000 {
+		spi1: spi@1c69000 {
 			compatible = "allwinner,sun8i-h3-spi";
 			reg = <0x01c69000 0x1000>;
 			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
@@ -423,13 +423,13 @@
 			#size-cells = <0>;
 		};
 
-		wdt0: watchdog@01c20ca0 {
+		wdt0: watchdog@1c20ca0 {
 			compatible = "allwinner,sun6i-a31-wdt";
 			reg = <0x01c20ca0 0x20>;
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		spdif: spdif@01c21000 {
+		spdif: spdif@1c21000 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun8i-h3-spdif";
 			reg = <0x01c21000 0x400>;
@@ -442,7 +442,7 @@
 			status = "disabled";
 		};
 
-		pwm: pwm@01c21400 {
+		pwm: pwm@1c21400 {
 			compatible = "allwinner,sun8i-h3-pwm";
 			reg = <0x01c21400 0x8>;
 			clocks = <&osc24M>;
@@ -450,7 +450,7 @@
 			status = "disabled";
 		};
 
-		codec: codec@01c22c00 {
+		codec: codec@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun8i-h3-codec";
 			reg = <0x01c22c00 0x400>;
@@ -464,7 +464,7 @@
 			status = "disabled";
 		};
 
-		uart0: serial@01c28000 {
+		uart0: serial@1c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
@@ -477,7 +477,7 @@
 			status = "disabled";
 		};
 
-		uart1: serial@01c28400 {
+		uart1: serial@1c28400 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
@@ -490,7 +490,7 @@
 			status = "disabled";
 		};
 
-		uart2: serial@01c28800 {
+		uart2: serial@1c28800 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
@@ -503,7 +503,7 @@
 			status = "disabled";
 		};
 
-		uart3: serial@01c28c00 {
+		uart3: serial@1c28c00 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
@@ -516,7 +516,7 @@
 			status = "disabled";
 		};
 
-		i2c0: i2c@01c2ac00 {
+		i2c0: i2c@1c2ac00 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x01c2ac00 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
@@ -529,7 +529,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c1: i2c@01c2b000 {
+		i2c1: i2c@1c2b000 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x01c2b000 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -542,7 +542,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c2: i2c@01c2b400 {
+		i2c2: i2c@1c2b400 {
 			compatible = "allwinner,sun6i-a31-i2c";
 			reg = <0x01c2b000 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
@@ -555,7 +555,7 @@
 			#size-cells = <0>;
 		};
 
-		gic: interrupt-controller@01c81000 {
+		gic: interrupt-controller@1c81000 {
 			compatible = "arm,gic-400";
 			reg = <0x01c81000 0x1000>,
 			      <0x01c82000 0x2000>,
@@ -566,7 +566,7 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
-		rtc: rtc@01f00000 {
+		rtc: rtc@1f00000 {
 			compatible = "allwinner,sun6i-a31-rtc";
 			reg = <0x01f00000 0x54>;
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
@@ -583,12 +583,12 @@
 			#reset-cells = <1>;
 		};
 
-		codec_analog: codec-analog@01f015c0 {
+		codec_analog: codec-analog@1f015c0 {
 			compatible = "allwinner,sun8i-h3-codec-analog";
 			reg = <0x01f015c0 0x4>;
 		};
 
-		ir: ir@01f02000 {
+		ir: ir@1f02000 {
 			compatible = "allwinner,sun5i-a13-ir";
 			clocks = <&r_ccu CLK_APB0_IR>, <&r_ccu CLK_IR>;
 			clock-names = "apb", "ir";
@@ -598,7 +598,7 @@
 			status = "disabled";
 		};
 
-		r_pio: pinctrl@01f02c00 {
+		r_pio: pinctrl@1f02c00 {
 			compatible = "allwinner,sun8i-h3-r-pinctrl";
 			reg = <0x01f02c00 0x400>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/tango4-common.dtsi b/arch/arm/boot/dts/tango4-common.dtsi
index 0c8cad4d6ee6..520a24a9af6a 100644
--- a/arch/arm/boot/dts/tango4-common.dtsi
+++ b/arch/arm/boot/dts/tango4-common.dtsi
@@ -159,7 +159,7 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			irq0: irq0@000 {
+			irq0: irq0@0 {
 				reg = <0x000 0x100>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
diff --git a/arch/arm/boot/dts/usb_a9263.dts b/arch/arm/boot/dts/usb_a9263.dts
index 482381c1c962..7b1125be99c4 100644
--- a/arch/arm/boot/dts/usb_a9263.dts
+++ b/arch/arm/boot/dts/usb_a9263.dts
@@ -128,7 +128,7 @@
 			};
 		};
 
-		usb0: ohci@00a00000 {
+		usb0: ohci@a00000 {
 			num-ports = <2>;
 			status = "okay";
 		};
diff --git a/arch/arm/boot/dts/vf610-twr.dts b/arch/arm/boot/dts/vf610-twr.dts
index 53e3b8b250c6..6f787e67bd2e 100644
--- a/arch/arm/boot/dts/vf610-twr.dts
+++ b/arch/arm/boot/dts/vf610-twr.dts
@@ -198,7 +198,7 @@
 	pinctrl-0 = <&pinctrl_i2c0>;
 	status = "okay";
 
-	codec: sgtl5000@0a {
+	codec: sgtl5000@a {
 	       #sound-dai-cells = <0>;
 	       compatible = "fsl,sgtl5000";
 	       reg = <0x0a>;
diff --git a/arch/arm/boot/dts/vf610-zii-dev-rev-c.dts b/arch/arm/boot/dts/vf610-zii-dev-rev-c.dts
index db3b408ea55a..02a6227c717c 100644
--- a/arch/arm/boot/dts/vf610-zii-dev-rev-c.dts
+++ b/arch/arm/boot/dts/vf610-zii-dev-rev-c.dts
@@ -359,7 +359,7 @@
 };
 
 &i2c1 {
-	at24mac602@00 {
+	at24mac602@0 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
 		read-only;
diff --git a/arch/arm/boot/dts/zx296702.dtsi b/arch/arm/boot/dts/zx296702.dtsi
index d45c8fcd7ab4..48890906c261 100644
--- a/arch/arm/boot/dts/zx296702.dtsi
+++ b/arch/arm/boot/dts/zx296702.dtsi
@@ -37,7 +37,7 @@
 			reg = <0x00400000 0x1000>;
 		};
 
-		intc: interrupt-controller@00801000 {
+		intc: interrupt-controller@801000 {
 			compatible = "arm,cortex-a9-gic";
 			#interrupt-cells = <3>;
 			#address-cells = <1>;
@@ -47,7 +47,7 @@
 			      <0x00800100 0x100>;
 		};
 
-		global_timer: timer@008000200 {
+		global_timer: timer@8000200 {
 			compatible = "arm,cortex-a9-global-timer";
 			reg = <0x00800200 0x20>;
 			interrupts = <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
