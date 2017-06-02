From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2] ARM: dts: r7s72100: add clock bit definitions
Date: Fri,  2 Jun 2017 09:06:49 -0700
Message-ID: <20170602160649.3120-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Add the remaining bit locations for the module stop clock registers.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
* Added coresight bit
* MCPWM -> PWM
* SNDGEN[0-3] -> SG[0-3]
* ETHABV -> ETHAVB
* SPIMBC[0-1] -> SPIBSC[0-1]
* Added SSI[0-5]
---
 include/dt-bindings/clock/r7s72100-clock.h | 51 ++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
index dcd2072151fc..7dd8bc0c3cd0 100644
--- a/include/dt-bindings/clock/r7s72100-clock.h
+++ b/include/dt-bindings/clock/r7s72100-clock.h
@@ -12,8 +12,18 @@
 
 #define R7S72100_CLK_PLL	0
 
+/* MSTP2 */
+#define R7S72100_CLK_CORESIGHT	0
+
 /* MSTP3 */
+#define R7S72100_CLK_IEBUS	7
+#define R7S72100_CLK_IRDA	6
+#define R7S72100_CLK_LIN0	5
+#define R7S72100_CLK_LIN1	4
 #define R7S72100_CLK_MTU2	3
+#define R7S72100_CLK_CAN	2
+#define R7S72100_CLK_ADCPWR	1
+#define R7S72100_CLK_PWM	0
 
 /* MSTP4 */
 #define R7S72100_CLK_SCIF0	7
@@ -26,25 +36,51 @@
 #define R7S72100_CLK_SCIF7	0
 
 /* MSTP5 */
+#define R7S72100_CLK_SCI0	7
+#define R7S72100_CLK_SCI1	6
+#define R7S72100_CLK_SG0	5
+#define R7S72100_CLK_SG1	4
+#define R7S72100_CLK_SG2	3
+#define R7S72100_CLK_SG3	2
 #define R7S72100_CLK_OSTM0	1
 #define R7S72100_CLK_OSTM1	0
 
 /* MSTP6 */
+#define R7S72100_CLK_ADC	7
+#define R7S72100_CLK_CEU	6
+#define R7S72100_CLK_DOC0	5
+#define R7S72100_CLK_DOC1	4
+#define R7S72100_CLK_DRC0	3
+#define R7S72100_CLK_DRC1	2
+#define R7S72100_CLK_JCU	1
 #define R7S72100_CLK_RTC	0
 
 /* MSTP7 */
+#define R7S72100_CLK_VDEC0	7
+#define R7S72100_CLK_VDEC1	6
 #define R7S72100_CLK_ETHER	4
+#define R7S72100_CLK_NAND	3
 #define R7S72100_CLK_USB0	1
 #define R7S72100_CLK_USB1	0
 
 /* MSTP8 */
+#define R7S72100_CLK_IMR0	7
+#define R7S72100_CLK_IMR1	6
+#define R7S72100_CLK_IMRDISP	5
 #define R7S72100_CLK_MMCIF	4
+#define R7S72100_CLK_MLB	3
+#define R7S72100_CLK_ETHAVB	2
+#define R7S72100_CLK_SCUX	1
 
 /* MSTP9 */
 #define R7S72100_CLK_I2C0	7
 #define R7S72100_CLK_I2C1	6
 #define R7S72100_CLK_I2C2	5
 #define R7S72100_CLK_I2C3	4
+#define R7S72100_CLK_SPIBSC0	3
+#define R7S72100_CLK_SPIBSC1	2
+#define R7S72100_CLK_VDC50	1	/* and LVDS */
+#define R7S72100_CLK_VDC51	0
 
 /* MSTP10 */
 #define R7S72100_CLK_SPI0	7
@@ -52,6 +88,17 @@
 #define R7S72100_CLK_SPI2	5
 #define R7S72100_CLK_SPI3	4
 #define R7S72100_CLK_SPI4	3
+#define R7S72100_CLK_CDROM	2
+#define R7S72100_CLK_SPDIF	1
+#define R7S72100_CLK_RGPVG2	0
+
+/* MSTP11 */
+#define R7S72100_CLK_SSI0	5
+#define R7S72100_CLK_SSI1	4
+#define R7S72100_CLK_SSI2	3
+#define R7S72100_CLK_SSI3	2
+#define R7S72100_CLK_SSI4	1
+#define R7S72100_CLK_SSI5	0
 
 /* MSTP12 */
 #define R7S72100_CLK_SDHI00	3
@@ -59,4 +106,8 @@
 #define R7S72100_CLK_SDHI10	1
 #define R7S72100_CLK_SDHI11	0
 
+/* MSTP13 */
+#define R7S72100_CLK_PIX1	2
+#define R7S72100_CLK_PIX0	1
+
 #endif /* __DT_BINDINGS_CLOCK_R7S72100_H__ */
-- 
2.13.0
