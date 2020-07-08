Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED63FC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 06:36:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C85A02078A
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 06:36:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="N2FhsoIC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729658AbgGHGgm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 02:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgGHGgm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jul 2020 02:36:42 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6522BC08C5DC
        for <devicetree@vger.kernel.org>; Tue,  7 Jul 2020 23:36:41 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a14so14951363pfi.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2020 23:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IV3+uveO4NWQ+DzEhA8aJUinLEWctsxMHdF7wTb5EsU=;
        b=N2FhsoICJdMy7FvrW7irqCM5djNZYTzp5ZN2PuMmjGHtG/u/GIOXG8wdfg4sZ6I4Li
         0irBmCfAbuNGuLR6fd1S/M3kzh0QdCGN2/cYrxYsyeGUEan9+vZU6fk5EQiLBbhsZ/zE
         sddUxfGVpSxfTSHII2qjmiZR++iXoR/67soME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IV3+uveO4NWQ+DzEhA8aJUinLEWctsxMHdF7wTb5EsU=;
        b=GZBFnI8/GLpsMchiD4MwzAipM+9nBMwXz/zEz+JWJ5djWQugXHGGNy1HdQiAmz9mg9
         iEOpHD1nLWxjKSo5lOe6odKaJWpyJa1cNHGvrdFycLxZm5M2xAnKjZ4km25oiJiriko0
         z1D4dmlI9TxsYb4OH2JjyAuIjZEEY1yiLAYFQKVqYwDpWVwnqIZmr61Xj/s9s5wfWsXH
         4Kcc6C+yHSd9NCx5SLaNvMLcAfbA6SKy3dmJ7GLqHq4DoVI7K11A7zHvQg1KLOqPNd2O
         t2PO5qGvc2qCh3CGcakzOFl70BqR3s2M9Ko0xkSnVRrOl3WJ1UAgq3GLx5nQOJrZQmFx
         wZQA==
X-Gm-Message-State: AOAM532In7ee3wsIWPSG6Hre5xphOOp61WT8gDYDsx1FBBfQsOQ/nBpp
        bhGQ1awQ8KwBtElbwiT5ewo2NQ==
X-Google-Smtp-Source: ABdhPJyByhHKXVQ0vuN0I4Ok0LYHgprFA72fKsMPOHyOpv9xYFodg73sWexQTqunUCY12sbHAhyfmQ==
X-Received: by 2002:a63:1a16:: with SMTP id a22mr25024136pga.142.1594190200909;
        Tue, 07 Jul 2020 23:36:40 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:ade2:f5f3:8cc0:52f9])
        by smtp.gmail.com with ESMTPSA id c12sm24587898pfn.162.2020.07.07.23.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 23:36:40 -0700 (PDT)
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
Subject: [PATCH v4 0/4] ARM: dts: rockchip: Radxa Rock Pi N8 initial support
Date:   Wed,  8 Jul 2020 12:06:23 +0530
Message-Id: <20200708063627.8365-1-jagan@amarulasolutions.com>
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

This series moved i2c2 into rk3399pro dtsi and rest are 
similar to v3.

Changes for v4:
- move i2c2 from carrier board to rk3399pro dtsi
Changes for v3:
- move hym8563_int pin to rk3399pro dtsi
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
 .../dts/rockchip-radxa-dalang-carrier.dtsi    |  67 +++--
 .../dts/rockchip/rk3399pro-rock-pi-n10.dts    |   2 +-
 .../dts/rockchip/rk3399pro-vmarc-som.dtsi     |  98 ++++---
 7 files changed, 379 insertions(+), 82 deletions(-)
 create mode 100644 arch/arm/boot/dts/rk3288-rock-pi-n8.dts
 create mode 100644 arch/arm/boot/dts/rk3288-vmarc-som.dtsi

-- 
2.25.1

