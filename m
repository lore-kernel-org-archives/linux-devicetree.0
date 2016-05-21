From: <hongkun.cao@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: fix dual-edge code defect
Date: Sat, 21 May 2016 15:23:39 +0800
Message-ID: <1463815419-11719-1-git-send-email-hongkun.cao@mediatek.com>
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
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, matthias.bgg@gmail.com, linus.walleij@linaro.org, erin.lo@mediatek.com
Cc: devicetree@vger.kernel.org, "hongkun.cao" <hongkun.cao@mediatek.com>, srv_heupstream@mediatek.com, hongzhou.yang@mediatek.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, yingjoe.chen@mediatek.com, inux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: "hongkun.cao" <hongkun.cao@mediatek.com>

When a dual-edge irq is triggered, an incorrect irq will be reported on
condition that the external signal is not stable and this incorrect irq
has been registered.
Correct the register offset.

Signed-off-by: hongkun.cao <hongkun.cao@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 2bbe6f7..92ae49f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1255,9 +1255,10 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 	const struct mtk_desc_pin *pin;
 
 	chained_irq_enter(chip, desc);
-	for (eint_num = 0; eint_num < pctl->devdata->ap_num; eint_num += 32) {
+	for (eint_num = 0;
+	     eint_num < pctl->devdata->ap_num;
+	     eint_num += 32, reg += 4) {
 		status = readl(reg);
-		reg += 4;
 		while (status) {
 			offset = __ffs(status);
 			index = eint_num + offset;
-- 
1.7.9.5
