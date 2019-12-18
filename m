Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AABC43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 19:10:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56C2921D7D
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 19:10:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="S86ZB6KZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbfLRTK3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 14:10:29 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33936 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbfLRTK3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 14:10:29 -0500
Received: by mail-pl1-f196.google.com with SMTP id x17so1406101pln.1
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 11:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EuBd5H0Egt+eDY+fK/iuV4fphB2qstxtMKk6PdK6o5A=;
        b=S86ZB6KZWjzBWNer4WPm2X1LwRziSTHVHOQAcHfs+JFNZIdFhkw7JLb807hllDCYEy
         Hu6MigRzR6kEQQW6ZcMElMamn2hUOuhvHGRSY3E3rVhsd/AdBI32u9lqJJRK1y71MuQp
         ncwlCQBEFnBNd45zE4nJPZMklK8i2yW5fNy4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EuBd5H0Egt+eDY+fK/iuV4fphB2qstxtMKk6PdK6o5A=;
        b=J30aOg3WbOzTaPaibPcePua9wYLqR9RbkS8OiPTddZxKWMQZdAJiOc6Rd+hKTZGn2x
         y/HgpMBs7MzF7rHDIow0Z3jffpV1MEqlTGVlnD53ud9sDsKKm44WWilv3RRWolDZJcz4
         iHp0qYk4u6or/bWWJkwju6LmznWXryFXm3Lk9YDpl8AGlgbrat6YgxnWZ82ROSvsk2jO
         Jsa75YKWmeGuZZy8EKfIIaWqjNF2M9ZIopT8viJ175IVuUpiDC8j+xQ36Fr5ntfJmYi2
         80NUiIxOEbyzx4Pz67y3YEe5n+Q0DpgCfS7m1QpltJr8MZ3ACi6YlmEpqQkQP+ZXYK5W
         XQkg==
X-Gm-Message-State: APjAAAV2OkRTi6/wcyelUEI4fo2FeT3Vd/V4w2rDQ0fYG7tS/LF+2QlA
        oF+xQZ5OZHXOl+uM1LyCLKTdqg==
X-Google-Smtp-Source: APXvYqwU8uLra6sgkg2kZFnCJdBPd9PVO3B5cEcqJKnQ6ikq51O0B+PtJzugqG3VZX2O+nw+6dGAJQ==
X-Received: by 2002:a17:90a:e389:: with SMTP id b9mr4642793pjz.7.1576696227877;
        Wed, 18 Dec 2019 11:10:27 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:78ea:e014:edb4:e862])
        by smtp.gmail.com with ESMTPSA id q7sm3745855pjd.3.2019.12.18.11.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 11:10:27 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     michael@amarulasolutions.com, Icenowy Zheng <icenowy@aosc.io>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v13 0/7] drm/sun4i: Allwinner A64 MIPI-DSI support
Date:   Thu, 19 Dec 2019 00:40:10 +0530
Message-Id: <20191218191017.2895-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This is v13 version for Allwinner A64 MIPI-DSI support
and here is the previous version set[1]

Changes for v13:
- update dt-bindings for A64
- drop has_mod_clk variant
- use regmap bus clock properly
Changes for v12:
- use enum insted of oneOf+const
- handle bus clock using regmap attach clk
- tested on A64, A33 boards.
Changes for v11:
- fix dt-bindings for dphy
- fix dt-bindings for dsi controller
- add bus clock handling code
- tested on A64, A33 boards.
Changes for v10:
- updated dt-bindings as per .yaml format
- rebased on drm-misc/for-linux-next
Changes for v9:
- moved dsi fixes in separate series on top of A33
- rebase on linux-next
Changes for v8:
- rebased on drm-misc change along with linux-next
- reworked video start delay patch
- tested on 4 different dsi panels
- reworked commit messages
Changes for v7:
- moved vcc-dsi binding to required filed.
- drop quotes on fallback dphy bindings.
- drop min_rate clock pll-mipi patches.
- introduce dclk divider computation as like A64 BSP.
- add A64 DSI quark patches.
- fixed A64 DSI pipeline.
- add proper commit messages.
- collect Merlijn Wajer Tested-by credits.
Changes for v6:
- dropped unneeded changes, patches
- fixed all burst mode patches as per previous version comments
- rebase on master
- update proper commit message
- dropped unneeded comments
- order the patches that make review easy
Changes for v5:
- collect Rob, Acked-by
- droped "Fix VBP size calculation" patch
- updated vblk timing calculation.
- droped techstar, bananapi dsi panel drivers which may require
  bridge or other setup. it's under discussion.
Changes for v4:
- droppoed untested CCU_FEATURE_FIXED_POSTDIV check code in
  nkm min, max rate patches
- create two patches for "Add Allwinner A64 MIPI DSI support"
  one for has_mod_clk quirk and other one for A64 support
- use existing driver code construct for hblk computation
- dropped "Increase hfp packet overhead" patch [2], though BSP added
  this but we have no issues as of now.
  (no issues on panel side w/o this change)
- create separate function for vblk computation 
- enable vcc-dsi regulator in dsi_runtime_resume
- collect Rob, Acked-by
- update MAINTAINERS file for panel drivers
- cleanup commit messages
- fixed checkpatch warnings/errors

[1] https://patchwork.freedesktop.org/series/70361/

Any inputs?
Jagan.

Jagan Teki (7):
  dt-bindings: sun6i-dsi: Document A64 MIPI-DSI controller
  dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/ A31 fallback)
  drm/sun4i: dsi: Get the mod clock for A31
  drm/sun4i: dsi: Handle bus clock via regmap_mmio_attach_clk
  drm/sun4i: dsi: Add Allwinner A64 MIPI DSI support
  arm64: dts: allwinner: a64: Add MIPI DSI pipeline
  [DO NOT MERGE] arm64: dts: allwinner: bananapi-m64: Enable Bananapi S070WV20-CT16 DSI
    panel

 .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 33 ++++++++++-
 .../phy/allwinner,sun6i-a31-mipi-dphy.yaml    |  6 +-
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 31 +++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 37 +++++++++++++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        | 55 +++++++++++++++----
 5 files changed, 148 insertions(+), 14 deletions(-)

-- 
2.18.0.321.gffc6fa0e3

