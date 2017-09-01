From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: [RFC/PATCH] drivers/of/platform: Add powerpc 4xx embedded busses to
 default list
Date: Fri, 01 Sep 2017 13:51:01 +1000
Message-ID: <1504237861.4974.59.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This allow to (slowly) migrate those embedded platforms
to of_platform_default_populate()

Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
---

I'm here to collect acks (or comments :-) I'd like this to go via
the powerpc tree along with the patches converting some of the
platforms. I'll be adding more bus types if/when I start tackling
other powerpc embedded families but for now I'm dealing with 4xx.

 drivers/of/platform.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index b19524623498..f3f2aab4eda1 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -34,6 +34,12 @@ const struct of_device_id of_default_bus_match_table[] = {
 #ifdef CONFIG_ARM_AMBA
 	{ .compatible = "arm,amba-bus", },
 #endif /* CONFIG_ARM_AMBA */
+#ifdef CONFIG_PPC
+	{ .compatible = "ibm,plb3", },
+	{ .compatible = "ibm,plb4", },
+	{ .compatible = "ibm,opb", },
+	{ .compatible = "ibm,ebc", },
+#endif
 	{} /* Empty terminated list */
 };
 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
