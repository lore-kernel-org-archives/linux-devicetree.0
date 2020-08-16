Return-Path: <SRS0=yifd=B2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F96C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 07:15:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49ED0207DA
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 07:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Tv9PqpD0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgHPHPs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Aug 2020 03:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbgHPHPr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 16 Aug 2020 03:15:47 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE12C061388
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2020 00:15:47 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x5so10739774wmi.2
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2020 00:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FtBZO3W76dH5HqtieBBm4KLqWKzxwPvD1yS5bD72/uQ=;
        b=Tv9PqpD0aZ6UNSJgj1O53N4jT+f+cBlRK3digViLJWOOruHGl+DOne0XXq6dWCrMf9
         4TovILfm2WaVWvkjRtpmhA7p06AOIIlFrK2MvwrpMHs929C4GbzUta9NMhWe+Wk24bBz
         UeChrJYuUGwihUS6FUkgu9fV9MCK/s/b4QjDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FtBZO3W76dH5HqtieBBm4KLqWKzxwPvD1yS5bD72/uQ=;
        b=M/lQi17K38/u9qMuYE8ObwJXyEpJh6n+LyziGFRn2rn3JM6k1d+MmiG+UzR7qGCceq
         Ughu3P64P1xMfdsWb5WhmpL5llQc3deBZGWvrZBb9XPrMy5c7zGUZYkxWYBST++TFN7e
         udPLbuOkwxCkctIBZ6bYck5bOfBsVb1PBO0dA+JgjMyRiVJd5qSoz9UJPyeefd3pVbfM
         HDZxDHJ0coFfLQ1xfa18GQSClkU+KqHoiMWQVFJNB20G0MzvxmtoVZ7G7JsCDGL4VYNJ
         Q5dTpvg9hB9jBjAI5BZq3NcfyrP49YYFG3bYGJh8uoLBTSsOM+mNby8dmLjvbARpziwW
         CGtg==
X-Gm-Message-State: AOAM532dnq+Gdmnie2HfSKXQEAogt1qIU8V2cKVWuBKuTVloS0bPMnSi
        m+qIYgcJmObix/Y/2qCEdkzQRw==
X-Google-Smtp-Source: ABdhPJw3apQSDQ3q1kNRiwIe55rEalLr/+3xxpIw9eqmcO8PtC5QjgBkCzNSa6CctdLakF/q1+95DA==
X-Received: by 2002:a7b:c38a:: with SMTP id s10mr10156297wmj.13.1597562145625;
        Sun, 16 Aug 2020 00:15:45 -0700 (PDT)
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d14sm26189487wre.44.2020.08.16.00.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 00:15:45 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org
Cc:     linux-iio@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: iio: chemical: add Atlas EZO Humidity module documentation
Date:   Sun, 16 Aug 2020 10:15:39 +0300
Message-Id: <20200816071540.31897-2-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200816071540.31897-1-matt.ranostay@konsulko.com>
References: <20200816071540.31897-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Cc: devicetree@vger.kernel.org
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 .../devicetree/bindings/iio/chemical/atlas,sensor.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml b/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
index 46496dc250f2..f1130d613735 100644
--- a/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
+++ b/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
@@ -20,6 +20,7 @@ description: |
     http://www.atlas-scientific.com/_files/_datasheets/_oem/RTD_oem_datasheet.pdf
     http://www.atlas-scientific.com/_files/_datasheets/_probe/EZO_CO2_Datasheet.pdf
     https://www.atlas-scientific.com/files/EZO_O2_datasheet.pdf
+    https://www.atlas-scientific.com/files/EZO_HUM_Datasheet.pdf
 
 properties:
   compatible:
@@ -31,6 +32,7 @@ properties:
       - atlas,rtd-sm
       - atlas,co2-ezo
       - atlas,o2-ezo
+      - atlas,hum-ezo
 
   reg:
      maxItems: 1
-- 
2.27.0

