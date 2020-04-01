Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49389C2D0F2
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 00:31:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BD16208FE
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 00:31:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="S20tp+zr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729514AbgDAAbQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 20:31:16 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:51834 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731331AbgDAAbQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 31 Mar 2020 20:31:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585701075; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jKs23a+KxYOIlOtupnaTWCe1cd9luMMtAARYPo2luxQ=; b=S20tp+zr0P3OTviX+YE66z21/9Uj33p5uHb1p8rmLQZ9sAb6STKV+Kt6HrnfNKNcgrtnhwNA
 4A9yk4OEjePkPThvUhLbKx1wwqihVs57Ggx5bO/n2lO8P+p7m9/U4jSW0NZOAq06IY0EHqh1
 4plJd+0S1wjhrnSOu+ImL7zdZxQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e83e0c9.7f283214eb90-smtp-out-n01;
 Wed, 01 Apr 2020 00:31:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0BFFDC4478C; Wed,  1 Apr 2020 00:31:04 +0000 (UTC)
Received: from displaysanity13-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: varar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A5AC6C433F2;
        Wed,  1 Apr 2020 00:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A5AC6C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tanmay@codeaurora.org
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, seanpaul@chromium.org,
        swboyd@chromium.org
Cc:     Tanmay Shah <tanmay@codeaurora.org>, robdclark@gmail.com,
        abhinavk@codeaurora.org, nganji@codeaurora.org,
        jsanka@codeaurora.org, aravindh@codeaurora.org,
        hoegsberg@google.com, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [DPU PATCH v5 0/5] Add support for DisplayPort driver on SnapDragon. 
Date:   Tue, 31 Mar 2020 17:30:26 -0700
Message-Id: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

These patches add support for Display-Port driver on SnapDragon 845 hardware. It adds
DP driver and DP PLL driver files along with the needed device-tree bindings.

The block diagram of DP driver is shown below:


                 +-------------+
                 |DRM FRAMEWORK|
                 +------+------+
                        |
                   +----v----+
                   | DP DRM  |
                   +----+----+
                        |
                   +----v----+
     +------------+|   DP    +----------++------+
     +             | DISPLAY |+---+      |      |
     |             +-+-----+-+    |      |      |
     |               |     |      |      |      |
     |               |     |      |      |      |
     |               |     |      |      |      |
     v               v     v      v      v      v
 +------+          +---+ +----+ +----+ +---+ +-----+
 |  DP  |          |DP | | DP | | DP | |DP | | DP  |
 |PARSER|          |AUX| |LINK| |CTRL| |PHY| |POWER|
 +--+---+          +---+ +----+ +--+-+ +-+-+ +-----+
    |                              |     |
 +--v---+                         +v-----v+
 |DEVICE|                         |  DP   |
 | TREE |                         |CATALOG|
 +------+                         +---+---+
                                      |
                                  +---v----+
                                  |CTRL/PHY|
                                  |   HW   |
                                  +--------+


These patches have dependency on clock driver changes mentioned below:
https://patchwork.kernel.org/patch/10632753/ 
https://patchwork.kernel.org/patch/10632757/

Chandan Uddaraju (4):
  dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
  drm: add constant N value in helper file
  drm/msm/dp: add displayPort driver support
  drm/msm/dp: add support for DP PLL driver

Jeykumar Sankaran (1):
  drm/msm/dpu: add display port support in DPU

 .../devicetree/bindings/display/msm/dp-sc7180.yaml |  325 ++++
 .../devicetree/bindings/display/msm/dpu.txt        |   16 +-
 drivers/gpu/drm/i915/display/intel_display.c       |    2 +-
 drivers/gpu/drm/msm/Kconfig                        |   21 +
 drivers/gpu/drm/msm/Makefile                       |   16 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   28 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |    8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   65 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    |  531 ++++++
 drivers/gpu/drm/msm/dp/dp_aux.h                    |   35 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  988 +++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   86 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 1707 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   35 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  943 +++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h                |   31 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  170 ++
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   19 +
 drivers/gpu/drm/msm/dp/dp_hpd.c                    |   69 +
 drivers/gpu/drm/msm/dp/dp_hpd.h                    |   79 +
 drivers/gpu/drm/msm/dp/dp_link.c                   | 1216 ++++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.h                   |  132 ++
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  490 ++++++
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   95 ++
 drivers/gpu/drm/msm/dp/dp_parser.c                 |  473 ++++++
 drivers/gpu/drm/msm/dp/dp_parser.h                 |  220 +++
 drivers/gpu/drm/msm/dp/dp_power.c                  |  545 +++++++
 drivers/gpu/drm/msm/dp/dp_power.h                  |  115 ++
 drivers/gpu/drm/msm/dp/dp_reg.h                    |  489 ++++++
 drivers/gpu/drm/msm/dp/pll/dp_pll.c                |  127 ++
 drivers/gpu/drm/msm/dp/pll/dp_pll.h                |   57 +
 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c           |  401 +++++
 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h           |   86 +
 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c      |  524 ++++++
 drivers/gpu/drm/msm/msm_drv.c                      |    2 +
 drivers/gpu/drm/msm/msm_drv.h                      |   53 +-
 include/drm/drm_dp_helper.h                        |    2 +
 37 files changed, 10178 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
 create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_display.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_display.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_link.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_link.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_reg.h
 create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.c
 create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.h
 create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
 create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h
 create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c

-- 
1.9.1
