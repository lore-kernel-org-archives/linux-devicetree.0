Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCEACA9EAF
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 09:02:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5AAA20663
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 09:02:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iXm81CQa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfJ3JCG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 05:02:06 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45681 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfJ3JCG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Oct 2019 05:02:06 -0400
Received: by mail-pg1-f193.google.com with SMTP id r1so1022336pgj.12
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 02:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=19R5LsKrbgqwghaZ71mmjHUlNxFRBymDHjBQo6p8lc4=;
        b=iXm81CQavjLlHdERzGPrpTTyW7r5NcqLhXFQ1WTyFwd+Z6701Mb2qRcRfg5NKqcz9T
         nzePMn/HZp7MECls2uqe67R5z7/Kt84ihDs9n0aseUOZhymnypq1pNIRqiT6x7e9JMi5
         4P8nxqOnOnymKHdeojgbnKk9W9P10K/gCNd76px0xlCr0Ok7i7BigOn/D99Lu6x9cEM2
         khUU9lr8+DL784zXy36KHdzoAVcwpDpoQdx2Ya9i5v1E+7QCJ48ShqIcdLbdKF5YSSGz
         j8OaVO4qQAyXo1Uzd5vKUwAscz2pFh4nZdgUkthhf4AWXGYlWJO6Kb6enL6DZnyYynGq
         soWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=19R5LsKrbgqwghaZ71mmjHUlNxFRBymDHjBQo6p8lc4=;
        b=lEdVdURns2GMFmfSspbzuGifgN21TBUwCZp4i/3xAxrV8X7irkI8R0YmnikdvoYTqd
         FK+JVFry9W5H0v4NfwpuQHkJVCXqEoMKj/9Ul/m7O5lwyLxtIFK8UJ0Wafv3ek8xRK1K
         peE2+M5o7WuxtrAKNZfQ9561bil1pZkiwB76sM54TfaUjQVj+QoIixV2gY5M/CSNc0O2
         W7gm/wGJxpcOvb9KpZ5gZa7FC30dUuuBoCKb4xGYXoz3fKiTi9StTFt1rPHqL5UxdHgQ
         jNvBkjawvJgs0a6z8XAN7CsXdOjZwhiSsbpM53pCSH5r8uHA8gGv0lBzAyqN6rf1vBhI
         5O3w==
X-Gm-Message-State: APjAAAWv7DZcTzgpx7yIBcgroSWrMR/tHnMeRvj+K4hOl60dXIaxDwka
        tDlA1krXnftmxLfahRlv6aqm
X-Google-Smtp-Source: APXvYqwUuGARa9qA1Xv26SDwtPBHlu97DYP79Xh26qXZ4IpI9ZV/Bzj19v7ntAvjvWo3KKyAV/P64g==
X-Received: by 2002:a17:90a:a598:: with SMTP id b24mr12829604pjq.46.1572426125350;
        Wed, 30 Oct 2019 02:02:05 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:618e:77d9:c9fa:423a:3851:8df4])
        by smtp.gmail.com with ESMTPSA id g24sm2070351pfi.81.2019.10.30.02.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:02:04 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     shawnguo@kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        darshak.patel@einfochips.com, prajose.john@einfochips.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/4] dt-bindings: arm: Add devicetree binding for Thor96 Board
Date:   Wed, 30 Oct 2019 14:31:22 +0530
Message-Id: <20191030090124.24900-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030090124.24900-1-manivannan.sadhasivam@linaro.org>
References: <20191030090124.24900-1-manivannan.sadhasivam@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add devicetree binding for Thor96 Board from Einfochips. This board is
one of the 96Boards Consumer Edition platform powered by NXP i.MX8MQ SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b4b4e6573b5..8016174d5e49 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -239,6 +239,7 @@ properties:
         items:
           - enum:
               - boundary,imx8mq-nitrogen8m # i.MX8MQ NITROGEN Board
+              - einfochips,imx8mq-thor96  # i.MX8MQ Thor96 Board
               - fsl,imx8mq-evk            # i.MX8MQ EVK Board
               - purism,librem5-devkit     # Purism Librem5 devkit
               - solidrun,hummingboard-pulse # SolidRun Hummingboard Pulse
-- 
2.17.1

