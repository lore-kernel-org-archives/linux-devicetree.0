Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC35FCA9EB6
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 952B42084C
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406859AbfJWPpT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 11:45:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37642 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404032AbfJWPpT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 11:45:19 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2570D28F903;
        Wed, 23 Oct 2019 16:45:16 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robdclark@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v3 00/21] drm: Add support for bus-format negotiation
Date:   Wed, 23 Oct 2019 17:44:51 +0200
Message-Id: <20191023154512.9762-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch series aims at adding support for runtime bus-format
negotiation between all elements of the
'encoder -> bridges -> connector/display' section of the pipeline.

In order to support that, we need drm bridges to fully take part in the
atomic state validation process, which requires adding a
drm_bridge_state and a new drm_bridge_funcs.atomic_check() hook.
Once those basic building blocks are in place, we can add new hooks to
allow bus format negotiation (those are called just before
->atomic_check()). The bus format selection is done at runtime by
testing all possible combinations across the whole bridge chain until
one is reported to work.

Major changes since v2:
* Get rid of the dummy bridge embedded in drm_encoder and let encoder
  drivers provide their own bridge element
* Clarify APIs and improve the doc
* Propagate bus flags by default

Major changes since the RFC:

* Add a dummy bridge to the drm_encoder object so that vc4 and exynos
  DSI drivers can implement the pre_enable/post_disable hooks instead
  of manually setting encoder->bridge to NULL to control the
  enable/disable sequence. This change is also a first step towards
  drm_bridge/drm_encoder unification. New encoder drivers should
  stop implementing drm_encoder_helper_funcs and switch to
  drm_bridge_funcs. Existing drivers can be converted progressively
  (already have a branch where I started converting some of them [1])
* rework the bus format negotiation to give more control to bridge
  drivers in the selection process (driver can select at runtime which
  input bus format they support for a specific output bus format based
  on any information available in the connector, crtc and bridge state.

A more detailed changelog is provided in each patch.

This patch series is also available here [2].

Thanks,

Boris

[1]https://github.com/bbrezillon/linux-0day/commits/drm-encoder-bridge
[2]https://github.com/bbrezillon/linux-0day/commits/drm-bridge-busfmt-v3

*** BLURB HERE ***

Boris Brezillon (21):
  drm/vc4: Declare the DSI encoder as a bridge element
  drm/exynos: Don't reset bridge->next
  drm/exynos: Declare the DSI encoder as a bridge element
  drm/bridge: Rename bridge helpers targeting a bridge chain
  drm/bridge: Introduce drm_bridge_chain_get_next_bridge()
  drm: Stop accessing encoder->bridge directly
  drm/bridge: Make the bridge chain a double-linked list
  drm/bridge: Add the drm_for_each_bridge_in_chain() helper
  drm/bridge: Add a drm_bridge_state object
  drm/bridge: Clarify the atomic enable/disable hooks semantics
  drm/bridge: Patch atomic hooks to take a drm_bridge_state
  drm/bridge: Add an ->atomic_check() hook
  drm/bridge: Add the drm_bridge_chain_get_prev_bridge() helper
  drm/bridge: Add the necessary bits to support bus format negotiation
  drm/imx: pd: Use bus format/flags provided by the bridge when
    available
  drm/bridge: lvds-encoder: Implement basic bus format negotiation
  dt-bindings: display: bridge: lvds-transmitter: Add new props
  drm/bridge: panel: Propage bus format/flags
  drm/panel: simple: Add support for Toshiba LTA089AC29000 panel
  dt-bindings: display: panel: Add the LTA089AC29000 variant
  ARM: dts: imx: imx51-zii-rdu1: Fix the display pipeline definition

 .../display/bridge/lvds-transmitter.txt       |  13 +
 .../display/panel/toshiba,lt089ac29000.txt    |   5 +-
 arch/arm/boot/dts/imx51-zii-rdu1.dts          |  24 +-
 .../drm/bridge/analogix/analogix_dp_core.c    |  12 +-
 drivers/gpu/drm/bridge/lvds-encoder.c         |  72 ++
 drivers/gpu/drm/bridge/panel.c                |   1 +
 drivers/gpu/drm/drm_atomic.c                  |  39 +
 drivers/gpu/drm/drm_atomic_helper.c           |  54 +-
 drivers/gpu/drm/drm_bridge.c                  | 800 +++++++++++++++---
 drivers/gpu/drm/drm_encoder.c                 |  15 +-
 drivers/gpu/drm/drm_probe_helper.c            |   4 +-
 drivers/gpu/drm/exynos/exynos_dp.c            |   1 -
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  90 +-
 drivers/gpu/drm/imx/parallel-display.c        | 174 +++-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |   8 +-
 drivers/gpu/drm/msm/edp/edp_bridge.c          |  10 +-
 drivers/gpu/drm/omapdrm/omap_drv.c            |   4 +-
 drivers/gpu/drm/omapdrm/omap_encoder.c        |   3 +-
 drivers/gpu/drm/panel/panel-simple.c          |  36 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  11 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                 |  90 +-
 include/drm/drm_atomic.h                      |   3 +
 include/drm/drm_bridge.h                      | 396 ++++++++-
 include/drm/drm_encoder.h                     |   9 +-
 24 files changed, 1588 insertions(+), 286 deletions(-)

-- 
2.21.0

