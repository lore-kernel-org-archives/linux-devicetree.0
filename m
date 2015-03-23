From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: [PATCH] drivers/of: Add empty ranges quirk for PA-Semi
Date: Mon, 23 Mar 2015 14:16:38 +1100
Message-ID: <1427080598.4770.214.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc dev list <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The "sdc" node is missing the ranges property, it needs to be treated
as having an empty one otherwise translation fails for its children.

Tested-by: Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
---
 drivers/of/address.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index ad29069..78a7dcb 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -450,12 +450,17 @@ static struct of_bus *of_match_bus(struct device_node *np)
 	return NULL;
 }
 
-static int of_empty_ranges_quirk(void)
+static int of_empty_ranges_quirk(struct device_node *np)
 {
 	if (IS_ENABLED(CONFIG_PPC)) {
-		/* To save cycles, we cache the result */
+		/* To save cycles, we cache the result for global "Mac" setting */
 		static int quirk_state = -1;
 
+		/* PA-SEMI sdc DT bug */
+		if (of_device_is_compatible(np, "1682m-sdc"))
+			return true;
+
+		/* Make quirk cached */
 		if (quirk_state < 0)
 			quirk_state =
 				of_machine_is_compatible("Power Macintosh") ||
@@ -490,7 +495,7 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
 	 * This code is only enabled on powerpc. --gcl
 	 */
 	ranges = of_get_property(parent, rprop, &rlen);
-	if (ranges == NULL && !of_empty_ranges_quirk()) {
+	if (ranges == NULL && !of_empty_ranges_quirk(parent)) {
 		pr_debug("OF: no ranges; cannot translate\n");
 		return 1;
 	}


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
