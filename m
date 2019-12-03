Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0764C43141
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 14:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C14842146E
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 14:15:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbfLCOP3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 09:15:29 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58978 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfLCOP2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 09:15:28 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AD9532905DE;
        Tue,  3 Dec 2019 14:15:27 +0000 (GMT)
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
        devicetree@vger.kernel.org, Eric Anholt <eric@anholt.net>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 07/11] drm/bridge: Clarify the atomic enable/disable hooks semantics
Date:   Tue,  3 Dec 2019 15:15:11 +0100
Message-Id: <20191203141515.3597631-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203141515.3597631-1-boris.brezillon@collabora.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The [pre_]enable/[post_]disable hooks are passed the old atomic state.
Update the doc and rename the arguments to make it clear.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
Changes in v4:
* Drop the doc update (Laurent)
* Add Rbs

Changes in v3:
* New patch
---
 include/drm/drm_bridge.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index bfb0385163f1..d7d714023050 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -263,7 +263,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_pre_enable callback is optional.
 	 */
 	void (*atomic_pre_enable)(struct drm_bridge *bridge,
-				  struct drm_atomic_state *state);
+				  struct drm_atomic_state *old_state);
 
 	/**
 	 * @atomic_enable:
@@ -288,7 +288,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
-			      struct drm_atomic_state *state);
+			      struct drm_atomic_state *old_state);
 	/**
 	 * @atomic_disable:
 	 *
@@ -311,7 +311,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
-			       struct drm_atomic_state *state);
+			       struct drm_atomic_state *old_state);
 
 	/**
 	 * @atomic_post_disable:
@@ -337,7 +337,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_post_disable callback is optional.
 	 */
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
-				    struct drm_atomic_state *state);
+				    struct drm_atomic_state *old_state);
 };
 
 /**
-- 
2.23.0

