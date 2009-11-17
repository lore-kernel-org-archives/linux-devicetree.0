From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [RFC PATCH 4/5] simple_gpio: port to new of gpio interface
Date: Tue, 17 Nov 2009 18:42:25 +0300
Message-ID: <1258472546-31343-5-git-send-email-dbaryshkov@gmail.com>
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
 arch/powerpc/sysdev/simple_gpio.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/sysdev/simple_gpio.c b/arch/powerpc/sysdev/simple_gpio.c
index 43c4569..5ad1e23 100644
--- a/arch/powerpc/sysdev/simple_gpio.c
+++ b/arch/powerpc/sysdev/simple_gpio.c
@@ -101,7 +101,7 @@ static int __init u8_simple_gpiochip_add(struct device_node *np)
 
 	mm_gc = &u8_gc->mm_gc;
 	of_gc = &mm_gc->of_gc;
-	gc = &of_gc->gc;
+	gc = &mm_gc->gc;
 
 	mm_gc->save_regs = u8_gpio_save_regs;
 	of_gc->gpio_cells = 2;
-- 
1.6.5
