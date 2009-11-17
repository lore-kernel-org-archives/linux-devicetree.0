From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [RFC PATCH 3/5] mpc8xxx_gpio: port to new of gpio interface
Date: Tue, 17 Nov 2009 18:42:24 +0300
Message-ID: <1258472546-31343-4-git-send-email-dbaryshkov@gmail.com>
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
 arch/powerpc/sysdev/mpc8xxx_gpio.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/sysdev/mpc8xxx_gpio.c b/arch/powerpc/sysdev/mpc8xxx_gpio.c
index 103eace..9e8f4b4 100644
--- a/arch/powerpc/sysdev/mpc8xxx_gpio.c
+++ b/arch/powerpc/sysdev/mpc8xxx_gpio.c
@@ -129,7 +129,7 @@ static void __init mpc8xxx_add_controller(struct device_node *np)
 
 	mm_gc = &mpc8xxx_gc->mm_gc;
 	of_gc = &mm_gc->of_gc;
-	gc = &of_gc->gc;
+	gc = &mm_gc->gc;
 
 	mm_gc->save_regs = mpc8xxx_gpio_save_regs;
 	of_gc->gpio_cells = 2;
-- 
1.6.5
