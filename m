Return-Path: <SRS0=StSA=7T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DD0C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat,  6 Jun 2020 00:36:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62466207DF
	for <linux-devicetree@archiver.kernel.org>; Sat,  6 Jun 2020 00:36:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hDabG4zj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728624AbgFFAgA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 5 Jun 2020 20:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728517AbgFFAf7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Jun 2020 20:35:59 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D2FC08C5C3
        for <devicetree@vger.kernel.org>; Fri,  5 Jun 2020 17:35:59 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id z7so13858002ybn.21
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2020 17:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=yfWV0PXIV5PpQ5wJBNut7KX55zaCQiiUSrjbwEbMGQE=;
        b=hDabG4zjcTPcxEXraRYdCV5IGq5A5N+2z/Kwosmi2e8VE0UeXfqNaXSzz9G1/2Lfrs
         1gfGPtg/SSbtaU7GYKC+lIhWX9tVXm1SXXD77ml3Mx1DF7zKbQAMU/LRwE1N+qF0gIqx
         6F4QneK92uZu516vUeWP0nRO7ZincYWZbqwD2AAX1qLItxpazt+PGZXqocwLlomvxT6k
         4lDCdyOJGrqCPSajxsGxkdybLsL+jo3hGIH+mXXZIuK5gVBMPFCXDcjsPCCN8AKdwokU
         mrDzmx/c2B8wI5DOhyAbOLqerxHD1Ve1E+5eCi+ChberuGBbwRecPbox5uKUr+oZdGHk
         6cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=yfWV0PXIV5PpQ5wJBNut7KX55zaCQiiUSrjbwEbMGQE=;
        b=JAz/gyvzBiS9VzW9wNP1jt3ibwdYJOLmZcdPelkCL1lZTSDp/iIdenmpT62pxZ+qr1
         iV7aJgdYgpro1sK2eKH/o328osSrwcqRtW/eBmvc1m9ZtQD4CQ1KLzfJfR7KcSlyECqE
         27G55NHlt90JTuR7L9K3dYZIJIOMlaoJUogvYytVUvm+pU1U8hZq2bApCwXxM8eV3XZe
         eFAClY5Q8chzNA017buHoaQ8U9lipvZPnl85L75khylZJLk4N+xZejdljw38t9zuw48g
         ezCVtxYsTb4VBgixZaUKuxXcp7itXCKxl8cR86/9A1HOwUpGv8/iyx1uCi4NomOnUbZm
         PMmA==
X-Gm-Message-State: AOAM53063IhklQbCMegTlFyxWpy9Ei/t5iKTUwqkAIQ9pIl87Hp3TmDM
        ia6ji1Ew/DCxjpT4hvl6vkK0J9dkisqxrcU=
X-Google-Smtp-Source: ABdhPJyamEg7iPPMO/P4Ajg/c05XHJ4f4AwNLvmL3Kp8Mx8OKK5lAA5mkRGzah80mh3MNvTlFcsjfT0ggbfnvfc=
X-Received: by 2002:a25:2d24:: with SMTP id t36mr20076041ybt.426.1591403758190;
 Fri, 05 Jun 2020 17:35:58 -0700 (PDT)
Date:   Fri,  5 Jun 2020 17:35:51 -0700
In-Reply-To: <20200606003552.247693-1-saravanak@google.com>
Message-Id: <20200606003552.247693-2-saravanak@google.com>
Mime-Version: 1.0
References: <20200606003552.247693-1-saravanak@google.com>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
Subject: [PATCH v1 1/2] driver core: Add device_is_dependent() to linux/device.h
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

