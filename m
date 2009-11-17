From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [RFC PATCH 2/5] mcu_mpc8349emitx: port to new of gpio interface
Date: Tue, 17 Nov 2009 18:42:23 +0300
Message-ID: <1258472546-31343-3-git-send-email-dbaryshkov@gmail.com>
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
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index 82a9bcb..4ba8b16 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -36,7 +36,7 @@ struct mcu {
 	struct mutex lock;
 	struct device_node *np;
 	struct i2c_client *client;
-	struct of_gpio_chip of_gc;
+	struct gpio_chip gc;
 	u8 reg_ctrl;
 };
 
@@ -55,8 +55,7 @@ static void mcu_power_off(void)
 
 static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_gpio_chip *of_gc = to_of_gpio_chip(gc);
-	struct mcu *mcu = container_of(of_gc, struct mcu, of_gc);
+	struct mcu *mcu = container_of(gc, struct mcu, gc);
 	u8 bit = 1 << (4 + gpio);
 
 	mutex_lock(&mcu->lock);
@@ -78,8 +77,8 @@ static int mcu_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 static int mcu_gpiochip_add(struct mcu *mcu)
 {
 	struct device_node *np;
-	struct of_gpio_chip *of_gc = &mcu->of_gc;
-	struct gpio_chip *gc = &of_gc->gc;
+	struct gpio_chip *gc = &mcu->gc;
+	struct of_gpio_chip *of_gc = &gc->of_gc;
 	int ret;
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,mcu-mpc8349emitx");
@@ -113,7 +112,7 @@ static int mcu_gpiochip_remove(struct mcu *mcu)
 {
 	int ret;
 
-	ret = gpiochip_remove(&mcu->of_gc.gc);
+	ret = gpiochip_remove(&mcu->gc);
 	if (ret)
 		return ret;
 	of_node_put(mcu->np);
-- 
1.6.5
