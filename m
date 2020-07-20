Return-Path: <SRS0=nYmw=A7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EED0C433E2
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 07:03:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF96720734
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 07:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="I6q1y0tc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbgGTHDt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 03:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgGTHDt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jul 2020 03:03:49 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25246C0619D2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 00:03:49 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id l6so8247706plt.7
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 00:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S91pqBIXOMqhpCywJzCF5HgxB4jKWpemY7PxHePdq0o=;
        b=I6q1y0tcxAMjjdoJod5qWJYE7KSLaohAiISvZTT5LBHNp+Ib+Q3NJ4EIIQTdFlo/Bg
         RlZVLz1JqElwkcxzTtVSxJH5PDGgZcZ3sSy/B3jv01PPAAFKCnJ38HMtArX0saZ9e5Eq
         ZHfhh+BypuEeX61UngdMaWabPSO+ZeQWxBBWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S91pqBIXOMqhpCywJzCF5HgxB4jKWpemY7PxHePdq0o=;
        b=h6TT0wEY/ct8IfcASAqPxTeMKIFYsG8d9AOaS8qP5/FnYWOhnKGoH1ab4pGIlvuefZ
         iQWoxi3Q9/wNIy3xGdSpBoVDZv7dZuY8NxFIFlgz7CbzApdbHjQ9rRKTlyCFUUV6xoez
         k9DximqAZ1dmD3zGGFWf7pWVhV6tL2OE9RzXsaQBFHHni2kBkzc/akBC2a3hp5Nxf7vC
         i+MNWGW6UTT8iKAF4EUukLkAHVVIZnDrIUWgz0ltVEbqM0LWsKXnLEG3YWwnLrID6zqe
         10QjEWnLQb4+KbZNNDdlHkB2XhObN2mSr/9qjz1DnQ0U4EbS/0e9w5CXoDdbO93kYAR6
         ihZg==
X-Gm-Message-State: AOAM531sLlWCPqJ6w7SeSfND1R+sx589FbaCw3RIFkL6OZL/8PmtyrpG
        OXqiBQM07mqlaEeh5AJQ6UPpbRxR+ka39g==
X-Google-Smtp-Source: ABdhPJyU0s4WREt+vb3NfmlvNYiYPuiSOOW1vWuul25+/XsrNtiGhLF7+dza35AzIiS1VSeZwurVxA==
X-Received: by 2002:a17:90a:1109:: with SMTP id d9mr22659634pja.201.1595228627529;
        Mon, 20 Jul 2020 00:03:47 -0700 (PDT)
Received: from ubuntu.Home (anon-62-111.vpn.ipredator.se. [46.246.62.111])
        by smtp.gmail.com with ESMTPSA id gn5sm10613862pjb.23.2020.07.20.00.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 00:03:46 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     linux-iio@vger.kernel.org
Cc:     jic23@kernel.org, Matt Ranostay <matt.ranostay@konsulko.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: iio: chemical: add O2 EZO module documentation
Date:   Mon, 20 Jul 2020 00:03:29 -0700
Message-Id: <20200720070330.259954-3-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720070330.259954-1-matt.ranostay@konsulko.com>
References: <20200720070330.259954-1-matt.ranostay@konsulko.com>
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
index 69e8931e0ae8..46496dc250f2 100644
--- a/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
+++ b/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
@@ -19,6 +19,7 @@ description: |
     http://www.atlas-scientific.com/_files/_datasheets/_oem/pH_oem_datasheet.pdf
     http://www.atlas-scientific.com/_files/_datasheets/_oem/RTD_oem_datasheet.pdf
     http://www.atlas-scientific.com/_files/_datasheets/_probe/EZO_CO2_Datasheet.pdf
+    https://www.atlas-scientific.com/files/EZO_O2_datasheet.pdf
 
 properties:
   compatible:
@@ -29,6 +30,7 @@ properties:
       - atlas,ph-sm
       - atlas,rtd-sm
       - atlas,co2-ezo
+      - atlas,o2-ezo
 
   reg:
      maxItems: 1
-- 
2.27.0

