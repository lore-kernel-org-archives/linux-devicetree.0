From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v1 1/1] dts: bindings: add mpc5121 clocks binding document
Date: Mon,  2 Dec 2013 15:20:34 +0100
Message-ID: <1385994034-2513-1-git-send-email-gsi@denx.de>
References: <20131202094656.GA12952@e106331-lin.cambridge.arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131202094656.GA12952-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

add a clock bindings documentation file for Freescale MPC5121

this binding implements and uses existing common clock bindings,
it does not introduce a new binding semantics but discusses the
specific use on Freescale MPC5121 and provides examples

Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
---

an accompanying doc update was suggested while the feature's
implementation currently is under review, i.e. this document does not
apply to the current status but "describes the future"

sending out this doc patch now is meant to neither have to re-spin the
whole series nor to further delay the doc update submission, but to
allow for immediate review of the doc update

 .../devicetree/bindings/clock/mpc5121-clock.txt    |   95 ++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mpc5121-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/mpc5121-clock.txt b/Documentation/devicetree/bindings/clock/mpc5121-clock.txt
new file mode 100644
index 000000000000..8fbb489f6581
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mpc5121-clock.txt
@@ -0,0 +1,95 @@
+Device Tree Clock bindings for Freescale MPC5121
+
+This binding uses the common clock binding[1] as well as the
+fixed-clock binding[2].
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+[2] Documentation/devicetree/bindings/clock/fixed-clock.txt
+
+== Clock provider ==
+
+The MPC5121 clock control module (CCM) implements a clock provider
+with several output clocks, which in turn are input clocks to
+peripherals.
+
+The MPC5121 CCM is another clock consumer with respect to the SoC's
+crystal or oscillator input (referred to both as XTAL or OSC in the
+chip's documentation).
+
+Required properties:
+- compatible:	shall contain "fsl,mpc5121-clock"
+- reg:		shall specify the start address and length of the
+		clock module's set of control registers
+- #clock-cells:	shall be 1; defines the number of integer cells
+		required for a clock specifier which references
+		this clock provider
+
+Optional properties:
+- clocks:	list of phandle and clock specifier pairs for the
+		node's input clocks, following the common clock
+		consumers binding; should be empty, or one XTAL/OSC
+		clock reference
+- clock-names:	list of clock input name strings sorted in the same
+		order as the 'clocks' property
+
+== Clock consumers ==
+
+Peripherals specify their input clocks by referencing clock providers
+according to the common clock consumer binding.  A clock gets identified
+by a phandle and clock specifiers pair.  The number of integer cells in
+the clock specifier is a property of the clock provider.
+
+The <dt-bindings/clock/mpc512x-clock.h> file provides symbolic names
+such that consumers need not encode magic numbers into their specs.
+
+== Examples ==
+
+The following example describes a fixed rate XTAL clock.
+
+osc: osc {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <33000000>;
+};
+
+The following example describes the clock control module (CCM),
+referencing the above XTAL as an input, providing output clocks.
+
+clks: clock@f00 {
+	compatible = "fsl,mpc5121-clock";
+	reg = <0xf00 0x100>;
+	#clock-cells = <1>;
+	clocks = <&osc>;
+	clock-names = "osc";
+};
+
+The following examples describe peripheral nodes which reference
+CCM output clocks as their input clocks.
+
+#include <dt-bindings/clock/mpc512x-clock.h>
+
+can@1300 {
+	compatible = "fsl,mpc5121-mscan";
+	...
+	clocks = <&clks MPC512x_CLK_BDLC>,
+		 <&clks MPC512x_CLK_IPS>,
+		 <&clks MPC512x_CLK_SYS>,
+		 <&clks MPC512x_CLK_REF>,
+		 <&clks MPC512x_CLK_MSCAN0_MCLK>;
+	clock-names = "ipg", "ips", "sys", "ref", "mclk";
+};
+
+i2c@1700 {
+	compatible = "fsl,mpc5121-i2c", "fsl-i2c";
+	...
+	clocks = <&clks MPC512x_CLK_I2C>;
+	clock-names = "ipg";
+};
+
+psc@11000 {
+	compatible = "fsl,mpc5121-psc";
+	...
+	clocks = <&clks MPC512x_CLK_PSC0>,
+		 <&clks MPC512x_CLK_PSC0_MCLK>;
+	clock-names = "ipg", "mclk";
+};
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
