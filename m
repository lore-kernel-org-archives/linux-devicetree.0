From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/9] ARM: dts: AM33xx: Add mailbox node
Date: Tue, 24 Jun 2014 20:04:48 -0500
Message-ID: <1403658295-54766-3-git-send-email-s-anna@ti.com>
References: <1403658295-54766-1-git-send-email-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1403658295-54766-1-git-send-email-s-anna@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Paul Walmsley <paul@pwsan.com>, Dave Gerlach <d-gerlach@ti.com>, Jassi Brar <jaswinder.singh@linaro.org>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-Id: devicetree@vger.kernel.org

The mailbox DT node data has been added for AM33xx device.
The mailbox IP in AM33xx is similar to the version found in
OMAP4+ devices.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 4a4e02d..1da3bcf 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -347,6 +347,13 @@
 			status = "disabled";
 		};
 
+		mailbox: mailbox@480C8000 {
+			compatible = "ti,am3352-mailbox";
+			reg = <0x480C8000 0x200>;
+			interrupts = <77>;
+			ti,hwmods = "mailbox";
+		};
+
 		timer1: timer@44e31000 {
 			compatible = "ti,am335x-timer-1ms";
 			reg = <0x44e31000 0x400>;
-- 
2.0.0

