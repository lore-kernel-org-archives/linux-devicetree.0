From: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v0 10/15] clk: st: Adds quadfs clock binding
Date: Thu, 27 Feb 2014 16:24:23 +0100
Message-ID: <1393514668-17440-11-git-send-email-gabriel.fernandez@st.com>
References: <1393514668-17440-1-git-send-email-gabriel.fernandez@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393514668-17440-1-git-send-email-gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/clock/st/st,quadfs.txt     | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/st/st,quadfs.txt

diff --git a/Documentation/devicetree/bindings/clock/st/st,quadfs.txt b/Documentation/devicetree/bindings/clock/st/st,quadfs.txt
new file mode 100644
index 0000000..ec86d62
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/st/st,quadfs.txt
@@ -0,0 +1,45 @@
+Binding for a type of quad channel digital frequency synthesizer found on
+certain STMicroelectronics consumer electronics SoC devices.
+
+This version contains a programmable PLL which can generate up to 216, 432
+or 660MHz (from a 30MHz oscillator input) as the input to the digital
+synthesizers.
+
+This binding uses the common clock binding[1].
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible : shall be:
+  "st,stih416-quadfs216",	"st,quadfs"
+  "st,stih416-quadfs432",	"st,quadfs"
+  "st,stih416-quadfs660-E",	"st,quadfs"
+  "st,stih416-quadfs660-F",	"st,quadfs"
+
+- #clock-cells : from common clock binding; shall be set to 1.
+
+- reg : A Base address and length of the register set.
+
+- clocks : from common clock binding
+
+- clock-output-names : From common clock binding. The block has 4
+                       clock outputs but not all of them in a specific instance
+                       have to be used in the SoC. If a clock name is left as
+                       an empty string then no clock will be created for the
+                       output associated with that string index. If fewer than
+                       4 strings are provided then no clocks will be created
+                       for the remaining outputs.
+
+Example:
+
+	CLOCKGEN_E: CLOCKGEN_E {
+                #clock-cells = <1>;
+                compatible = "st,stih416-quadfs660-E", "st,quadfs";
+                reg = <0xfd3208bc 0xB0>;
+
+                clocks = <&CLK_SYSIN>;
+                clock-output-names = "CLK_M_PIX_MDTP_0",
+                                        "CLK_M_PIX_MDTP_1",
+                                        "CLK_M_PIX_MDTP_2",
+                                        "CLK_M_MPELPC";
+        };
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
