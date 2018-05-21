Return-Path: <SRS0=LFrQ=II=cisco.com=sschaeck@kernel.org>
Date: Mon, 21 May 2018 14:42:57 -0700
From: Stefan M Schaeckeler <sschaeck@cisco.com>
Subject: [PATCH v2] of: unittest: for strings, account for trailing \0 in
 property length field
Message-ID: <20180521214257.GA10768@sjc-ads-587.cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

For strings, account for trailing \0 in property length field:

This is consistent with how dtc builds string properties.

Function __of_prop_dup() would misbehave on such properties as it duplicates
properties based on the property length field creating new string values
without trailing \0s.

Signed-off-by: Stefan M Schaeckeler <sschaeck@cisco.com>
Reviewed-by: Frank Rowand <frank.rowand@sony.com>
Tested-by: Frank Rowand <frank.rowand@sony.com>
---
Changes in v2:
 - fixed spacing around + sign.

 drivers/of/unittest.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 53c83d6..c996835 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -162,13 +162,13 @@ static void __init of_unittest_dynamic(void)
 	prop++;
 	prop->name = "new-property";
 	prop->value = "new-property-data-should-fail";
-	prop->length = strlen(prop->value);
+	prop->length = strlen(prop->value) + 1;
 	unittest(of_add_property(np, prop) != 0,
 		 "Adding an existing property should have failed\n");
 
 	/* Try to modify an existing property - should pass */
 	prop->value = "modify-property-data-should-pass";
-	prop->length = strlen(prop->value);
+	prop->length = strlen(prop->value) + 1;
 	unittest(of_update_property(np, prop) == 0,
 		 "Updating an existing property should have passed\n");
 
@@ -176,7 +176,7 @@ static void __init of_unittest_dynamic(void)
 	prop++;
 	prop->name = "modify-property";
 	prop->value = "modify-missing-property-data-should-pass";
-	prop->length = strlen(prop->value);
+	prop->length = strlen(prop->value) + 1;
 	unittest(of_update_property(np, prop) == 0,
 		 "Updating a missing property should have passed\n");
 
-- 
2.10.3.dirty
