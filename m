From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] of: Remove spaces before tabs
Date: Wed, 22 Oct 2014 11:44:55 +0200
Message-ID: <1413971095-27192-4-git-send-email-geert+renesas@glider.be>
References: <1413971095-27192-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413971095-27192-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/base.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index cff3afcff1951faf..19075e770d8b6306 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -577,9 +577,9 @@ EXPORT_SYMBOL(of_get_parent);
  *	of_get_next_parent - Iterate to a node's parent
  *	@node:	Node to get parent of
  *
- * 	This is like of_get_parent() except that it drops the
- * 	refcount on the passed node, making it suitable for iterating
- * 	through a node's parents.
+ *	This is like of_get_parent() except that it drops the
+ *	refcount on the passed node, making it suitable for iterating
+ *	through a node's parents.
  *
  *	Returns a node pointer with refcount incremented, use
  *	of_node_put() on it when done.
@@ -1566,15 +1566,15 @@ EXPORT_SYMBOL(of_parse_phandle);
  * Example:
  *
  * phandle1: node1 {
- * 	#list-cells = <2>;
+ *	#list-cells = <2>;
  * }
  *
  * phandle2: node2 {
- * 	#list-cells = <1>;
+ *	#list-cells = <1>;
  * }
  *
  * node3 {
- * 	list = <&phandle1 1 2 &phandle2 3>;
+ *	list = <&phandle1 1 2 &phandle2 3>;
  * }
  *
  * To get a device_node of the `node2' node you may call this:
@@ -1615,7 +1615,7 @@ EXPORT_SYMBOL(of_parse_phandle_with_args);
  * }
  *
  * node3 {
- * 	list = <&phandle1 0 2 &phandle2 2 3>;
+ *	list = <&phandle1 0 2 &phandle2 2 3>;
  * }
  *
  * To get a device_node of the `node2' node you may call this:
-- 
1.9.1
