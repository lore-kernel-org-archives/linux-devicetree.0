Return-Path: <SRS0=kVRS=Y2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85C7CA9EC7
	for <linux-devicetree@archiver.kernel.org>; Sat,  2 Nov 2019 17:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BBB6218AC
	for <linux-devicetree@archiver.kernel.org>; Sat,  2 Nov 2019 17:29:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXt4YZa1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfKBR32 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 2 Nov 2019 13:29:28 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40149 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfKBR32 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 2 Nov 2019 13:29:28 -0400
Received: by mail-wr1-f66.google.com with SMTP id o28so12678782wro.7;
        Sat, 02 Nov 2019 10:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sh78oVIiRrDkWPPtRwjQsKosVmgPku74hJKQMiox9SI=;
        b=EXt4YZa1gBYT0SBFSOdnUSP/Xh88Qx6qTawy8qoHa8PEm/6u8Lyhzaavhf5PFWdGfO
         XiGrDHjj8V2k/+vwiGyNxefEq1eobFQeIwwi1P2sbX1glmauDj1tZrH7N+hs8ngAWgv3
         HiTqhntK9yuiKhQAnbmiLofR4XLRVoednEDWYN7rMGS86/uN8RgYnKfdSQlRKiNy1bQL
         tr/hJgMOnRo34VOhXV/Y9d+eUrVErRTG+g3r16pwN/ePQR12OT3S3rfMSTSFH2JOxO48
         w5cPGNhPXpCASWTsgjTY7W6yD7B4+bhR/3ulNfVh0W88GdGF1S6E1kQ8CzMCOcoL6jdC
         G+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sh78oVIiRrDkWPPtRwjQsKosVmgPku74hJKQMiox9SI=;
        b=hXlHbCu6BrMalaPeLeIMuT39KCHrSe3i/m/mowjLORxcDJbkjmbHbXSnRdXKfrYzw/
         E8tVy/KW1eb/CigHqneHthRJd2ln25uylQlw1CQXK0ZCzkdaZlCc+x2awIoCzQp2W4yn
         xUm2Au/ByZEpEY/cMMUp0845QAbeByU8GMpkKJ69z6iO10+k+slYFDexeSkAf8JAzxR+
         0mMBGLoIjmEqg/AJC1oivv0IdwFMoVnQqkLYe8B9fCe/fFlTMVRcNWwFAZQNaqYu1wfF
         CFeMtNwkhnscM9t25q4s9SVjcPaXYCZBygOi2OF7MaOFhDliGr5jiVqOYs/TqrFNyTJ3
         NnSw==
X-Gm-Message-State: APjAAAVb7wQ14zluJ/HimI+8LbNhofLJW1egBLKk5QT10joWSj3iTMo9
        dpVq1IHZ9hKP1hDqUXiuXQo=
X-Google-Smtp-Source: APXvYqz0gH833YbhVFROvsGuASqu7kuQq2cSTcdMc6e6Ku7AG2rW5qdKkUuR2ejBlQK5LJFZIyPq2g==
X-Received: by 2002:a5d:6b0a:: with SMTP id v10mr15060341wrw.32.1572715765835;
        Sat, 02 Nov 2019 10:29:25 -0700 (PDT)
Received: from morpheus.home.roving-it.com (2.e.6.5.c.a.a.1.a.8.0.3.1.e.3.c.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:c3e1:308a:1aac:56e2])
        by smtp.googlemail.com with ESMTPSA id a17sm10652954wmb.8.2019.11.02.10.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 10:29:24 -0700 (PDT)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: tegra: Jetson TX2: Allow bootloader to configure Ethernet MAC
Date:   Sat,  2 Nov 2019 17:29:17 +0000
Message-Id: <20191102172917.27310-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add an ethernet alias so that a stable MAC address is added to the
device tree for the wired ethernet interface.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 5e18acf5cfad..947744d0f04c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -8,6 +8,7 @@
 	compatible = "nvidia,p3310", "nvidia,tegra186";
 
 	aliases {
+		ethernet0 = "/ethernet@2490000";
 		sdhci0 = "/sdhci@3460000";
 		sdhci1 = "/sdhci@3400000";
 		serial0 = &uarta;
-- 
2.23.0

