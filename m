Return-Path: <SRS0=7bfi=7X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E33C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 01:19:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDB54206D5
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 01:19:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eNVqmRIU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgFJBTn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 21:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgFJBTl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Jun 2020 21:19:41 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F8A9C03E96F
        for <devicetree@vger.kernel.org>; Tue,  9 Jun 2020 18:19:41 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id 205so696587qkh.5
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2020 18:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=yfWV0PXIV5PpQ5wJBNut7KX55zaCQiiUSrjbwEbMGQE=;
        b=eNVqmRIUwneb7C0hIKPK8NbWaIdma8E3pFG9OveH/9rjz2NUiFefJCDfGpjedDR/7Y
         otq92cPnjrLV3I8b1oYQg5UYASq7FNLE/jasv6gwmUICjes1etn5obIxZOxX4psfSLG3
         7ANc8SckSOm6//UdDhSkLFTdZ59wOC508k1w05BoajtFik9GJvQUP7T+jLG7IYPN3oJl
         6jSVfbHXGoAReWfJ0+YZPKZImIb901QqJ5VhPf/McBAIQJYpEIj76om28OZJ2fqaEVIC
         PRT3cY7qmAT+RjXExO5c7+OxN0//N5ZeSMHNI8xfuxkkJhUcBn4jtqKJI3/5/6wWKmKc
         BAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=yfWV0PXIV5PpQ5wJBNut7KX55zaCQiiUSrjbwEbMGQE=;
        b=Q/5bk3czNXSPk3T/jRScOzu7l7HzLfWiwCgNTn8caHXTziLFqXfD+406HtPjri09uu
         ohoqjaGRz4cfTQx9qL6KHucTmq9dYHtk29EQLWF4u4PdH8ct3TYWG2uLUM0MVT+MyYdC
         L/voctbmX6etawtmw23tJCuRK66D71s5t/rZ+O5yfuofqM6Cg1ohA5Dlo2Z1mB+acova
         ZibxGV3ktRppGF30bQ3ESLieSOPv0RikFQivP2BMfEPwgs721o4ePhsItrV14Fjyft/f
         qappBZncALDCIJqylpr4a413WFdHvxFgQIMtB5M6l0fLnc8gwk3TuiWvoRQza7XjT7iK
         ibjw==
X-Gm-Message-State: AOAM531NQvDdROPgYs//fRCkVl4rSe292THyOvtH3+sB/xRINMWV4lHo
        Gmo5hTI12eq5sk1UDnHT56A0pNvUJXc2S/4=
X-Google-Smtp-Source: ABdhPJxi93+NVDZZ/OsrOpngzLuOz6F85u/dw8RuSapadVdZ0MhksmvrB1L0B0ileeWIo0xXnQsmOhV6vlD0sb0=
X-Received: by 2002:ad4:438c:: with SMTP id s12mr973574qvr.200.1591751980646;
 Tue, 09 Jun 2020 18:19:40 -0700 (PDT)
Date:   Tue,  9 Jun 2020 18:19:33 -0700
In-Reply-To: <20200610011934.49795-1-saravanak@google.com>
Message-Id: <20200610011934.49795-2-saravanak@google.com>
Mime-Version: 1.0
References: <20200610011934.49795-1-saravanak@google.com>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
Subject: [PATCH v2 1/2] driver core: Add device_is_dependent() to linux/device.h
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

DT implementation of fw_devlink needs this function to detect cycles. So
make it available.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c    | 2 +-
 include/linux/device.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 139cdf7e7327..509b13610b56 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -118,7 +118,7 @@ int device_links_read_lock_held(void)
  * Check if @target depends on @dev or any device dependent on it (its child or
  * its consumer etc).  Return 1 if that is the case or 0 otherwise.
  */
-static int device_is_dependent(struct device *dev, void *target)
+int device_is_dependent(struct device *dev, void *target)
 {
 	struct device_link *link;
 	int ret;
diff --git a/include/linux/device.h b/include/linux/device.h
index ac8e37cd716a..5c618effc51e 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -829,6 +829,7 @@ extern int device_change_owner(struct device *dev, kuid_t kuid, kgid_t kgid);
 extern const char *device_get_devnode(struct device *dev,
 				      umode_t *mode, kuid_t *uid, kgid_t *gid,
 				      const char **tmp);
+extern int device_is_dependent(struct device *dev, void *target);
 
 static inline bool device_supports_offline(struct device *dev)
 {
-- 
2.27.0.278.ge193c7cf3a9-goog

