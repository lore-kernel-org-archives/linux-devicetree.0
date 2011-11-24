From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 07/14] tegra: fdt: Add initial device tree definitions for USB
 ports
Date: Wed, 23 Nov 2011 19:54:49 -0800
Message-ID: <1322106896-23054-8-git-send-email-sjg@chromium.org>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322106896-23054-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is not available in kernel-land yet, but this initial
set of definitions provides the info we need.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm/dts/tegra20.dtsi |   80 +++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 80 insertions(+), 0 deletions(-)

diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
index 65d7e6a..28d23da 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -143,5 +143,85 @@
 		reg = <0xc8000600 0x200>;
 		interrupts = < 63 >;
 	};
+
+/* This table has USB timing parameters for each Oscillator frequency we
+ * support. There are four sets of values:
+ *
+ * 1. PLLU configuration information (reference clock is osc/clk_m and
+ * PLLU-FOs are fixed at 12MHz/60MHz/480MHz).
+ *
+ *  Reference frequency     13.0MHz      19.2MHz      12.0MHz      26.0MHz
+ *  ----------------------------------------------------------------------
+ *      DIVN                960 (0x3c0)  200 (0c8)    960 (3c0h)   960 (3c0)
+ *      DIVM                13 (0d)      4 (04)       12 (0c)      26 (1a)
+ * Filter frequency (MHz)   1            4.8          6            2
+ * CPCON                    1100b        0011b        1100b        1100b
+ * LFCON0                   0            0            0            0
+ *
+ * 2. PLL CONFIGURATION & PARAMETERS for different clock generators:
+ *
+ * Reference frequency     13.0MHz         19.2MHz         12.0MHz     26.0MHz
+ * ---------------------------------------------------------------------------
+ * PLLU_ENABLE_DLY_COUNT   02 (0x02)       03 (03)         02 (02)     04 (04)
+ * PLLU_STABLE_COUNT       51 (33)         75 (4B)         47 (2F)    102 (66)
+ * PLL_ACTIVE_DLY_COUNT    05 (05)         06 (06)         04 (04)     09 (09)
+ * XTAL_FREQ_COUNT        127 (7F)        187 (BB)        118 (76)    254 (FE)
+ *
+ * 3. Debounce values IdDig, Avalid, Bvalid, VbusValid, VbusWakeUp, and
+ * SessEnd. Each of these signals have their own debouncer and for each of
+ * those one out of two debouncing times can be chosen (BIAS_DEBOUNCE_A or
+ * BIAS_DEBOUNCE_B).
+ *
+ * The values of DEBOUNCE_A and DEBOUNCE_B are calculated as follows:
+ *    0xffff -> No debouncing at all
+ *    <n> ms = <n> *1000 / (1/19.2MHz) / 4
+ *
+ * So to program a 1 ms debounce for BIAS_DEBOUNCE_A, we have:
+ * BIAS_DEBOUNCE_A[15:0] = 1000 * 19.2 / 4  = 4800 = 0x12c0
+ *
+ * We need to use only DebounceA for BOOTROM. We don't need the DebounceB
+ * values, so we can keep those to default.
+ *
+ * a4. The 20 microsecond delay after bias cell operation.
+ *  Reference frequency     13.0MHz      19.2MHz      12.0MHz      26.0MHz
+ */
+	usbparams@0 {
+		compatible = "nvidia,tegra20-usbparams";
+		osc-frequency = <13000000>;
+		/* DivN, DivM, DivP, CPCON, LFCON, Delays      Debounce, Bias */
+		params = <0x3c0 0x0d 0x00 0xc 0  0x02 0x33 0x05 0x7f  0x7ef4 5>;
+	};
+
+	usbparams@1 {
+		compatible = "nvidia,tegra20-usbparams";
+		osc-frequency = <19200000>;
+		params = <0x0c8 0x04 0x00 0x3 0  0x03 0x4b 0x06 0xbb  0xbb80 7>;
+	};
+
+	usbparams@2 {
+		compatible = "nvidia,tegra20-usbparams";
+		osc-frequency = <12000000>;
+		params = <0x3c0 0x0c 0x00 0xc 0  0x02 0x2f 0x04 0x76  0x7530 5>;
+	};
+
+	usbparams@3 {
+		compatible = "nvidia,tegra20-usbparams";
+		osc-frequency = <26000000>;
+		params = <0x3c0 0x1a 0x00 0xc 0  0x04 0x66 0x09 0xfe  0xfde8 9>;
+	};
+
+	usb@0xc5008000 {
+		compatible = "nvidia,tegra20-usb";
+		reg = <0xc5008000 0x8000>;
+		periph-id = <59>;	// PERIPH_ID_USB3
+		status = "disabled";
+	};
+
+	usb@0xc5000000 {
+		compatible = "nvidia,tegra20-usb";
+		reg = <0xc5000000 0x8000>;
+		periph-id = <22>;	// PERIPH_ID_USBD
+		status = "disabled";
+	};
 };
 
-- 
1.7.3.1
