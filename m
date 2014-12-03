From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v5 09/11] ARM: at91/dt: add matrix node in sama5d3 dtsi
Date: Wed,  3 Dec 2014 21:44:13 +0100
Message-ID: <1417639455-17410-10-git-send-email-boris.brezillon@free-electrons.com>
References: <1417639455-17410-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417639455-17410-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Add matrix node in sama5d3 dtsi so that it can be referenced by other
devices.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 arch/arm/boot/dts/sama5d3.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index 9f1eed5..d49dab7 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -425,6 +425,11 @@
 				clock-names = "ddrck", "mpddr";
 			};
 
+			matrix: matrix@ffffec00 {
+				compatible = "atmel,sama5d3-matrix", "syscon";
+				reg = <0xffffec00 0x200>;
+			};
+
 			dbgu: serial@ffffee00 {
 				compatible = "atmel,at91sam9260-usart";
 				reg = <0xffffee00 0x200>;
-- 
1.9.1
