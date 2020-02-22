Return-Path: <SRS0=C9Bv=4K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5733C35671
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Feb 2020 16:25:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88498206ED
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Feb 2020 16:25:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XkrY8yO4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbgBVQZI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 22 Feb 2020 11:25:08 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:34839 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727714AbgBVQZH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 22 Feb 2020 11:25:07 -0500
Received: by mail-pj1-f68.google.com with SMTP id q39so2143256pjc.0
        for <devicetree@vger.kernel.org>; Sat, 22 Feb 2020 08:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VcbN+zbqnNuxs1Y+XpjZhKj62zQGe5VKHxFInvYNzhY=;
        b=XkrY8yO4wKTo1Ip/tvQeTKJ6BzqMkJdo09DcPnZHfMbhF8ykoejeQh+siDxQLdIimL
         qn5Sz4uupzVNkVPjXrEYXgm101KJVUF3dB5wABhKDecayZ7Zn3BtMJtPGlE9aVQAqGnG
         kwiUp7nlyF+uhreEYdaZZpvI57blTv9VB8HN2ZT+ndjzpEyk2hPHvCvM03ZP64ZMs7ky
         /Zu4yfinheyLwFBGvn3vLSu33X6gSq6brXGxMjNVcSxGVdKT4Z03s9SMCBzHef3g6VhD
         mhuHW/BSrvmEUJ7PUF3ICazyTYRHdRhWPwuPklGPwwrzfeT0y6hn0/95iIGSYjy/maaT
         h//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VcbN+zbqnNuxs1Y+XpjZhKj62zQGe5VKHxFInvYNzhY=;
        b=s6pwlHM/I1c/It9XqzpA7ZrCsKZe4awCvVQ8ieiL9GXIu5NhmdOmYwfmDJjTb1Ea57
         0sdJXmmNzuW5WcCwTEdGQk6DVK+WGu++9nTvRjsFYNtMAShekSfJSzuZ7KEg0TyJQrml
         1bXf5dpVUY+XJucSFT/Q0jQ+6v52Xq9DJY3BiCacsnYX2bI7fO2qo8ZCdcQMMvznNclV
         D4tMSjhwbrJoprp1lOiO+bajt19W0E0vQxAYO+VRmE4MjhKU6JX1qcB4zpHxrGvB6SX5
         faV+F5NRgWIBSsdtGwJ1knfNvfZG7GHTrbVg56Vano//eD9eQVFtKVXjSO7I4hdJqIUC
         giow==
X-Gm-Message-State: APjAAAXACYyyv8oY02NloOufGOX26bng3sMl1aMGbUybkYZquHfRE2bJ
        7UTnV3ZLa4OtUD5AcOokevmw8eh2fA==
X-Google-Smtp-Source: APXvYqx/LFN4kFjlJlu5S7c+YgXjlHWaEEHF6Jx72iqDrj6XzazM2iceQO8QQj3BejL48ZDwDwQ9dg==
X-Received: by 2002:a17:902:b409:: with SMTP id x9mr42518281plr.218.1582388706985;
        Sat, 22 Feb 2020 08:25:06 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:801:b38c:89e8:305c:23c4:b77f])
        by smtp.gmail.com with ESMTPSA id q17sm6851296pfg.123.2020.02.22.08.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2020 08:25:05 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     matthias.bgg@gmail.com, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        adamboardman@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/4] dt-bindings: i2c: Document I2C controller binding for MT6797 SoC
Date:   Sat, 22 Feb 2020 21:54:41 +0530
Message-Id: <20200222162444.11590-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200222162444.11590-1-manivannan.sadhasivam@linaro.org>
References: <20200222162444.11590-1-manivannan.sadhasivam@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

I2C controller driver for MT6577 SoC is reused for MT6797 SoC. Hence,
document that in DT binding.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
index 68f6d73a8b73..88b71c1b32c9 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
@@ -8,6 +8,7 @@ Required properties:
       "mediatek,mt2712-i2c": for MediaTek MT2712
       "mediatek,mt6577-i2c": for MediaTek MT6577
       "mediatek,mt6589-i2c": for MediaTek MT6589
+      "mediatek,mt6797-i2c", "mediatek,mt6577-i2c": for MediaTek MT6797
       "mediatek,mt7622-i2c": for MediaTek MT7622
       "mediatek,mt7623-i2c", "mediatek,mt6577-i2c": for MediaTek MT7623
       "mediatek,mt7629-i2c", "mediatek,mt2712-i2c": for MediaTek MT7629
-- 
2.17.1

