Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89622C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 12:17:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6737A20DD4
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 12:17:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="XYOS/3//"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728635AbgFPMRP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 08:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgFPMRN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 16 Jun 2020 08:17:13 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9FACC08C5C3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 05:17:12 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id k1so8214510pls.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 05:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Im+gWXwz9xrt/i5JNVHGmDB8gIP62Jly/iM3EIi0NBg=;
        b=XYOS/3//CEA68v+h5ngRHMKXDOo7bWl8gOA4MxY7IFFhBr64ctPeOjbdTHTw+cO2i0
         qSghunqiPGyKUL6GxCGttew8Tst+2b0tT+u444JO6vUfdlf03BIeFycb/Kt8E5xvo46Y
         hbXIctmm+yhchgtjbUEFjTfyv7YPB169kf0+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Im+gWXwz9xrt/i5JNVHGmDB8gIP62Jly/iM3EIi0NBg=;
        b=UcF/rhvouw8MDtJA7jfR1yHK1X3LS9gJ4BrWXFVjqRolzxWZjmHkqRZZp2eaY71+HW
         Wtc1yiVP62db94ZZkqzKXKcyB+R1ZRiWwkoV8kucRwxk56it9PXrWJfgZ26zdTavo2iW
         HZLNQm3yoxeYnOThNiynP3SgjglZvQW1Tj7Ji+JjFZ3TMJ6u2CPD5LzaEIDXcrKkxpO8
         VOny6VBfxMSKNh2732FOL+EF5feuMwAup/xgSFVDHFXC5NP4RkPqW2KyszEd2IMRpk/E
         xdrQR0DrQ+8q1jJg1XkRGe8ukg9xXch6iycq0nYrQSM7kPUOrQuNy+/Ble/mJNOy+q1Q
         DCNg==
X-Gm-Message-State: AOAM532x03GnaWuDm4W8bjjNaI6e545oyC6APs0gxnBpeSaqn9UE80hm
        cLT3q1nGxl+yQhVwh8nF4513zQ==
X-Google-Smtp-Source: ABdhPJwaPXD+3UGrbUOue2kQH1OEHemcgB9H5Q7Z04moIxoi/6LLQ2MgiaKS6I+q8uTmAUSpd8zc6Q==
X-Received: by 2002:a17:902:848d:: with SMTP id c13mr1819369plo.289.1592309832346;
        Tue, 16 Jun 2020 05:17:12 -0700 (PDT)
Received: from shiro.work (p1285116-ipngn200805sizuokaden.shizuoka.ocn.ne.jp. [114.171.61.116])
        by smtp.googlemail.com with ESMTPSA id f23sm2360703pja.8.2020.06.16.05.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 05:17:11 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v4 01/12] dt-bindings: vendor-prefixes: Add mstar vendor prefix
Date:   Tue, 16 Jun 2020 21:15:14 +0900
Message-Id: <20200616121525.1409790-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200616121525.1409790-1-daniel@0x0f.com>
References: <20200612130032.3905240-2-daniel@0x0f.com>
 <20200616121525.1409790-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add prefix for MStar Semiconductor, Inc.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9aeab66be85f..b09b6c9911c3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -680,6 +680,8 @@ patternProperties:
     description: Microsemi Corporation
   "^msi,.*":
     description: Micro-Star International Co. Ltd.
+  "^mstar,.*":
+    description: MStar Semiconductor, Inc. (acquired by MediaTek Inc.)
   "^mti,.*":
     description: Imagination Technologies Ltd. (formerly MIPS Technologies Inc.)
   "^multi-inno,.*":
-- 
2.27.0.rc0

