From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [RFC PATCH v4 4/8] staging: imx-drm: Document imx-hdmi device tree
 bindings
Date: Tue, 25 Feb 2014 15:23:19 +0100
Message-ID: <1393338203-25051-5-git-send-email-p.zabel@pengutronix.de>
References: <1393338203-25051-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1393338203-25051-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds device tree binding documentation for the HDMI transmitter
on i.MX6.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 .../devicetree/bindings/staging/imx-drm/hdmi.txt   | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/staging/imx-drm/hdmi.txt

diff --git a/Documentation/devicetree/bindings/staging/imx-drm/hdmi.txt b/Documentation/devicetree/bindings/staging/imx-drm/hdmi.txt
new file mode 100644
index 0000000..7dcd673a
--- /dev/null
+++ b/Documentation/devicetree/bindings/staging/imx-drm/hdmi.txt
@@ -0,0 +1,53 @@
+Device-Tree bindings for HDMI Transmitter
+
+HDMI Transmitter
+================
+
+The LVDS Display Bridge device tree node contains up to two lvds-channel
+nodes describing each of the two LVDS encoder channels of the bridge.
+
+Required properties:
+ - #address-cells : should be <1>
+ - #size-cells : should be <0>
+ - compatible : should be "fsl,imx6q-hdmi" or "fsl,imx6dl-hdmi".
+ - gpr : should be <&gpr>.
+   The phandle points to the iomuxc-gpr region containing the HDMI
+   multiplexer control register.
+ - clocks, clock-names : phandles to the HDMI iahb and isrf clocks, as described
+   in Documentation/devicetree/bindings/clock/clock-bindings.txt and
+   Documentation/devicetree/bindings/clock/imx6q-clock.txt.
+ - port@[0-4]: Up to four port nodes with endpoint definitions as defined in
+   Documentation/devicetree/bindings/media/video-interfaces.txt,
+   corresponding to the four inputs to the HDMI multiplexer.
+
+example:
+
+	gpr: iomuxc-gpr@020e0000 {
+		/* ... */
+	};
+
+        hdmi: hdmi@0120000 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x00120000 0x9000>;
+                interrupts = <0 115 0x04>;
+                gpr = <&gpr>;
+                clocks = <&clks 123>, <&clks 124>;
+                clock-names = "iahb", "isfr";
+
+                port@0 {
+                        reg = <0>;
+
+                        hdmi_mux_0: endpoint {
+                                remote-endpoint = <&ipu1_di0_hdmi>;
+                        };
+                };
+
+                port@1 {
+                        reg = <1>;
+
+                        hdmi_mux_1: endpoint {
+                                remote-endpoint = <&ipu1_di1_hdmi>;
+                        };
+                };
+        };
-- 
1.8.5.3
