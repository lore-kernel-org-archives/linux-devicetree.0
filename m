Return-Path: <SRS0=uzRV=5Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B097BC43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 08:37:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A0D120787
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 08:37:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XTvtKtJF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730099AbgCaIhf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 04:37:35 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42827 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730070AbgCaIhe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 31 Mar 2020 04:37:34 -0400
Received: by mail-wr1-f67.google.com with SMTP id h15so24766070wrx.9
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2020 01:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bw9s/mMNE/c7asckCQOQ8iAFN4jSk9KCdHX9uwgrhEw=;
        b=XTvtKtJFWmp2Zmc3VHP/lvfCJ1inAsyaqylWIh4Ss2EKA+1ovJ1tZmg5c1aXZ3q1zH
         goXa/80FrVAlCdEsamIa0Jor0NdqbZbeODuoBI4nBsVZjN54/VQXvZWNDd3Yt5c8Zzog
         y+6S1xkEXg9k9OHLfXBnbyNzBRQEEvi1RUL7KPol2Ldpc6jaI+0wWqYOUDr5VxOjlLOG
         Thgq/dr9FhALeoYg9RGCzIZhLz0emEdHlnoFSv3kct7Gz3xgQ4um7eDgk/DyxIVFTAyN
         KGD7UbQHUcme5r1KIMbkd1YQI/FYPlMhhp4FeOk12xCgoCxR9ciQpHntE1wf1+flNhUK
         5k/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bw9s/mMNE/c7asckCQOQ8iAFN4jSk9KCdHX9uwgrhEw=;
        b=aqHtWMpIrhbRlbulPSAyGqjiVlG+/jKVBx5SW1ti/Iig6CizrfhVrRmBElf2DbIXQ2
         1G+cyj5Z0bfRS7i7uv0G7NPIRPDFybcLrXumCG6F+3LkqCZYn2ORRCNT1j2kIbXNLK8w
         LBNHyv1n3awcIFam0OOgDb4Szf8WVbupedoh9LQMHdpbVZhHdhJR8QbhN4ygMWd1LrR1
         NP671gbVk67FHzAvpmEyoFMT/7RpG1fwouUOOmkQ/JsF4HnbIIx2xNGqhKXh9QkE5zXx
         uld+TZj+2Hp7XgKjVSG+S8nj4HbNLRrQk7hqdAjsDewyPdAKCnQGCaWnmM8ntAenJJuP
         /9LQ==
X-Gm-Message-State: ANhLgQ3zTNeT0aemDfNp9qUaXcuZxK1e75A3xxVy/rpj1E2edmfaaeWB
        mNBl8ni1ah4OWfhbLxQ7B5PVTQyekgyF9w==
X-Google-Smtp-Source: ADFU+vvfGC1b/+1ygxgUrGk28VZ+Ia8a+bilQBp6RcBH82KuSbgACrUme3dO63WJl/H4m1H7wNagzQ==
X-Received: by 2002:adf:b307:: with SMTP id j7mr20134382wrd.128.1585643852432;
        Tue, 31 Mar 2020 01:37:32 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id j188sm2955870wmj.36.2020.03.31.01.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 01:37:31 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     devicetree@vger.kernel.org
Cc:     benjamin.gaignard@st.com, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2] dt-bindings: usb: dwc2: fix bindings for amlogic,meson-gxbb-usb
Date:   Tue, 31 Mar 2020 10:37:29 +0200
Message-Id: <20200331083729.24906-1-narmstrong@baylibre.com>
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
Reviewed-by: Benjamin Gaignard <benjamin.gaignard@st.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 71cf7ba32237..b5303d918e70 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -44,14 +44,11 @@ properties:
       - const: lantiq,arx100-usb
       - const: lantiq,xrx200-usb
       - items:
-          - const: amlogic,meson8-usb
-          - const: snps,dwc2
-      - items:
-          - const: amlogic,meson8b-usb
-          - const: snps,dwc2
-      - const: amlogic,meson-gxbb-usb
-      - items:
-          - const: amlogic,meson-g12a-usb
+          - enum:
+            - amlogic,meson8-usb
+            - amlogic,meson8b-usb
+            - amlogic,meson-gxbb-usb
+            - amlogic,meson-g12a-usb
           - const: snps,dwc2
       - const: amcc,dwc-otg
       - const: snps,dwc2
-- 
2.22.0

