Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B58FC33CB6
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 03:38:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4522206D7
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 03:38:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NnpfF2ML"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730103AbgAQDiF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 22:38:05 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40936 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgAQDiF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jan 2020 22:38:05 -0500
Received: by mail-pf1-f193.google.com with SMTP id q8so11260622pfh.7
        for <devicetree@vger.kernel.org>; Thu, 16 Jan 2020 19:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wUKL7anK2VMZt2D/L2kwFyqgWv6/GSNMYRnjYd65PE0=;
        b=NnpfF2MLFTvbGaAnhIIe+UgRA4YZvtzhQgTmCjVzzsS2lK4pkLEDcM4uX19C2q7Jsu
         3gPDrtYqjZvQHtmsh/wTaM1BCoUox0scJPy4CcfosRpQbJzj1jDbj4cuVtW1w7m0Zd//
         z3+A6z+8S3cmIcLu2P3ExnGOFZnxriABD2A6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wUKL7anK2VMZt2D/L2kwFyqgWv6/GSNMYRnjYd65PE0=;
        b=SaiktBGt6oDWLhzm1mofYpp8o6i/Gd7tdwuTnxsiO1eKYVTLS1WrQdGtClwe+orny6
         totg1SSIdtvrXkiN7fPCI9s+IJsYBwKPFNcTRDAYRGY4aeEkVr0FOmuHOWRxI/IMNl0A
         HuSxnao+Mjc86QgT8mhwjcJbnKW6Bpqdn7aUmfSmn9PLKoDgPNExgQL5aoVoY7bnSId4
         BudD1+gBtjnPjR/3qsdP4BWpmr4CTWFEDrhcOxiLbOsKvuks3z5fqTq0IBJeTiHX3qTu
         1V/brWqNwXlHFwj5asGMaEm2ohbSTr0BQxJ3EEgsZQN3hcdhPHCUsG9N2Zf9n+2KBgfm
         2Xbw==
X-Gm-Message-State: APjAAAUiy+BK4x/x9XEDEVXTq0+XN0wZyNyLQ923mfVuJaGq/bA/Ajnb
        pO4Raej/QnQT/YTmP1PL3fMhAQ==
X-Google-Smtp-Source: APXvYqz1iwhj0OogQfDaYFTpD4TqMlb4k5bUlrDqndHj3nE2Trjh5/+S2MJfNPZXlLkQ/QY0Qb2AtQ==
X-Received: by 2002:a62:446:: with SMTP id 67mr844511pfe.109.1579232284594;
        Thu, 16 Jan 2020 19:38:04 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id j38sm25940259pgj.27.2020.01.16.19.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 19:38:04 -0800 (PST)
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
Subject: [PATCH v4 2/3] arm64: dts: mt8173: add uart aliases
Date:   Fri, 17 Jan 2020 11:37:48 +0800
Message-Id: <20200117033749.137420-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200117033749.137420-1-hsinyi@chromium.org>
References: <20200117033749.137420-1-hsinyi@chromium.org>
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
2.25.0.rc1.283.g88dfdc4193-goog

