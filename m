From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH 2/3] ARM: dts: sun5i: add a pinctrl node for 4bit mmc2
Date: Thu, 22 Dec 2016 04:02:34 +0800
Message-ID: <20161221200235.11617-2-icenowy@aosc.xyz>
References: <20161221200235.11617-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161221200235.11617-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Zepan <715805855@qq.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.xyz>
List-Id: devicetree@vger.kernel.org

Some board only use 4bit mode of mmc2.

Add a pinctrl node for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 arch/arm/boot/dts/sun5i.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 54170147040f..c058d37d5433 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -594,6 +594,14 @@
 				bias-pull-up;
 			};
 
+			mmc2_4bit_pins_a: mmc2-4bit@0 {
+				pins = "PC6", "PC7", "PC8", "PC9",
+				       "PC10", "PC11";
+				function = "mmc2";
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
 			spi2_pins_a: spi2@0 {
 				pins = "PE1", "PE2", "PE3";
 				function = "spi2";
-- 
2.11.0
