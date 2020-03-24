Return-Path: <SRS0=2e0x=5J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E598C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 10:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 784AF208D5
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 10:20:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EEH56wJB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgCXKUl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 24 Mar 2020 06:20:41 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36869 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbgCXKUl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 24 Mar 2020 06:20:41 -0400
Received: by mail-wr1-f68.google.com with SMTP id w10so20719317wrm.4
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2020 03:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PTVvCh6PCJj9CPS0mPmEeRILoyiEMTqk2ooxm8xZf1k=;
        b=EEH56wJBqun7EBSVO4LMn6fqPoTs4At2LM/YVV2dtVHxxbpJuN3szu7uSpe+kSmvi3
         TxCvqdQJquFANwLgUK+fQPNkG608Rkh94NOPfDs6MMjSiiREA3uudX/TedyWtWiTnyFY
         EzgQ7NpsLtbO6g1gyMPfdcBV89d97RTuF0W5cg9SUKkAESJgkdtJwZFxU9O7uIHugZ1d
         1k70pLR86Lf9DQ8w5F2ZadKf4edU3JPtuEtGh9Tjwic7MHmGL00zd9Tm258pm+VsMltS
         M6U0YI2KMrVMVjygtAnys1cOp4ZMzHXENKLwlLxS9LbdPwxWGI4lw14Z07p1aSdaH1Gj
         hCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PTVvCh6PCJj9CPS0mPmEeRILoyiEMTqk2ooxm8xZf1k=;
        b=nm8uRehuBYFlNVnPa3U53TLuyz5ymwaRpmS57D3j1vu/pXLZt9i5M0q2nlJPkjnbpx
         szMxpqLfKAlUnAGbbTkCvqa5TG2F05AG+b57OHYJAcb/s251A2z6wE2sXWthlfE9W4OF
         sb9Lv0hn+BCjLjNYYighX4DsoWTcsIKdHzk07/6MkjEf3Wg5s7bNuNGKcMF+Mfs7WIqR
         /QjwrGT2HGcfMWWPEiTr/eIiwpmowIACaojJ7EsFvGAI9iUziDb2ckPlZDLLK1MwEPOL
         rzynXmT9S5TtuMqp7DcI3/Kw6M86Irih5tW7D2xcQiE+RfDNcNrOMts3NMzAY0LpAlXx
         j+Fg==
X-Gm-Message-State: ANhLgQ0aLt9iUeYNY+aBXfvn/P2PH+Z+/tPpopdfY1Wpnuwlb42hS9mH
        9/Lklm3YilfCbaR9d2ZKREUbUw==
X-Google-Smtp-Source: ADFU+vv0Pm5TZxBHMF9uclt+1rsV0UT+7tGkBMqmqLouYZCDr6eH28qreQbJ7FmeuNB4K4N4oYjX8A==
X-Received: by 2002:adf:ee52:: with SMTP id w18mr9469000wro.245.1585045239496;
        Tue, 24 Mar 2020 03:20:39 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id h5sm2879527wro.83.2020.03.24.03.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 03:20:39 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/13] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic GXL and GXM Families USB Glue Bindings
Date:   Tue, 24 Mar 2020 11:20:18 +0100
Message-Id: <20200324102030.31000-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200324102030.31000-1-narmstrong@baylibre.com>
References: <20200324102030.31000-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Amlogic GXL and GXM is slightly different from the Amlogic G12A Glue.

The GXL SoCs only embeds 2 USB2 PHYs and no USB3 PHYs, and the GXM SoCs
embeds 3 USB2 PHYs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index b0e5e0fe9386..e9afedbe8424 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -25,9 +25,13 @@ description: |
   The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
   host-only mode.
 
+  The Amlogic GXL & GXM SoCs doesn't embed an USB3 PHY.
+
 properties:
   compatible:
     enum:
+      - amlogic,meson-gxl-usb-ctrl
+      - amlogic,meson-gxm-usb-ctrl
       - amlogic,meson-g12a-usb-ctrl
       - amlogic,meson-a1-usb-ctrl
 
@@ -89,6 +93,23 @@ required:
   - dr_mode
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-gxl-usb-ctrl
+            - amlogic,meson-gxm-usb-ctrl
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          items:
+            - const: usb_ctrl
+            - const: ddr
+      required:
+        - clock-names
   - if:
       properties:
         compatible:
-- 
2.22.0

