From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH 1/4] drm: arm: Add DT bindings documentation for HDLCD driver.
Date: Wed,  5 Aug 2015 15:28:09 +0100
Message-ID: <1438784892-27888-2-git-send-email-Liviu.Dudau@arm.com>
References: <1438784892-27888-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1438784892-27888-1-git-send-email-Liviu.Dudau@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Jon Medhurst <tixy@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>

Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
---
 .../devicetree/bindings/drm/arm/arm,hdlcd.txt      | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/arm/arm,hdlcd.txt

diff --git a/Documentation/devicetree/bindings/drm/arm/arm,hdlcd.txt b/Documentation/devicetree/bindings/drm/arm/arm,hdlcd.txt
new file mode 100644
index 0000000..b57f1b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/arm/arm,hdlcd.txt
@@ -0,0 +1,74 @@
+ARM HDLCD
+
+This is a display controller found on several development platforms produced
+by ARM Ltd and in more modern of its' Fast Models. The HDLCD is an RGB
+streamer that reads the data from a framebuffer and sends it to a single
+digital encoder (DVI or HDMI).
+
+Required properties:
+  - compatible: "arm,hdlcd"
+  - reg: Physical base address and length of the controller's registers.
+    If a second pair of address and length values is present this specifies
+    the presence of a DMA coherent memory area that the HDLCD can use as
+    framebuffer instead of normal CMA memory.
+  - interrupts: One interrupt used by the display controller to notify the
+    interrupt controller when any of the interrupt sources programmed in
+    the interrupt mask register have activated.
+  - clocks: A list of phandle + clock-specifier pairs, one for each
+    entry in 'clock-names'.
+  - clock-names: A list of clock names. For HDLD it should contain:
+      - "pxlclk" for the clock feeding the output PLL of the controller.
+  - port: The HDLCD connection to an encoder chip. The connection is modelled
+    using the OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
+
+
+Example:
+
+/ {
+	...
+
+	hdlcd@2b000000 {
+		compatible = "arm,hdlcd";
+		reg = <0 0x2b000000 0 0x1000>;
+		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&oscclk5>;
+		clock-names = "pxlclk";
+		port {
+			hdlcd_output: endpoint@0 {
+				remote-endpoint = <&hdmi_enc_input>;
+			};
+		};
+	};
+
+	/* HDMI encoder on I2C bus */
+	i2c@7ffa0000 {
+		....
+		hdmi-transmitter@70 {
+			compatible = ".....";
+			reg = <0x70>;
+			video-ports = <0x234501>;
+			port@0 {
+				hdmi_enc_input: endpoint {
+					remote-endpoint = <&hdlcd_output>;
+				};
+
+				hdmi_enc_output: endpoint {
+					remote-endpoint = <&hdmi_1_port>;
+				};
+			};
+		};
+
+	};
+
+	hdmi1: connector@1 {
+		compatible = "hdmi-connector";
+		type = "a";
+		port {
+			hdmi_1_port: endpoint {
+				remote-endpoint = <&hdmi_enc_output>;
+			};
+		};
+	};
+
+	...
+};
-- 
2.4.6
