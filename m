From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/4] ARM: dts: da850-evm: add the output port to the vpif node
Date: Thu, 16 Feb 2017 19:15:31 +0100
Message-ID: <1487268932-6469-4-git-send-email-bgolaszewski@baylibre.com>
References: <1487268932-6469-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487268932-6469-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Patrick Titiano <ptitiano@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

Extend the vpif node with an output port with a single channel.

NOTE: this is still just hardware description - the actual driver
is registered using pdata-quirks.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/boot/dts/da850-evm.dts | 13 ++++++++++---
 arch/arm/boot/dts/da850.dtsi    |  8 +++++++-
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index 14f6f8ea..b549861 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -300,16 +300,23 @@
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
