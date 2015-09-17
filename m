From: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH V4 1/3] reset: hisilicon: document hisi-hi6220 reset controllers bindings
Date: Thu, 17 Sep 2015 20:00:00 +0800
Message-ID: <1442491202-211336-1-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-H32Fclmsjq1BDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yudongbin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, peter.panshilin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, qijiwen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add DT bindings documentation for hi6220 SoC reset controller.

Signed-off-by: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 .../bindings/reset/hisilicon,hi6220-reset.txt      | 97 ++++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt

diff --git a/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt b/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt
new file mode 100644
index 0000000..c0f7928
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
+- compatible: may be "hisilicon,hi6220-reset-ctl"
+- reg: should be register base and length as documented in the
+  datasheet
+- #reset-cells: 1, see below
+
+Example:
+
+	reset_ctrl: reset_ctrl@f7030000 {
+		compatible = "hisilicon,hi6220-reset-ctl";
+		reg = <0x0 0xf7030000 0x0 0x1000>;
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
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
