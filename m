From: Boris BREZILLON <b.brezillon@overkiz.com>
Subject: [PATCH 2/9] ARM: at91/dt: add ethernet phy to at91rm9200ek board
Date: Wed, 28 Aug 2013 13:03:39 +0200
Message-ID: <1377687819-10653-1-git-send-email-b.brezillon@overkiz.com>
References: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Russell King <linux@arm.linux.org.uk>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Joachim Eastwood <manabian@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Boris BREZILLON <b.brezillon@overkiz.com>
List-Id: devicetree@vger.kernel.org

Add ethernet phy node in at91rm9200ek.dts.
The reg register is not specified, as it may differ depending on the init
process of the board:
ADDR0/1 phy pins are connected to PA13/14 rm9200 pins. Which means the phy
will take its address from these pins during the reset process.

The macb driver will launch a full scan on the mdio bus to discover the phy
address.

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
---
 arch/arm/boot/dts/at91rm9200ek.dts |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/at91rm9200ek.dts b/arch/arm/boot/dts/at91rm9200ek.dts
index d2d72c3..37b0880 100644
--- a/arch/arm/boot/dts/at91rm9200ek.dts
+++ b/arch/arm/boot/dts/at91rm9200ek.dts
@@ -47,6 +47,11 @@
 			macb0: ethernet@fffbc000 {
 				phy-mode = "rmii";
 				status = "okay";
+
+				phy0: ethernet-phy {
+					interrupt-parent = <&pioC>;
+					interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+				};
 			};
 
 			usb1: gadget@fffb0000 {
-- 
1.7.9.5
