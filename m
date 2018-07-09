From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 8/8] ARM: dts: imx6qdl-apalis/-colibri: remove unused pinctrl
 groups
Date: Mon,  9 Jul 2018 17:48:48 +0200
Message-ID: <20180709154848.5401-8-stefan@agner.ch>
References: <20180709154848.5401-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180709154848.5401-1-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, max.krummenacher@toradex.com, marcel.ziswiler@toradex.com, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, maitysanchayan@gmail.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

100/200MHz states for USDHC3 are not required since the SoC
does not support modes faster than DDR52 for the on board eMMC.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx6qdl-apalis.dtsi  | 34 --------------------------
 arch/arm/boot/dts/imx6qdl-colibri.dtsi | 34 --------------------------
 2 files changed, 68 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
index 8c04f42fdb71..05f07ea3e8c8 100644
--- a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
@@ -947,38 +947,4 @@
 			MX6QDL_PAD_SD3_RST__SD3_RESET  0x17059
 		>;
 	};
-
-	pinctrl_usdhc3_100mhz: usdhc3100mhzgrp {
-		fsl,pins = <
-			MX6QDL_PAD_SD3_CMD__SD3_CMD    0x170b9
-			MX6QDL_PAD_SD3_CLK__SD3_CLK    0x100b9
-			MX6QDL_PAD_SD3_DAT0__SD3_DATA0 0x170b9
-			MX6QDL_PAD_SD3_DAT1__SD3_DATA1 0x170b9
-			MX6QDL_PAD_SD3_DAT2__SD3_DATA2 0x170b9
-			MX6QDL_PAD_SD3_DAT3__SD3_DATA3 0x170b9
-			MX6QDL_PAD_SD3_DAT4__SD3_DATA4 0x170b9
-			MX6QDL_PAD_SD3_DAT5__SD3_DATA5 0x170b9
-			MX6QDL_PAD_SD3_DAT6__SD3_DATA6 0x170b9
-			MX6QDL_PAD_SD3_DAT7__SD3_DATA7 0x170b9
-			/* eMMC reset */
-			MX6QDL_PAD_SD3_RST__SD3_RESET  0x170b9
-		>;
-	};
-
-	pinctrl_usdhc3_200mhz: usdhc3200mhzgrp {
-		fsl,pins = <
-			MX6QDL_PAD_SD3_CMD__SD3_CMD    0x170f9
-			MX6QDL_PAD_SD3_CLK__SD3_CLK    0x100f9
-			MX6QDL_PAD_SD3_DAT0__SD3_DATA0 0x170f9
-			MX6QDL_PAD_SD3_DAT1__SD3_DATA1 0x170f9
-			MX6QDL_PAD_SD3_DAT2__SD3_DATA2 0x170f9
-			MX6QDL_PAD_SD3_DAT3__SD3_DATA3 0x170f9
-			MX6QDL_PAD_SD3_DAT4__SD3_DATA4 0x170f9
-			MX6QDL_PAD_SD3_DAT5__SD3_DATA5 0x170f9
-			MX6QDL_PAD_SD3_DAT6__SD3_DATA6 0x170f9
-			MX6QDL_PAD_SD3_DAT7__SD3_DATA7 0x170f9
-			/* eMMC reset */
-			MX6QDL_PAD_SD3_RST__SD3_RESET  0x170f9
-		>;
-	};
 };
diff --git a/arch/arm/boot/dts/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
index 6821ea511051..87e15e7cb32b 100644
--- a/arch/arm/boot/dts/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
@@ -692,40 +692,6 @@
 		>;
 	};
 
-	pinctrl_usdhc3_100mhz: usdhc3100mhzgrp {
-		fsl,pins = <
-			MX6QDL_PAD_SD3_CMD__SD3_CMD	0x170b9
-			MX6QDL_PAD_SD3_CLK__SD3_CLK	0x100b9
-			MX6QDL_PAD_SD3_DAT0__SD3_DATA0	0x170b9
-			MX6QDL_PAD_SD3_DAT1__SD3_DATA1	0x170b9
-			MX6QDL_PAD_SD3_DAT2__SD3_DATA2	0x170b9
-			MX6QDL_PAD_SD3_DAT3__SD3_DATA3	0x170b9
-			MX6QDL_PAD_SD3_DAT4__SD3_DATA4	0x170b9
-			MX6QDL_PAD_SD3_DAT5__SD3_DATA5	0x170b9
-			MX6QDL_PAD_SD3_DAT6__SD3_DATA6	0x170b9
-			MX6QDL_PAD_SD3_DAT7__SD3_DATA7	0x170b9
-			/* eMMC reset */
-			MX6QDL_PAD_SD3_RST__SD3_RESET	0x170b9
-		>;
-	};
-
-	pinctrl_usdhc3_200mhz: usdhc3200mhzgrp {
-		fsl,pins = <
-			MX6QDL_PAD_SD3_CMD__SD3_CMD	0x170f9
-			MX6QDL_PAD_SD3_CLK__SD3_CLK	0x100f9
-			MX6QDL_PAD_SD3_DAT0__SD3_DATA0	0x170f9
-			MX6QDL_PAD_SD3_DAT1__SD3_DATA1	0x170f9
-			MX6QDL_PAD_SD3_DAT2__SD3_DATA2	0x170f9
-			MX6QDL_PAD_SD3_DAT3__SD3_DATA3	0x170f9
-			MX6QDL_PAD_SD3_DAT4__SD3_DATA4	0x170f9
-			MX6QDL_PAD_SD3_DAT5__SD3_DATA5	0x170f9
-			MX6QDL_PAD_SD3_DAT6__SD3_DATA6	0x170f9
-			MX6QDL_PAD_SD3_DAT7__SD3_DATA7	0x170f9
-			/* eMMC reset */
-			MX6QDL_PAD_SD3_RST__SD3_RESET	0x170f9
-		>;
-	};
-
 	pinctrl_weim_cs0: weimcs0grp {
 		fsl,pins = <
 			/* nEXT_CS0 */
-- 
2.18.0
