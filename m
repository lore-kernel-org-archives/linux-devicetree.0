Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A004EC352BE
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72D572075E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8GyZwFv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730275AbgDHTwW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:22 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33511 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730271AbgDHTwV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:21 -0400
Received: by mail-lf1-f68.google.com with SMTP id h6so6163874lfc.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VYly4r8qrsCzIDD9s/1dOkg2kifrOc3QtNDhWtGpr0M=;
        b=Z8GyZwFva9wkBtNxzbWQtihm4YtkF8iWYkyXS880jTa89LjKBdSnMdeflWyfutS/x8
         WWPtTpFDtEEv2NRJXhu70mill3dQ+Dklsu/uZoFUrPTMFfdXFiVztZzkiS+FHDJMzhif
         yg0KxkjkefFWGzE2+LJfT0beUFXpDcwPC63q4UPryLmEOQ0xOVgQ9b5qd8DBgW9+WS8k
         A3piNS43SETtJ6D9VvMIhnbA90Fh4vE+k0OrZs9Tf0fWnE4KhlJ2fSw3OT6RcrJAAm33
         fYE7Xt8eHwZgDFVdkFqLiWq4TfIbtP9hYjqYlGGqgMaYpuu5AYXdEvFWrA0kFz3uNN6L
         6eOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=VYly4r8qrsCzIDD9s/1dOkg2kifrOc3QtNDhWtGpr0M=;
        b=Zmb9JdQ+Npt4dusVGD1vwNXm4kJzghzv/JsMXH15zxCAL334S+PIGOEblObSCTYLRj
         UacFylZfkZaYvaYFPfJqIRKa4D6yjChe2WAk+YS9ydt1ubziaOfNFdAxBgGbBXYRqFDb
         KCxJkJz5b80pf9GfiZrtHC8ENZRz5ZV9QRfip6s4tu+l3JEHUgN0l48N9iAfN9j4hliw
         Cn8DfrGnCxI43snlMp2pg6Gn2aiOaGIJMnSa0QWc13H4CnKsKHFHyiJc+GrdkMUNQehe
         xqpAnqE16t+NewAXkVvsz21XntnJjq12bHAe6AVY2oBntPB54n8jHHyDsI4u/2cmMz/C
         pB2Q==
X-Gm-Message-State: AGi0PuZeJfrTP7E0JF5wG72FTrVFZjtrr50bK52YdzS0Fg+62Wq4ANwx
        J7SKMegJSef2CWqoRKWfUVE=
X-Google-Smtp-Source: APiQypJsw0jAML1ydWByy1IInf4xNx7ti8E0whJ9r853xrHrkAucXzc62YZoBcAWQPUxKLN1P1ZSew==
X-Received: by 2002:ac2:4466:: with SMTP id y6mr5589200lfl.125.1586375539526;
        Wed, 08 Apr 2020 12:52:19 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:19 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 36/36] dt-bindings: display: move DSI panels to panel-simple-dsi
Date:   Wed,  8 Apr 2020 21:51:09 +0200
Message-Id: <20200408195109.32692-37-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Tomi noticed that several DSI panels was wrongly
described in panel-simple.yaml.
Move them to panel-simple-dsi.yaml where they belong.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../bindings/display/panel/panel-simple-dsi.yaml          | 8 ++++++++
 .../devicetree/bindings/display/panel/panel-simple.yaml   | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index f2698d7c09e6..423532f57e89 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -29,8 +29,16 @@ properties:
       # compatible must be listed in alphabetical order, ordered by compatible.
       # The description in the comment is mandatory for each compatible.
 
+        # AU Optronics Corporation 8.0" WUXGA TFT LCD panel
+      - auo,b080uan01
+        # Boe Corporation 8.0" WUXGA TFT LCD panel
+      - boe,tv080wum-nl0
         # Kingdisplay KD097D04 9.7" 1536x2048 TFT LCD panel
       - kingdisplay,kd097d04
+        # LG ACX467AKM-7 4.95" 1080×1920 LCD Panel
+      - lg,acx467akm-7
+        # LG Corporation 7" WXGA TFT LCD panel
+      - lg,ld070wx3-sl01
         # One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
       - osddisplays,osd101t2587-53ts
         # Panasonic 10" WUXGA TFT LCD panel
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index e4f8133f48bb..c6aa5ddc678a 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -33,8 +33,6 @@ properties:
       - ampire,am-480272h3tmqw-t01h
         # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
       - ampire,am800480r3tmqwa1h
-        # AU Optronics Corporation 8.0" WUXGA TFT LCD panel
-      - auo,b080uan01
         # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
       - auo,b101aw03
         # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
@@ -71,8 +69,6 @@ properties:
       - boe,nv101wxmn51
         # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
       - boe,nv140fhmn49
-        # Boe Corporation 8.0" WUXGA TFT LCD panel
-      - boe,tv080wum-nl0
         # CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
       - cdtech,s043wq26h-ct7
         # CDTech(H.K.) Electronics Limited 7" 800x480 color TFT-LCD panel
@@ -155,12 +151,8 @@ properties:
       - kyo,tcg121xglp
         # LeMaker BL035-RGB-002 3.5" QVGA TFT LCD panel
       - lemaker,bl035-rgb-002
-        # LG ACX467AKM-7 4.95" 1080×1920 LCD Panel
-      - lg,acx467akm-7
         # LG 7" (800x480 pixels) TFT LCD panel
       - lg,lb070wv8
-        # LG Corporation 7" WXGA TFT LCD panel
-      - lg,ld070wx3-sl01
         # LG Corporation 5" HD TFT LCD panel
       - lg,lh500wx1-sd03
         # LG LP079QX1-SP0V 7.9" (1536x2048 pixels) TFT LCD panel
-- 
2.20.1

