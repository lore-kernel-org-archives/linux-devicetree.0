Return-Path: <SRS0=DJdz=7G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20AFC433E2
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 May 2020 19:25:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9388F20899
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 May 2020 19:25:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q9zdV7gO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388359AbgEXTZ6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 24 May 2020 15:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388351AbgEXTZ5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 24 May 2020 15:25:57 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A39C061A0E
        for <devicetree@vger.kernel.org>; Sun, 24 May 2020 12:25:56 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id a4so9348393lfh.12
        for <devicetree@vger.kernel.org>; Sun, 24 May 2020 12:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5XttF+gsxtE2Nh/RT1QjWbgSDPDgIMs0jLXUksIU0jw=;
        b=Q9zdV7gO/MYu3S00/kxokO6oD2tR0Kw1o4ENGUPMf/DwqEdKXQtIfXMkXjWFVa2JWt
         jIRsVs3gIH9SwWWfHwoL+KwCRVD4xDYZK0cwCMCmy+t0JOGfE+Xc+dZE03N8lut5sz2W
         qQbKlEL8CGXjD2iudWs2dSowjnDDAaSxLb3joGbQiq+sY49Xo/F1fVPpClEZ07Ox5cI1
         zlF+AwGVs5d9V2hEtk9DV51aPBoYSMkcxHaLTReRDTVa5BeVFiv5qP3Miej0vCt1uTwA
         gFt9geoJAfS8I979RxuhEtBr9fn0QHv43JLpSFojnSofo0nJrCyV2i+44pa5glYnzy4J
         rlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5XttF+gsxtE2Nh/RT1QjWbgSDPDgIMs0jLXUksIU0jw=;
        b=DeV2hir3IKbCFVV8lM72dcsjj5R5asvs8k/C+Zm7bB2vgehgX1WMhTBGH5wWVf41eA
         Kb/Hreb1r4GJyDVK/XTT+Ov2pX6aTkpbRfq2ObxRIWPl7a3abvqCGn1QBZAUpecPqpUJ
         0qdZma15pKnVbWi0h46Q6WKI9JE70nJP3xWXlV8r2imTRqjMmta2BGCRHnjQfuS/sDRl
         OL+6UXBkfPS1Z04Xzn7vLAbSFX7gJoEeEr4em/cxxOQ3KCPn36xw/adDDQCljTknPQty
         DBB2y+aBze7zABnzZgoNI41giTPKU0W244YLaD+JC5CQ/J+UfaHfGAdWb30PDJ5La2o6
         6EQw==
X-Gm-Message-State: AOAM5339jTWpR66gHciEFrYKM0ENMzS/xG9gaC276BcDB91YvL9g9dPR
        FDYYa4htJ2gYG5mNQTX+MfZ1XA==
X-Google-Smtp-Source: ABdhPJwN7XnAuNpoLsBpve9Y4DsBJwSK4bv4ADy1BFqTyLwbNZ2j2wh6a12hUzBuYEe9s7X+cCSCmw==
X-Received: by 2002:a05:6512:533:: with SMTP id o19mr8600990lfc.6.1590348354921;
        Sun, 24 May 2020 12:25:54 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id v10sm3878137lja.23.2020.05.24.12.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 12:25:54 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 09/10] media: i2c: imx290: Move the settle time delay out of loop
Date:   Sun, 24 May 2020 22:25:04 +0300
Message-Id: <20200524192505.20682-10-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200524192505.20682-1-andrey.konovalov@linaro.org>
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

The 10ms settle time is needed only at the end of all consecutive
register writes. So move the delay to outside of the for loop of
imx290_set_register_array().

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/i2c/imx290.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 88850f3b1427..ee5c95cf64f3 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -347,11 +347,11 @@ static int imx290_set_register_array(struct imx290 *imx290,
 		ret = imx290_write_reg(imx290, settings->reg, settings->val);
 		if (ret < 0)
 			return ret;
-
-		/* Settle time is 10ms for all registers */
-		msleep(10);
 	}
 
+	/* Provide 10ms settle time */
+	msleep(10);
+
 	return 0;
 }
 
-- 
2.17.1

