Return-Path: <SRS0=MGmW=T3=klsmartin.com=Leif.Middelschulte@kernel.org>
From: Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 01/10] dt-bindings: input: touchscreen: stmpe: add touch window configuration
Date: Mon, 27 May 2019 18:07:27 +0200
Message-ID: <20190527160736.30569-2-leif.middelschulte@klsmartin.com>
In-Reply-To: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Leif Middelschulte <leif.middelschulte@klsmartin.com>
List-ID: <devicetree@vger.kernel.org>

The STMPE811 is able to only monitor a subwindow of the
entire screen. Touches outside of this window are neglected.
This change adds the corresponding documentation.

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
---
 .../devicetree/bindings/input/touchscreen/stmpe.txt      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
index c549924603d2..04962e2e1ad0 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
@@ -33,6 +33,13 @@ Optional properties:
 - st,i-drive		: current limit value of the touchscreen drivers
 				0 -> 20 mA (typical 35mA max)
 				1 -> 50 mA (typical 80 mA max)
+- st,window-tracking	: An u12 array that allows to pre-set a sub-window in the touchscreen.
+				Any touch position that is outside the sub-window is discarded
+				(top-right x, top-right y, bottom-left x, bottom-left y).
+				The given window also affects the value range (limits) set
+				within the input subsystem which, in turn, affects
+				the input resolution calculation on both axes.
+
 
 Optional properties common with MFD (deprecated):
  - st,sample-time	: ADC conversion time in number of clock.
@@ -101,6 +108,8 @@ stmpe811@41 {
 		 * current limit value
 		 */
 		st,i-drive = <1>;
+		/* enable entire window */
+		st,window-tracking = /bits/ 16 <4095 4095 0 0>;
 	};
 	stmpe_adc {
 		compatible = "st,stmpe-adc";
-- 
2.21.0
