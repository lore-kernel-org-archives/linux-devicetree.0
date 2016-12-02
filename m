From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 5/5] ARM64: dts: amlogic: add the ethernet TX delay
 configuration
Date: Sat,  3 Dec 2016 00:47:39 +0100
Message-ID: <20161202234739.22929-6-martin.blumenstingl@googlemail.com>
References: <20161202234739.22929-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161202234739.22929-1-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds the amlogic,tx-delay-ns with the old (hardcoded) default value
of 2ns to all boards which are using an RGMII ethernet PHY.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi     | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts  | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxm-s912-q200.dts  | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index cbaf024..fdade07 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -161,6 +161,8 @@
 	snps,reset-delays-us = <0 10000 1000000>;
 	snps,reset-active-low;
 
+	amlogic,tx-delay-ns = <2>;
+
 	phy-mode = "rgmii";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
index 2abc553..8172e12 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
@@ -152,6 +152,8 @@
 	snps,reset-delays-us = <0 10000 1000000>;
 	snps,reset-active-low;
 
+	amlogic,tx-delay-ns = <2>;
+
 	phy-mode = "rgmii";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index a0e92e3..ab49712 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -131,6 +131,8 @@
 	snps,reset-delays-us = <0 10000 1000000>;
 	snps,reset-active-low;
 
+	amlogic,tx-delay-ns = <2>;
+
 	phy-mode = "rgmii";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index f66939c..7fd11c6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -64,6 +64,8 @@
 	snps,reset-delays-us = <0 10000 1000000>;
 	snps,reset-active-low;
 
+	amlogic,tx-delay-ns = <2>;
+
 	/* External PHY is in RGMII */
 	phy-mode = "rgmii";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index f859d75..cf9b960 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -156,6 +156,8 @@
 	snps,reset-delays-us = <0 10000 1000000>;
 	snps,reset-active-low;
 
+	amlogic,tx-delay-ns = <2>;
+
 	/* External PHY is in RGMII */
 	phy-mode = "rgmii";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-s912-q200.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-s912-q200.dts
index 5dbc660..e428e29 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-s912-q200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-s912-q200.dts
@@ -64,6 +64,8 @@
 	snps,reset-delays-us = <0 10000 1000000>;
 	snps,reset-active-low;
 
+	amlogic,tx-delay-ns = <2>;
+
 	/* External PHY is in RGMII */
 	phy-mode = "rgmii";
 };
-- 
2.10.2
