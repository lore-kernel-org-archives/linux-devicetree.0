From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH]  of/base: Fix PowerPC address parsing hack
Date: Thu, 13 Nov 2014 11:45:22 +1100
Message-ID: <1415839522.5124.58.camel@kernel.crashing.org>
References: <1415771461.5124.33.camel@kernel.crashing.org>
	 <20141113091036.4e9ec43d@canb.auug.org.au>
	 <1415833725.5124.53.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415833725.5124.53.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

What about this one instead ? I want to cache it because that function
can be called quite a while and doing two additional property lookup
and string compares every time might hurt some platforms.

----

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

diff --git a/drivers/of/address.c b/drivers/of/address.c
index e371825..5eae0cd 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -403,6 +403,17 @@ static struct of_bus *of_match_bus(struct device_node *np)
 	return NULL;
 }
 
+static int of_empty_ranges_quirk(void)
+{
+	/* To save cycles, we cache the result */
+	static int quirk_state = -1;
+
+	if (quirk_state < 0)
+		quirk_state = of_machine_is_compatible("Power Macintosh") ||
+			of_machine_is_compatible("MacRISC");
+	return quirk_state;
+}
+
 static int of_translate_one(struct device_node *parent, struct of_bus *bus,
 			    struct of_bus *pbus, __be32 *addr,
 			    int na, int ns, int pna, const char *rprop)
@@ -428,12 +439,10 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
 	 * This code is only enabled on powerpc. --gcl
 	 */
 	ranges = of_get_property(parent, rprop, &rlen);
-#if !defined(CONFIG_PPC)
-	if (ranges == NULL) {
+	if (ranges == NULL && !of_empty_ranges_quirk()) {
 		pr_err("OF: no ranges; cannot translate\n");
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
