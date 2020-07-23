Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4887CC433E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 12:40:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 235DB20768
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 12:40:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LmYSOZz8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728692AbgGWMkL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 08:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728499AbgGWMkL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jul 2020 08:40:11 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABBF5C0619DC
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2020 05:40:10 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id a14so2961979pfi.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2020 05:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=78DNKewgvGuO7JtiEp9n0GA7+N0YVp1BKe8RGOkUB1k=;
        b=LmYSOZz8qGvkJMQRHPG7LEJeh47WCjGLbF91lOecvk8FRiv7selasyl6PIWrtrWSpZ
         cQpHU570FvQHZ2Q0L7ukehQRmac7dwZc0jwqKrqURBUd2OM6h9oMirl50ABJCkxTFDPm
         iYEMyyQHEkn0YigFUJ8Qbm9Lpk2QHiOUTjMZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=78DNKewgvGuO7JtiEp9n0GA7+N0YVp1BKe8RGOkUB1k=;
        b=Nn6beCJDUvmTqIc17bdTzBymoAXgdTtedzy9zJr/Q1RZAolnz9QeU1jLFgDbb1B0vR
         QXZ6aeLwtOQk4T8p/0QYmB01crF7CUGjs5//mBkpI7FaEJvYhgXTIVc367AfitfsIswa
         XQ9VDJJR7Snep2pTH/Ufyz42m1vPpskXV6/by/zR9LT8TGm6LArVCHxGuHf5zVMXp1uq
         AHKi6Q+2MhCjtg31SMUu9iR9cT5xfzSnrfjWCJjWwTC+qi8GsdXDrVeSTFBPcOSsffO0
         M7Q2auassg+8WkayBnRrT2l3V1Y99qVz5cuOGbyDNnP3SIAIb8aTPsOVqZ7GIJ3Ahig7
         GfRQ==
X-Gm-Message-State: AOAM5321G6dbBOvx2mjbsMKXR0CybO3G1rICE1uadHtnTcFjVEi20Mj3
        gfBVRQ65ncxSsJJD3U2yMIvcnA==
X-Google-Smtp-Source: ABdhPJzKQ8HIN0n3HwHsMov5IRd+jA9fucy3Zbi4FubPg+ZV8L0hq/Q4PpwulFt6FCsbldStufZUQA==
X-Received: by 2002:a63:e24d:: with SMTP id y13mr4089941pgj.248.1595508010141;
        Thu, 23 Jul 2020 05:40:10 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:cbf:ea0:8a30:a3af])
        by smtp.gmail.com with ESMTPSA id m26sm3051270pff.84.2020.07.23.05.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 05:40:09 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 0/7] arm64: dts: rockchip: Add Engicam PX30.Core
Date:   Thu, 23 Jul 2020 18:09:44 +0530
Message-Id: <20200723123951.149497-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

PX30.Core is an EDIMM SOM based on Rockchip PX30 from Engicam.
    
PX30.Core needs to mount on top of Engicam baseboards for creating
complete platform boards.
    
Possible baseboards are,
- EDIMM2.2 Starter Kit
- C.TOUCH 2.0 10.1" Open Frame

Note: These baseboards can be used for i.MX8 SOM's as well. So having
baseboard on respective SoC seems to be easy rather than making it
common across all.

Any inputs?
Jagan.

Jagan Teki (7):
  dt-bindings: arm: rockchip: Add Engicam PX30.Core EDIMM2.2 Starter Kit
  arm64: dts: rockchip: px30: Add Engicam EDIMM2.2 Starter Kit
  arm64: dts: rockchip: Add Engicam PX30.Core SOM
  arm64: dts: rockchip: Add Engicam PX30.Core EDIMM2.2 Starter Kit
  dt-bindings: arm: rockchip: Add Engicam PX30.Core C.TOUCH 2.0 10.1" OF
  arm64: dts: rockchip: px30: Add Engicam C.TOUCH 2.0 10.1" OF
  arm64: dts: rockchip: Add Engicam PX30.Core C.TOUCH 2.0 10.1" OF

 .../devicetree/bindings/arm/rockchip.yaml     |  12 +
 arch/arm64/boot/dts/rockchip/Makefile         |   2 +
 .../dts/rockchip/px30-engicam-common.dtsi     |  31 +++
 .../rockchip/px30-engicam-ctouch2-of10.dtsi   |   7 +
 .../dts/rockchip/px30-engicam-edimm2.2.dtsi   |   7 +
 .../rockchip/px30-px30-core-ctouch2-of10.dts  |  21 ++
 .../dts/rockchip/px30-px30-core-edimm2.2.dts  |  21 ++
 .../boot/dts/rockchip/px30-px30-core.dtsi     | 250 ++++++++++++++++++
 8 files changed, 351 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-engicam-common.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2-of10.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-engicam-edimm2.2.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-px30-core-ctouch2-of10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-px30-core-edimm2.2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-px30-core.dtsi

-- 
2.25.1

