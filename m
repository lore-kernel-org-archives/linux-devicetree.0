From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH 06/11] ARM: dts: NSP: Add GPIO reboot method to bcm958625xmc
 DTS file
Date: Wed,  3 Aug 2016 14:39:01 -0400
Message-ID: <1470249546-12440-7-git-send-email-jon.mason@broadcom.com>
References: <1470249546-12440-1-git-send-email-jon.mason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470249546-12440-1-git-send-email-jon.mason@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: f.fainelli@gmail.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the ability to reboot the bcm958625xmc board via GPIO.
Unfortunately, not all of the NSP based boards use the same GPIO pin
and one doesn't have the ability to reboot via GPIO at all.  So, this
will need to be specified per DTS file.

Signed-off-by: Jon Mason <jon.mason@broadcom.com>
---
 arch/arm/boot/dts/bcm958525xmc.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/bcm958525xmc.dts b/arch/arm/boot/dts/bcm958525xmc.dts
index 9517360..959cde9 100644
--- a/arch/arm/boot/dts/bcm958525xmc.dts
+++ b/arch/arm/boot/dts/bcm958525xmc.dts
@@ -33,6 +33,7 @@
 /dts-v1/;
 
 #include "bcm-nsp.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "NorthStar Plus XMC (BCM958525xmc)";
@@ -50,6 +51,12 @@
 		device_type = "memory";
 		reg = <0x60000000 0x40000000>;
 	};
+
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpioa 31 GPIO_ACTIVE_LOW>;
+		priority = <200>;
+	};
 };
 
 &i2c0 {
-- 
2.7.4
