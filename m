From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: Add mtk-systimer bindings
Date: Mon, 25 Jun 2018 15:10:00 +0800
Message-ID: <1529910601-15005-2-git-send-email-stanley.chu@mediatek.com>
References: <1529910601-15005-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529910601-15005-1-git-send-email-stanley.chu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, Stanley Chu <stanley.chu@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add binding documentation for the System Timer driver of
the Mediatek SoCs.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 .../bindings/timer/mediatek,mtk-systimer.txt       |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt
new file mode 100644
index 0000000..735a6fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt
@@ -0,0 +1,18 @@
+Mediatek System Timers
+----------------------
+
+Required properties:
+- compatible: should contain
+	"mediatek,sys_timer" for those platforms which support system timer.
+- reg: Mandatory. The location and length for system timer registers.
+- clock-frequency: Optional. If not assigned specifically, default
+	value 13000000 (means 13 MHz) would be applied.
+
+Examples:
+
+	sys_timer@10017000 {
+		compatible = "mediatek,sys_timer";
+		reg = <0 0x10017000 0 0x1000>;
+		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
+		clock-frequency = <13000000>;
+	};
-- 
1.7.9.5
