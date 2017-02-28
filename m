From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 4/4] ARM: dts: da850-evm: add the output port to the vpif
 node
Date: Tue, 28 Feb 2017 17:15:16 +0100
Message-ID: <1488298516-14363-5-git-send-email-bgolaszewski@baylibre.com>
References: <1488298516-14363-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488298516-14363-1-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sekhar Nori <nsekhar@ti.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Patrick Titiano <ptitiano@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

Extend the vpif node with an output port with a single channel.

NOTE: this is still mostly just hardware description - the actual
driver is registered using pdata-quirks. We need the node however
for correct pin control function selection.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/boot/dts/da850-evm.dts | 15 +++++++++++----
 arch/arm/boot/dts/da850.dtsi    |  8 +++++++-
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index 3968a18..aa29991 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -300,20 +300,27 @@
 
 &vpif {
 	pinctrl-names = "default";
-	pinctrl-0 = <&vpif_capture_pins>;
+	pinctrl-0 = <&vpif_capture_pins>, <&vpif_display_pins>;
 	status = "okay";
 
 	/* VPIF capture port */
-	port {
-		vpif_ch0: endpoint@0 {
+	port@0 {
+		vpif_input_ch0: endpoint@0 {
 			reg = <0>;
 			bus-width = <8>;
 		};
 
-		vpif_ch1: endpoint@1 {
+		vpif_input_ch1: endpoint@1 {
 			reg = <1>;
 			bus-width = <8>;
 			data-shift = <8>;
 		};
 	};
+
+	/* VPIF display port */
+	port@1 {
+		vpif_output_ch0: endpoint {
+			bus-width = <8>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 5150331..c708155 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -358,7 +358,13 @@
 			status = "disabled";
 
 			/* VPIF capture port */
-			port {
+			port@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			/* VPIF display port */
+			port@1 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
-- 
2.9.3
