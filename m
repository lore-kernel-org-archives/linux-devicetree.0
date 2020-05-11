Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D3DC54E8F
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 02:32:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4670A24954
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 02:32:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="OawOFF1c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729220AbgEKCcX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 10 May 2020 22:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729379AbgEKCcX (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sun, 10 May 2020 22:32:23 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF066C061A0C
        for <devicetree@vger.kernel.org>; Sun, 10 May 2020 19:32:22 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id b26so6147412lfa.5
        for <devicetree@vger.kernel.org>; Sun, 10 May 2020 19:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WH8zS66RY8W04XUM1pecSUY+m/Om2TcnzwoU0cWSKDI=;
        b=OawOFF1cZc5W2QBJ1SGSBnyOrjUqtgUoa/fqRc5YZ8z7ELz218a22XGfEFXyg651Zc
         FYVUDc7KZ/MNWLjiWVAOLlFbTZ4xoAD0ykGBYb3WJVz7Z1PhpcNzg4iYxQ9/Z5lSSd7W
         i8S4cQYMvqCn+tZYTzL0wfK0nuw7na/FzCjZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WH8zS66RY8W04XUM1pecSUY+m/Om2TcnzwoU0cWSKDI=;
        b=o3Spb/xYQB4EoY2XV4DFxt1k6El+tS/s8LpD2V1xbCGPTmudBp7cm8j+WJH0kF3RJp
         NIKyDtNe0GvpCT6SwFHtzO6PYF2E56/0k7RIfkKZMapNCn0wB5XDd1R2QwtWGJMZt/CV
         SJSE7dprUpsdBseueba91T45w+/u98wuf3i/+WeLJfeeC0e5WoUqP856pwWH2WKcY9ZK
         Ayqk0ltJQ/gVGftdxIPg+fNI5GMcbg2bJYtcEQquCmJWDg90MB0QgM1dE/0JdtbSPwiS
         R/uWTDl71nOtTvljU3rxe97VuhGkYo5q65lqUbyKyUbbmpr3VSSMAQjssUU8Xmm1KDeS
         qI9Q==
X-Gm-Message-State: AOAM533/dhFA8h/o8Rw7HH3nTiPEoT0gPGHLHhL8CbHpcQRtxO6N1WfJ
        XqberSmhhFpW6nYneE11NoVqRQ==
X-Google-Smtp-Source: ABdhPJzqN6hRh60E1JzXVqh1Wwmr9ySPA7ByBUOuH8GB6uNjukh36OhtZqubPRAUQwzR9RNiVdnsvg==
X-Received: by 2002:a19:2258:: with SMTP id i85mr9363084lfi.86.1589164340592;
        Sun, 10 May 2020 19:32:20 -0700 (PDT)
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id p6sm8624051lfc.15.2020.05.10.19.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 19:32:20 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     linux-iio@vger.kernel.org
Cc:     jic23@kernel.org, Matt Ranostay <matt.ranostay@konsulko.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: iio: chemical: add CO2 EZO module documentation
Date:   Mon, 11 May 2020 05:32:13 +0300
Message-Id: <20200511023214.14704-2-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200511023214.14704-1-matt.ranostay@konsulko.com>
References: <20200511023214.14704-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Cc: devicetree@vger.kernel.org
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 .../devicetree/bindings/iio/chemical/atlas,sensor.yaml      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml b/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
index edcd2904d50e..0d109e1b34ee 100644
--- a/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
+++ b/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
@@ -4,19 +4,20 @@
 $id: http://devicetree.org/schemas/iio/chemical/atlas,sensor.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Atlas Scientific OEM sensors
+title: Atlas Scientific OEM + EZO sensors
 
 maintainers:
   - Matt Ranostay <matt.ranostay@konsulko.com>
 
 description: |
-  Atlas Scientific OEM sensors connected via I2C
+  Atlas Scientific OEM + EZO sensors connected via I2C
 
   Datasheets:
     http://www.atlas-scientific.com/_files/_datasheets/_oem/DO_oem_datasheet.pdf
     http://www.atlas-scientific.com/_files/_datasheets/_oem/EC_oem_datasheet.pdf
     http://www.atlas-scientific.com/_files/_datasheets/_oem/ORP_oem_datasheet.pdf
     http://www.atlas-scientific.com/_files/_datasheets/_oem/pH_oem_datasheet.pdf
+    http://www.atlas-scientific.com/_files/_datasheets/_probe/EZO_CO2_Datasheet.pdf
 
 properties:
   compatible:
@@ -25,6 +26,7 @@ properties:
       - atlas,ec-sm
       - atlas,orp-sm
       - atlas,ph-sm
+      - atlas,co2-ezo
 
   reg:
      maxItems: 1
-- 
2.20.1

