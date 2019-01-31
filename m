From: Stefan Mavrodiev <stefan@olimex.com>
Subject: [PATCH 4/5] arm64: dts: allwinner: axp803: add charge led node
Date: Thu, 31 Jan 2019 10:23:06 +0200
Message-ID: <20190131082308.22522-4-stefan@olimex.com>
References: <20190131082308.22522-1-stefan@olimex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190131082308.22522-1-stefan@olimex.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/Allwinner sunXi SoC
 support" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, "open list:X-POWERS MULTIFUNCTION PMIC DEVICE
 DRIVERS" <linux-kernel@vger.kernel.org>
Cc: Stefan Mavrodiev <stefan@olimex.com>
List-Id: devicetree@vger.kernel.org

Add dt node for axp20x-led driver controlling CHGLED.
Default status is disabled, since it may be not used.

Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
---
 arch/arm64/boot/dts/allwinner/axp803.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/axp803.dtsi b/arch/arm64/boot/dts/allwinner/axp803.dtsi
index c3a618e1279a..af4898602b34 100644
--- a/arch/arm64/boot/dts/allwinner/axp803.dtsi
+++ b/arch/arm64/boot/dts/allwinner/axp803.dtsi
@@ -76,6 +76,11 @@
 		};
 	};
 
+	axp_led: led {
+		compatible = "x-powers,axp20x-led";
+		status = "disabled";
+	};
+
 	battery_power_supply: battery-power-supply {
 		compatible = "x-powers,axp803-battery-power-supply",
 			     "x-powers,axp813-battery-power-supply";
-- 
2.17.1
