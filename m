From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: [PATCH] of/address: Don't throw errors on absent ranges properties
Date: Fri, 14 Nov 2014 17:58:23 +1100
Message-ID: <1415948303.666.50.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The core always tries to translate any "reg" property to construct the platform
device names. This results in a pile of "OF: no ranges; cannot translate" errors
in dmesg whenever we expose things like i2c devices that cannot directly translate
to the MMIO space.

Turn this into a pr_debug instead

Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

diff --git a/drivers/of/address.c b/drivers/of/address.c
index f0541fd..bf1f79d 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -444,7 +444,7 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
 	 */
 	ranges = of_get_property(parent, rprop, &rlen);
 	if (ranges == NULL && !of_empty_ranges_quirk()) {
-		pr_err("OF: no ranges; cannot translate\n");
+		pr_debug("OF: no ranges; cannot translate\n");
 		return 1;
 	}
 	if (ranges == NULL || rlen == 0) {


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
