From: Rob Herring <robh@kernel.org>
Subject: [PATCH] spmi: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 16:43:32 -0500
Message-ID: <20170718214339.7774-52-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that we have a custom printf format specifier, convert users of
full_name to use %pOF instead. This is preparation to remove storing
of the full path string for each node.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/spmi/spmi.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index 2b9b0941d9eb..c14b4201210c 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -454,27 +454,25 @@ static void of_spmi_register_devices(struct spmi_controller *ctrl)
 		struct spmi_device *sdev;
 		u32 reg[2];

-		dev_dbg(&ctrl->dev, "adding child %s\n", node->full_name);
+		dev_dbg(&ctrl->dev, "adding child %pOF\n", node);

 		err = of_property_read_u32_array(node, "reg", reg, 2);
 		if (err) {
 			dev_err(&ctrl->dev,
-				"node %s err (%d) does not have 'reg' property\n",
-				node->full_name, err);
+				"node %pOF err (%d) does not have 'reg' property\n",
+				node, err);
 			continue;
 		}

 		if (reg[1] != SPMI_USID) {
 			dev_err(&ctrl->dev,
-				"node %s contains unsupported 'reg' entry\n",
-				node->full_name);
+				"node %pOF contains unsupported 'reg' entry\n",
+				node);
 			continue;
 		}

 		if (reg[0] >= SPMI_MAX_SLAVE_ID) {
-			dev_err(&ctrl->dev,
-				"invalid usid on node %s\n",
-				node->full_name);
+			dev_err(&ctrl->dev, "invalid usid on node %pOF\n", node);
 			continue;
 		}

--
2.11.0
