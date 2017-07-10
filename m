From: frowand.list@gmail.com
Subject: [PATCH v2 2/3] of: overlay: correctly apply overlay node with unit-address
Date: Mon, 10 Jul 2017 12:05:21 -0700
Message-ID: <1499713523-19184-3-git-send-email-frowand.list@gmail.com>
References: <1499713523-19184-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499713523-19184-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Correct existing node name detection when overlay node name has
a unit-address.

Expected test result is overlay will update the nodes and properties
for /testcase-data-2/fairway-1/ride@100/ after the patch is applied.

Before this patch is applied:

   Console error message near end of unittest:
      OF: Duplicate name in fairway-1, renamed to "ride@100#1"

   $ cd /proc/device-tree/testcase-data-2/fairway-1/
   $ # extra node: ride@100#1
   $ ls
   #address-cells  linux,phandle   phandle         ride@200
   #size-cells     name            ride@100        status
   compatible      orientation     ride@100#1
   $ cd /proc/device-tree/testcase-data-2/fairway-1/ride@100/
   $ ls track@3/incline_up
   ls: track@3/incline_up: No such file or directory
   $ ls track@4/incline_up
   ls: track@4/incline_up: No such file or directory

After this patch is applied:

   Console error message no longer occurs

   $ cd /proc/device-tree/testcase-data-2/fairway-1/
   $ # no extra node: ride@100#1
   $ ls
   #address-cells  compatible      name            phandle         ride@200
   #size-cells     linux,phandle   orientation     ride@100        status
   $ cd /proc/device-tree/testcase-data-2/fairway-1/ride@100/
   $ ls track@3/incline_up
   track@3/incline_up
   $ ls track@4/incline_up
   track@4/incline_up

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/overlay.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index c0e4ee1cd1ba..bd3c32f2d411 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -130,7 +130,10 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
 		return -ENOMEM;
 
 	/* NOTE: Multiple mods of created nodes not supported */
-	tchild = of_get_child_by_name(target, cname);
+	for_each_child_of_node(target, tchild)
+		if (!of_node_cmp(cname, kbasename(tchild->full_name)))
+			break;
+
 	if (tchild != NULL) {
 		/* new overlay phandle value conflicts with existing value */
 		if (child->phandle)
-- 
Frank Rowand <frank.rowand@sony.com>
