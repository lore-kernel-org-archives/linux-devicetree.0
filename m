Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FA8C34349
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:40:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 789AA247F0
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbfLMSK7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 13:10:59 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:52391 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728599AbfLMSK7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 13:10:59 -0500
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id F2189200009;
        Fri, 13 Dec 2019 18:10:52 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        <linux-rockchip@lists.infradead.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Sandy Huang <hjc@rock-chips.com>
Cc:     <linux-arm-kernel@lists.infradead.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 00/12] Add PX30 LVDS support
Date:   Fri, 13 Dec 2019 19:10:39 +0100
Message-Id: <20191213181051.25983-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

This series aims at supporting LVDS on PX30.

A first couple of patches update the documentation with the new
compatible and the presence of a PHY. Then, the existing Rockchip
driver is cleaned and extended to support PX30 specificities. Finally,
the PX30 DTSI is updated with CRTC routes, the DSI DPHY and the LVDS
IP itself.

Cheers,
Miquèl

Miquel Raynal (12):
  dt-bindings: display: rockchip-lvds: Declare PX30 compatible
  dt-bindings: display: rockchip-lvds: Document PX30 PHY
  drm/rockchip: lvds: Fix indentation of a #define
  drm/rockchip: lvds: Harmonize function names
  drm/rockchip: lvds: Change platform data
  drm/rockchip: lvds: Create an RK3288 specific probe function
  drm/rockchip: lvds: Helpers should return decent values
  drm/rockchip: lvds: Pack functions together
  drm/rockchip: lvds: Add PX30 support
  arm64: dts: rockchip: Add PX30 CRTCs graph LVDS endpoints
  arm64: dts: rockchip: Add PX30 DSI DPHY
  arm64: dts: rockchip: Add PX30 LVDS

 .../display/rockchip/rockchip-lvds.txt        |   4 +
 arch/arm64/boot/dts/rockchip/px30.dtsi        |  58 ++
 drivers/gpu/drm/rockchip/rockchip_lvds.c      | 516 ++++++++++++------
 drivers/gpu/drm/rockchip/rockchip_lvds.h      |  19 +-
 4 files changed, 441 insertions(+), 156 deletions(-)

-- 
2.20.1

