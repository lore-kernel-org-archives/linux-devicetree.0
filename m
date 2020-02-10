Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741B1C3F68F
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 06:36:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C60321775
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 06:36:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nIERl2yu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbgBJGg2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 01:36:28 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33228 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgBJGg2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 01:36:28 -0500
Received: by mail-pl1-f195.google.com with SMTP id ay11so2432218plb.0
        for <devicetree@vger.kernel.org>; Sun, 09 Feb 2020 22:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8M/+JKdLoe27r1QkgI6hunqV9+SJ7vAk/tNBmFTl07w=;
        b=nIERl2yuhbzfok1YLM6oHhmpJYGu5YzjLocGeIhR2aXGpa0Rzpm2/6PhHvWz5i39zN
         Nf3rkaul93gk4B4Pg34rzr0xC0GvJuPsC0o3imF5nlMLYDU3Rp6+dRa1Ot/kj6pEvNd3
         6vCTh//IQi/I4sv72O3ZB5bWxCFwuw161MP8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8M/+JKdLoe27r1QkgI6hunqV9+SJ7vAk/tNBmFTl07w=;
        b=ZVUDGCERLUlSJcJzuQAyfTSA5UEp5ZCibb8ZgWAeCZtdcU/YZ6tTOVUjqOjmRJqLHM
         weYOsZe0EcHT6z4SkOb1xyD2Hl+INpqtRlbjdiUw2amaT/G7xGfHnbP1EOEEt/iiZGgs
         SzL7muJSjjEkfYWh+274f2QQT0OOs49uiZnL3zqw09hgJO96MFVqDfXzTaCZ8FsfBbmG
         sqDlI2eorJih/YZuEYGwzWmChcy3H7ZnTgUoZLonUzfQHOZJxzt0r7FrkfkPCFKVnxvZ
         j21o+ZxC3mKSFoxhUOmB2Qx2hCgC1Lrr2hvnZlWRWNRHUDTCWhZyGiEKPopF1bAB+jDn
         /YgQ==
X-Gm-Message-State: APjAAAVVE0oni+KaTmsOKqll0lsJCPPV+MZJFfIT8w2LUutCAZ5TtqNt
        2QKCbPDlEGJzwN+IVicNPbHWBQ==
X-Google-Smtp-Source: APXvYqzeU6ktZruV6307EOPnFu0S/auGICxWezFUqXXV4L/USf6GdEp0kwPmRlzuszsyR45ZVgnnrQ==
X-Received: by 2002:a17:902:7797:: with SMTP id o23mr10818758pll.298.1581316586487;
        Sun, 09 Feb 2020 22:36:26 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id f15sm11070041pgj.30.2020.02.09.22.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 22:36:26 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH v7 2/5] arm64: dts: mt8173: add uart aliases
Date:   Mon, 10 Feb 2020 14:35:21 +0800
Message-Id: <20200210063523.133333-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
In-Reply-To: <20200210063523.133333-1-hsinyi@chromium.org>
References: <20200210063523.133333-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add serial as uart aliases in mt8173.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 8b4e806d5119..790cd64aa447 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -50,6 +50,10 @@ aliases {
 		mdp_wdma0 = &mdp_wdma0;
 		mdp_wrot0 = &mdp_wrot0;
 		mdp_wrot1 = &mdp_wrot1;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
 	};
 
 	cluster0_opp: opp_table0 {
-- 
2.25.0.225.g125e21ebc7-goog

