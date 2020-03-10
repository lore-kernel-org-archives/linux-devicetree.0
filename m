Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F8EC10F27
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:08:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 42EF72146E
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 18:08:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5iO+KwK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgCJSId (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 14:08:33 -0400
Received: from mail-qk1-f178.google.com ([209.85.222.178]:38798 "EHLO
        mail-qk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgCJSId (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 14:08:33 -0400
Received: by mail-qk1-f178.google.com with SMTP id h14so7695612qke.5
        for <devicetree@vger.kernel.org>; Tue, 10 Mar 2020 11:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=94RPXFu+kyZVOWDCvspW3Fmhnjp4ZietGZ5aahydPE8=;
        b=S5iO+KwKb+u3LXB5lH6LhqY9kI9I1Yd6VR4VZItObFmCs0WSRp+R1Qz5frNX1GELQq
         pKEIudl+kKvLc0FpwDAk2h4VhIWK6IocKgVQCOLGwwoWL6Lzd73CK4oOnoosJ9NBSS27
         XA/c5M0vlsRigkwgdntcdyzzFfBU8c7b5RloHuttpelv29u0QkOpJ+1/dlmcxX3WmX1D
         gV+m6Wojf1YmZ9yoXl123RlGmWJPGYqJuB5CZv1j2HA4l11exDlXFVw/ArEZhAYdfThO
         F5ciK6ByPyIIshEES1XobUb5LRRQfbVBZy6VkSUskeqfZFFLT3v2NsSpt6cM41t6l/jA
         39oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=94RPXFu+kyZVOWDCvspW3Fmhnjp4ZietGZ5aahydPE8=;
        b=pEPzvTxtkqO/Zpti/HuJMMtky43jRd87cJ3VBT4iCS3ZsVWtCZMx59NLjaDKqoKEub
         fnlnyNDuoHBJI0YXtfXcAJIKEmqVVIZ4SC5Baiszc44WEbnntTCnVBixpXH+3wyKkBuk
         K2Bzq+F9B1MRlmLGvSLMDOAkLoFE3EBVttArx/nWP3k9j1f/oeVRCaS7VDhvZg6asUxM
         WM2zEY5xIiak40qNMtoaTKziM6p3X89/qA48ltV2WLXHdUDeCZVt9UbvZr5hRZIoIEEE
         uYvu+aFJdAVrSpWWn9tu7ZNC1QmWx4cCq6pYq3hyihDpxvrHRbB4f5KHr/peBk0XV+9x
         gXoQ==
X-Gm-Message-State: ANhLgQ1918AG8jRgSqhSNrwM74BOWdD9wh3E5ybQl0NyNEA77HnfAxLy
        lbV51sTJSOP57gi/P+EMqYs=
X-Google-Smtp-Source: ADFU+vuvMUFYZTh0oG/mqeDkOzC1qsCLTwew52z3bdtwj/C3P7Sn3+PFBUmBhHxIXh2AOd28bhC3AQ==
X-Received: by 2002:a37:9b51:: with SMTP id d78mr21434818qke.65.1583863712215;
        Tue, 10 Mar 2020 11:08:32 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id 127sm17848821qkj.97.2020.03.10.11.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:08:31 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     otavio.salvador@ossystems.com.br, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/5] dt-bindings: arm: fsl: Add TechNexion boards
Date:   Tue, 10 Mar 2020 15:08:21 -0300
Message-Id: <20200310180825.10111-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add entries for the TechNexion boards.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Put all TechNexion entries on the same patch

 Documentation/devicetree/bindings/arm/fsl.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 06715a6be23e..cd3fbe7e3948 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -119,6 +119,10 @@ properties:
               - fsl,imx6q-sabreauto
               - fsl,imx6q-sabrelite
               - fsl,imx6q-sabresd
+              - technexion,imx6q-pico-dwarf   # TechNexion i.MX6Q Pico-Dwarf
+              - technexion,imx6q-pico-hobbit  # TechNexion i.MX6Q Pico-Hobbit
+              - technexion,imx6q-pico-nymph   # TechNexion i.MX6Q Pico-Nymph
+              - technexion,imx6q-pico-pi      # TechNexion i.MX6Q Pico-Pi
               - technologic,imx6q-ts4900
               - technologic,imx6q-ts7970
               - toradex,apalis_imx6q            # Apalis iMX6 Module
@@ -166,6 +170,10 @@ properties:
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
               - fsl,imx6dl-sabreauto      # i.MX6 DualLite/Solo SABRE Automotive Board
               - fsl,imx6dl-sabresd        # i.MX6 DualLite SABRE Smart Device Board
+              - technexion,imx6dl-pico-dwarf   # TechNexion i.MX6DL Pico-Dwarf
+              - technexion,imx6dl-pico-hobbit  # TechNexion i.MX6DL Pico-Hobbit
+              - technexion,imx6dl-pico-nymph   # TechNexion i.MX6DL Pico-Nymph
+              - technexion,imx6dl-pico-pi      # TechNexion i.MX6DL Pico-Pi
               - technologic,imx6dl-ts4900
               - technologic,imx6dl-ts7970
               - toradex,colibri_imx6dl          # Colibri iMX6 Module
@@ -225,6 +233,9 @@ properties:
               - fsl,imx6ul-14x14-evk      # i.MX6 UltraLite 14x14 EVK Board
               - kontron,imx6ul-n6310-som  # Kontron N6310 SOM
               - kontron,imx6ul-n6311-som  # Kontron N6311 SOM
+              - technexion,imx6ul-pico-dwarf   # TechNexion i.MX6UL Pico-Dwarf
+              - technexion,imx6ul-pico-hobbit  # TechNexion i.MX6UL Pico-Hobbit
+              - technexion,imx6ul-pico-pi      # TechNexion i.MX6UL Pico-Pi
           - const: fsl,imx6ul
 
       - description: Kontron N6310 S Board
@@ -285,6 +296,10 @@ properties:
               - fsl,imx7d-sdb             # i.MX7 SabreSD Board
               - fsl,imx7d-sdb-reva        # i.MX7 SabreSD Rev-A Board
               - novtech,imx7d-meerkat96   # i.MX7 Meerkat96 Board
+              - technexion,imx7d-pico-dwarf   # TechNexion i.MX7D Pico-Dwarf
+              - technexion,imx7d-pico-hobbit  # TechNexion i.MX7D Pico-Hobbit
+              - technexion,imx7d-pico-nymph   # TechNexion i.MX7D Pico-Nymph
+              - technexion,imx7d-pico-pi      # TechNexion i.MX7D Pico-Pi
               - toradex,colibri-imx7d                   # Colibri iMX7 Dual Module
               - toradex,colibri-imx7d-aster             # Colibri iMX7 Dual Module on Aster Carrier Board
               - toradex,colibri-imx7d-emmc              # Colibri iMX7 Dual 1GB (eMMC) Module
-- 
2.17.1

