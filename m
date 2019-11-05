Return-Path: <SRS0=ig8w=Y5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4023ACA9EC7
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 06:45:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05FB1217F5
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 06:45:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C876wPh8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387620AbfKEGpK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 01:45:10 -0500
Received: from mail-pf1-f201.google.com ([209.85.210.201]:53913 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387517AbfKEGpH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 01:45:07 -0500
Received: by mail-pf1-f201.google.com with SMTP id h2so15437198pfr.20
        for <devicetree@vger.kernel.org>; Mon, 04 Nov 2019 22:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=XdaR2+XQAwKYeyNEgWxgp1az1blUC06vkdAbdXcvcHc=;
        b=C876wPh8tqKnOtnMTuVlk7qWjh/6uzXkKcfblgna13kjit4XjZzStlLt54Rqo/yLk9
         Spm0vxzqDCusVk5xuCcRuqv5CeqtUY9UmZ7DPEH485cELpDzpEmqD+iLCh2cGpHA6+sG
         22F4WCoPFS9BeljH0KRHI+FQfLGH+J0lw4m8mFZgI97lNhFKNs4zwoigTgFo3CITn/6L
         yVkxPnlgCbiNij0/JWaFB/F+CaFUXJFEyHNiTnag2If6nhl57vOJ0GX1u/jdnmtV6p5/
         fsFNgwNAxr6TVobf6u3gnGYD4bcCKWVcZzsPdZkNxVvGCm5xmisPwfGbaw6SQL/y4CUz
         dMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=XdaR2+XQAwKYeyNEgWxgp1az1blUC06vkdAbdXcvcHc=;
        b=FLg8j4TaEgmlf55x7jTvlJ6F4QFlLXdRcnsqEaj/QrEoOOTa3l6TxrkkVnnlWczMxO
         NmxjYtqmri5lN3RzCLN0SBMHWWN1kMhMWwlIDfw+z/egwWCNnDLtHM0Y6cczbxlJvImU
         jrO8uHcj2YxTh2RSV6BFFPB2Za2maezrvw+dHJwZzRErK0RQthXzvEyGV4UWr6YtnQI2
         uZ0m9FGbWGo6tKpPiZTctSe8pp0+absUCl655DOFzkBn66nrYTX7aQUE7SPoX92JOOve
         nMMIn5kmQ9G21MEUdqtxCNkew4yKQsrsp2UaEjlU3qJh9JQjytKPUz2B9Z7gnnVTLNKY
         NcqQ==
X-Gm-Message-State: APjAAAVCp7V+gqRwM7u6WE7gsLwwJSlwlrdk2dbCC1qqZq2aMolMln+9
        /aX+qqnzbDgdsgr3/rrDtl9LcS5cQIf5SP4=
X-Google-Smtp-Source: APXvYqwPiGuqImrS6zPTyA7MjZPQ6bd5d+E9VSz/iN1kfrtyvAekOcD0pNHMc8ykjAn4DU+ppGvntphbJefEQwU=
X-Received: by 2002:a63:d50c:: with SMTP id c12mr32034480pgg.199.1572936306321;
 Mon, 04 Nov 2019 22:45:06 -0800 (PST)
Date:   Mon,  4 Nov 2019 22:44:54 -0800
In-Reply-To: <20191105064456.36906-1-saravanak@google.com>
Message-Id: <20191105064456.36906-3-saravanak@google.com>
Mime-Version: 1.0
References: <20191105064456.36906-1-saravanak@google.com>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
Subject: [PATCH v1 2/3] of: property: Make it easy to add device links from DT properties
From:   Saravana Kannan <saravanak@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a DEFINE_SIMPLE_PROP macro to make it easy to add support for simple
properties with fixed names that just list phandles and phandle args.

Add a DEFINE_SUFFIX_PROP macro to make it easy to add support for
properties with fixes suffix that just list phandles and phandle args.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 62 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 47 insertions(+), 15 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index fbc201330ba0..812b69a029d1 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1101,17 +1101,11 @@ static struct device_node *parse_prop_cells(struct device_node *np,
 	return sup_args.np;
 }
 
-static struct device_node *parse_clocks(struct device_node *np,
-					const char *prop_name, int index)
-{
-	return parse_prop_cells(np, prop_name, index, "clocks", "#clock-cells");
-}
-
-static struct device_node *parse_interconnects(struct device_node *np,
-					       const char *prop_name, int index)
-{
-	return parse_prop_cells(np, prop_name, index, "interconnects",
-				"#interconnect-cells");
+#define DEFINE_SIMPLE_PROP(fname, name, cells)				  \
+static struct device_node *parse_##fname(struct device_node *np,	  \
+					const char *prop_name, int index) \
+{									  \
+	return parse_prop_cells(np, prop_name, index, name, cells);	  \
 }
 
 static int strcmp_suffix(const char *str, const char *suffix)
@@ -1125,13 +1119,47 @@ static int strcmp_suffix(const char *str, const char *suffix)
 	return strcmp(str + len - suffix_len, suffix);
 }
 
-static struct device_node *parse_regulators(struct device_node *np,
-					    const char *prop_name, int index)
+/**
+ * parse_suffix_prop_cells - Suffix property parsing function for suppliers
+ *
+ * @np:		Pointer to device tree node containing a list
+ * @prop_name:	Name of property to be parsed. Expected to hold phandle values
+ * @index:	For properties holding a list of phandles, this is the index
+ *		into the list.
+ * @suffix:	Property suffix that is known to contain list of phandle(s) to
+ *		supplier(s)
+ * @cells_name:	property name that specifies phandles' arguments count
+ *
+ * This is a helper function to parse properties that have a known fixed suffix
+ * and are a list of phandles and phandle arguments.
+ *
+ * Returns:
+ * - phandle node pointer with refcount incremented. Caller must of_node_put()
+ *   on it when done.
+ * - NULL if no phandle found at index
+ */
+static struct device_node *parse_suffix_prop_cells(struct device_node *np,
+					    const char *prop_name, int index,
+					    const char *suffix,
+					    const char *cells_name)
 {
-	if (index || strcmp_suffix(prop_name, "-supply"))
+	struct of_phandle_args sup_args;
+
+	if (strcmp_suffix(prop_name, suffix))
 		return NULL;
 
-	return of_parse_phandle(np, prop_name, 0);
+	if (of_parse_phandle_with_args(np, prop_name, cells_name, index,
+				       &sup_args))
+		return NULL;
+
+	return sup_args.np;
+}
+
+#define DEFINE_SUFFIX_PROP(fname, suffix, cells)			     \
+static struct device_node *parse_##fname(struct device_node *np,	     \
+					const char *prop_name, int index)    \
+{									     \
+	return parse_suffix_prop_cells(np, prop_name, index, suffix, cells); \
 }
 
 /**
@@ -1155,6 +1183,10 @@ struct supplier_bindings {
 					  const char *prop_name, int index);
 };
 
+DEFINE_SIMPLE_PROP(clocks, "clocks", "#clock-cells")
+DEFINE_SIMPLE_PROP(interconnects, "interconnects", "#interconnect-cells")
+DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
+
 static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_clocks, },
 	{ .parse_prop = parse_interconnects, },
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

