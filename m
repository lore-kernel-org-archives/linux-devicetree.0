Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD256C433E2
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 12:18:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B180F20B80
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 12:18:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="qYuLDE6c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgFPMRU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 08:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728640AbgFPMRR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 16 Jun 2020 08:17:17 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA1AC08C5C5
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 05:17:15 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id y17so8310913plb.8
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 05:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LJO92mvN8G5Ck3uoTs8tbtHokwelI/PjMZ8RoMwKBik=;
        b=qYuLDE6cUJWd5a4DmxyscuvyFglYOxees6+5yxZbHCeW4dVK/TAHc5qEfavEUmqtku
         4jynq09mMyw7LfQBSZ2XkmvVR0xQfwjDSx/aPlX3EdAOGqTBfN+Rd7VzMBFpksIDfWrd
         jSI6ZMBqHU3nd1Kvqh3mtN33mVSeNv9oMvyIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LJO92mvN8G5Ck3uoTs8tbtHokwelI/PjMZ8RoMwKBik=;
        b=LVFKlEWkNz7kibwyJC+cdL85Nmo3fbz6xyxz9i9mN/ow9bhB0fSabOsesZSX6A7qGu
         UtsO2xHzKVbhSeuGRcSx39fFNreIjQa4leM0GQs3eQgft03K3IKxrVEi3qB8oimr7+qf
         XWBfo2fpXoin2EEwYxXXtA5e9iQCcawYaBDTVQXBycdH1Ao44t9VedhIkdMMeEJLnnsB
         I2S4qr7jiEcbW0MKoKpkegZRieJLX/X3ZPyHmi/MaLfR7ImNQYXk+c3TBp0gIKPq6SuH
         gYnlpI9HuDNw7+lnkRVMHtR6YH3t/hNA/mGlr07qC/DmVaqZpdghKAi1qrq+kAIZHsEG
         ldOA==
X-Gm-Message-State: AOAM532UCQiWdqPeTWoiypWQ5Ds58pmLq8OfBNMsCido7KDXsyN38e8+
        QQRuLVuHmDdvbxPtOODdTAqQ9A==
X-Google-Smtp-Source: ABdhPJxh4mja4k9jxSfXKuDqMXATuL0/kxNng8htaYKY7QzDnrSNVuiHfGFh8qWBfZavfBpJSAz/kA==
X-Received: by 2002:a17:902:9b92:: with SMTP id y18mr1756775plp.228.1592309834497;
        Tue, 16 Jun 2020 05:17:14 -0700 (PDT)
Received: from shiro.work (p1285116-ipngn200805sizuokaden.shizuoka.ocn.ne.jp. [114.171.61.116])
        by smtp.googlemail.com with ESMTPSA id f23sm2360703pja.8.2020.06.16.05.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 05:17:13 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v4 02/12] dt-bindings: vendor-prefixes: Add sstar vendor prefix
Date:   Tue, 16 Jun 2020 21:15:15 +0900
Message-Id: <20200616121525.1409790-3-daniel@0x0f.com>
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

Add prefix for Xiamen Xingchen Technology Co., Ltd

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b09b6c9911c3..ba5bd3b0ed9a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -986,6 +986,8 @@ patternProperties:
     description: Spreadtrum Communications Inc.
   "^sst,.*":
     description: Silicon Storage Technology, Inc.
+  "^sstar,.*":
+    description: Xiamen Xingchen(SigmaStar) Technology Co., Ltd. (formerly part of MStar Semiconductor, Inc.)
   "^st,.*":
     description: STMicroelectronics
   "^starry,.*":
-- 
2.27.0.rc0

