From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] bcm2835: add VideoCore Mailbox to the device tree
Date: Fri, 24 Oct 2014 15:20:05 +0200
Message-ID: <1414156805-30253-1-git-send-email-lkundrak@v3.sk>
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
To: linux-rpi-kernel@lists.infradead.org
Cc: Lubomir Rintel <lkundrak@v3.sk>, devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org

Follows the generic Mailbox Controller bindings as documented in
Documentation/devicetree/bindings/mailbox/mailbox.txt.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/bcm2835.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
index 3342cb1..bd046a9 100644
--- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -50,6 +50,13 @@
 			#interrupt-cells = <2>;
 		};
 
+		mailbox: mailbox@0x7e00b880 {
+			compatible = "brcm,bcm2835-mbox";
+			reg = <0x7e00b880 0x40>;
+			interrupts = <0 1>;
+			#mbox-cells = <1>;
+		};
+
 		watchdog@7e100000 {
 			compatible = "brcm,bcm2835-pm-wdt";
 			reg = <0x7e100000 0x28>;
-- 
2.1.0
