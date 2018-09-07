From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] of: Split up name & type in modalias generation
Date: Fri,  7 Sep 2018 16:22:47 +0200
Message-ID: <20180907142247.2931-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The kernel's vsnprintf() implementation discards all alpha-numeric
characters following a %p conversion specifier. This is done in order to
generically skip any of the various modifiers that the kernel supports.
Unfortunately, the OF modalias is generated with a format string that
violates the assumption made by vsnprintf():

	of:N%pOFnT%s

While processing the above format string, vsnprintf() will eat the 'T'
character, assuming that it belongs to the preceeding %p specifier. This
results in a modalias with an incompatible format, which in turn causes
the automatic loading of drivers based on modalias to no longer work.

To fix this, split up the generation of the name & type fields into two
separate snprintf() calls to avoid confusing the parser.

Fixes: 73813f8483b1 ("of: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Note that a more elegant fix would be to make the %p format specifier
parser report back the exact number of characters consumed. I briefly
tried to implement it, but quickly ran into numerous special cases
that make this solution rather involved.

I can spend some more time to improve this in general if that's what we
ultimately want, but I think this patch is a better short-term fix to
workaround the issue.
---
 drivers/of/device.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index daa075d87317..dabef9fc8538 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -218,14 +218,20 @@ static ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len
 	if ((!dev) || (!dev->of_node))
 		return -ENODEV;
 
-	/* Name & Type */
-	csize = snprintf(str, len, "of:N%pOFnT%s", dev->of_node,
-			 dev->of_node->type);
+	/* Name */
+	csize = snprintf(str, len, "of:N%pOFn", dev->of_node);
 	tsize = csize;
 	len -= csize;
 	if (str)
 		str += csize;
 
+	/* Type */
+	csize = snprintf(str, len, "T%s", dev->of_node->type);
+	tsize += csize;
+	len -= csize;
+	if (str)
+		str += csize;
+
 	of_property_for_each_string(dev->of_node, "compatible", p, compat) {
 		csize = strlen(compat) + 1;
 		tsize += csize;
-- 
2.18.0
