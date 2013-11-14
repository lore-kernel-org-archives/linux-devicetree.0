From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH RFC] net: of_mdio: Scan PHYs which have device_type set to ethernet-phy
Date: Thu, 14 Nov 2013 15:05:56 +0000
Message-ID: <1384441556-20674-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

According to Documentation/devicetree/bindings/net/phy.txt device_type
property of PHY nodes is mandatory, which should be set to
"ethernet-phy". This patch adds check in scanning phys and only scans
node which have device-type set to "ethernet-phy".

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
---
 drivers/of/of_mdio.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index d5a57a9..78c53c7 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -57,6 +57,9 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 
 	/* Loop over the child nodes and register a phy_device for each one */
 	for_each_available_child_of_node(np, child) {
+		/* A PHY must have device_type set to "ethernet-phy" */
+		if (of_node_cmp(child->type, "ethernet-phy"))
+			continue;
 		/* A PHY must have a reg property in the range [0-31] */
 		paddr = of_get_property(child, "reg", &len);
 		if (!paddr || len < sizeof(*paddr)) {
@@ -112,6 +115,10 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 
 	/* auto scan for PHYs with empty reg property */
 	for_each_available_child_of_node(np, child) {
+		/* A PHY must have device_type set to "ethernet-phy" */
+		if (of_node_cmp(child->type, "ethernet-phy"))
+			continue;
+
 		/* Skip PHYs with reg property set */
 		paddr = of_get_property(child, "reg", &len);
 		if (paddr)
-- 
1.7.6.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
