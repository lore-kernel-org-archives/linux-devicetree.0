From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] [linux-next] ARM: mvebu: make DTS comments reflect DEBUG_LL
 changes
Date: Mon, 19 Jan 2015 20:40:25 +0100
Message-ID: <1421696425.9655.65.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: Valentin Rothberg <valentinrothberg@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Kconfig symbol DEBUG_MVEBU_UART_ALTERNATE was renamed to
DEBUG_MVEBU_UART0_ALTERNATE. And the symbol DEBUG_MVEBU_UART1_ALTERNATE
was added to allow UART1 as a DEBUG_LL target. Make the comment at the
top of this DTS reflect those changes.

Since we're touching this DTS add comments to show which blocks describe
UART0 and UART1.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Created on top of next-20150119. Untested! Note that I know nothing
about this board or about DT source files, so all changes are nothing
more than guesses.

 arch/arm/boot/dts/armada-xp-axpwifiap.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/armada-xp-axpwifiap.dts b/arch/arm/boot/dts/armada-xp-axpwifiap.dts
index ca0200e20751..28174ab019f9 100644
--- a/arch/arm/boot/dts/armada-xp-axpwifiap.dts
+++ b/arch/arm/boot/dts/armada-xp-axpwifiap.dts
@@ -3,8 +3,8 @@
  *
  * Note: this board is shipped with a new generation boot loader that
  * remaps internal registers at 0xf1000000. Therefore, if earlyprintk
- * is used, the CONFIG_DEBUG_MVEBU_UART_ALTERNATE option should be
- * used.
+ * is used, the CONFIG_DEBUG_MVEBU_UART0_ALTERNATE option or the
+ * CONFIG_DEBUG_MVEBU_UART1_ALTERNATE option should be used.
  *
  * Copyright (C) 2013 Marvell
  *
@@ -60,10 +60,12 @@
 		};
 
 		internal-regs {
+			/* UART0 */
 			serial@12000 {
 				status = "okay";
 			};
 
+			/* UART1 */
 			serial@12100 {
 				status = "okay";
 			};
-- 
1.9.3
