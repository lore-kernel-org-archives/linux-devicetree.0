Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D07C2D0EC
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 17:19:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9D242073E
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 17:19:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxTPia0S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgCZRTm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 13:19:42 -0400
Received: from mail-qv1-f65.google.com ([209.85.219.65]:37219 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgCZRTm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 13:19:42 -0400
Received: by mail-qv1-f65.google.com with SMTP id n1so3427359qvz.4;
        Thu, 26 Mar 2020 10:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JCcFv+VtQkOFOzCdOp/d+4xlelZn6o7lJvfIJY7gw+o=;
        b=kxTPia0SE/nPUfDNdNFLyxWLpirImLkHe3HlF1cxWqdFUKQOJPsseGVl1YzUAEIv5t
         AbtcssT8WH4sJM8YkpMBeYGAApTEUMhOrNkTT++rBuFTeOuoFQAvwdO97V6JEaiTRK5y
         SUm5ST3aIJDUtdQxSC75qLMxKz8f2AJVRAgdbGSqWKfcxa2R5LFeWSi55nNw/A3J9sq8
         viqKnoEGA6hs49M7qomlK92JcxB3emRnduXqF/3miXLveM0WY8/7hV2BXRGJMtDjWKxR
         qZJMe3YCuciLoQAU7SLFWzjAQ3jaiL50JGySPiBry/buNLKP2HR2DRMOTuTLcRje5idx
         v5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JCcFv+VtQkOFOzCdOp/d+4xlelZn6o7lJvfIJY7gw+o=;
        b=ZdySumc3rGYy2Xm0JTFE6puiJfyx7cSi95LxVOKJ7eIsOZSI7jiBSuuQO0o2hfgjmg
         6aRd1B/o5XgAO5Mtfb1A5O+N8Gq3tuxs1lvoU5o1bzNWle6flXDXz/Zbw4Rd5awlMzp1
         rSP/SiuJ1o1ItGBTxCAbrdnx+5HMl4WedmNKzJ1SyETrtqQFrZQTN+bG7PzBPepgruYB
         5eiqBgKUPHYbolL8cQkylnDUwa2J8tLUaGg5t689RXBqK3dc592XWR0XRLO1EDqkbYSh
         NqscMk6TWkdYtznkbck7u+J7BvVBk6VCD8oXt0ti7zgmh8HospEOKnYAW8UKtW5QOepk
         z6bA==
X-Gm-Message-State: ANhLgQ2jpLZ4kSdxT3ud/eacwYYksY3FYhwGgua/C9hU355C5C1aYYRX
        xvM3C7VbMrq3XrxxOMrVO3Q=
X-Google-Smtp-Source: ADFU+vsLTa/30dh93pB1pVwQXfzJN2mtdQ9XLJmYQ/0IRGzW9SKd3i7SjXGGYZRLuYbmJ5pc1k7qdQ==
X-Received: by 2002:ad4:5808:: with SMTP id dd8mr8943897qvb.191.1585243180791;
        Thu, 26 Mar 2020 10:19:40 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
        by smtp.gmail.com with ESMTPSA id d2sm1792498qkl.98.2020.03.26.10.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 10:19:39 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, sboyd@kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] dt-bindings: imx8mq-clock: Fix the file path
Date:   Thu, 26 Mar 2020 14:19:32 -0300
Message-Id: <20200326171933.13394-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Currently the following warning is seen with 'make dt_binding_check':

Documentation/devicetree/bindings/clock/imx8mq-clock.yaml: $id: relative path/filename doesn't match actual path or filename

Fix it by removing the "bindings" directory from the file path.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/clock/imx8mq-clock.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8mq-clock.yaml b/Documentation/devicetree/bindings/clock/imx8mq-clock.yaml
index 77790f0fdcd3..05d7d1471e0c 100644
--- a/Documentation/devicetree/bindings/clock/imx8mq-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8mq-clock.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/bindings/clock/imx8mq-clock.yaml#
+$id: http://devicetree.org/schemas/clock/imx8mq-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NXP i.MX8M Quad Clock Control Module Binding
-- 
2.17.1

