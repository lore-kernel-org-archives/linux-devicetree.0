Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C9EC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 06:17:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E3C920760
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 06:17:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KLF43n6Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgGAGRd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 02:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726746AbgGAGRc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jul 2020 02:17:32 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7682AC03E979
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 23:17:32 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x8so8599004plm.10
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 23:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+2b3Z7NQ6qRs9z8ZOS0vUP5Nq/Ho83IjPcgqiODpIpU=;
        b=KLF43n6YjX7k+lO7rHanFyuYvQZTHQmNIfLgFRLSh4SKnwSmCkVrrc+kKK+gG6zmux
         0ju42j6/uSBblsn2HfS//VjuiXdLa3RWqFYU7RkpnDfBl8bHe4HePAEaYxHSx12mK7av
         8B0VPlSksuRGPhlGE/OQbC0SWh3ecS0lok+UI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+2b3Z7NQ6qRs9z8ZOS0vUP5Nq/Ho83IjPcgqiODpIpU=;
        b=anu7mcM7GVJZPj451F5D+W+Qz7xOcmF8YPLRBLome3IL4sxGvG2ovzdkyKmLAoZ7O/
         Zq2oS4CwVJzpUW2V/Rx/4xCQ/aZjn3LuKoJQFqk8gdCXOZK2fBTtJetxmSo/lO2xxBAI
         zyIaQiveXktRdPZ5Gy6tVHSB4TNbY9dhOv8JIjh2bDvquy1dmmlSBkk8yl7yZ+6uUSPS
         /A2f3+QeVfPvubTpRIlTrpbL0CPCn66klK3X5IhvvmyPTHRAS/0/FRGek3dUHCxYgjBF
         KkD8LAf3hrq4Hivtxn6/6Iv43W5wyeCshU678bu9VIdB4Klv7sMlJLx8QWc7dl3d/aOY
         /LSQ==
X-Gm-Message-State: AOAM530P0pe84aEgH0qQ2hvKKRFxWVdAT71nvU3dOArJitI0VO7C4JOU
        D5aMXM6C2cBddVoxp3iOpTfAAQ==
X-Google-Smtp-Source: ABdhPJxVZQA2WNy1QJJpNvaiFwpRDdQJwpSy3Jecu9AjKd9A/PFzdOV1u40x4tVkEj4swGz/Y0TIuA==
X-Received: by 2002:a17:90a:658a:: with SMTP id k10mr16333877pjj.220.1593584251909;
        Tue, 30 Jun 2020 23:17:31 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:356d:fc3d:92ff:192e])
        by smtp.gmail.com with ESMTPSA id n189sm4555744pfn.108.2020.06.30.23.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 23:17:31 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Tom Cubie <tom@radxa.com>,
        Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 0/4] ARM: dts: rockchip: Radxa Rock Pi N8 initial support
Date:   Wed,  1 Jul 2020 11:47:13 +0530
Message-Id: <20200701061717.143753-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Rock Pi N8 is a Rockchip RK3288 based SBC, which has
- VMARC RK3288 SOM (as per SMARC standard) from Vamrs.
- Compatible carrier board from Radxa.

VMARC RK3288 SOM need to mount on top of dalang carrier
board for making Rock PI N8 SBC.

This series fixs few trivial changes related to properties 
moved into main carrier board dts and commit message rephrase. 

Changes for v2:
- add more trivial cleanups
- update commit message

Jagan Teki (4):
  arm64: dts: rockchip: Trivial cleanups for RockPI N10
  dt-bindings: arm: rockchip: Add Rock Pi N8 binding
  ARM: dts: rockchip: Add VMARC RK3288 SOM initial support
  ARM: dts: rockchip: Add Radxa Rock Pi N8 initial support

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/rk3288-rock-pi-n8.dts       |  17 ++
 arch/arm/boot/dts/rk3288-vmarc-som.dtsi       | 270 ++++++++++++++++++
 .../dts/rockchip-radxa-dalang-carrier.dtsi    |  58 +++-
 .../dts/rockchip/rk3399pro-rock-pi-n10.dts    |   2 +-
 .../dts/rockchip/rk3399pro-vmarc-som.dtsi     |  64 ++---
 7 files changed, 356 insertions(+), 62 deletions(-)
 create mode 100644 arch/arm/boot/dts/rk3288-rock-pi-n8.dts
 create mode 100644 arch/arm/boot/dts/rk3288-vmarc-som.dtsi

-- 
2.25.1

