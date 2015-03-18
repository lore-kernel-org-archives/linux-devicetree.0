From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 1/6] clk: iproc: define Broadcom iProc clock binding
Date: Tue, 17 Mar 2015 22:45:17 -0700
Message-ID: <1426657522-2473-2-git-send-email-rjui@broadcom.com>
References: <1426657522-2473-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426657522-2473-1-git-send-email-rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document the device tree binding for Broadcom iProc architecture based
clock controller

Signed-off-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../bindings/clock/brcm,iproc-clocks.txt           |  171 ++++++++++++++++++++
 1 file changed, 171 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt

diff --git a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
new file mode 100644
index 0000000..bf2316b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
@@ -0,0 +1,171 @@
+Broadcom iProc Family Clocks
+
+This binding uses the common clock binding:
+    Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+The iProc clock controller manages clocks that are common to the iProc family.
+An SoC from the iProc family may have several PPLs, e.g., ARMPLL, GENPLL,
+LCPLL0, MIPIPLL, and etc., all derived from an onboard crystal. Each PLL
+comprises of several leaf clocks
+
+Required properties for PLLs:
+- compatible:
+    Should have a value of the form "brcm,<soc>-<pll>". For example, GENPLL on
+Cygnus has a compatible string of "brcm,cygnus-genpll"
+
+- #clock-cells:
+    Must be <0>
+
+- reg:
+    Define the base and range of the I/O address space that contain the iProc
+clock control registers required for the PLL
+
+- clocks:
+    The input parent clock phandle for the PLL. For all iProc PLLs, this is an
+onboard crystal with a fixed rate
+
+Example:
+
+	osc: oscillator {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <25000000>;
+	};
+
+	genpll: genpll {
+		#clock-cells = <0>;
+		compatible = "brcm,cygnus-genpll";
+		reg = <0x0301d000 0x2c>,
+			<0x0301c020 0x4>;
+		clocks = <&osc>;
+	};
+
+Required properties for leaf clocks of a PLL:
+
+- compatible:
+    Should have a value of the form "brcm,<soc>-<pll>-clk". For example, leaf
+clocks derived from the GENPLL on Cygnus SoC have a compatible string of
+"brcm,cygnus-genpll-clk"
+
+- #clock-cells:
+    Have a value of <1> since there are more than 1 leaf clock of a
+given PLL
+
+- reg:
+    Define the base and range of the I/O address space that contain the iProc
+clock control registers required for the PLL leaf clocks
+
+- clocks:
+    The input parent PLL phandle for the leaf clock
+
+- clock-output-names:
+    An ordered list of strings defining the names of the leaf clocks
+
+Example:
+
+	genpll: genpll {
+		#clock-cells = <0>;
+		compatible = "brcm,cygnus-genpll";
+		reg = <0x0301d000 0x2c>,
+			<0x0301c020 0x4>;
+		clocks = <&osc>;
+	};
+
+	genpll_clks: genpll_clks {
+		#clock-cells = <1>;
+		compatible = "brcm,cygnus-genpll-clk";
+		reg = <0x0301d000 0x2c>;
+		clocks = <&genpll>;
+		clock-output-names = "axi21", "250mhz", "ihost_sys",
+			"enet_sw", "audio_125", "can";
+	};
+
+Required properties for ASIU clocks:
+
+ASIU clocks are a special case. These clocks are derived directly from the
+reference clock of the onboard crystal
+
+- compatible:
+    Should have a value of the form "brcm,<soc>-asiu-clk". For example, ASIU
+clocks for Cygnus have a compatible string of "brcm,cygnus-asiu-clk"
+
+- #clock-cells:
+    Have a value of <1> since there are more than 1 ASIU clocks
+
+- reg:
+    Define the base and range of the I/O address space that contain the iProc
+clock control registers required for ASIU clocks
+
+- clocks:
+    The input parent clock phandle for the ASIU clock, i.e., the onboard
+crystal
+
+- clock-output-names:
+    An ordered list of strings defining the names of the ASIU clocks
+
+Example:
+
+	osc: oscillator {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <25000000>;
+	};
+
+	asiu_clks: asiu_clks {
+		#clock-cells = <1>;
+		compatible = "brcm,cygnus-asiu-clk";
+		reg = <0x0301d048 0xc>,
+			<0x180aa024 0x4>;
+		clocks = <&osc>;
+		clock-output-names = "keypad", "adc/touch", "pwm";
+	};
+
+Cygnus
+------
+PLL and leaf clock compatible strings for Cygnus are:
+    "brcm,cygnus-armpll"
+    "brcm,cygnus-genpll"
+    "brcm,cygnus-lcpll0"
+    "brcm,cygnus-mipipll"
+    "brcm,cygnus-genpll-clk"
+    "brcm,cygnus-lcpll0-clk"
+    "brcm,cygnus-mipipll-clk"
+    "brcm,cygnus-asiu-clk"
+
+The following table defines the set of PLL/clock index and ID for Cygnus.
+These clock IDs are defined in:
+    "include/dt-bindings/clock/bcm-cygnus.h"
+
+    Clock      Source           Index   ID
+    ---        -----            -----   ---------
+    crystal    N/A              N/A     N/A
+
+    armpll     crystal          N/A     N/A
+    genpll     crystal          N/A     N/A
+    lcpll0     crystal          N/A     N/A
+    mipipll    crystal          N/A     N/A
+
+    keypad     crystal (ASIU)   0       BCM_CYGNUS_ASIU_KEYPAD_CLK
+    adc/tsc    crystal (ASIU)   1       BCM_CYGNUS_ASIU_ADC_CLK
+    pwm        crystal (ASIU)   2       BCM_CYGNUS_ASIU_PWM_CLK
+
+    axi21      genpll           0       BCM_CYGNUS_GENPLL_AXI21_CLK
+    250mhz     genpll           1       BCM_CYGNUS_GENPLL_250MHZ_CLK
+    ihost_sys  genpll           2       BCM_CYGNUS_GENPLL_IHOST_SYS_CLK
+    enet_sw    genpll           3       BCM_CYGNUS_GENPLL_ENET_SW_CLK
+    audio_125  genpll           4       BCM_CYGNUS_GENPLL_AUDIO_125_CLK
+    can        genpll           5       BCM_CYGNUS_GENPLL_CAN_CLK
+
+    pcie_phy   lcpll0           0       BCM_CYGNUS_LCPLL0_PCIE_PHY_REF_CLK
+    ddr_phy    lcpll0           1       BCM_CYGNUS_LCPLL0_DDR_PHY_CLK
+    sdio       lcpll0           2       BCM_CYGNUS_LCPLL0_SDIO_CLK
+    usb_phy    lcpll0           3       BCM_CYGNUS_LCPLL0_USB_PHY_REF_CLK
+    smart_card lcpll0           4       BCM_CYGNUS_LCPLL0_SMART_CARD_CLK
+    ch5_unused lcpll0           5       BCM_CYGNUS_LCPLL0_CH5_UNUSED
+
+    ch0_unused mipipll          0       BCM_CYGNUS_MIPIPLL_CH0_UNUSED
+    ch1_lcd    mipipll          1       BCM_CYGNUS_MIPIPLL_CH1_LCD
+    ch2_v3d    mipipll          2       BCM_CYGNUS_MIPIPLL_CH2_V3D
+    ch3_unused mipipll          3       BCM_CYGNUS_MIPIPLL_CH3_UNUSED
+    ch4_unused mipipll          4       BCM_CYGNUS_MIPIPLL_CH4_UNUSED
+    ch5_unused mipipll          5       BCM_CYGNUS_MIPIPLL_CH5_UNUSED
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
