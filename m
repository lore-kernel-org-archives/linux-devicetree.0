From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 02/14] ARM: dts: at91: sama5d27_som1_ek: enable i2c2
Date: Tue, 10 Oct 2017 13:09:37 +0300
Message-ID: <1507630189-15504-3-git-send-email-claudiu.beznea@microchip.com>
References: <1507630189-15504-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1507630189-15504-1-git-send-email-claudiu.beznea@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: devicetree@vger.kernel.org

Enable i2c.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
index 43bca17b9e4e..03a4c77fd6ab 100644
--- a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
+++ b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
@@ -133,7 +133,7 @@
 
 			flx1: flexcom@f8038000 {
 				atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
-				status = "disabled";
+				status = "okay";
 
 				i2c2: i2c@600 {
 					compatible = "atmel,sama5d2-i2c";
@@ -147,7 +147,7 @@
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_mikrobus_i2c>;
 					atmel,fifo-size = <16>;
-					status = "disabled";
+					status = "okay";
 				};
 			};
 
-- 
2.7.4
