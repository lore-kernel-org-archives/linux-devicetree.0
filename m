Return-Path: <SRS0=ZTIy=4Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBF5C10DCE
	for <linux-devicetree@archiver.kernel.org>; Sun,  8 Mar 2020 11:50:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B4502084E
	for <linux-devicetree@archiver.kernel.org>; Sun,  8 Mar 2020 11:50:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewXgXl+X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgCHLue (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 8 Mar 2020 07:50:34 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:40819 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbgCHLue (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 8 Mar 2020 07:50:34 -0400
Received: by mail-lj1-f180.google.com with SMTP id 19so4178749ljj.7
        for <devicetree@vger.kernel.org>; Sun, 08 Mar 2020 04:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8U0arpJjyZG4PEcID5P3OdBxXe5FL2ju3xXw7vB6b5Y=;
        b=ewXgXl+XIX83J0qPxVIMouqkdbaEsp2Skrles62G1DDhD95uW8cRlgGyRlpnH0H3q5
         RsdI3gjugvptUjBfaVTe1nFHkAIOg+uTzc1ZotHJ2SLOci6SgdggNrU8ki+uwnF9+KFc
         NtbYQLD3SDkCthoXRu/yyud8tZatR2jQx+tH2+pJp8FVz64WT5Quxo7/0o5iPDi52TbK
         hHWg5+MgPgyfVtvCj1S8oB7KQWxdM29PxS3o/Pfsm9YKrEMeXYelbT907+lS6ttJJFFh
         SdszsXHwbzJfbKAzu/TZzpnip2D2fMlCGt6U6iTNBC9Yl2PJQIm94DK46xKo5OYgqEbu
         KmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=8U0arpJjyZG4PEcID5P3OdBxXe5FL2ju3xXw7vB6b5Y=;
        b=uYcxAC4pMjLszvQT/Q91bkWnADeAg7NZRKuSjvwEpPsrKclQ4GoX0Sjdw8X5tX35V2
         0ziR6eQ6KXP/s8fjXhJ9BzRERG0WGhhP1VYODhpFh8z8nniRrOJpS5xLrIKiCNcYQz0q
         16AVcgkd+FmvKevLNDqWlDAFsauKbjxuiQ3deizoIuPaV9WYxvkPvQNdI2RXAMKC659V
         rjhGc7Z3RiC++mqDh39beKAacW7F54FOOQru317JcehlQ7OhMr5neCRQX9mHscpAm2GW
         QBxq8dw8erojgn+UPB5bNELo9QvOK99d0Vm+xibL79GXuYXN0gmy38OW8gBG4Y8QHWOi
         5vcw==
X-Gm-Message-State: ANhLgQ16hppM5Hh0CE8JS1yxOfgpR91ZPGKlq1+q9rcZMjdK1ppf/qfw
        NhhKD+ivzjjo6mT9L2wwRDI=
X-Google-Smtp-Source: ADFU+vscdSC5W1WXwbGjsyCNU3QkHsMl8UcRV7mQHXL9XewiB+zCLdzS7TWZx3O9REjmTM8bbAsXbA==
X-Received: by 2002:a2e:9886:: with SMTP id b6mr3914692ljj.266.1583668231058;
        Sun, 08 Mar 2020 04:50:31 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id u5sm8557572ljl.75.2020.03.08.04.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 04:50:30 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Maxime Ripard <mripard@kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 1/1] dt-bindings: display: fix panel warnings
Date:   Sun,  8 Mar 2020 12:50:17 +0100
Message-Id: <20200308115017.18563-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200308115017.18563-1-sam@ravnborg.org>
References: <20200308115017.18563-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Fix following type af warnings in the panel bindings:

Warning (unit_address_vs_reg): /example-0/dsi/panel: node has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): /example-0/dsi@ff450000: node has a unit name, but no reg property

Removing the "@xxx" from the node name fixed first warning.
Adding a missing reg property fixed the second warning

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/display/panel/elida,kd35t133.yaml     | 2 +-
 .../bindings/display/panel/leadtek,ltk500hd1829.yaml          | 2 +-
 .../devicetree/bindings/display/panel/novatek,nt35510.yaml    | 4 ++--
 .../devicetree/bindings/display/panel/orisetech,otm8009a.yaml | 2 +-
 .../devicetree/bindings/display/panel/panel-dpi.yaml          | 2 +-
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml   | 2 +-
 .../devicetree/bindings/display/panel/raydium,rm68200.yaml    | 2 +-
 .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
index 4bd74eaa61be..aa761f697b7a 100644
--- a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
+++ b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
@@ -34,7 +34,7 @@ additionalProperties: false
 
 examples:
   - |
-    dsi@ff450000 {
+    dsi {
         #address-cells = <1>;
         #size-cells = <0>;
         panel@0 {
diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
index 4ebcea7d0c63..2c9b8aa34815 100644
--- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
@@ -34,7 +34,7 @@ additionalProperties: false
 
 examples:
   - |
-    dsi@ff450000 {
+    dsi {
         #address-cells = <1>;
         #size-cells = <0>;
         panel@0 {
diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
index 791fc9daa68b..73d2ff3baaff 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
@@ -40,10 +40,10 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
-    dsi@a0351000 {
+    dsi {
         #address-cells = <1>;
         #size-cells = <0>;
-        panel {
+        panel@0 {
             compatible = "hydis,hva40wv1", "novatek,nt35510";
             reg = <0>;
             vdd-supply = <&ab8500_ldo_aux4_reg>;
diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
index 6e6ac995c27b..4b6dda6dbc0f 100644
--- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
@@ -39,7 +39,7 @@ required:
 
 examples:
   - |
-    dsi@0 {
+    dsi {
       #address-cells = <1>;
       #size-cells = <0>;
       panel@0 {
diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
index 5275d350f8cb..f63870384c00 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
@@ -48,7 +48,7 @@ additionalProperties: false
 
 examples:
   - |
-    panel@0 {
+    panel {
         compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
         label = "osddisplay";
         power-supply = <&vcc_supply>;
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 8b60368a2425..cefe19b6bf44 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -50,7 +50,7 @@ required:
 
 examples:
   - |
-    mdss_dsi@fd922800 {
+    mdss_dsi {
       #address-cells = <1>;
       #size-cells = <0>;
       panel@0 {
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
index 09149f140d5f..a35ba16fc000 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
@@ -42,7 +42,7 @@ required:
 
 examples:
   - |
-    dsi@0 {
+    dsi {
       #address-cells = <1>;
       #size-cells = <0>;
       panel@0 {
diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
index 186e5e1c8fa3..39ec7ae525ad 100644
--- a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
+++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
@@ -34,7 +34,7 @@ additionalProperties: false
 
 examples:
   - |
-    dsi@ff450000 {
+    dsi {
         #address-cells = <1>;
         #size-cells = <0>;
         panel@0 {
-- 
2.20.1

