Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920ABC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 00:51:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 721ED2075D
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 00:51:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="pqldIbp8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgHQAvD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Aug 2020 20:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbgHQAvB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 16 Aug 2020 20:51:01 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B80DAC061385
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2020 17:51:00 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id f18so12205358wmc.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2020 17:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uPXUJGG/urnZWIGvOG0Oo9fZAeznk7ypl0i8BvRFFN0=;
        b=pqldIbp87u9cmjz3e8AiIQdo4euscVRdB4Gc7e+935AWRF/ZScHxeB0PUW26FqjaT1
         CVZ1RnCVpLF9kRbwbQ6Mk9QwwstoXU78a4cjBKWc7zQYkGA/PCHlBcDulfDsPMAsS+lU
         q7v66GuyNxQJFBldW6k70ylyHUizGzL/gEKtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uPXUJGG/urnZWIGvOG0Oo9fZAeznk7ypl0i8BvRFFN0=;
        b=Ayf6WixtPpe/ZWRGh7iRMeWYg545ltBbjqhtuXjPT/RXqGqkMInqQs1X85CqZKL0BF
         GvXEzHncaNbRlVJ7o3h6nI5PU3rR7v6uaWd26A3nU/SL8bS82J+U2GrR8EYThRk2vBvU
         D5hwa8VBwN+XzpYuFhA/NP5bTvXlVBTHcoVcywoy/PMEOTr8ZhRqRO3OZ2W8XUVVUezY
         BSeqiz9fQAXaEtXMppXSDvTlqyUEKLWSVd9RJUWI1tknCZGbYKaqAtJc+dDNdO9oRK96
         re0GMbrrbYXajr+HQZCmRqUaUh6vLSnsUSf0WqFHph6hobb3KIY1gpr4uIl61Jzkdrki
         RLEQ==
X-Gm-Message-State: AOAM5335jACX0sFCMJSd92xEcR/vtbaNCUlG9RBYo8jrt0tMflCPWjIW
        7/l/X9bqgtT4wN8q9cNpVwOW1A==
X-Google-Smtp-Source: ABdhPJwp+GNCPwTrHNjI11jdoplRpoy+ezOD0IwWLjiTA/hhVt87fQgHiptdwxzH2Vq4xjgQyKW8JQ==
X-Received: by 2002:a1c:9a06:: with SMTP id c6mr11801115wme.23.1597625459390;
        Sun, 16 Aug 2020 17:50:59 -0700 (PDT)
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id b139sm29892711wmd.19.2020.08.16.17.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 17:50:58 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org
Cc:     linux-iio@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: iio: chemical: add Atlas EZO Humidity module documentation
Date:   Mon, 17 Aug 2020 03:50:51 +0300
Message-Id: <20200817005052.11565-2-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200817005052.11565-1-matt.ranostay@konsulko.com>
References: <20200817005052.11565-1-matt.ranostay@konsulko.com>
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
2.20.1

