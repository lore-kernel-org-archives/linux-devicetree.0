Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E82ACA9EBC
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4006C2086D
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 15:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436469AbfJWPpa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 11:45:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37738 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436464AbfJWPpa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 11:45:30 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B6D2328F962;
        Wed, 23 Oct 2019 16:45:28 +0100 (BST)
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
Subject: [PATCH v3 13/21] drm/bridge: Add the drm_bridge_chain_get_prev_bridge() helper
Date:   Wed, 23 Oct 2019 17:45:04 +0200
Message-Id: <20191023154512.9762-14-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Will be useful for bridge drivers that want to do bus format
negotiation with their neighbours.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
* Inline drm_bridge_chain_get_prev_bridge()
* Fix the doc

Changes in v2:
* Fix the kerneldoc
* Drop the !bridge || !bridge->encoder check
---
 include/drm/drm_bridge.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 2beb1ef9a733..3fb518494640 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -526,6 +526,22 @@ drm_bridge_chain_get_next_bridge(struct drm_bridge *bridge)
 	return list_next_entry(bridge, chain_node);
 }
 
+/**
+ * drm_bridge_chain_get_prev_bridge() - Get the previous bridge in the chain
+ * @bridge: bridge object
+ *
+ * RETURNS:
+ * the previous bridge in the chain, or NULL if @bridge is the first.
+ */
+static inline struct drm_bridge *
+drm_bridge_chain_get_prev_bridge(struct drm_bridge *bridge)
+{
+	if (list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain))
+		return NULL;
+
+	return list_prev_entry(bridge, chain_node);
+}
+
 /**
  * drm_bridge_chain_get_first_bridge() - Get the first bridge in the chain
  * @encoder: encoder object
-- 
2.21.0

