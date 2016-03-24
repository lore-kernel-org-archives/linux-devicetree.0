From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [RFC 3/3] checks: Add unit-address checks for PCI buses
Date: Wed, 23 Mar 2016 19:40:21 -0500
Message-ID: <1458780021-5052-3-git-send-email-robh@kernel.org>
References: <1458780021-5052-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458780021-5052-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

PCI device unit addresses are in the form DD or DD,F where DD is the
device 0-0x1f and F is the function 0-7. Add checks that the unit
address matches this form.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/checks.c b/checks.c
index 82a7f38..1d0fcfb 100644
--- a/checks.c
+++ b/checks.c
@@ -549,10 +549,30 @@ static bool is_pci_bridge(struct node *node)
 	return false;
 }
 
+static void pci_unit_addr(struct check *c, struct node *dt, struct node *node)
+{
+	const char *unitname = get_unitname(node);
+	unsigned int dev, func;
+	int ret;
+
+	ret = sscanf(unitname, "%2x,%1x", &dev, &func);
+	if (ret >= 1) {
+		if (dev > 0x1f)
+			FAIL(c, "Node %s PCI device number out of range",
+			     node->fullpath);
+	}
+	if (ret == 2) {
+		if (func > 7)
+			FAIL(c, "Node %s PCI function number out of range",
+			     node->fullpath);
+	}
+}
+
 struct bus_type pci_bus_type = {
         .expected_addr_cells = 3,
         .expected_size_cells = 2,
         .is_type = is_pci_bridge,
+        .check_unit_addr = pci_unit_addr,
 };
 
 static bool is_simple_bridge(struct node *node)
-- 
2.5.0
