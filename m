From: Vijay Kumar B <vijaykumar@zilogic.com>
Subject: [PATCH] Specify all interrupts for the GPIO controller.
Date: Mon,  3 Oct 2016 15:40:12 +0530
Message-ID: <1475489412-9758-1-git-send-email-vijaykumar@zilogic.com>
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
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Vijay Kumar B <vijaykumar@zilogic.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The PXA GPIO controller has 3 interrupt outputs, this needs to be
indicated in the DTS file. Without this mainstone's CPLD interrupt 0
will not be raised to the processor.

Signed-off-by: Vijay Kumar B. <vijaykumar@zilogic.com>
Reviewed-by: Deepak S. <deepak@zilogic.com>
---
 arch/arm/boot/dts/pxa2xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/pxa2xx.dtsi b/arch/arm/boot/dts/pxa2xx.dtsi
index 5e5af07..9ca2e5b 100644
--- a/arch/arm/boot/dts/pxa2xx.dtsi
+++ b/arch/arm/boot/dts/pxa2xx.dtsi
@@ -54,8 +54,8 @@
 			reg = <0x40e00000 0x10000>;
 			gpio-controller;
 			#gpio-cells = <0x2>;
-			interrupts = <10>;
-			interrupt-names = "gpio_mux";
+			interrupts = <8 9 10>;
+			interrupt-names = "gpio0", "gpio1", "gpio_mux";
 			interrupt-controller;
 			#interrupt-cells = <0x2>;
 			ranges;
-- 
2.1.4
