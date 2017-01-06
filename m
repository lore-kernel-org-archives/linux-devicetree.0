From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH 3/3] ARM: dts: at91: use "atmel,sama5d4-ddramc" for ramc
Date: Fri, 6 Jan 2017 14:59:47 +0800
Message-ID: <20170106065947.30631-4-wenyou.yang@atmel.com>
References: <20170106065947.30631-1-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170106065947.30631-1-wenyou.yang@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Russell King <linux@arm.linux.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Wenyou Yang <wenyou.yang@microchip.com>, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: devicetree@vger.kernel.org

Use the new compatible "atmel,sama5d4-ddramc" for the ramc of
SAMA5D2 and SAMA5D4.

Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
---

 arch/arm/boot/dts/sama5d2.dtsi | 2 +-
 arch/arm/boot/dts/sama5d4.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index ceb9783ff7e1..b5259d85737d 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -380,7 +380,7 @@
 			};
 
 			ramc0: ramc@f000c000 {
-				compatible = "atmel,sama5d3-ddramc";
+				compatible = "atmel,sama5d4-ddramc";
 				reg = <0xf000c000 0x200>;
 				clocks = <&ddrck>, <&mpddr_clk>;
 				clock-names = "ddrck", "mpddr";
diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
index 4f60c1b7b137..603ba986858c 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -370,7 +370,7 @@
 			};
 
 			ramc0: ramc@f0010000 {
-				compatible = "atmel,sama5d3-ddramc";
+				compatible = "atmel,sama5d4-ddramc";
 				reg = <0xf0010000 0x200>;
 				clocks = <&ddrck>, <&mpddr_clk>;
 				clock-names = "ddrck", "mpddr";
-- 
2.11.0
