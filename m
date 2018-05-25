From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [PATCH 4/5] dt-bindings: ptp: add ptp-qoriq.txt
Date: Fri, 25 May 2018 12:40:37 +0800
Message-ID: <20180525044038.37756-4-yangbo.lu@nxp.com>
References: <20180525044038.37756-1-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180525044038.37756-1-yangbo.lu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>, claudiu.manoil@nxp.com, Rob Herring <robh+dt@kernel.org>
Cc: Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch is to add a documentation for ptp_qoriq dt-bindings.
The description for ptp_qoriq dt-bindings was actually moved
from Documentation/devicetree/bindings/net/fsl-tsec-phy.txt,
since gianfar_ptp driver was moved to ptp_qoriq driver.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
 .../devicetree/bindings/net/fsl-tsec-phy.txt       |   68 +-------------------
 .../devicetree/bindings/ptp/ptp-qoriq.txt          |   69 ++++++++++++++++++++
 2 files changed, 70 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ptp/ptp-qoriq.txt

diff --git a/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt b/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
index 79bf352..047bdf7 100644
--- a/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
+++ b/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
@@ -86,70 +86,4 @@ Example:
 
 * Gianfar PTP clock nodes
 
-General Properties:
-
-  - compatible   Should be "fsl,etsec-ptp"
-  - reg          Offset and length of the register set for the device
-  - interrupts   There should be at least two interrupts. Some devices
-                 have as many as four PTP related interrupts.
-
-Clock Properties:
-
-  - fsl,cksel        Timer reference clock source.
-  - fsl,tclk-period  Timer reference clock period in nanoseconds.
-  - fsl,tmr-prsc     Prescaler, divides the output clock.
-  - fsl,tmr-add      Frequency compensation value.
-  - fsl,tmr-fiper1   Fixed interval period pulse generator.
-  - fsl,tmr-fiper2   Fixed interval period pulse generator.
-  - fsl,max-adj      Maximum frequency adjustment in parts per billion.
-
-  These properties set the operational parameters for the PTP
-  clock. You must choose these carefully for the clock to work right.
-  Here is how to figure good values:
-
-  TimerOsc     = selected reference clock   MHz
-  tclk_period  = desired clock period       nanoseconds
-  NominalFreq  = 1000 / tclk_period         MHz
-  FreqDivRatio = TimerOsc / NominalFreq     (must be greater that 1.0)
-  tmr_add      = ceil(2^32 / FreqDivRatio)
-  OutputClock  = NominalFreq / tmr_prsc     MHz
-  PulseWidth   = 1 / OutputClock            microseconds
-  FiperFreq1   = desired frequency in Hz
-  FiperDiv1    = 1000000 * OutputClock / FiperFreq1
-  tmr_fiper1   = tmr_prsc * tclk_period * FiperDiv1 - tclk_period
-  max_adj      = 1000000000 * (FreqDivRatio - 1.0) - 1
-
-  The calculation for tmr_fiper2 is the same as for tmr_fiper1. The
-  driver expects that tmr_fiper1 will be correctly set to produce a 1
-  Pulse Per Second (PPS) signal, since this will be offered to the PPS
-  subsystem to synchronize the Linux clock.
-
-  Reference clock source is determined by the value, which is holded
-  in CKSEL bits in TMR_CTRL register. "fsl,cksel" property keeps the
-  value, which will be directly written in those bits, that is why,
-  according to reference manual, the next clock sources can be used:
-
-  <0> - external high precision timer reference clock (TSEC_TMR_CLK
-        input is used for this purpose);
-  <1> - eTSEC system clock;
-  <2> - eTSEC1 transmit clock;
-  <3> - RTC clock input.
-
-  When this attribute is not used, eTSEC system clock will serve as
-  IEEE 1588 timer reference clock.
-
-Example:
-
-	ptp_clock@24e00 {
-		compatible = "fsl,etsec-ptp";
-		reg = <0x24E00 0xB0>;
-		interrupts = <12 0x8 13 0x8>;
-		interrupt-parent = < &ipic >;
-		fsl,cksel       = <1>;
-		fsl,tclk-period = <10>;
-		fsl,tmr-prsc    = <100>;
-		fsl,tmr-add     = <0x999999A4>;
-		fsl,tmr-fiper1  = <0x3B9AC9F6>;
-		fsl,tmr-fiper2  = <0x00018696>;
-		fsl,max-adj     = <659999998>;
-	};
+Refer to Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
diff --git a/Documentation/devicetree/bindings/ptp/ptp-qoriq.txt b/Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
new file mode 100644
index 0000000..0f569d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
@@ -0,0 +1,69 @@
+* Freescale QorIQ 1588 timer based PTP clock
+
+General Properties:
+
+  - compatible   Should be "fsl,etsec-ptp"
+  - reg          Offset and length of the register set for the device
+  - interrupts   There should be at least two interrupts. Some devices
+                 have as many as four PTP related interrupts.
+
+Clock Properties:
+
+  - fsl,cksel        Timer reference clock source.
+  - fsl,tclk-period  Timer reference clock period in nanoseconds.
+  - fsl,tmr-prsc     Prescaler, divides the output clock.
+  - fsl,tmr-add      Frequency compensation value.
+  - fsl,tmr-fiper1   Fixed interval period pulse generator.
+  - fsl,tmr-fiper2   Fixed interval period pulse generator.
+  - fsl,max-adj      Maximum frequency adjustment in parts per billion.
+
+  These properties set the operational parameters for the PTP
+  clock. You must choose these carefully for the clock to work right.
+  Here is how to figure good values:
+
+  TimerOsc     = selected reference clock   MHz
+  tclk_period  = desired clock period       nanoseconds
+  NominalFreq  = 1000 / tclk_period         MHz
+  FreqDivRatio = TimerOsc / NominalFreq     (must be greater that 1.0)
+  tmr_add      = ceil(2^32 / FreqDivRatio)
+  OutputClock  = NominalFreq / tmr_prsc     MHz
+  PulseWidth   = 1 / OutputClock            microseconds
+  FiperFreq1   = desired frequency in Hz
+  FiperDiv1    = 1000000 * OutputClock / FiperFreq1
+  tmr_fiper1   = tmr_prsc * tclk_period * FiperDiv1 - tclk_period
+  max_adj      = 1000000000 * (FreqDivRatio - 1.0) - 1
+
+  The calculation for tmr_fiper2 is the same as for tmr_fiper1. The
+  driver expects that tmr_fiper1 will be correctly set to produce a 1
+  Pulse Per Second (PPS) signal, since this will be offered to the PPS
+  subsystem to synchronize the Linux clock.
+
+  Reference clock source is determined by the value, which is holded
+  in CKSEL bits in TMR_CTRL register. "fsl,cksel" property keeps the
+  value, which will be directly written in those bits, that is why,
+  according to reference manual, the next clock sources can be used:
+
+  <0> - external high precision timer reference clock (TSEC_TMR_CLK
+        input is used for this purpose);
+  <1> - eTSEC system clock;
+  <2> - eTSEC1 transmit clock;
+  <3> - RTC clock input.
+
+  When this attribute is not used, eTSEC system clock will serve as
+  IEEE 1588 timer reference clock.
+
+Example:
+
+	ptp_clock@24e00 {
+		compatible = "fsl,etsec-ptp";
+		reg = <0x24E00 0xB0>;
+		interrupts = <12 0x8 13 0x8>;
+		interrupt-parent = < &ipic >;
+		fsl,cksel       = <1>;
+		fsl,tclk-period = <10>;
+		fsl,tmr-prsc    = <100>;
+		fsl,tmr-add     = <0x999999A4>;
+		fsl,tmr-fiper1  = <0x3B9AC9F6>;
+		fsl,tmr-fiper2  = <0x00018696>;
+		fsl,max-adj     = <659999998>;
+	};
-- 
1.7.1
