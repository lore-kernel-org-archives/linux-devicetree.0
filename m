From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] of: Improve of_phandle_iterator_next() error message
Date: Wed,  3 Apr 2019 10:56:33 -0700
Message-ID: <20190403175633.1839-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Understanding why of_phandle_iterator_next() returns an error can
sometimes be hard to decipher based solely on the error message, a
typical error example is that #foo-cells = <X> and the phandle property
used has a smaller number of cells specified, e.g.:

	#thermal-sensor-cells = <1>;
	phandle = <&scmi_sensor>

instead of:

	phandle <&scmi_sensor 0>;

Instead, make it clear what the expectations are towards debugging
incorrect Device Tree faster:

OF: /thermal-zones/scmi-thermal: #thermal-sensor-cells = 1, found 0 instead

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/of/base.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 5226e898476e..20e0e7ee4edf 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1350,8 +1350,9 @@ int of_phandle_iterator_next(struct of_phandle_iterator *it)
 		 * property data length
 		 */
 		if (it->cur + count > it->list_end) {
-			pr_err("%pOF: arguments longer than property\n",
-			       it->parent);
+			pr_err("%pOF: %s = %d found %d\n",
+			       it->parent, it->cells_name,
+			       count, it->cell_count);
 			goto err;
 		}
 	}
-- 
2.17.1
