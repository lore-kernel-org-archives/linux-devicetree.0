From: Peter Senna Tschudin <peter.senna@collabora.com>
Subject: [PATCH V2 1/4] dt-bindings: display: megachips-stdpxxxx-ge-b850v3-fw
Date: Tue, 28 Feb 2017 15:28:10 +0100
Message-ID: <85c405428279c1c8e062d825112db800342a98ca.1488287639.git.peter.senna@collabora.com>
References: <cover.1488287639.git.peter.senna@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1488287639.git.peter.senna@collabora.com>
In-Reply-To: <cover.1488287639.git.peter.senna@collabora.com>
References: <cover.1488287639.git.peter.senna@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: airlied@linux.ie, architt@codeaurora.org, akpm@linux-foundation.org, daniel.vetter@ffwll.ch, davem@davemloft.net, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, enric.balletbo@collabora.com, eballetbo@gmail.com, galak@codeaurora.org, gregkh@linuxfoundation.org, heiko@sntech.de, ijc+devicetree@hellion.org.uk, javier@dowhile0.org, jslaby@suse.cz, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux@roeck-us.net, mark.rutland@arm.com, martin.donnelly@ge.com, martyn.welch@collabora.co.uk, mchehab@osg.samsung.com, pawel.moll@arm.com, peter.senna@collabora.com, peter.senna@gmail.com, p.zabel@pengutronix.de, thierry.reding@gmail.com, rmk+kernel@armlinux.org.uk, robh+dt@kernel.org, shawnguo@kernel.org, tiwai@suse.com, treding@nvidia.com, ykk@rock-chips.com, laurent.pinchart@ideasonboard.com
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh@kernel.org>, Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>
List-Id: devicetree@vger.kernel.org

Devicetree binding documentation for the second video output
of the GE B850v3:
   STDP4028-ge-b850v3-fw bridges (LVDS-DP)
   STDP2690-ge-b850v3-fw bridges (DP-DP++)

Added entry for MegaChips at:
 Documentation/devicetree/bindings/vendor-prefixes.txt

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Martin Donnelly <martin.donnelly@ge.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@collabora.com>
---
Changes from V1:
 - New subject
 - Moved binding documentation from bindings/video/ to bindings/display/bridge/
 - Reworded to describe hardware instead of the driver
 - Reformated the bindings to have one set of required properties per device
 - Updated reg description
 - Defined number of ports and what they are for

 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.txt     | 94 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt b/Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
new file mode 100644
index 0000000..7baa658
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
@@ -0,0 +1,94 @@
+Drivers for the second video output of the GE B850v3:
+   STDP4028-ge-b850v3-fw bridges (LVDS-DP)
+   STDP2690-ge-b850v3-fw bridges (DP-DP++)
+
+The video processing pipeline on the second output on the GE B850v3:
+
+   Host -> LVDS|--(STDP4028)--|DP -> DP|--(STDP2690)--|DP++ -> Video output
+
+Each bridge has a dedicated flash containing firmware for supporting the custom
+design. The result is that, in this design, neither the STDP4028 nor the
+STDP2690 behave as the stock bridges would. The compatible strings include the
+suffix "-ge-b850v3-fw" to make it clear that the driver is for the bridges with
+the firmware specific for the GE B850v3.
+
+The hardware do not provide control over the video processing pipeline, as the
+two bridges behaves as a single one. The only interfaces exposed by the
+hardware are EDID, HPD, and interrupts.
+
+stdp4028-ge-b850v3-fw required properties:
+  - compatible : "megachips,stdp4028-ge-b850v3-fw"
+  - reg : I2C bus address
+  - interrupt-parent : phandle of the interrupt controller that services
+    interrupts to the device
+  - interrupts : one interrupt should be described here, as in
+    <0 IRQ_TYPE_LEVEL_HIGH>
+  - ports : One input port(reg = <0>) and one output port(reg = <1>)
+
+stdp2690-ge-b850v3-fw required properties:
+    compatible : "megachips,stdp2690-ge-b850v3-fw"
+  - reg : I2C bus address
+  - ports : One input port(reg = <0>) and one output port(reg = <1>)
+
+Example:
+
+&mux2_i2c2 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	stdp4028@73 {
+		compatible = "megachips,stdp4028-ge-b850v3-fw";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg = <0x73>;
+
+		interrupt-parent = <&gpio2>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				stdp4028_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				stdp4028_out: endpoint {
+					remote-endpoint = <&stdp2690_in>;
+				};
+			};
+		};
+	};
+
+	stdp2690@72 {
+		compatible = "megachips,stdp2690-ge-b850v3-fw";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg = <0x72>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				stdp2690_in: endpoint {
+					remote-endpoint = <&stdp4028_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				stdp2690_out: endpoint {
+					/* Connector for external display */
+				};
+			};
+		};
+	};
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index ec0bfb9..4686f4b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -178,6 +178,7 @@ maxim	Maxim Integrated Products
 mcube	mCube
 meas	Measurement Specialties
 mediatek	MediaTek Inc.
+megachips	MegaChips
 melexis	Melexis N.V.
 melfas	MELFAS Inc.
 memsic	MEMSIC Inc.
-- 
2.9.3
