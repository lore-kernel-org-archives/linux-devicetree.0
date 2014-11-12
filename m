From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: [PATCH]  of/base: Fix PowerPC address parsing hack
Date: Wed, 12 Nov 2014 16:51:01 +1100
Message-ID: <1415771461.5124.33.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

We have a historical hack that treats missing ranges properties as the
equivalent of an empty one. This is needed for ancient PowerMac "bad"
device-trees, and shouldn't be enabled for any other PowerPC platform,
otherwise we get some nasty layout of devices in sysfs or even
duplication when a set of otherwise identically named devices is
created multiple times under a different parent node with no ranges
property.

This fix is needed for the PowerNV i2c busses to be exposed properly
and will fix a number of other embedded cases.

Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
CC: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
--- 

diff --git a/drivers/of/address.c b/drivers/of/address.c
index e371825..e37f017 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -7,6 +7,10 @@
 #include <linux/pci_regs.h>
 #include <linux/string.h>
 
+#ifdef CONFIG_PPC
+#include <asm/machdep.h>
+#endif
+
 /* Max address size we deal with */
 #define OF_MAX_ADDR_CELLS	4
 #define OF_CHECK_ADDR_COUNT(na)	((na) > 0 && (na) <= OF_MAX_ADDR_CELLS)
@@ -428,12 +432,13 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
 	 * This code is only enabled on powerpc. --gcl
 	 */
 	ranges = of_get_property(parent, rprop, &rlen);
-#if !defined(CONFIG_PPC)
+#if defined(CONFIG_PPC)
+	if (!machine_is(powermac))
+#endif /* defined(CONFIG_PPC) */
 	if (ranges == NULL) {
-		pr_err("OF: no ranges; cannot translate\n");
+		pr_debug("OF: no ranges; cannot translate\n");
 		return 1;
 	}
-#endif /* !defined(CONFIG_PPC) */
 	if (ranges == NULL || rlen == 0) {
 		offset = of_read_number(addr, na);
 		memset(addr, 0, pna * 4);

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
