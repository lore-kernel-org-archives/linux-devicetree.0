Return-Path: <SRS0=zwrU=BO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F8DC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Aug 2020 23:00:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31CD420792
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Aug 2020 23:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TVPlXmno"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgHDXAI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 4 Aug 2020 19:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgHDXAF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 4 Aug 2020 19:00:05 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D38C061757
        for <devicetree@vger.kernel.org>; Tue,  4 Aug 2020 16:00:04 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id y206so11280388pfb.10
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2020 16:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rcZb+dHytv0a32nKpWx1evN57JE3AVDCE8fU5l5akxE=;
        b=TVPlXmnofY4oNI4lkFaO/QjHknqPBUcZWI9D3ZsaudyW2Xm/AsgQMBtyFstm66Q92T
         iKkOGtZOUqGJ1sLgmSltnMcNQNHVq2F7DoD/0PxZTNRRE2VYC7sRXCeM7x3AypNJJwuB
         MEVULh6cW6y7Nk+oyaOde07gfo7whh4CHCkYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rcZb+dHytv0a32nKpWx1evN57JE3AVDCE8fU5l5akxE=;
        b=MXRksw3zwU6qGtjIzQGsUtFCGDaK4KgV5fx78Di1EDG7p3+vN85jYJU1wrZvqde7Hx
         ZT0gliloDH3y5DOskrZ2nfgKm3pY8OZ0RdASClmucft49yql3ggLjohn2TvAccAx70Vv
         ogwrE5JfE18jrBvUpMxWiozXfYcS6jOuz7JSYalLNGko9N3dvMd5j1o0nJpINjmVmXgL
         UuDik29FY2Soehe31q1gO/ETI4esxNPdpfcPavaT7ZxNFRuFEjs1I+Dk7i13nUCyrxkz
         MKgtalKKCHo7vuNgTdQhfeVNLHZT0QatKBZk5WkcryCf3AxJDjJekkV5ibItKte7To8B
         3OVA==
X-Gm-Message-State: AOAM5325psdEkjki7kvNDG2VhQwzKioaWtMvoqTsbzQRlbyYm0zo77ta
        VIaq5GyM2mqlvTl9wxS0rFJv5g==
X-Google-Smtp-Source: ABdhPJy1jQHdDTxYXJqvgHoo3khVirwf9b0zx6/wK4kt+3c+gECT298hPuwBViACzGRRYUCo7jsrPQ==
X-Received: by 2002:a63:2482:: with SMTP id k124mr568208pgk.332.1596582004360;
        Tue, 04 Aug 2020 16:00:04 -0700 (PDT)
Received: from bhanumaiya-glaptop.hsd1.ca.comcast.net ([2601:646:9500:590:250:b6ff:fe8e:b459])
        by smtp.gmail.com with ESMTPSA id y4sm247141pgb.16.2020.08.04.16.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 16:00:03 -0700 (PDT)
From:   Bhanu Prakash Maiya <bhanumaiya@chromium.org>
X-Google-Original-From: Bhanu Prakash Maiya <bhanumaiya@google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Benson Leung <bleung@chromium.org>,
        Furquan Shaikh <furquan@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Duncan Laurie <dlaurie@google.com>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Eric Peers <epeers@google.com>,
        Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 2/2] dt-bindings: mfd: Add DT compatible string "google,cros_ec_uart"
Date:   Tue,  4 Aug 2020 15:59:57 -0700
Message-Id: <20200804155833.v5.2.I8d7530d8372e4ef298ddaaaad612a2cdd24ed93e@changeid>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
In-Reply-To: <20200804155833.v5.1.Ic98067cd92a0b7fed9cd3dfb7b4e736e76551cda@changeid>
References: <20200804155833.v5.1.Ic98067cd92a0b7fed9cd3dfb7b4e736e76551cda@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bhanu Prakash Maiya <bhanumaiya@chromium.org>

Add DT compatible string in
Documentation/devicetree/bindings/mfd/google,cros-ec.yaml

Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes in v5: None
Changes in v4:
- Changes in commit message.

Changes in v3:
- Rebased changes on google,cros-ec.yaml

Changes in v2:
- No change

 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index 6a7279a85ec1c..552d1c9bf3de4 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -10,11 +10,12 @@ maintainers:
   - Benson Leung <bleung@chromium.org>
   - Enric Balletbo i Serra <enric.balletbo@collabora.com>
   - Guenter Roeck <groeck@chromium.org>
+  - Bhanu Prakash Maiya <bhanumaiya@chromium.org>
 
 description:
   Google's ChromeOS EC is a microcontroller which talks to the AP and
   implements various functions such as keyboard and battery charging.
-  The EC can be connected through various interfaces (I2C, SPI, and others)
+  The EC can be connected through various interfaces (I2C, SPI, UART and others)
   and the compatible string specifies which interface is being used.
 
 properties:
@@ -29,6 +30,9 @@ properties:
       - description:
           For implementations of the EC is connected through RPMSG.
         const: google,cros-ec-rpmsg
+      - description:
+          For implementations of the EC is connected through UART.
+        const: google,cros-ec-uart
 
   google,cros-ec-spi-pre-delay:
     description:
-- 
2.26.2

