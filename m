From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [RFC PATCH 5/5] qe_gpio: port to new of gpio interface
Date: Tue, 17 Nov 2009 18:42:26 +0300
Message-ID: <1258472546-31343-6-git-send-email-dbaryshkov@gmail.com>
References: <1258472546-31343-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1258472546-31343-1-git-send-email-dbaryshkov@gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: devicetree-discuss@lists.ozlabs.org, linuxppc-dev@ozlabs.org
Cc: David Brownell <dbrownell@users.sourceforge.net>, Paul Mackerras <paulus@samba.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 arch/powerpc/sysdev/qe_lib/gpio.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/qe_lib/gpio.c b/arch/powerpc/sysdev/qe_lib/gpio.c
index 8e7a776..b85eab8 100644
--- a/arch/powerpc/sysdev/qe_lib/gpio.c
+++ b/arch/powerpc/sysdev/qe_lib/gpio.c
@@ -187,7 +187,7 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 	if (err < 0)
 		goto err1;
 
-	mm_gc = to_of_mm_gpio_chip(&of_gc->gc);
+	mm_gc = to_of_mm_of_chip(of_gc);
 	qe_gc = to_qe_gpio_chip(mm_gc);
 
 	spin_lock_irqsave(&qe_gc->lock, flags);
@@ -319,7 +319,7 @@ static int __init qe_add_gpiochips(void)
 
 		mm_gc = &qe_gc->mm_gc;
 		of_gc = &mm_gc->of_gc;
-		gc = &of_gc->gc;
+		gc = &mm_gc->gc;
 
 		mm_gc->save_regs = qe_gpio_save_regs;
 		of_gc->gpio_cells = 2;
-- 
1.6.5
