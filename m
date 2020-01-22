Return-Path: <SRS0=6ipe=3L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877D8C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 09:25:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5472E20704
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 09:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QWf4OAlw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgAVJZi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jan 2020 04:25:38 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53301 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgAVJZh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jan 2020 04:25:37 -0500
Received: by mail-wm1-f68.google.com with SMTP id m24so6031488wmc.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jan 2020 01:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jl1D3AmziTwVaydKZMicfuuKx92SzNFy1wg6z3sQOu8=;
        b=QWf4OAlw4HblNZpibCzinKXmVcQxe2T3DfOdm82fH1kR0Jy8WNv+EvTlK7H9S+2b5V
         6n4s6TI9j+qvwWD89eXAY4eDuqw5rfoI8xRW5t31OQdI02Em/Jcng6UEPc/Z7fBvmWcy
         1HHC/4EpUgA5szvKHBynZhxUgdzdnCq0Hv5rmbgcg9W+GrFcsTx5iiM3xUZ8FX/7KVNW
         Qpe4pt8y82X9eT/OV+GaI9zSNq3fnqGpIaD20d3czbeOC6wukZGh9xua5d/u33wq4D4I
         thyksjj+mUNYd5z3wbuon9IKV+KzAGO9j9s2bSQCd3h/9FILqKaTfW9QTjUTCS9/eQpp
         wtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jl1D3AmziTwVaydKZMicfuuKx92SzNFy1wg6z3sQOu8=;
        b=a6LAMgp8Jp3TyveQorMgAv+yl3d2nGZ7jjoqN+bUs8BYMvf43RugUer+sUla06D3T2
         2czB1IMfUsxDiuojE0ug+GlAvzM4FY9Dh1/9f9s6qSK3XO9VYNB0HLelVvtqevmGWYUD
         pDMM1CxWu0NaIxMB4On+/IWw5h2V4F2DGPrFCXBYX8BZZrGsB62X/9EBYYCJW0X59RSQ
         4KhZ4pua9MdQIIqOm9JehzfOafGEVRWb9g05cpqRUBuy8r9aP/mfyZtN+h3b5L1uQlwA
         s7yXeFP38EAleCoh9Z4PU9E6C7WR9jnbJvD+S3sjsFBMUho8w6vdPW71SBCXPaTzpTod
         aobg==
X-Gm-Message-State: APjAAAUFxVMnH3uCKhGenN5yUGuAy1BdX6gYi9CIuSF2BfpYjwv+VSgj
        71/HF9EXIWK2x8ILq9EI73QgIQ==
X-Google-Smtp-Source: APXvYqzbK5xmg3Q8pvvBxsVKUN7iX5VNKCEhjLiLQ4URYMDIPnu2V9Aj/FpSlwqF5Jr7ga/yDdQT5g==
X-Received: by 2002:a7b:c08d:: with SMTP id r13mr2021190wmh.104.1579685135848;
        Wed, 22 Jan 2020 01:25:35 -0800 (PST)
Received: from starbuck.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id g25sm4134125wmh.3.2020.01.22.01.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 01:25:35 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: reset: meson: add gxl internal dac reset
Date:   Wed, 22 Jan 2020 10:25:26 +0100
Message-Id: <20200122092526.2436421-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the reset line of the internal DAC found on the amlogic gxl SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/dt-bindings/reset/amlogic,meson-gxbb-reset.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h b/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
index ea5058618863..883bfd3bcbad 100644
--- a/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
@@ -69,7 +69,7 @@
 #define RESET_SYS_CPU_L2		58
 #define RESET_SYS_CPU_P			59
 #define RESET_SYS_CPU_MBIST		60
-/*					61	*/
+#define RESET_ACODEC			61
 /*					62	*/
 /*					63	*/
 /*	RESET2					*/
-- 
2.24.1

