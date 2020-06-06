Return-Path: <SRS0=StSA=7T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D10EC433E0
	for <linux-devicetree@archiver.kernel.org>; Sat,  6 Jun 2020 00:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64818207D8
	for <linux-devicetree@archiver.kernel.org>; Sat,  6 Jun 2020 00:36:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tCvb0rty"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbgFFAgG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 5 Jun 2020 20:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728639AbgFFAgC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Jun 2020 20:36:02 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5926BC08C5C2
        for <devicetree@vger.kernel.org>; Fri,  5 Jun 2020 17:36:01 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id n8so10087216qtk.11
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2020 17:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=3rwiHKUr1AxIgiBs+EhDy5U0uXajwFWLvUrsluBnWtI=;
        b=tCvb0rtydIlX1l4DUSCJVmszhVO51xYb7WShxVYCeQ4/d0kx1dKfC2bg7G/wsjyPjQ
         FwUwjGLiu2XNax8R/EglZq5mK+tGs/gFowOzTYa4SayjRVzsXHMGxOFVwueAimqfrU9l
         59A6NeH3HzXMXd5WSIkuiOYFm8pE7MeGGp8nohynUjWP7a9L9GYLsFiwCtbCsVKQpOjJ
         K/Kr8P++ltSnDdxxdIkcuoAsiWvQaL9mmRTARBAvRx8LXkoG8LmX43ckouIXZhEYOVvP
         0XN9aTXSCYrAJWLnYIgoB8FFWbtoN2dojWDZPr1HKW8nlk2G2hMJ2SG8p3SZ1poirWDK
         8Jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=3rwiHKUr1AxIgiBs+EhDy5U0uXajwFWLvUrsluBnWtI=;
        b=HdLjrrO2m9EGgSI5yb7o5vl+NVgFbraoheOl/f2j3PNhw+71484LyAfWXhjDnBWFCT
         CIgPq8YwLUwbALnqQ4VZXGE/OAqwZCZ5KhWZdXYoX6m1W+XOc+5Es/P/EOA6SWndxh/4
         +PI+j/c+69mAHS3MQWe1wQL+BcCStC6KWYZzf2i8/XknnWaSgLXcarHutnX0XLn+CSDW
         9rw3/9WCzWzrNX0tI/sKGg58qiwd3R+kS236/RbmX81/mMXB/oxhTo5OcXS0dlqaodoy
         41LhxFumIZnfMTcRTWCHSBcyBUADuAShJQgzLm9bQnnhs0smqSBPwT0s6x05jaFcrNnn
         kY+A==
X-Gm-Message-State: AOAM533hkdNrJUd6LRUwtKz9YVmTj9bnu9OT6M60oP/RjZ6h5zGjpUD3
        pvGDHC2gjtB0tolvp0cK1hhIxPZIWvjbQt4=
X-Google-Smtp-Source: ABdhPJwV3a2b/+6U0mme/bYd1RKRwfA69Mx7Lz6ZtA+jAeGPVXgF0nmNeRGRbtwJpF4WcsU807OIswt+7IpP0aw=
X-Received: by 2002:a0c:b516:: with SMTP id d22mr12553717qve.88.1591403760519;
 Fri, 05 Jun 2020 17:36:00 -0700 (PDT)
Date:   Fri,  5 Jun 2020 17:35:52 -0700
In-Reply-To: <20200606003552.247693-1-saravanak@google.com>
Message-Id: <20200606003552.247693-3-saravanak@google.com>
Mime-Version: 1.0
References: <20200606003552.247693-1-saravanak@google.com>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
Subject: [PATCH v1 2/2] of: property: Improve cycle detection when one of the
 devices is never added
From:   Saravana Kannan <saravanak@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Consider this example where -> means LHS device is a consumer of RHS
device and indentation represents "child of" of the previous device.

Device A -> Device C

Device B -> Device A
	Device C

Without this commit:
1. Device A is added.
2. Device A is added to waiting for supplier list (Device C)
3. Device B is added
4. Device B is linked as a consumer to Device A
5. Device A doesn't probe because it's waiting for Device C to be added.
6. Device B doesn't probe because Device A hasn't probed.
7. Device C will never be added because it's parent hasn't probed.

So, Device A, B and C will be in a probe/add deadlock.

This commit detects this scenario and stops trying to create a device
link between Device A and Device C since doing so would create a cycle:
Device A -> Devic C -(parent)-> Device B -> Device A.

With this commit:
1. Device A is added.
3. Device B is added
4. Device B is linked as a consumer to Device A
5. Device A probes.
6. Device B probes because Device A has probed.
7. Device C is added and probed.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 44 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 1f2086f4e7ce..7eebe21274a4 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1014,6 +1014,20 @@ static bool of_is_ancestor_of(struct device_node *test_ancestor,
 	return false;
 }
 
+static struct device *of_get_next_parent_dev(struct device_node *np)
+{
+	struct device *dev = NULL;
+
+	of_node_get(np);
+	do {
+		np = of_get_next_parent(np);
+		if (np)
+			dev = get_dev_from_fwnode(&np->fwnode);
+	} while (np && !dev);
+	of_node_put(np);
+	return dev;
+}
+
 /**
  * of_link_to_phandle - Add device link to supplier from supplier phandle
  * @dev: consumer device
@@ -1035,10 +1049,9 @@ static bool of_is_ancestor_of(struct device_node *test_ancestor,
 static int of_link_to_phandle(struct device *dev, struct device_node *sup_np,
 			      u32 dl_flags)
 {
-	struct device *sup_dev;
+	struct device *sup_dev, *sup_par_dev;
 	int ret = 0;
 	struct device_node *tmp_np = sup_np;
-	int is_populated;
 
 	of_node_get(sup_np);
 	/*
@@ -1075,16 +1088,35 @@ static int of_link_to_phandle(struct device *dev, struct device_node *sup_np,
 		return -EINVAL;
 	}
 	sup_dev = get_dev_from_fwnode(&sup_np->fwnode);
-	is_populated = of_node_check_flag(sup_np, OF_POPULATED);
-	of_node_put(sup_np);
-	if (!sup_dev && is_populated) {
+	if (!sup_dev && of_node_check_flag(sup_np, OF_POPULATED)) {
 		/* Early device without struct device. */
 		dev_dbg(dev, "Not linking to %pOFP - No struct device\n",
 			sup_np);
+		of_node_put(sup_np);
 		return -ENODEV;
 	} else if (!sup_dev) {
-		return -EAGAIN;
+		sup_par_dev = of_get_next_parent_dev(sup_np);
+		of_node_put(sup_np);
+
+		/*
+		 * DL_FLAG_SYNC_STATE_ONLY doesn't block probing, so cycle
+		 * detection isn't necessary and shouldn't be done.
+		 */
+		if (dl_flags & DL_FLAG_SYNC_STATE_ONLY)
+			return -EAGAIN;
+
+		/*
+		 * If devices haven't been created for any of the ancestors, we
+		 * can't check for cycles. So let's try again later.
+		 */
+		if (!sup_par_dev)
+			return -EAGAIN;
+
+		/* Cyclic dependency detected, don't try to link */
+		if (device_is_dependent(dev, sup_par_dev))
+			return -EINVAL;
 	}
+	of_node_put(sup_np);
 	if (!device_link_add(dev, sup_dev, dl_flags))
 		ret = -EINVAL;
 	put_device(sup_dev);
-- 
2.27.0.278.ge193c7cf3a9-goog

