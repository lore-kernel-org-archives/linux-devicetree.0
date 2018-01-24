From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] ARM: dts: use a correct at24 fallback for
 at91-nattis-2-natte-2
Date: Wed, 24 Jan 2018 22:34:12 +0100
Message-ID: <20180124213412.4612-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Peter Rosin <peda@axentia.se>
Cc: devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

We now require all at24 users to use the "atmel,<model>" fallback in
device tree for different manufacturers.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
index 3ea1d26e1c68..9ae2a9de6123 100644
--- a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
+++ b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
@@ -146,7 +146,7 @@
 	};
 
 	eeprom@50 {
-		compatible = "nxp,24c02";
+		compatible = "nxp,24c02", "atmel,24c02";
 		reg = <0x50>;
 		pagesize = <16>;
 	};
-- 
2.16.1
