From: Nishanth Menon <nm@ti.com>
Subject: [PATCH] ARM: dts: omap5-uevm: Add Uart wakeup interrupt
Date: Fri, 15 May 2015 16:59:21 -0500
Message-ID: <1431727161-16870-1-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-omap@vger.kernel.org, Nishanth Menon <nm@ti.com>
List-Id: devicetree@vger.kernel.org

UART3 wakeup takes place with iodaisy chain. enable the wakeup pin.

Reported-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---

Test on linus master (f0897f4cc0fc) with 8250  driver: http://pastebin.ubuntu.com/11154446/

Applies on next-20150515 and linus master (f0897f4cc0fc)

 arch/arm/boot/dts/omap5-uevm.dts |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/omap5-uevm.dts b/arch/arm/boot/dts/omap5-uevm.dts
index 74777a6e200a..214190796143 100644
--- a/arch/arm/boot/dts/omap5-uevm.dts
+++ b/arch/arm/boot/dts/omap5-uevm.dts
@@ -604,6 +604,8 @@
 &uart3 {
         pinctrl-names = "default";
         pinctrl-0 = <&uart3_pins>;
+	interrupts-extended = <&gic GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
+			      <&omap5_pmx_core 0x19c>;
 };
 
 &uart5 {
-- 
1.7.9.5

