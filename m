From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 1/4] dt-bindings: mrvl,mmp-timer: add clock
Date: Mon, 10 Sep 2018 13:30:28 +0200
Message-ID: <20180910113031.42634-2-lkundrak@v3.sk>
References: <20180910113031.42634-1-lkundrak@v3.sk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180910113031.42634-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Russell King <linux@armlinux.org.uk>, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

The timer needs the timer clock to be enabled, otherwise it stops
ticking.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt b/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt
index 9a6e251462e7..a2ede0bd12ca 100644
--- a/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt
@@ -4,10 +4,12 @@ Required properties:
 - compatible : Should be "mrvl,mmp-timer".
 - reg : Address and length of the register set of timer controller.
 - interrupts : Should be the interrupt number.
+- clocks : Should contain a single entry describing the clock input.
 
 Example:
 	timer0: timer@d4014000 {
 		compatible = "mrvl,mmp-timer";
 		reg = <0xd4014000 0x100>;
 		interrupts = <13>;
+		clocks = <&coreclk 2>;
 	};
-- 
2.17.1
