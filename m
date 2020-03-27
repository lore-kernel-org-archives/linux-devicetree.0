Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2811C43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 15:57:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9DD912072F
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 15:57:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOtF8cOt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbgC0P5a (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 11:57:30 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35760 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgC0P5a (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Mar 2020 11:57:30 -0400
Received: by mail-qt1-f193.google.com with SMTP id e14so8971775qts.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2020 08:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=MJgmzrT3mOT+iy0/6QFgsKv2QDxpME0Uv8zYggJWeY8=;
        b=gOtF8cOtFG7EY31dkW2qu/WHXxMr29zCI0j8gDupt6lJykRlih49OGKaLo2ZnkORFG
         acneG8dOHa4CKURbTpsGzRIJC7vN+9g1z6ymWgGTrOMSc8ThhVuEKRYyIBFob6OrtBSD
         4c+UicmKBzM7uKnpR9JMR2w1XUZo0JbfAbntWMqBuZ7bkV7aoNLxUiCtGvOUGmJ/BlXh
         BLm1kKuCm4uPCQTYuz0mfPOSyhDvCB4F4hGI+PIw2AnSfgrBpgAWQw/ZEqUX8zcizldu
         4EDxknHdqnOQsl1/aeHmrv1vDtW0AhNhPskZR0dFRpbacuBQArZ72dZfe5na7epIii0F
         AP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MJgmzrT3mOT+iy0/6QFgsKv2QDxpME0Uv8zYggJWeY8=;
        b=mYhNpU6oQ9q2iWqNbRnAepZG7KIoFOLbZwiJKMc40xdrSzaH+VMHBAwSGAboXUYM+d
         ICIX4Kjz8to5+tEfyj++OaDVRvtQokFhmFdd4T1JtIPEX3mctvusJiBEMxpssocPcHLc
         nvYTEyW1AhPkAeLTlJEv1dRhiCnwoq16ous3OwOIp/clAWU+FO1LrDM5sThwfsGsZmyp
         eBO1JftJ1uwLR9QvYgULUE0ESde2bZ9EvBNkpQlLTlEIoGqf4szZXz1AVK5i9MJ7+vPf
         oiL2K98MH43BIsfxRRb3kjl6TYxs1rtnLHtP+lLsiZsWdpGDxws0wUBOVbUX4Fiu0BB4
         +eig==
X-Gm-Message-State: ANhLgQ0bIoeWpkZEjW1MzlCphwNaNx5Yc+kNgyR4PkZ6+7PbSG9NMduJ
        Wd2knRhdwtLiG7S9qub5dzM=
X-Google-Smtp-Source: ADFU+vtrmn9ruMwW6MFirU7I7rcRKH43s6n+pJouD0/cFjfZ4bhBpyGa2v3QZVHYtIj4fqLNCGkq9A==
X-Received: by 2002:ac8:7a63:: with SMTP id w3mr14431356qtt.352.1585324648736;
        Fri, 27 Mar 2020 08:57:28 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
        by smtp.gmail.com with ESMTPSA id 31sm4090023qta.56.2020.03.27.08.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 08:57:28 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     broonie@kernel.org
Cc:     robh+dt@kernel.org, benjamin.gaignard@st.com,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: sound: cs42l51: Remove unneeded I2C unit name
Date:   Fri, 27 Mar 2020 12:57:21 -0300
Message-Id: <20200327155721.7596-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The following warning is seen with 'make dt_binding_check':

Documentation/devicetree/bindings/sound/cirrus,cs42l51.example.dts:18.15-34.11: Warning (unit_address_vs_reg): /example-0/i2c@0: node has a unit name, but no reg or ranges property

Fix it by removing the unneeded i2c unit name.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml
index efce847a3408..83f44f07ac3f 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml
@@ -49,7 +49,7 @@ required:
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-    i2c@0 {
+    i2c {
       #address-cells = <1>;
       #size-cells = <0>;
 
-- 
2.17.1

