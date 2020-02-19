Return-Path: <SRS0=2Ix+=4H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC10C34050
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 08:49:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1247A208E4
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 08:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eOn683oV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgBSItj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 03:49:39 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:47052 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbgBSItj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Feb 2020 03:49:39 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so27130751wrl.13
        for <devicetree@vger.kernel.org>; Wed, 19 Feb 2020 00:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T0eSzODQf+W38t9LTsDjuyIfyjBdakLnggT4q7x4oTI=;
        b=eOn683oVvXQjTuyoamRMS/6txb2X4yR16EEMZ9wVMGf4xEdGnJkpV3Q6ie2ZEl/C28
         aqFEyKPyaeDAM3wsKZ1HWD/4Aljt7OYsHjKwQ+PeZQll8xYrdenp9m/Hn+tK14yIngoY
         Vp/OOH9NofYie7bvqYGp8+xDWUbQGfgczsAZlN6CdRZgyX+bPcQjDRGFAzI6ASS2rEE1
         EeMXt2Da63BkeiGRRnplzXzP63wUU1NkfIByK6Oe77zIxOkrVbc3EGhEC689+8VR3EcK
         LXsEZKNFn8trGzlk5jTTQXlgkYzohPXr+5vaARlgXr4B1fiuScgNBsq4MCJNOkAMEpHy
         snbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T0eSzODQf+W38t9LTsDjuyIfyjBdakLnggT4q7x4oTI=;
        b=QH9fOPWEfTFBwce+C52s5pGy7X2pT0wBxUcdShkhwfnZH+tWO3KREsl2ahhyb7lZm2
         JRlg7/5Qt61dKgmmCiOu9wZP2LQtDFw+gfehmyHf9RzegHwAdpo/RYCGr1OyfCI7tTFO
         8GuiTEZW2SB6dZ1xHezL/MYDHRkE0FvXH/PhKBSZ3+nnUv2W1XRpPIrrplr7sdLV31yP
         55sUu+EevU6IxRHs/Ij3O9tK9UdbRLByL5+y40sqvGKVQW7E6UhbrJ8UCXQUzrn8/PcL
         P4ctN+CVV/u1erTYc6xRbm1x8FKmY7kGnSSQkRcD09eYaVzYSCc97A02Nwatg10WBe3j
         eVKA==
X-Gm-Message-State: APjAAAW8a3MK1ED9OO6UZzJ6ANYVATeQ9wHxI+uO08w1PCQJxORI2ug3
        yZUpdQoLl4u7bszdogxH30tUtw==
X-Google-Smtp-Source: APXvYqxKOdAjnfvM0EHcdkIDQwsjh0sXPwUv9bmf16zBUM96R+Up461G6B7gxLGGvU8J8Ah1WJf02A==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr34170279wrv.120.1582102177029;
        Wed, 19 Feb 2020 00:49:37 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t13sm2021673wrw.19.2020.02.19.00.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 00:49:36 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clk: g12a-clkc: add SPICC SCLK Source clock IDs
Date:   Wed, 19 Feb 2020 09:49:27 +0100
Message-Id: <20200219084928.28707-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200219084928.28707-1-narmstrong@baylibre.com>
References: <20200219084928.28707-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add clock ids used by the SPICC Controllers of the G12A and compatible SoCs

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 0837c1a7ae49..b0d65d73db96 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -143,5 +143,7 @@
 #define CLKID_CPU1_CLK				253
 #define CLKID_CPU2_CLK				254
 #define CLKID_CPU3_CLK				255
+#define CLKID_SPICC0_SCLK			258
+#define CLKID_SPICC1_SCLK			261
 
 #endif /* __G12A_CLKC_H */
-- 
2.22.0

