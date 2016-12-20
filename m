From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 4/4 v2] of/overlay: test count and destroy_last
Date: Tue, 20 Dec 2016 20:04:55 +0100
Message-ID: <20161220190455.25115-5-xypron.glpk@gmx.de>
References: <20161220190455.25115-1-xypron.glpk@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161220190455.25115-1-xypron.glpk@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>
List-Id: devicetree@vger.kernel.org

In the unit tests check that the functions
of_overlay_destroy_last() and of_overlay_count()
work as expected.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---

v2:
	Added this patch

 drivers/of/unittest.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 53c83d6..e3fbf0b 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1466,6 +1466,7 @@ static void of_unittest_overlay_8(void)
 	struct device_node *np;
 	int ret, i, ov_id[2];
 	int overlay_nr = 8, unittest_nr = 8;
+	int count_before = of_overlay_count();
 
 	/* we don't care about device state in this test */
 
@@ -1485,6 +1486,12 @@ static void of_unittest_overlay_8(void)
 					overlay_path(overlay_nr + i));
 			return;
 		}
+
+		if (count_before + i + 1 != of_overlay_count()) {
+			unittest(0, "count does not increment by 1\n");
+			return;
+		}
+
 		ov_id[i] = ret;
 		of_unittest_track_overlay(ov_id[i]);
 	}
@@ -1501,7 +1508,7 @@ static void of_unittest_overlay_8(void)
 
 	/* removing them in order should work */
 	for (i = 1; i >= 0; i--) {
-		ret = of_overlay_destroy(ov_id[i]);
+		ret = of_overlay_destroy_last();
 		if (ret != 0) {
 			unittest(0, "overlay @\"%s\" not destroyed @\"%s\"\n",
 					overlay_path(overlay_nr + i),
@@ -1509,6 +1516,12 @@ static void of_unittest_overlay_8(void)
 						PDEV_OVERLAY));
 			return;
 		}
+
+		if (count_before + i != of_overlay_count()) {
+			unittest(0, "count does not decrement by 1\n");
+			return;
+		}
+
 		of_unittest_untrack_overlay(ov_id[i]);
 	}
 
-- 
2.10.2
