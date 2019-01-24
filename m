From: frowand.list@gmail.com
Subject: [PATCH 2/2] of: unittest: add caution to function header comment
Date: Thu, 24 Jan 2019 15:22:14 -0800
Message-ID: <1548372134-15729-3-git-send-email-frowand.list@gmail.com>
References: <1548372134-15729-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548372134-15729-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Name of function attach_node_and_children() is misleading because
if the node already exists in the livetree then only the node's
properties are attached.  This works for the existing test data,
but add comment warning of this misleading name.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/unittest.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 3249fe259d30..872956500c27 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1127,7 +1127,11 @@ static void update_node_properties(struct device_node *np,
 
 /**
  *	attach_node_and_children - attaches nodes
- *	and its children to live tree
+ *	and its children to live tree.
+ *	CAUTION: misleading function name - if node @np already exists in
+ *	the live tree then children of @np are *not* attached to the live
+ *	tree.  This works for the current test devicetree nodes because such
+ *	nodes do not have child nodes.
  *
  *	@np:	Node to attach to live tree
  */
-- 
Frank Rowand <frank.rowand@sony.com>
