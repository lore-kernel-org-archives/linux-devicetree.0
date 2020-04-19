Return-Path: <SRS0=ADtQ=6D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825F9C38A29
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Apr 2020 06:06:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57F232076A
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Apr 2020 06:06:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="VYZRXgtt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgDSGGC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 19 Apr 2020 02:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgDSGGB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 19 Apr 2020 02:06:01 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0BBC061A0F
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2020 23:06:01 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id x23so5240535lfq.1
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2020 23:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VX6tMFQF79i/ftypgBXXLpWGwJKO5n2LFJJUQCNDLbI=;
        b=VYZRXgtt76KAzkGTlkhcYV7C3oZ54V2PNDiye5y4PpD7RY/ZDHqj3Sl6JjfiwKt3K0
         aIfHvPz9odBQXH4HcxGad6bp0w4xeCrvoc4CqtBN3G+gcLRAj+Fjvda6OfkjVcs40IQ8
         4quT6a+ZnD73s8JhwZAnBlQHZwpQqt/mvnqxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VX6tMFQF79i/ftypgBXXLpWGwJKO5n2LFJJUQCNDLbI=;
        b=A7rLsseKxIJ/1JN4Z1t1J43GMQTzyNXwoFCJlett1erXeZCBsTOaekv20FBl9W0ya1
         A0lr99lbbArU+hLz2y3sF6WnfvQBnTC23SEMIDNBlnQqrtJbdJZwozkTCvCK8j3j7vLS
         5dfcpVutmCNcuFpuNkjF/vxrOyCCeHTU7M4GDhzmMSYx7ngwbTRv35CqKsuJE1ZCTI18
         Wb78uFjgqHAHhfbDY6nGLlHwBdRHjojpATT1fG4cuIrW2ItCx5okxd3fBxUxvHBpVPEc
         ZSAmgxLCpLf7OUiVVs1CJQXvwwHcNb/ba/LLXYsm7p3WE7WSAvBvs/flwHwjBVBquDEt
         /+RQ==
X-Gm-Message-State: AGi0PuaHH7wIYuE+Y7NhX70i44VmVd1UqPKECQv2EQpCTiGfkqY9rEBf
        7Q/Tn3IswBzysU34yAoMIvWcLg==
X-Google-Smtp-Source: APiQypKamEmLuz1pWmrPKe03nYQbtpKARp5yKm25A3SvjGluCLrG+6Atb/fzGnCrfQBg0xpMFgTChw==
X-Received: by 2002:a19:6448:: with SMTP id b8mr3378653lfj.18.1587276359665;
        Sat, 18 Apr 2020 23:05:59 -0700 (PDT)
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id o22sm3695002ljj.100.2020.04.18.23.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 23:05:59 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org
Cc:     linux-iio@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: iio: chemical: add Atlas Scientific RTD-SM sensor docs
Date:   Sun, 19 Apr 2020 09:05:54 +0300
Message-Id: <20200419060555.14433-2-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200419060555.14433-1-matt.ranostay@konsulko.com>
References: <20200419060555.14433-1-matt.ranostay@konsulko.com>
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
index edcd2904d50e..0e510a52920d 100644
--- a/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
+++ b/Documentation/devicetree/bindings/iio/chemical/atlas,sensor.yaml
@@ -17,6 +17,7 @@ description: |
     http://www.atlas-scientific.com/_files/_datasheets/_oem/EC_oem_datasheet.pdf
     http://www.atlas-scientific.com/_files/_datasheets/_oem/ORP_oem_datasheet.pdf
     http://www.atlas-scientific.com/_files/_datasheets/_oem/pH_oem_datasheet.pdf
+    http://www.atlas-scientific.com/_files/_datasheets/_oem/RTD_oem_datasheet.pdf
 
 properties:
   compatible:
@@ -25,6 +26,7 @@ properties:
       - atlas,ec-sm
       - atlas,orp-sm
       - atlas,ph-sm
+      - atlas,rtd-sm
 
   reg:
      maxItems: 1
-- 
2.20.1

