Return-Path: <SRS0=uboK=3Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B452C352A2
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Feb 2020 13:07:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BFFB217BA
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Feb 2020 13:07:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbgBENHn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 5 Feb 2020 08:07:43 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:21470 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726386AbgBENHn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 5 Feb 2020 08:07:43 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Feb 2020 18:36:56 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
  by ironmsg01-blr.qualcomm.com with ESMTP; 05 Feb 2020 18:36:41 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id 232D02770; Wed,  5 Feb 2020 18:36:40 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>, robdclark@gmail.com,
        seanpaul@chromium.org, sean@poorly.run
Subject: [PATCHv3 0/2] Add support for rm69299 Visionox panel driver and add devicetree bindings for visionox panel
Date:   Wed,  5 Feb 2020 18:36:28 +0530
Message-Id: <1580907990-32108-1-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adding support for visionox rm69299 panel driver and adding bindings for the same panel.

Harigovindan P (2):
  dt-bindings: display: add visionox rm69299 panel variant
  drm/panel: add support for rm69299 visionox panel driver

 .../bindings/display/visionox,rm69299.yaml         | 109 ++++++
 drivers/gpu/drm/panel/Kconfig                      |   8 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     | 371 +++++++++++++++++++++
 4 files changed, 489 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/visionox,rm69299.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c

-- 
2.7.4

