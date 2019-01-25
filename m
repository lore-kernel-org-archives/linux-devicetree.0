From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 11/11] ARM: dts: sun8i-a23-q8: Set compatible string for LCD panel
Date: Fri, 25 Jan 2019 11:23:14 +0800
Message-ID: <20190125032314.20915-12-wens@csie.org>
References: <20190125032314.20915-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125032314.20915-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Q8 tablets follow the A23/A33 tablet reference design, and normally
use a "generic" 800x480 LCD panel. The actual panel may vary between
production runs, and there are no visible markings denoting its model.
This patch uses a panel that has the same dimensions and timings that
are close to what was provided in the vendor fex files.

Since there are also A33 Q8 tablets with 1024x600 panels, this patch
only sets the compatible string for A23 Q8 tablets.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-a23-q8-tablet.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a23-q8-tablet.dts b/arch/arm/boot/dts/sun8i-a23-q8-tablet.dts
index b6958e8f2f01..d4dab7c28398 100644
--- a/arch/arm/boot/dts/sun8i-a23-q8-tablet.dts
+++ b/arch/arm/boot/dts/sun8i-a23-q8-tablet.dts
@@ -61,3 +61,7 @@
 		"Headset Mic", "HBIAS";
 	status = "okay";
 };
+
+&panel {
+	compatible = "bananapi,s070wv20-ct16", "simple-panel";
+};
-- 
2.20.1
