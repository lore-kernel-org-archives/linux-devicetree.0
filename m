From: Rob Herring <robh@kernel.org>
Subject: [PATCH] mux: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 16:43:18 -0500
Message-ID: <20170718214339.7774-38-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that we have a custom printf format specifier, convert users of
full_name to use %pOF instead. This is preparation to remove storing
of the full path string for each node.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Peter Rosin <peda@axentia.se>
---
 drivers/mux/mux-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mux/mux-core.c b/drivers/mux/mux-core.c
index 90b8995f07cb..bef3fe1df670 100644
--- a/drivers/mux/mux-core.c
+++ b/drivers/mux/mux-core.c
@@ -452,8 +452,8 @@ struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
 					 "mux-controls", "#mux-control-cells",
 					 index, &args);
 	if (ret) {
-		dev_err(dev, "%s: failed to get mux-control %s(%i)\n",
-			np->full_name, mux_name ?: "", index);
+		dev_err(dev, "%pOF: failed to get mux-control %s(%i)\n",
+			np, mux_name ?: "", index);
 		return ERR_PTR(ret);
 	}

@@ -464,8 +464,8 @@ struct mux_control *mux_control_get(struct device *dev, const char *mux_name)

 	if (args.args_count > 1 ||
 	    (!args.args_count && (mux_chip->controllers > 1))) {
-		dev_err(dev, "%s: wrong #mux-control-cells for %s\n",
-			np->full_name, args.np->full_name);
+		dev_err(dev, "%pOF: wrong #mux-control-cells for %pOF\n",
+			np, args.np);
 		return ERR_PTR(-EINVAL);
 	}

@@ -474,8 +474,8 @@ struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
 		controller = args.args[0];

 	if (controller >= mux_chip->controllers) {
-		dev_err(dev, "%s: bad mux controller %u specified in %s\n",
-			np->full_name, controller, args.np->full_name);
+		dev_err(dev, "%pOF: bad mux controller %u specified in %pOF\n",
+			np, controller, args.np);
 		return ERR_PTR(-EINVAL);
 	}

--
2.11.0
