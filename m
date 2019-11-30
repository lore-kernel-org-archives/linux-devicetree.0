Return-Path: <SRS0=1K1h=ZW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EFEC432C3
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 19:53:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9368020732
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 19:53:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEyVUEni"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfK3Txn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 30 Nov 2019 14:53:43 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33051 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbfK3Txm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 30 Nov 2019 14:53:42 -0500
Received: by mail-wm1-f67.google.com with SMTP id y23so7557682wma.0
        for <devicetree@vger.kernel.org>; Sat, 30 Nov 2019 11:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6soWZHI+mBTs41mjvaDIr6I3byHujiJ15JL91cIfBfg=;
        b=kEyVUEniLeWRnZ/iiy3lXikbGhgzAhI2N1brCJfbLj+G6dOYjyFfej7e3DIDTykTeX
         BkqKh1fi64gQTq/ft06MJO09fUkzk+OsPHAkca3CMipijhPl0lrR+mXm6f3ogG1ncPBE
         0spvEpWI5Zpzl6PPPXhS4xSGDKBzeiu5k9QFOcmi5HHrPeHC1Tb/noHxjXCRgo55OQ/1
         4/IQcowh65/19CLsL71wcOS2wz03MrIV5FTFuZaRn7SfqYG8cotZzO8on3NHTWjxlWt0
         1XBIozO2PMAn2F8+GcJ1wGPRS79wJomXDi/Yo0zSp+Th9tHHmPWq9F8e66gvfSbdXHZN
         YCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6soWZHI+mBTs41mjvaDIr6I3byHujiJ15JL91cIfBfg=;
        b=CAeF4qOIh/hvqbTm9/KkkvIHlhEB8K2aEVVfGAgAX3Q3dqZ4cksgDIAhXChLvLSOyV
         /0oJk9/NvWOA+fVmWQQqIJSia4gB5bH2HlRec7AnH7lpb2rIUOb3WVEtEHjBHMl3LZ57
         9Nu86UyHqK0ADwCk3ZIWLJp1Z9ltzU4nASrz3E5jTxWu/AtsUy3BgCFrb8hB8q7g1+qN
         /85yziJDNw4SyoU7UHxSDdeWlvwna46W7qEjTqddk+29E3Ah4qrD2ZJxmHiagJ/Wd/Qu
         pyXJVcexEH2PxA5ietOBg/FQJkNijfmzh4Lxrr6QVasdGXhjCRQk7d1BHcOZabO0LOFo
         LImw==
X-Gm-Message-State: APjAAAXTLhz6Gj11XEcOGevBx/Iy6seoRBo/qda9reygRWUK1+85rgep
        tdutYIVkqvgneLkLyRS/7ejLbbyJHva71Q==
X-Google-Smtp-Source: APXvYqxr0/UNhRe7WGzdPx15cQazIE3NboG8iq6r4/OO8DdXHDxu7PgO2q3pQSN2W8DFS0NtLmvM+w==
X-Received: by 2002:a7b:cb07:: with SMTP id u7mr15761033wmj.174.1575143620444;
        Sat, 30 Nov 2019 11:53:40 -0800 (PST)
Received: from localhost ([37.238.188.27])
        by smtp.gmail.com with ESMTPSA id a184sm8964233wmf.29.2019.11.30.11.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 11:53:40 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v4 1/3] dt-bindings: Add vendor prefix for Videostrong
Date:   Sat, 30 Nov 2019 22:53:33 +0300
Message-Id: <20191130195335.17740-2-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191130195335.17740-1-mohammad.rasim96@gmail.com>
References: <20191130195335.17740-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Videostrong Technology Co., Ltd., A manufacturer of Android Players & STB
(Android with DVB Hybrid box & DVB-T2/S2/C/ISDB-T/DTMB-TH/ATSC) as well as
HD media players.

Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fd6fa07c45b8..a6c83d70aa74 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1008,6 +1008,8 @@ patternProperties:
     description: Variscite Ltd.
   "^via,.*":
     description: VIA Technologies, Inc.
+  "^videostrong,.*":
+    description: Videostrong Technology Co., Ltd.
   "^virtio,.*":
     description: Virtual I/O Device Specification, developed by the OASIS consortium
   "^vishay,.*":
--
2.24.0

