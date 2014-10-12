From: Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 2/3] media: rc: meson: document device tree bindings
Date: Sun, 12 Oct 2014 22:01:54 +0200
Message-ID: <1413144115-23188-3-git-send-email-b.galvani@gmail.com>
References: <1413144115-23188-1-git-send-email-b.galvani@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413144115-23188-1-git-send-email-b.galvani@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jerry Cao <jerry.cao@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Beniamino Galvani <b.galvani@gmail.com>
List-Id: devicetree@vger.kernel.org

This adds binding documentation for the infrared remote control
receiver available in Amlogic Meson SoCs.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 Documentation/devicetree/bindings/media/meson-ir.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/meson-ir.txt

diff --git a/Documentation/devicetree/bindings/media/meson-ir.txt b/Documentation/devicetree/bindings/media/meson-ir.txt
new file mode 100644
index 0000000..407848e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/meson-ir.txt
@@ -0,0 +1,14 @@
+* Amlogic Meson IR remote control receiver
+
+Required properties:
+ - compatible	: should be "amlogic,meson6-ir"
+ - reg		: physical base address and length of the device registers
+ - interrupts	: a single specifier for the interrupt from the device
+
+Example:
+
+	ir-receiver@c8100480 {
+		compatible= "amlogic,meson6-ir";
+		reg = <0xc8100480 0x20>;
+		interrupts = <0 15 1>;
+	};
-- 
1.9.1
