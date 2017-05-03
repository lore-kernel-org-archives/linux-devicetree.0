From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] of/unittest: Missing unlocks on error
Date: Wed, 3 May 2017 22:49:50 +0300
Message-ID: <20170503194950.4xbdbwybvx6dkadx@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frank.rowand@sony.com>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Static checkers complain that we should unlock before returning.  Which
is true.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 12597ff8cfb0..425338d6286d 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2210,14 +2210,14 @@ static __init void of_unittest_overlay_high_level(void)
 				unittest(0,
 					 "duplicate property '%s' in overlay_base node __symbols__",
 					 prop->name);
-				return;
+				goto err_unlock;
 			}
 			ret = __of_add_property_sysfs(of_symbols, prop);
 			if (ret) {
 				unittest(0,
 					 "unable to add property '%s' in overlay_base node __symbols__ to sysfs",
 					 prop->name);
-				return;
+				goto err_unlock;
 			}
 		}
 	}
@@ -2232,6 +2232,10 @@ static __init void of_unittest_overlay_high_level(void)
 
 	unittest(overlay_data_add(2),
 		 "Adding overlay 'overlay_bad_phandle' failed\n");
+	return;
+
+err_unlock:
+	mutex_unlock(&of_mutex);
 }
 
 #else
