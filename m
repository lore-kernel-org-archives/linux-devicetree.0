Return-Path: <SRS0=OVGR=BU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EDCC433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Aug 2020 15:42:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F4FE2080C
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Aug 2020 15:42:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgHJPW3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Aug 2020 11:22:29 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:5536 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727801AbgHJPW2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 10 Aug 2020 11:22:28 -0400
X-IronPort-AV: E=Sophos;i="5.75,457,1589209200"; 
   d="scan'208";a="54088449"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Aug 2020 00:22:27 +0900
Received: from localhost.localdomain (unknown [172.29.52.120])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 539274001958;
        Tue, 11 Aug 2020 00:22:23 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/3] Add optional regulator support for LVDS codec.
Date:   Mon, 10 Aug 2020 16:22:16 +0100
Message-Id: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch series add support for enabling optional regulator for LVDS
codec bridge driver that may be used as VCC source.

Ref:https://patchwork.kernel.org/patch/11705819/

Biju Das (3):
  dt-bindings: display: bridge: lvds-codec: Document vcc-supply property
  drm/bridge: lvds-codec: Add support for regulator
  ARM: dts: iwg20d-q7-common: Fix touch controller probe failure

 .../bindings/display/bridge/lvds-codec.yaml   |  3 ++
 arch/arm/boot/dts/iwg20d-q7-common.dtsi       | 14 +++++++++
 drivers/gpu/drm/bridge/lvds-codec.c           | 29 +++++++++++++++++++
 3 files changed, 46 insertions(+)

-- 
2.17.1

