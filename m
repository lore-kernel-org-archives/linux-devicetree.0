From: Torsten Duwe <duwe@lst.de>
Subject: [PATCH 1/4] arm64: DTS: allwinner: a64: Add pinmux for RGB666 LCD
Date: Tue, 14 May 2019 18:02:25 +0200 (CEST)
Message-ID: <20190514160225.AB0D368B20@newverein.lst.de>
References: <20190514155911.6C0AC68B05@newverein.lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy@aosc.io>

Allwinner A64's TCON0 can output RGB666 LCD signal.

Add its pinmux.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
Signed-off-by: Torsten Duwe <duwe@suse.de>
---

originally: patchwork.kernel.org/patch/10814179

Almost trivial, and obviously correct.
I added the /omit-if-no-ref/.

---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 2abb335145a6..a8bbee84e7da 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -559,6 +559,16 @@
 				function = "i2c1";
 			};

+			/omit-if-no-ref/
+			lcd_rgb666_pins: lcd-rgb666 {
+				pins = "PD0", "PD1", "PD2", "PD3", "PD4",
+				       "PD5", "PD6", "PD7", "PD8", "PD9",
+				       "PD10", "PD11", "PD12", "PD13",
+				       "PD14", "PD15", "PD16", "PD17",
+				       "PD18", "PD19", "PD20", "PD21";
+				function = "lcd0";
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3",
 				       "PF4", "PF5";
