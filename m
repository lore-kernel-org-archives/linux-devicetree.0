From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH 3/4] ARM: at91/dt: define sam9x5ek's crystal frequencies
Date: Mon, 14 Apr 2014 10:43:13 +0200
Message-ID: <1397464994-27267-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1397464994-27267-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397464994-27267-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Boris BREZILLON <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Define sam9x5ek's main and slow crystal frequencies.

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
---
 arch/arm/boot/dts/at91sam9x5cm.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9x5cm.dtsi b/arch/arm/boot/dts/at91sam9x5cm.dtsi
index 4a5ee5c..2798b02 100644
--- a/arch/arm/boot/dts/at91sam9x5cm.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5cm.dtsi
@@ -23,6 +23,14 @@
 		};
 	};
 
+	slow_xtal: slow_xtal {
+		clock-frequency = <32768>;
+	};
+
+	main_xtal: main_xtal {
+		clock-frequency = <12000000>;
+	};
+
 	ahb {
 		apb {
 			pinctrl@fffff400 {
-- 
1.8.3.2
