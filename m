From: Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
Subject: [PATCH 1/2] powerpc: i2c-mpc: preserve I2C clocking
Date: Tue, 31 Mar 2009 14:43:39 +0200
Message-ID: <20090331124348.330571158@denx.de>
References: <20090331124338.531903515@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline; filename=i2c-mpc-preserver-clocking.patch
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The I2c node property "fsl,preserve-clocking" allows to overtake the
clock settings from the boot loader and avoids the hard-coded setting.

Signed-off-by: Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
---
 drivers/i2c/busses/i2c-mpc.c |   24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

Index: linux-2.6/drivers/i2c/busses/i2c-mpc.c
===================================================================
--- linux-2.6.orig/drivers/i2c/busses/i2c-mpc.c	2009-03-31 13:25:08.000000000 +0200
+++ linux-2.6/drivers/i2c/busses/i2c-mpc.c	2009-03-31 13:28:03.000000000 +0200
@@ -318,17 +318,24 @@
 {
 	int result = 0;
 	struct mpc_i2c *i2c;
+	int set_clock;
 
 	i2c = kzalloc(sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
 
-	if (of_get_property(op->node, "dfsrr", NULL))
-		i2c->flags |= FSL_I2C_DEV_SEPARATE_DFSRR;
-
-	if (of_device_is_compatible(op->node, "fsl,mpc5200-i2c") ||
-			of_device_is_compatible(op->node, "mpc5200-i2c"))
-		i2c->flags |= FSL_I2C_DEV_CLOCK_5200;
+	if (of_get_property(op->node, "fsl,preserve-clocking", NULL)) {
+		set_clock = 0;
+	} else {
+		set_clock = 1;
+
+		if (of_get_property(op->node, "dfsrr", NULL))
+			i2c->flags |= FSL_I2C_DEV_SEPARATE_DFSRR;
+
+		if (of_device_is_compatible(op->node, "fsl,mpc5200-i2c") ||
+		    of_device_is_compatible(op->node, "mpc5200-i2c"))
+			i2c->flags |= FSL_I2C_DEV_CLOCK_5200;
+	}
 
 	init_waitqueue_head(&i2c->queue);
 
@@ -348,8 +355,9 @@
 			goto fail_request;
 		}
 	}
-	
-	mpc_i2c_setclock(i2c);
+
+	if (set_clock)
+		mpc_i2c_setclock(i2c);
 
 	dev_set_drvdata(&op->dev, i2c);
