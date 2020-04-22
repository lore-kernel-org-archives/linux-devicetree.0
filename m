Return-Path: <SRS0=0pfk=6G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB07FC54FCB
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 22:22:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF6DE20781
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 22:22:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZIHNbUlp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgDVWW5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Apr 2020 18:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725839AbgDVWW4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 Apr 2020 18:22:56 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC793C03C1A9
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 15:22:56 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d24so1508486pll.8
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 15:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7n9uO7zs3e13z9r7bmohTXGO4/vUq74CC3yhkpSAyMY=;
        b=ZIHNbUlpox+u1m0ebKe2wk0RwC2o/aYdUqLCwHJ7gtjjVybZ2jMKA3HWkkeiVdbR9X
         DsUJ612mDWci5nsLRkI/APdEF10aZNG+Jwp00tIWFYyk0DPD9L7LyOdnvpigDATntZos
         /lXXLrxJQ6hiC+2+G2eWRVln7NPqFyLKJ5nOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7n9uO7zs3e13z9r7bmohTXGO4/vUq74CC3yhkpSAyMY=;
        b=i/F99Lz2v5jcnqNOhDPBfVs1cMEbB3OsagbfTree21UQistS1CewKzltBo6K0m9660
         Y5fGV53wAbYIrQhbvXB/wDkv+OLgAXgFcUqVn+PCb4P5kAz/NDn4ToJo5cdwP/P8chTi
         81Qxg+F0OBWTgwXh1B4YErham2FCwHWkA7dQZS1lnncLs7jY3UL6DNPxYR1LbyC8vgnV
         lHvu6vYdHnBXFuIZtxe2fAQtlzZxgOCkaro9CKvGAOjahCdVPftWYuqjkSD1UKreMFSm
         gfd/B+GsOs1RCu+V7UzUO8zWeH+lQHXKHeTu1P8R3p2GVld7LakwZDz6JvmEiniLelFs
         K6pg==
X-Gm-Message-State: AGi0Pua39bse4Yu/P6PaYRyUdpYZIxqIdX7M31uysBZW8+mw7nQeeQ73
        SF9NLWabOAOjaOwCAoMjQ0iThw==
X-Google-Smtp-Source: APiQypL56z/Wb04CpGSScMPO2DkFtPhoLvkZPEVd8n8lgYhypelbe1QqGnKB4xu5a/XVPjIkOl3ryQ==
X-Received: by 2002:a17:90a:3327:: with SMTP id m36mr981410pjb.116.1587594176212;
        Wed, 22 Apr 2020 15:22:56 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id w9sm541224pff.101.2020.04.22.15.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 15:22:55 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, twawrzynczak@chromium.org,
        Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: chrome: Add cros-ec-typec mux props
Date:   Wed, 22 Apr 2020 15:22:39 -0700
Message-Id: <20200422222242.241699-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add properties for mode, orientation and USB data role switches for
Type C connectors. When available, these will allow the Type C connector
class port driver to configure the various switches according to USB PD
information (like orientation, alt mode etc.) provided by the Chrome OS
EC controller.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 .../bindings/chrome/google,cros-ec-typec.yaml | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
index 6d7396ab8bee..b5814640aa32 100644
--- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
@@ -21,7 +21,21 @@ properties:
     const: google,cros-ec-typec
 
   connector:
-    $ref: /schemas/connector/usb-connector.yaml#
+    allOf:
+      - $ref: /schemas/connector/usb-connector.yaml#
+      - type: object
+        properties:
+          mode-switch:
+            description: Reference to a DT node for the USB Type C Multiplexer
+              controlling the data lines routing for this connector.
+
+          orientation-switch:
+            description: Reference to a DT node for the USB Type C orientation
+              switch for this connector.
+
+          usb-role-switch:
+            description: Reference to a DT node for the USB Data role switch
+              for this connector.
 
 required:
   - compatible
@@ -49,6 +63,17 @@ examples:
             data-role = "dual";
             try-power-role = "source";
           };
+
+          connector@1 {
+            compatible = "usb-c-connector";
+            reg = <1>;
+            power-role = "dual";
+            data-role = "host";
+            try-power-role = "source";
+            mode-switch = <&typec_mux>;
+            orientation-switch = <&typec_orientation_switch>;
+            usb-role-switch = <&typec_mux>;
+          };
         };
       };
     };
-- 
2.26.1.301.g55bc3eb7cb9-goog

