From: Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: da850-evm: add WP and CD to MMC
Date: Fri, 30 Mar 2018 11:52:34 -0500
Message-ID: <1522428754-28337-1-git-send-email-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@kernel.org, nsekhar@ti.com, linux@armlinux.org.uk, robh+dt@kernel.org, Adam Ford <aford173@gmail.com>
List-Id: devicetree@vger.kernel.org

The legacy mode uses the write protect and card detect but DT
has not.  This patch enables the pinmuxing and detection for
WP and CD.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index c82368c..1030788 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -42,6 +42,12 @@
 					0x04 0x00011000 0x000ff000
 				>;
 			};
+			mmc0_cd_wp_pins: pinmux_mmc0_cd_wp_pins {
+				pinctrl-single,bits = <
+					/* GP4[0], GP4[1]*/
+					0x28 0x88000000 0xff000000
+					>;
+			};
 			nand_pins: nand_pins {
 				pinctrl-single,bits = <
 					/* EMA_WAIT[0], EMA_OE, EMA_WE, EMA_CS[4], EMA_CS[3] */
@@ -106,7 +112,9 @@
 			bus-width = <4>;
 			status = "okay";
 			pinctrl-names = "default";
-			pinctrl-0 = <&mmc0_pins>;
+			pinctrl-0 = <&mmc0_pins &mmc0_cd_wp_pins>;
+			cd-gpios = <&gpio 64 GPIO_ACTIVE_LOW>;
+			wp-gpios = <&gpio 65 GPIO_ACTIVE_HIGH>;
 		};
 		spi1: spi@30e000 {
 			status = "okay";
-- 
2.7.4
