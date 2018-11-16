From: Rob Herring <robh@kernel.org>
Subject: [PATCH] atm: Convert to using %pOFn instead of device_node.name
Date: Fri, 16 Nov 2018 16:05:37 -0600
Message-ID: <20181116220540.17222-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chas Williams <3chas3@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In preparation to remove the node name pointer from struct device_node,
convert printf users to use the %pOFn format specifier.

Cc: Chas Williams <3chas3@gmail.com>
Cc: linux-atm-general@lists.sourceforge.net
Cc: netdev@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/atm/fore200e.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/atm/fore200e.c b/drivers/atm/fore200e.c
index f55ffde877b5..14053e01a2cc 100644
--- a/drivers/atm/fore200e.c
+++ b/drivers/atm/fore200e.c
@@ -754,8 +754,8 @@ static int fore200e_sba_proc_read(struct fore200e *fore200e, char *page)
 
 	regs = of_get_property(op->dev.of_node, "reg", NULL);
 
-	return sprintf(page, "   SBUS slot/device:\t\t%d/'%s'\n",
-		       (regs ? regs->which_io : 0), op->dev.of_node->name);
+	return sprintf(page, "   SBUS slot/device:\t\t%d/'%pOFn'\n",
+		       (regs ? regs->which_io : 0), op->dev.of_node);
 }
 
 static const struct fore200e_bus fore200e_sbus_ops = {
-- 
2.19.1
