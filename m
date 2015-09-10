From: Chen Feng <puck.chen@hisilicon.com>
Subject: [RESEND PATCH 2/3] reset: hisilicon: document hisi-hi6220 reset controllers bindings
Date: Thu, 10 Sep 2015 14:11:29 +0800
Message-ID: <1441865490-104686-2-git-send-email-puck.chen@hisilicon.com>
References: <1441865490-104686-1-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441865490-104686-1-git-send-email-puck.chen@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: puck.chen@hisilicon.com, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org
Cc: dan.zhao@hisilicon.com, w.f@huawei.com, haojian.zhuang@linaro.org, bintian.wang@huawei.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add DT bindings documentation for hi6220 SoC reset controller.

Signed-off-by: Chen Feng <puck.chen@hisilicon.com>
---
 .../bindings/reset/hisilicon,hi6220-reset.txt      | 97 ++++++++++++++++++++++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |  2 +-
 2 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt

diff --git a/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt b/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt
new file mode 100644
index 0000000..8a23f50
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt
@@ -0,0 +1,97 @@
+Hisilicon System Reset Controller
+======================================
+
+Please also refer to reset.txt in this directory for common reset
+controller binding usage.
+
+The reset controller node must be a sub-node of the chip controller
+node on SoCs.
+
+Required properties:
+- compatible: may be "hisilicon,hisi_reset_ctl"
+- reg: should be register base and length as documented in the
+  datasheet
+- #reset-cells: 1, see below
+
+Example:
+
+	reset_ctrl: reset_ctrl@f7030304 {
+		compatible = "hisilicon,hi6220_reset_ctl";
+		reg = <0x0 0xf7030304 0x0 0x1000>;
+		#reset-cells = <1>;
+	};
+
+Specifying reset lines connected to IP modules
+==============================================
+example:
+
+        uart1: uart1@..... {
+		...
+                resets = <&reset_ctrl 0x305>;
+		...
+        };
+
+The following RESET_INDEX values are valid for hi6220 SoC:
+	PERIPH_RSTDIS0_MMC0 		= 0x000,
+	PERIPH_RSTDIS0_MMC1		= 0x001,
+	PERIPH_RSTDIS0_MMC2		= 0x002,
+	PERIPH_RSTDIS0_NANDC		= 0x003,
+	PERIPH_RSTDIS0_USBOTG_BUS	= 0x004,
+	PERIPH_RSTDIS0_POR_PICOPHY	= 0x005,
+	PERIPH_RSTDIS0_USBOTG		= 0x006,
+	PERIPH_RSTDIS0_USBOTG_32K	= 0x007,
+
+	PERIPH_RSTDIS1_HIFI		= 0x100,
+	PERIPH_RSTDIS1_DIGACODEC	= 0x105,
+
+	PERIPH_RSTEN2_IPF		= 0x200,
+	PERIPH_RSTEN2_SOCP		= 0x201,
+	PERIPH_RSTEN2_DMAC		= 0x202,
+	PERIPH_RSTEN2_SECENG		= 0x203,
+	PERIPH_RSTEN2_ABB		= 0x204,
+	PERIPH_RSTEN2_HPM0		= 0x205,
+	PERIPH_RSTEN2_HPM1		= 0x206,
+	PERIPH_RSTEN2_HPM2		= 0x207,
+	PERIPH_RSTEN2_HPM3		= 0x208,
+
+	PERIPH_RSTEN3_CSSYS		= 0x300,
+	PERIPH_RSTEN3_I2C0		= 0x301,
+	PERIPH_RSTEN3_I2C1		= 0x302,
+	PERIPH_RSTEN3_I2C2		= 0x303,
+	PERIPH_RSTEN3_I2C3		= 0x304,
+	PERIPH_RSTEN3_UART1		= 0x305,
+	PERIPH_RSTEN3_UART2		= 0x306,
+	PERIPH_RSTEN3_UART3		= 0x307,
+	PERIPH_RSTEN3_UART4		= 0x308,
+	PERIPH_RSTEN3_SSP		= 0x309,
+	PERIPH_RSTEN3_PWM		= 0x30a,
+	PERIPH_RSTEN3_BLPWM		= 0x30b,
+	PERIPH_RSTEN3_TSENSOR		= 0x30c,
+	PERIPH_RSTEN3_DAPB		= 0x312,
+	PERIPH_RSTEN3_HKADC		= 0x313,
+	PERIPH_RSTEN3_CODEC_SSI		= 0x314,
+	PERIPH_RSTEN3_PMUSSI1		= 0x316,
+
+	PERIPH_RSTEN8_RS0		= 0x400,
+	PERIPH_RSTEN8_RS2		= 0x401,
+	PERIPH_RSTEN8_RS3		= 0x402,
+	PERIPH_RSTEN8_MS0		= 0x403,
+	PERIPH_RSTEN8_MS2		= 0x405,
+	PERIPH_RSTEN8_XG2RAM0		= 0x406,
+	PERIPH_RSTEN8_X2SRAM_TZMA	= 0x407,
+	PERIPH_RSTEN8_SRAM		= 0x408,
+	PERIPH_RSTEN8_HARQ		= 0x40a,
+	PERIPH_RSTEN8_DDRC		= 0x40c,
+	PERIPH_RSTEN8_DDRC_APB		= 0x40d,
+	PERIPH_RSTEN8_DDRPACK_APB	= 0x40e,
+	PERIPH_RSTEN8_DDRT		= 0x411,
+
+	PERIPH_RSDIST9_CARM_DAP		= 0x500,
+	PERIPH_RSDIST9_CARM_ATB		= 0x501,
+	PERIPH_RSDIST9_CARM_LBUS	= 0x502,
+	PERIPH_RSDIST9_CARM_POR		= 0x503,
+	PERIPH_RSDIST9_CARM_CORE	= 0x504,
+	PERIPH_RSDIST9_CARM_DBG		= 0x505,
+	PERIPH_RSDIST9_CARM_L2		= 0x506,
+	PERIPH_RSDIST9_CARM_SOCDBG	= 0x507,
+	PERIPH_RSDIST9_CARM_ETM		= 0x508,
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 09bb9d1..111537a 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -169,7 +169,7 @@
 		};
 
 		reset_ctrl: reset_ctrl@f7030304 {
-			compatible = "hisilicon,hisi_reset_ctl";
+			compatible = "hisilicon,hi6220_reset_ctl";
 			reg = <0x0 0xf7030304 0x0 0x1000>;
 			#reset-cells = <1>;
 		};
-- 
1.9.1
