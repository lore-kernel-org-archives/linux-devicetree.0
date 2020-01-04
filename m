Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32481C3F68F
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 06:35:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05BF624655
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 06:35:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dounZ2pp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgADGfP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 01:35:15 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43682 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgADGfP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 01:35:15 -0500
Received: by mail-pg1-f194.google.com with SMTP id k197so24364035pga.10;
        Fri, 03 Jan 2020 22:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GqJ8ZmfM/PFXKuoIgxtZB8URd70ARnFMr3QCYoyfFA0=;
        b=dounZ2ppJYTKqp51bh8xzI0RyZitcAA3RY3wYe2pbOenDAxwIdyop1p9R2D3XgoYw6
         gVAUHqpKtj5wN3CAcdUSt2K+sdeQU/cHqJNYP0MkOMe2jeqB/xx6Bf4RYkQ0Pp4kpF15
         FJCnCjkXi00z7p/ERiYzPxsI0yMUxe6pRtVw9srlhulWl+f5YQlqdHL11sB354eSsmZd
         /FN9+ODH4EF/b9wGlEp0njgPJ1+RskUyNkzbPTMci++SkCmGP9+X8++tqJpYj2rxwRZq
         KF0+7XtVFr09k8RFkxgb1Uwqd6IAGupOEMExVOp5BuEYe0eNdXdji6aCP/W0kHXBQrEG
         +hMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GqJ8ZmfM/PFXKuoIgxtZB8URd70ARnFMr3QCYoyfFA0=;
        b=XeIH72afvbvcXV0uzxRg6yXpVX8qYjDBW4MiSRLwLD58B5HymKQg/9OiVla5AdPhe6
         OPuTAiwEwqrMW0fABqWSWyL3Gr/nGRxMHcNSwY8lwoelH9HvuainTb+x5OysisywjWB/
         mo/Wtyji0ohMBE0Bkocq3U/PdKpu7N//NVwvedH+f2ibssJlfsBGNDt/z8MYtirhgNCm
         b80nkz1c2aXaKYL7or/c5ENFpO794dUuJJw56eJQjalcpRI8Lj6Utwm9Qgj/fT65pHPE
         S0Wd9kpW6DLmUn1sjQ+e/DZzvRLtaocyteYDaZfIjB/3+2mBUfShw915Fbt6mjkhPlHe
         bZZw==
X-Gm-Message-State: APjAAAUo3ip91pg9cqtRnSdj786CIXI6OFpf6GwyJaYzR0MrbPoiFfbb
        imNlG9sY59QdJQ/cAc/5gP0=
X-Google-Smtp-Source: APXvYqwr5GDNc9qscNd3uh0Bu2sGtpzDoHRLmGIpeTafg/WPx1VPd9XTmXJf/hJ1skNSPqxboNByNg==
X-Received: by 2002:a63:2ccc:: with SMTP id s195mr57308380pgs.75.1578119714606;
        Fri, 03 Jan 2020 22:35:14 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net. [216.71.213.236])
        by smtp.gmail.com with ESMTPSA id u2sm64761580pgc.19.2020.01.03.22.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 22:35:13 -0800 (PST)
From:   Vasily Khoruzhick <anarsoul@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 0/3] arm64: allwinner: a64: Enable DVFS on A64
Date:   Fri,  3 Jan 2020 22:35:02 -0800
Message-Id: <20200104063505.219030-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series enables DVFS on Allwinner A64. Operating points table is taken
from BSP kernel.

Icenowy Zheng (1):
  clk: sunxi-ng: add mux and pll notifiers for A64 CPU clock

Vasily Khoruzhick (2):
  clk: sunxi-ng: a64: export CLK_CPUX clock for DVFS
  arm64: dts: allwinner: a64: enable DVFS

 .../allwinner/sun50i-a64-amarula-relic.dts    |   4 +
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts |   4 +
 .../dts/allwinner/sun50i-a64-nanopi-a64.dts   |   4 +
 .../dts/allwinner/sun50i-a64-olinuxino.dts    |   4 +
 .../dts/allwinner/sun50i-a64-orangepi-win.dts |   4 +
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |   4 +
 .../dts/allwinner/sun50i-a64-pinebook.dts     |   4 +
 .../allwinner/sun50i-a64-sopine-baseboard.dts |   4 +
 .../boot/dts/allwinner/sun50i-a64-sopine.dtsi |   4 +
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts |   4 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 102 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c         |  28 ++++-
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h         |   1 -
 include/dt-bindings/clock/sun50i-a64-ccu.h    |   1 +
 14 files changed, 170 insertions(+), 2 deletions(-)

-- 
2.24.1

