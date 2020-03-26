Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D575C43331
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 16:10:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6FDC62076A
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 16:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gXvzLY6C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgCZQKx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 12:10:53 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38417 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727912AbgCZQKw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 12:10:52 -0400
Received: by mail-wm1-f66.google.com with SMTP id f6so1075645wmj.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 09:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1ef+2V/P1wVE9VpsnS3HxhmcxnSy4fChdW7K3iDl8o8=;
        b=gXvzLY6CeYfNADxB4JG7xpxE1ji6qxNQpWQTYlcZc2xV6aeQHWJx7+Ku4CkmmIsu/j
         5lgc2eF4IeXZDfNTc/6NawhJONqDcc/DonMZnbnHT0pkJe4Ep9i6OGj3M+DsdjC8PqJd
         iEBf/wVHXTc5e4Tqzqsm07uRysLqJhCt/Kv3LORjwjD/TPUF3QZ0D6hXGOrqkxoOtA4s
         bxNHXHXqOhXOVVTSJl4cg11QufqsP2o8bht5TXZuCL8edYupMSlZTqrGGypsOYoyGTql
         m4QhIuLQReAEik1QYMGEMfhZRtTJ8t+RfAQbQwcnrq3b/Crfd7YVI9IO74+xVSRjY5iU
         KQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1ef+2V/P1wVE9VpsnS3HxhmcxnSy4fChdW7K3iDl8o8=;
        b=RFGb2IuSI2/m/hkb+vIbf9eeokuh9PdVS8zwZGp3XJmr6y/9p+idnvJZQ8kUbeUCDe
         vhxmtbrtsIu6PFDzghzDdkbP6FMOj7r3EIOsDcq7GCfCSbToNJ5FWPgNLmCeOY2+PKJA
         roY2NKE95TGELrdh/WT8p0kDnRUgg5dcQ28QcurshPfy3HUc8CShsebcxwvYWi/aWlym
         Jca3w5RWYRGSavFDxa4MtT5CSHFMx+kmB0JpyKDucF5sSPLGpcLXSnF92CmFB15az2eX
         EByGAOHfwT1kIYTqVJQ4s0jxfIlLmC09i2MAGHQ7op2UrgEdeow8OVunEo/A5ClqQ1SR
         efTQ==
X-Gm-Message-State: ANhLgQ3SJOkwUSMpOXYQ9LvWca9RKPh84LyFxpTmDSlwOFoVNgH7Pg3H
        VSAlqLgF4AwG1dMsAieW9WOMhMEjcqqp6g==
X-Google-Smtp-Source: ADFU+vsfmcT+ctSJtMv05Y4tqAkQhOxGFaOI1CZwiZ+BkPxzrO7+Kc9u+EBInbsonLwD8A2tC7yMtA==
X-Received: by 2002:a1c:9c85:: with SMTP id f127mr661739wme.91.1585239050485;
        Thu, 26 Mar 2020 09:10:50 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id v8sm4275098wrw.2.2020.03.26.09.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 09:10:49 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     devicetree@vger.kernel.org
Cc:     benjamin.gaignard@st.com, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] dt-bindings: usb: dwc2: fix bindings for amlogic,meson-gxbb-usb
Date:   Thu, 26 Mar 2020 17:10:46 +0100
Message-Id: <20200326161046.12111-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The amlogic,meson-gxbb-usb compatible needs snps,dwc2 aswell like other
Amlogic SoC.

Fixes: f3ca745d8a0e ("dt-bindings: usb: Convert DWC2 bindings to json-schema")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 71cf7ba32237..b7b9ddcbc637 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -49,7 +49,9 @@ properties:
       - items:
           - const: amlogic,meson8b-usb
           - const: snps,dwc2
-      - const: amlogic,meson-gxbb-usb
+      - items:
+          - const: amlogic,meson-gxbb-usb
+          - const: snps,dwc2
       - items:
           - const: amlogic,meson-g12a-usb
           - const: snps,dwc2
-- 
2.22.0

