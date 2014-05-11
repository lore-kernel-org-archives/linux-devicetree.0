From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 2/4] dt-bindings: add mtk-timer bindings
Date: Sun, 11 May 2014 03:41:01 +0200
Message-ID: <1399772463-859-3-git-send-email-matthias.bgg@gmail.com>
References: <1399772463-859-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1399772463-859-1-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, daniel.lezcano@linaro.org, tglx@linutronix.de, matthias.bgg@gmail.com, thierry.reding@gmail.com, florian.vaussard@epfl.ch, jic23@kernel.org, jason@lakedaemon.net, andrew@lunn.ch, silvio.fricke@gmail.com, heiko.stuebner@bq.com, olof@lixom.net, sebastian.hesselbarth@gmail.com, sboyd@codeaurora.org, gregory.clement@free-electrons.com, arnd@arndb.de, robherring2@gmail.com, marc.zyngier@arm.com, maxime.ripard@free-electrons.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for the General Porpose Timer driver of
the Mediatek SoCs.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 .../devicetree/bindings/timer/mediatek,mtk-timer.txt    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
new file mode 100644
index 0000000..a36eb0f
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -0,0 +1,17 @@
+Mediatek MT6598, MT6577 and MT6572 Timers
+---------------------------------------
+
+Required properties:
+- compatible: Should be "mediatek,mtk6589-timer"
+- reg: Should contain location and length for timers register.
+- clocks : phandle to the clock source, normaly a 13 MHz fixed system clock
+		and a 32 KHz fixed RTC clock.
+
+Examples:
+
+	timer {
+		compatible = "mediatek,mtk6589-timer";
+		reg = <0x10008000 0x80>;
+		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&system_clk>, <&rtc_clk>;
+	};
-- 
1.8.1.2
