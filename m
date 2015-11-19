From: Pramod Kumar <pramodku@broadcom.com>
Subject: [PATCH v2 1/7] dt-binding: Add ngpios property to GPIO controller node
Date: Thu, 19 Nov 2015 09:22:13 +0530
Message-ID: <1447905139-16002-2-git-send-email-pramodku@broadcom.com>
References: <1447905139-16002-1-git-send-email-pramodku@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1447905139-16002-1-git-send-email-pramodku@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org, Pramod Kumar <pramodku@broadcom.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Jonas Gorski <jogo@openwrt.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jason Uy <jasonuy@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add ngpios property to the gpio controller's DT node so that controller
driver extracts total number of in-use gpio lines from DT and removes
dependency on driver.

Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
index 16589fb6..8b1e5d1 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
@@ -10,6 +10,9 @@ Required properties:
     Define the base and range of the I/O address space that contains the Cygnus
 GPIO/PINCONF controller registers
 
+- ngpios:
+    Total number of in-use slots in GPIO controller
+
 - #gpio-cells:
     Must be two. The first cell is the GPIO pin number (within the
 controller's pin space) and the second cell is used for the following:
@@ -57,6 +60,7 @@ Example:
 		compatible = "brcm,cygnus-ccm-gpio";
 		reg = <0x1800a000 0x50>,
 		      <0x0301d164 0x20>;
+		ngpios = <24>;
 		#gpio-cells = <2>;
 		gpio-controller;
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
@@ -78,6 +82,7 @@ Example:
 	gpio_asiu: gpio@180a5000 {
 		compatible = "brcm,cygnus-asiu-gpio";
 		reg = <0x180a5000 0x668>;
+		ngpios = <146>;
 		#gpio-cells = <2>;
 		gpio-controller;
 		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
-- 
1.9.1
