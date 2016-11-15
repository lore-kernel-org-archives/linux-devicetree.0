From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2] ARM: dts: da850: add the mstpri and ddrctl nodes
Date: Tue, 15 Nov 2016 12:00:11 +0100
Message-ID: <1479207611-18028-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, linux-drm <dri-devel@lists.freedesktop.org>, linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add the nodes for the MSTPRI configuration and DDR2/mDDR memory
controller drivers to da850.dtsi.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- moved the priority controller node above the cfgchip node
- renamed added nodes to better reflect their purpose

 arch/arm/boot/dts/da850.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 1bb1f6d..412eec6 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -210,6 +210,10 @@
 			};
 
 		};
+		prictrl: priority-controller@14110 {
+			compatible = "ti,da850-mstpri";
+			reg = <0x14110 0x0c>;
+		};
 		cfgchip: chip-controller@1417c {
 			compatible = "ti,da830-cfgchip", "syscon", "simple-mfd";
 			reg = <0x1417c 0x14>;
@@ -451,4 +455,8 @@
 			  1 0 0x68000000 0x00008000>;
 		status = "disabled";
 	};
+	memctrl: memory-controller@b0000000 {
+		compatible = "ti,da850-ddr-controller";
+		reg = <0xb0000000 0xe8>;
+	};
 };
-- 
2.9.3
