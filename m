From: Alison Chaiken <alison_chaiken@mentor.com>
Subject: [PATCH] documentation: pinctrl: correct i.MX6 errors
Date: Thu, 11 Apr 2013 10:45:23 -0700
Message-ID: <1365702323-2019-1-git-send-email-alison_chaiken@mentor.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: grant.likely@secretlab.ca, linux-doc@vger.kernel.org, rob.herring@calxeda.com, rob@landley.net, linux-arm-kernel@lists.infradead.org, Alison Chaiken <alison_chaiken@mentor.com>
List-Id: devicetree@vger.kernel.org

The existing content of the file fsl,imx-pinctrl.txt describes a hardware configuration that does not match commonly available reference platforms.   Users are copying these inappropriate pinctrl config settings into their DTS.   The changes match the values suggested in the Freescale Rev. 0 IMX6DQRM of 11/2012.

Signed-off-by: Alison Chaiken <alison_chaiken@mentor.com>
---
 .../bindings/pinctrl/fsl,imx-pinctrl.txt           |   27 ++++++++++----------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt
index ab19e6b..2c0bf12 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt
@@ -72,23 +72,24 @@ iomuxc@020e0000 {
 	/* shared pinctrl settings */
 	usdhc4 {
 		pinctrl_usdhc4_1: usdhc4grp-1 {
-			fsl,pins = <1386 0x17059	/* MX6Q_PAD_SD4_CMD__USDHC4_CMD */
-				    1392 0x10059	/* MX6Q_PAD_SD4_CLK__USDHC4_CLK	*/
-				    1462 0x17059	/* MX6Q_PAD_SD4_DAT0__USDHC4_DAT0 */
-				    1470 0x17059	/* MX6Q_PAD_SD4_DAT1__USDHC4_DAT1 */
-				    1478 0x17059	/* MX6Q_PAD_SD4_DAT2__USDHC4_DAT2 */
-				    1486 0x17059	/* MX6Q_PAD_SD4_DAT3__USDHC4_DAT3 */
-				    1493 0x17059	/* MX6Q_PAD_SD4_DAT4__USDHC4_DAT4 */
-				    1501 0x17059	/* MX6Q_PAD_SD4_DAT5__USDHC4_DAT5 */
-				    1509 0x17059	/* MX6Q_PAD_SD4_DAT6__USDHC4_DAT6 */
-				    1517 0x17059>;	/* MX6Q_PAD_SD4_DAT7__USDHC4_DAT7 */
+			fsl,pins = <1386 0x1b0b0	/* MX6Q_PAD_SD4_CMD__USDHC4_CMD */
+				    1392 0x1b0b0	/* MX6Q_PAD_SD4_CLK__USDHC4_CLK	*/
+				    1462 0x1b0b0	/* MX6Q_PAD_SD4_DAT0__USDHC4_DAT0 */
+				    1470 0x1b0b0	/* MX6Q_PAD_SD4_DAT1__USDHC4_DAT1 */
+				    1478 0x1b0b0	/* MX6Q_PAD_SD4_DAT2__USDHC4_DAT2 */
+				    1486 0x1b0b0	/* MX6Q_PAD_SD4_DAT3__USDHC4_DAT3 */
+				    1493 0x1b0b0	/* MX6Q_PAD_SD4_DAT4__USDHC4_DAT4 */
+				    1501 0x1b0b0	/* MX6Q_PAD_SD4_DAT5__USDHC4_DAT5 */
+				    1509 0x1b0b0	/* MX6Q_PAD_SD4_DAT6__USDHC4_DAT6 */
+				    1517 0x1b0b0>;	/* MX6Q_PAD_SD4_DAT7__USDHC4_DAT7 */
 		};
 	};
 	....
 };
-Refer to the IOMUXC controller chapter in imx6q datasheet,
-0x17059 means enable hysteresis, 47KOhm Pull Up, 50Mhz speed,
-80Ohm driver strength and Fast Slew Rate.
+Refer to Table 4-1 in the i.MX 6Dual/6Quad Applications Processor
+Reference Manual (Document IMX6DQRM, Rev. 0 11/2012):
+0x1b0b0 means enable hysteresis, 100KOhm Pull Up, 100Mhz speed,
+40Ohm driver strength and Slow Slew Rate.
 User should refer to each SoC spec to set the correct value.
 
 TODO: when dtc macro support is available, we can change above raw data
-- 
1.7.10.4

