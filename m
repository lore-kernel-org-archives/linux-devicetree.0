Return-Path: <SRS0=C9Bv=4K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B8DC35641
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Feb 2020 01:40:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6ADC924656
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Feb 2020 01:40:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ud1xUGHO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbgBVBkt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 20:40:49 -0500
Received: from mail-pf1-f202.google.com ([209.85.210.202]:54003 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbgBVBkr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Feb 2020 20:40:47 -0500
Received: by mail-pf1-f202.google.com with SMTP id c17so2331198pfi.20
        for <devicetree@vger.kernel.org>; Fri, 21 Feb 2020 17:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=sbjXfIRqNbN+zO5bw0TFE0zoSgbZ1QQ5aagCM5afePc=;
        b=ud1xUGHOBKvb/hZaryVaI0jhkYzz5PMsiqucgi7KvMFeX2D1rSak9aqlz2JV4MfsgI
         pJbYlLQNDo2dsKJEc9w0UdWn5OkznacQzkYXVWHl90VuF0fsvPkoR3nquTTE1GsB4MQm
         YAjxBeEEt7lWKTHfucFlkjRcz0SATmBBngwVsozp9aYIuHPNtonVoPndgLcoQREA/smt
         9G0k9UU9LmKNVjRSlwiQ1TgsSxURjQTvJks4xUdDTpOZRjuHkRVGVhehKQ2T8djuWzyt
         AUb8BWrZi4JAcse07+7XxAOmwWyrDwx+gJWak2I03A+RyDpRqhNZqdm8xpLBMwtrHxhX
         obOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=sbjXfIRqNbN+zO5bw0TFE0zoSgbZ1QQ5aagCM5afePc=;
        b=T1UV8CB1S5liiupE13BYqjiPVfD5bEcbjW/vKniNAx4LficflNLg5EGhZmOhkPZ1ec
         LMy9w+DNk6dhCOME9Z/tR0yyWSPCYhWCte9uWaj3s43BBunL98OKd3Kqob8K9Trv0YdR
         KeRzgm31jF2/3sx4dik2YrUt1Z7OkQMM71Zc1oP/BaK23gZxeOhfuICOVyC1jlpUxdEU
         iPrWWr2FDdF+byfP+TuJC+D5GVzp9WMaZCMTeq3PJ7qgR8tQPcktYW9dTh6ViQoV99zk
         56BUuf5xiPY8YO7fVMf7ZPcfIfCU+QLzR9UqoWdrWIWuKctHakclW3PwnVnCp1pe6rAy
         F0fQ==
X-Gm-Message-State: APjAAAWZGAGc/OHi9nPDNyX4hqZ+yHvZmUGMFsVnff082zH0wQTfp+u5
        8IAB603Bluv2rP3vgWhjW6d7gNo+6RbChl4=
X-Google-Smtp-Source: APXvYqxDQk1BSfiJ4Um6agz42N01VWAX3UFH/JG2+Be5e7QkaImHOBKwFc8btIvgsRytF/5NFRyY8vpitPM8CIY=
X-Received: by 2002:a63:8ac7:: with SMTP id y190mr41772483pgd.68.1582335645920;
 Fri, 21 Feb 2020 17:40:45 -0800 (PST)
Date:   Fri, 21 Feb 2020 17:40:34 -0800
In-Reply-To: <20200222014038.180923-1-saravanak@google.com>
Message-Id: <20200222014038.180923-2-saravanak@google.com>
Mime-Version: 1.0
References: <20200222014038.180923-1-saravanak@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v1 1/5] driver core: Reevaluate dev->links.need_for_probe as
 suppliers are added
From:   Saravana Kannan <saravanak@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     kernel-team@android.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

A previous patch 03324507e66c ("driver core: Allow
fwnode_operations.add_links to differentiate errors") forgot to update
all call sites to fwnode_operations.add_links. This patch fixes that.

Legend:
-> Denotes RHS is an optional/potential supplier for LHS
=> Denotes RHS is a mandatory supplier for LHS

Example:

Device A => Device X
Device A -> Device Y

Before this patch:
1. Device A is added.
2. Device A is marked as waiting for mandatory suppliers
3. Device X is added
4. Device A is left marked as waiting for mandatory suppliers

Step 4 is wrong since all mandatory suppliers of Device A have been
added.

After this patch:
1. Device A is added.
2. Device A is marked as waiting for mandatory suppliers
3. Device X is added
4. Device A is no longer considered as waiting for mandatory suppliers

This is the correct behavior.

Fixes: 03324507e66c ("driver core: Allow fwnode_operations.add_links to differentiate errors")
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index dbb0f9130f42..d32a3aefff32 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -523,9 +523,13 @@ static void device_link_add_missing_supplier_links(void)
 
 	mutex_lock(&wfs_lock);
 	list_for_each_entry_safe(dev, tmp, &wait_for_suppliers,
-				 links.needs_suppliers)
-		if (!fwnode_call_int_op(dev->fwnode, add_links, dev))
+				 links.needs_suppliers) {
+		int ret = fwnode_call_int_op(dev->fwnode, add_links, dev);
+		if (!ret)
 			list_del_init(&dev->links.needs_suppliers);
+		else if (ret != -ENODEV)
+			dev->links.need_for_probe = false;
+	}
 	mutex_unlock(&wfs_lock);
 }
 
-- 
2.25.0.265.gbab2e86ba0-goog

