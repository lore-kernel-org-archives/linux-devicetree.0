Return-Path: <SRS0=dVBB=5N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25035C2D0E5
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 18:50:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF178206F6
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 18:50:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZ4gMSbs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbgC1SuT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 28 Mar 2020 14:50:19 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:33663 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbgC1SuT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 28 Mar 2020 14:50:19 -0400
Received: by mail-qt1-f194.google.com with SMTP id c14so11693108qtp.0;
        Sat, 28 Mar 2020 11:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=oYwocgoq6qpXm64s+/hBCAU65wjBcJ1aR6NQoL8J8es=;
        b=aZ4gMSbstNOrjAg0zQnPKVEmNM3bkh196iXVjD4xX1pjQOJUp+qyZ1KXaI8h7u3GLE
         l+Ax8Rpy/IpjAvMQHtAeRR+3DIhPjfvrw7ripSCO3v6pI4jEkRevUaAZ7t8E11fILTCo
         xMmNkFPHz4+kLaKYanpsvfh/CLs1wGpmU16kiKHprwmjqh0YOAbduneAwBUNjhJSHUFh
         vXDSsBRMxAWZeK2bIPicIZAFR4ZfewYtTPt9p1vZkY+fBqF5cJP/ql/3TwU4J1ATrvBj
         V/1Vrf//SAwGs5QoEVbfZ86gYRN3Xc4bASBwSRVvI2ieEJ7p/d4/VbEMJHV4tGeNxiDX
         K7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oYwocgoq6qpXm64s+/hBCAU65wjBcJ1aR6NQoL8J8es=;
        b=aYB6MbdryAO9lDKmmNMgv1YSmY7cpUonfe2R0ufBSWRU6qJOt8X9uIglDsFBxEfV8E
         JvT6RKO4Bqe1VrI2rrXZQl2sy5R6vqqMyfPMyH5TnHgx/RjVO0p2T3GK3zSe6wFwlaiW
         t8cHRDOUJIjX38/YWGWR5gwbQFLdE14Ecg/meCh/ConiBP0AE1YuMiRr04OoJRn+CcmT
         VWCmPDfgFku9N2T7zhUr0rFVj0jJIaTjgd+LSCmne42yJ29Z+gYA6CJqHdilQYxlOkBc
         bPh3cbHYU1SuUrZjAKQqqlaF+uwC8zH7RV75npFo9TqQiPnw8bHo0ODax1BAJUFBXhja
         fKqg==
X-Gm-Message-State: ANhLgQ0Djjx3dkHQpS4Z68w2KUx9a95eC7S4cT4wSW1Jjtyl6k3Pwhk0
        VcleB/sjCLzCqGwo1zesKcI6NTc1/00=
X-Google-Smtp-Source: ADFU+vs08RNWXBoXfG+YYCM3oqNKXcwjgcCPu9eafdq2sjdF0D6h4DNPnv9KOfPWrrz4sihL1ajRfQ==
X-Received: by 2002:ac8:312e:: with SMTP id g43mr5241102qtb.360.1585421418495;
        Sat, 28 Mar 2020 11:50:18 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
        by smtp.gmail.com with ESMTPSA id g29sm7051336qte.0.2020.03.28.11.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 11:50:17 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: clock: dac: syscon-icst: Remove unneeded unit name
Date:   Sat, 28 Mar 2020 15:49:58 -0300
Message-Id: <20200328184958.16134-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The following warnings are seen with 'make dt_binding_check':

Documentation/devicetree/bindings/clock/arm,syscon-icst.example.dts:17.16-24.11: Warning (unit_address_vs_reg): /example-0/clock@00: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/clock/arm,syscon-icst.example.dts:17.16-24.11: Warning (unit_address_format): /example-0/clock@00: unit name should not have leading 0s

Fix them by removing the unneeded clock unit name.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
index de9a465096db..444aeea27db8 100644
--- a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
+++ b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
@@ -91,7 +91,7 @@ required:
 
 examples:
   - |
-    vco1: clock@00 {
+    vco1: clock {
       compatible = "arm,impd1-vco1";
       #clock-cells = <0>;
       lock-offset = <0x08>;
-- 
2.17.1

