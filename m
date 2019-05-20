From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 4/5] ARM: dts: meson8m2: update the offset of the canvas module
Date: Mon, 20 May 2019 21:43:52 +0200
Message-ID: <20190520194353.24445-5-martin.blumenstingl@googlemail.com>
References: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, mjourdan@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

With the Meson8m2 SoC the canvas module was moved from offset 0x20
(Meson8) to offset 0x48 (same as on Meson8b). The offsets inside the
canvas module are identical.

Correct the offset so the driver uses the correct registers.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8m2.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/meson8m2.dtsi b/arch/arm/boot/dts/meson8m2.dtsi
index bb87b251e16d..5bde7f502007 100644
--- a/arch/arm/boot/dts/meson8m2.dtsi
+++ b/arch/arm/boot/dts/meson8m2.dtsi
@@ -14,6 +14,16 @@
 	compatible = "amlogic,meson8m2-clkc", "amlogic,meson8-clkc";
 };
 
+&dmcbus {
+	/* the offset of the canvas registers has changed compared to Meson8 */
+	/delete-node/ video-lut@20;
+
+	canvas: video-lut@48 {
+		compatible = "amlogic,meson8m2-canvas", "amlogic,canvas";
+		reg = <0x48 0x14>;
+	};
+};
+
 &ethmac {
 	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac";
 	reg = <0xc9410000 0x10000
-- 
2.21.0
