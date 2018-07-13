Return-Path: <SRS0=tHxF=J5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr40103.outbound.protection.outlook.com ([40.107.4.103]:13852
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729643AbeGMPad (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 13 Jul 2018 11:30:33 -0400
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Subject: [PATCH] of: Export of_node_ktype
Date: Fri, 13 Jul 2018 17:14:50 +0200
Message-Id: <20180713151450.2098-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@nokia.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-ID: <devicetree@vger.kernel.org>

This is necessary for of_node_init() to work in modules.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 drivers/of/kobj.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
index 7a0a18980b98..6348174ff615 100644
--- a/drivers/of/kobj.c
+++ b/drivers/of/kobj.c
@@ -27,6 +27,7 @@ static void of_node_release(struct kobject *kobj)
 struct kobj_type of_node_ktype = {
 	.release = of_node_release,
 };
+EXPORT_SYMBOL_GPL(of_node_ktype);
 
 static ssize_t of_node_property_read(struct file *filp, struct kobject *kobj,
 				struct bin_attribute *bin_attr, char *buf,
-- 
2.18.0

