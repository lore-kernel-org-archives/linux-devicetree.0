From: Sergei Ianovich <ynvich@gmail.com>
Subject: [PATCH v4 02/21] ARM: dts: pxa2xx fix compatible strings
Date: Wed, 16 Apr 2014 21:13:12 +0400
Message-ID: <1397668411-27162-3-git-send-email-ynvich@gmail.com>
References: <1387309071-22382-1-git-send-email-ynvich@gmail.com>
 <1397668411-27162-1-git-send-email-ynvich@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1397668411-27162-1-git-send-email-ynvich@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <zonque@gmail.com>, Sergei Ianovich <ynvich@gmail.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Sergei Ianovich <ynvich@gmail.com>
CC: Daniel Mack <zonque@gmail.com>
CC: Haojian Zhuang <haojian.zhuang@gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>
---
   v3..v4
   v2..v3
   v1..v2
   * no changes

 arch/arm/boot/dts/pxa2xx.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/pxa2xx.dtsi b/arch/arm/boot/dts/pxa2xx.dtsi
index a5e90f0..3419f87 100644
--- a/arch/arm/boot/dts/pxa2xx.dtsi
+++ b/arch/arm/boot/dts/pxa2xx.dtsi
@@ -18,7 +18,6 @@
 		serial1 = &btuart;
 		serial2 = &stuart;
 		serial3 = &hwuart;
-		i2c0 = &pwri2c;
 		i2c1 = &pxai2c1;
 	};
 
@@ -113,14 +112,14 @@
 		};
 
 		usb0: ohci@4c000000 {
-			compatible = "mrvl,pxa-ohci";
+			compatible = "marvell,pxa-ohci";
 			reg = <0x4c000000 0x10000>;
 			interrupts = <3>;
 			status = "disabled";
 		};
 
 		mmc0: mmc@41100000 {
-			compatible = "mrvl,pxa-mmc";
+			compatible = "marvell,pxa-mmc";
 			reg = <0x41100000 0x1000>;
 			interrupts = <23>;
 			status = "disabled";
-- 
1.8.4.2
