From: Boris BREZILLON <brezillonboris@gmail.com>
Subject: [PATCH 07/11] ARM: at91/dt: add xtal frequencies to sama5d3 xplained board
Date: Tue, 18 Mar 2014 21:18:40 +0100
Message-ID: <1395173924-3648-8-git-send-email-b.brezillon.dev@gmail.com>
References: <1395173924-3648-1-git-send-email-b.brezillon.dev@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395173924-3648-1-git-send-email-b.brezillon.dev@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Mike Turquette <mturquette@linaro.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Boris BREZILLON <b.brezillon.dev@gmail.com>, Boris BREZILLON <b.brezillon@overkiz.com>
List-Id: devicetree@vger.kernel.org

Define crystal properties of sama5d3 xplained board.

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
---
 arch/arm/boot/dts/at91-sama5d3_xplained.dts |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sama5d3_xplained.dts b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
index ce13755..df5b707 100644
--- a/arch/arm/boot/dts/at91-sama5d3_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
@@ -21,6 +21,16 @@
 		reg = <0x20000000 0x10000000>;
 	};
 
+	clocks {
+		slow_xtal {
+			clock-frequency = <32768>;
+		};
+
+		main_xtal {
+			clock-frequency = <12000000>;
+		};
+	};
+
 	ahb {
 		apb {
 			mmc0: mmc@f0000000 {
-- 
1.7.9.5
