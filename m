From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/6] ARM: integrator: check PL010 device name rather than base
 address
Date: Thu, 16 Aug 2012 14:15:49 +0200
Message-ID: <1345119349-22670-1-git-send-email-linus.walleij@linaro.org>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Will Deacon <will.deacon@arm.com>, Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

In the PL010 UART callback a comparison against the base address is
done to figure out which UART is doing the callback. This does not
play well with device tree, so let's check the dev_name() of the
device instead.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-integrator/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-integrator/core.c b/arch/arm/mach-integrator/core.c
index 5ba4bc8..67ea181 100644
--- a/arch/arm/mach-integrator/core.c
+++ b/arch/arm/mach-integrator/core.c
@@ -100,7 +100,7 @@ static void integrator_uart_set_mctrl(struct amba_device *dev, void __iomem *bas
 {
 	unsigned int ctrls = 0, ctrlc = 0, rts_mask, dtr_mask;
 
-	if (dev == &uart0_device) {
+	if (!strcmp(dev_name(&dev->dev), "uart0")) {
 		rts_mask = 1 << 4;
 		dtr_mask = 1 << 5;
 	} else {
-- 
1.7.11.2
