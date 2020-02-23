Return-Path: <SRS0=8u50=4L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D6CC35671
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Feb 2020 12:18:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B115F20656
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Feb 2020 12:18:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="emNMLzoW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgBWMSz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 23 Feb 2020 07:18:55 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35510 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgBWMSz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 23 Feb 2020 07:18:55 -0500
Received: by mail-lj1-f193.google.com with SMTP id q8so6959741ljb.2
        for <devicetree@vger.kernel.org>; Sun, 23 Feb 2020 04:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BXKksNkbkU6OrFeniHxIoTPEPDtrdEfi9fYOE86NNJw=;
        b=emNMLzoWBw1eL3Wr7KPh3+nmoIjK8h0PmEzCWejMB70d8JO+9Xx/SdqCGJ5vb3IMdu
         mLhp9cxMjOmmEuJqD6s+h1Ef3D7KqmY5rwgJ8a0NQZb0H2HQl8VzGCcKc2To0fnitxHf
         irnLaPZXlWA1vHntpz/cq2EagYVszc3Hqy6u7Gq2c3LAn8n4nwM6wqHLAqQsJCWtOJMg
         4F0NppoVR8kJo5M6ekudUuE5JTouhst4uoJ1sYZRQZdRO/uyxBK8v/7+YfO2wcwBZhdr
         vYz8rCLXi9LtRghhWKFsd/gF4m5ASFHGaZ0YGys4rshVTt75TTyvvcBNiNjq7jHu3O7R
         ZnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BXKksNkbkU6OrFeniHxIoTPEPDtrdEfi9fYOE86NNJw=;
        b=CCVoa5UfqGS328UyrTFBehvL3fRykFGSgSvZXLljdQKWowoyxilpzjxs3M7ZEKKx9U
         Yyzp1KUniFE08ZZ9KidPWRJVBvoXJTAzYLHMlk86Uvd+zlCUfyCh8+wQ4KDdyd6pfDk4
         VeEmRbNvNlpdU90nPspCS4sssMi2Ardvi1ZMSFSCCdujCBXyP164APpF4pxGyXCmrq3r
         7GdoI+I7pwmyy3pvcIftxV+wD8if1kangOc1mk1sHqiQbkyCwM2/5WF+0Njbg9of4Wiy
         QrWGQazNmfXK9OCaEJ8P2h6wHx+kGbQe1vYF1RXm51soJCvYVPz6inufzpR/ufEB9vbH
         Fm2w==
X-Gm-Message-State: APjAAAXdr+nwsCVlrIaNkWvus/EAM+r60az3IvGLHq0bcQliJhGpYl8f
        6/Q7LOa7yYYphrk9mPVwGAux/g==
X-Google-Smtp-Source: APXvYqzazielqJ7POJpbkvLpUVC0yKxgxrXXqnsw9lP01N6dySQphWiTLsH9BQYsuVkQGt+gWHrJNQ==
X-Received: by 2002:a2e:b5b4:: with SMTP id f20mr28395925ljn.112.1582460332906;
        Sun, 23 Feb 2020 04:18:52 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id r10sm5458553ljk.9.2020.02.23.04.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 04:18:51 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/3 v2] dt-bindings: Add vendor prefix for Hydis technologies
Date:   Sun, 23 Feb 2020 13:18:39 +0100
Message-Id: <20200223121841.26836-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This vendor has produced a number of display panels,
including HVA40WV1.

Cc: devicetree@vger.kernel.org
Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- New patch adding this vendor.
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9e67944bec9c..95ef233dbb52 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -421,6 +421,8 @@ patternProperties:
     description: Shenzhen Hugsun Technology Co. Ltd.
   "^hwacom,.*":
     description: HwaCom Systems Inc.
+  "^hydis,.*":
+    description: Hydis Technologies
   "^hyundai,.*":
     description: Hyundai Technology
   "^i2se,.*":
-- 
2.21.1

