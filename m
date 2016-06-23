From: megous@megous.com
Subject: [PATCH 14/14] ARM: dts: sun8i: Enable DVFS on Orange Pi One
Date: Thu, 23 Jun 2016 21:21:04 +0200
Message-ID: <20160623192104.18720-15-megous@megous.com>
References: <20160623192104.18720-1-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160623192104.18720-1-megous@megous.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dev@linux-sunxi.org
Cc: Ondrej Jirman <megous@megous.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

Use Xulong Orange Pi One GPIO based regulator for
passive cooling and thermal management.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts | 39 +++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
index ce4ba91..6bd4367 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
@@ -107,6 +107,45 @@
 	};
 };
 
+&cpu0 {
+	clocks = <&cpu>;
+	clock-latency = <244144>; /* 8 32k periods */
+	operating-points = <
+		/* kHz	  uV */
+		1296000	1300000
+		1200000	1300000
+		624000	1100000
+		480000	1100000
+		312000	1100000
+		240000	1100000
+		>;
+	#cooling-cells = <2>;
+	cooling-min-level = <0>;
+	cooling-max-level = <5>;
+	cpu0-supply = <&vdd_soc>;
+};
+
+&cpu_thermal {
+	cooling-maps {
+		map0 {
+			trip = <&cpu_alert0>;
+			cooling-device = <&cpu0 (-1) (-1)>;
+		};
+	};
+
+	trips {
+		cpu_alert0: cpu_alert0 {
+			temperature = <80000>;
+			hysteresis = <2000>;
+			type = "passive";
+		};
+
+		cpu_crit: cpu_crit {
+			temperature = <100000>;
+			hysteresis = <2000>;
+			type = "critical";
+		};
+	};
 };
 
 &ehci1 {
-- 
2.9.0
