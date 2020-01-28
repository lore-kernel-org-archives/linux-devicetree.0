Return-Path: <SRS0=5/ta=3R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA02C3F68F
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 13:55:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C324124685
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 13:55:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgA1NzX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jan 2020 08:55:23 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45100 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbgA1NzX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jan 2020 08:55:23 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 00967294498;
        Tue, 28 Jan 2020 13:55:20 +0000 (GMT)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, intel-gfx-trybot@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v10 03/12] drm/bridge: analogix: Plug atomic state hooks to the default implementation
Date:   Tue, 28 Jan 2020 14:55:05 +0100
Message-Id: <20200128135514.108171-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200128135514.108171-1-boris.brezillon@collabora.com>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This is needed to pass a bridge state to all atomic hooks, if we don't
do that, the core can't duplicate/create bridge states.

v10:
* Add changelog to the commit message

v9:
* Add Neil's R-b
* Move earlier in the series

v8:
* No changes

v7:
* New patch

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6effe532f820..aaaec39ec2a7 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1563,6 +1563,9 @@ static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_pre_enable = analogix_dp_bridge_atomic_pre_enable,
 	.atomic_enable = analogix_dp_bridge_atomic_enable,
 	.atomic_disable = analogix_dp_bridge_atomic_disable,
-- 
2.24.1

