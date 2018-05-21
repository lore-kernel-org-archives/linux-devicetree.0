Return-Path: <SRS0=YcIV=II=vger.kernel.org=devicetree-owner@kernel.org>
Received: from alln-iport-4.cisco.com ([173.37.142.91]:19063 "EHLO
        alln-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbeEUX0O (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 May 2018 19:26:14 -0400
Date: Mon, 21 May 2018 16:26:14 -0700
From: Stefan M Schaeckeler <sschaeck@cisco.com>
Subject: [PATCH v3] of: unittest: for strings, account for trailing \0 in
 property length field
Message-ID: <20180521232613.GA18584@sjc-ads-587.cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
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
Changes in v3:
 - forgot one string in v2.
Changes in v2:
- fixed spacing around + sign.

 drivers/of/unittest.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 6bb37c1..ecee50d 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -165,20 +165,20 @@ static void __init of_unittest_dynamic(void)
 	/* Add a new property - should pass*/
 	prop->name = "new-property";
 	prop->value = "new-property-data";
-	prop->length = strlen(prop->value);
+	prop->length = strlen(prop->value) + 1;
 	unittest(of_add_property(np, prop) == 0, "Adding a new property failed\n");
 
 	/* Try to add an existing property - should fail */
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
 
@@ -186,7 +186,7 @@ static void __init of_unittest_dynamic(void)
 	prop++;
 	prop->name = "modify-property";
 	prop->value = "modify-missing-property-data-should-pass";
-	prop->length = strlen(prop->value);
+	prop->length = strlen(prop->value) + 1;
 	unittest(of_update_property(np, prop) == 0,
 		 "Updating a missing property should have passed\n");
 
-- 
2.10.3.dirty

