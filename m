From: Peter Senna Tschudin <peter.senna@collabora.com>
Subject: [PATCH V2 3/5] Documentation/devicetree/bindings: b850v3_lvds_dp
Date: Thu,  9 Jun 2016 18:25:03 +0200
Message-ID: <59c49951b95b0eb5b34eede6cfce526e72bc2443.1465486875.git.peter.senna@collabora.com>
References: <1464626385-19253-1-git-send-email-peter.senna@collabora.com>
 <cover.1465486875.git.peter.senna@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1465486875.git.peter.senna@collabora.com>
In-Reply-To: <cover.1465486875.git.peter.senna@collabora.com>
References: <cover.1465486875.git.peter.senna@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: airlied@linux.ie, akpm@linux-foundation.org, davem@davemloft.net, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, enric.balletbo@collabora.com, eballetbo@gmail.com, galak@codeaurora.org, gregkh@linuxfoundation.org, heiko@sntech.de, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux@roeck-us.net, mark.rutland@arm.com, martin.donnelly@ge.com, martyn.welch@collabora.co.uk, mchehab@osg.samsung.com, pawel.moll@arm.com, peter.senna@collabora.com, peter.senna@gmail.com, p.zabel@pengutronix.de, thierry.reding@gmail.com, rmk+kernel@armlinux.org.uk, robh+dt@kernel.org, shawnguo@kernel.org, tiwai@suse.com, treding@nvidia.com, ykk@rock-chips.com
Cc: Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

Devicetree bindings documentation for the GE B850v3 LVDS/DP++
display bridge.

Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@collabora.com>
---
Changes from V1:
 - Replaced '_' by '-' in node names or compatible strings
 - Added missing @73 to the example

 .../devicetree/bindings/ge/b850v3_lvds_dp.txt      | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ge/b850v3_lvds_dp.txt

diff --git a/Documentation/devicetree/bindings/ge/b850v3_lvds_dp.txt b/Documentation/devicetree/bindings/ge/b850v3_lvds_dp.txt
new file mode 100644
index 0000000..46bbea9
--- /dev/null
+++ b/Documentation/devicetree/bindings/ge/b850v3_lvds_dp.txt
@@ -0,0 +1,38 @@
+Driver for GE B850v3 LVDS/DP++ display bridge
+
+Required properties:
+  - compatible : should be "ge,b850v3_lvds_dp".
+  - reg : should contain the address used to ack the interrupts.
+  - interrupt-parent : should link to the gpio used as interrupt
+    source on the host.
+  - interrupts : one interrupt should be described here, as in
+    <0 IRQ_TYPE_LEVEL_HIGH>.
+  - edid-reg : should contain the address used to read edid information
+  - port : should describe the vide signal connection between the host
+    and the bridge.
+
+Example:
+
+&mux2_i2c2 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	b850v3-lvds-dp-bridge@73  {
+		compatible = "ge,b850v3-lvds-dp";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg = <0x73>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+		edid-reg = <0x72>;
+
+		port@0 {
+			reg = <0>;
+			b850v3_dp_bridge_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+};
-- 
2.5.5
