From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 2/4] ARM: dts: clps711x: rename uart device tree nodes
Date: Fri, 21 Dec 2018 13:30:17 +0300
Message-ID: <20181221103019.15374-2-shc_work@mail.ru>
References: <20181221103019.15374-1-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181221103019.15374-1-shc_work@mail.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexander Shiyan <shc_work@mail.ru>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Use generic names 'serial' for UARTs.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 arch/arm/boot/dts/ep7209.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ep7209.dtsi b/arch/arm/boot/dts/ep7209.dtsi
index bcaf54221145..48a1660a9cf2 100644
--- a/arch/arm/boot/dts/ep7209.dtsi
+++ b/arch/arm/boot/dts/ep7209.dtsi
@@ -22,8 +22,8 @@
 		gpio1 = &portb;
 		gpio3 = &portd;
 		gpio4 = &porte;
-		serial0 = &uart1;
-		serial1 = &uart2;
+		serial0 = &serial1;
+		serial1 = &serial2;
 		spi0 = &spi;
 		timer0 = &timer1;
 		timer1 = &timer2;
@@ -143,7 +143,7 @@
 			#pwm-cells = <1>;
 		};
 
-		uart1: uart@80000480 {
+		serial1: serial@80000480 {
 			compatible = "cirrus,ep7209-uart";
 			reg = <0x80000480 0x80>;
 			interrupts = <12 13>;
@@ -166,7 +166,7 @@
 			reg = <0x80001100 0x80>;
 		};
 
-		uart2: uart@80001480 {
+		serial2: serial@80001480 {
 			compatible = "cirrus,ep7209-uart";
 			reg = <0x80001480 0x80>;
 			interrupts = <28 29>;
-- 
2.13.0
