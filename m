Return-Path: <SRS0=mzwU=6O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7281CC8300B
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 13:25:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C60A20870
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 13:25:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H+Yik8du"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgD3NZO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Apr 2020 09:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726685AbgD3NZO (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Apr 2020 09:25:14 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88994C035494
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 06:25:14 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id a5so689048pjh.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BnAC1hbVK6lZpRP0Ydha1Gljhb6wHC7kfdrL2QnVe3Y=;
        b=H+Yik8dur/zMWlkhhhAZ/p0JRWaIhASGJgvuag9nSCNSjcwYXzm879vZ7bfluRWADf
         bZ5JshFMKBW/U5TDr8mkNdbmJZxwNSpe+0vLYPl2JftqVrb2g0jLrdYE+zJfRVNT4i0J
         l+t75wePe6LVyhYikGF1RsXYbARDri71Mi/jnOzZIko3kp3vREGXeOy9FQrXVgyV0BXM
         T34AVV29o1og4uA9tzroiez44NbRH0h6TkKOTLTa4rz2VHrp7iiW9TYjLIoWu7UlDnQa
         JRp8Se7lm4EdK+mtF3KaCGCBt04ZiO9obRxTArYZRTxBF7B+dCO7Q8ZaDHvJge3msRAT
         nbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BnAC1hbVK6lZpRP0Ydha1Gljhb6wHC7kfdrL2QnVe3Y=;
        b=Vr9ctvS2wrqsasj10dwG+VEoHeuKiB8Zb+TT9xids3sn/9y56eibALtC2r/1FKV2GQ
         09VP65Awxd1LXXkDaNOYrB4sSaY4gf7hMFOfPI6YucKjWyPxsqVLAyx4PSWzKmg1ScGn
         yLFKUh0RemEKyLE2LrL1uKULOjEpm4HDXCOASeVqWGCCX3blt2LX/DqdaS19hm/0wZW3
         Ysy79KT8B7zejqrDw5DFtLTdNfet6AGk6Es0LzPc/fQqoBbDzH7pNAUa9QIMZRwnGceH
         hfwdYP9a6m9MiAuDsqRgECJJ9As7XiTr4RsesxoD4QteA5EPGzAgcBHXGYJBpgEbuuu6
         /bGQ==
X-Gm-Message-State: AGi0PuZlKRqx8j55fLS25MI0rGL6n8KYuDanTOHKShil31awX8Y9Wsin
        yQ89nsPfMkyD86DK6P2anwK6Yg==
X-Google-Smtp-Source: APiQypKTuuXpbq3lvIBZDBjmrimHR8+C7q0E8e5x+YC8XooF9fgbNjEhRu9FOfq2SpdDuFxJ99E2Ew==
X-Received: by 2002:a17:90a:f418:: with SMTP id ch24mr2988645pjb.68.1588253113474;
        Thu, 30 Apr 2020 06:25:13 -0700 (PDT)
Received: from devnote (NE2965lan1.rev.em-net.ne.jp. [210.141.244.193])
        by smtp.gmail.com with ESMTPSA id e11sm3541893pfl.85.2020.04.30.06.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 06:25:13 -0700 (PDT)
Date:   Thu, 30 Apr 2020 22:25:09 +0900
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/2] dt-bindings: arm: Add Akebi96 board support
Message-Id: <20200430222509.c0c3699e42b3e2e3c290ceae@linaro.org>
In-Reply-To: <158824887998.2799.1402930732677315138.stgit@localhost>
References: <158824887998.2799.1402930732677315138.stgit@localhost>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add uniphier-ld20-akebi96 compatible string for
Akebi96 board support.

Signed-off-by: Masami Hiramatsu <masami.hiramatsu@linaro.org>
---
 .../bindings/arm/socionext/uniphier.yaml           |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
index 65ad6d8a3c99..10a7f0752281 100644
--- a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
+++ b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
@@ -51,6 +51,7 @@ properties:
       - description: LD20 SoC boards
         items:
           - enum:
+            - socionext,uniphier-ld20-akebi96
             - socionext,uniphier-ld20-global
             - socionext,uniphier-ld20-ref
           - const: socionext,uniphier-ld20

