From: Rob Herring <robh@kernel.org>
Subject: [PATCH] macintosh: windfarm: Another convert to using %pOFn instead of device_node.name
Date: Fri, 16 Nov 2018 16:05:39 -0600
Message-ID: <20181116220540.17222-3-robh@kernel.org>
References: <20181116220540.17222-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116220540.17222-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <patch-notifications@ellerman.id.au>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

In preparation to remove the node name pointer from struct device_node,
convert printf users to use the %pOFn format specifier.

Convert the open coded iterating thru child nodes to
for_each_child_of_node() while we're here.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/macintosh/windfarm_fcu_controls.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/macintosh/windfarm_fcu_controls.c b/drivers/macintosh/windfarm_fcu_controls.c
index fab7a21e9577..2b3ca628a650 100644
--- a/drivers/macintosh/windfarm_fcu_controls.c
+++ b/drivers/macintosh/windfarm_fcu_controls.c
@@ -425,18 +425,18 @@ static void wf_fcu_lookup_fans(struct wf_fcu_priv *pv)
 		{ "CPU B 2",		"cpu-fan-b-1",		},
 		{ "CPU B 3",		"cpu-fan-c-1",		},
 	};
-	struct device_node *np = NULL, *fcu = pv->i2c->dev.of_node;
+	struct device_node *np, *fcu = pv->i2c->dev.of_node;
 	int i;
 
 	DBG("Looking up FCU controls in device-tree...\n");
 
-	while ((np = of_get_next_child(fcu, np)) != NULL) {
+	for_each_child_of_node(fcu, np) {
 		int id, type = -1;
 		const char *loc;
 		const char *name;
 		const u32 *reg;
 
-		DBG(" control: %s, type: %s\n", np->name, np->type);
+		DBG(" control: %pOFn, type: %s\n", np, of_node_get_device_type(np));
 
 		/* Detect control type */
 		if (!strcmp(np->type, "fan-rpm-control") ||
-- 
2.19.1
