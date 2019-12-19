Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC44C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 10:12:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9135224650
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 10:12:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IuUMWbuI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfLSKMC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 05:12:02 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34746 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfLSKMC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 05:12:02 -0500
Received: by mail-wm1-f65.google.com with SMTP id f4so6656389wmj.1
        for <devicetree@vger.kernel.org>; Thu, 19 Dec 2019 02:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s2vukPTY6TMIDnDN5oMJx3TVhD6ZcioJVJfMMNPJQ1g=;
        b=IuUMWbuIj8EKKGMPBmldpeqYAhBnnwPMu0MkViF4+qedXpY4EI4FLAAjCpRB2gR+HY
         hx7By2u7A/KZC/awj3zXgQ03nJx2J13BVSZGngujEu5HvOCHhL+5bY7JBSGFBkkizK8u
         XLXM5+mzEFZjq/WXIbjV3ig7hLy/W46nGM9RXdx4dq4zj1CGrS6+uVwpWZBtfSF0CU51
         nnza2fJaxy5+1MgVyZFJm1yAbpob58J70QpBR1Miy5pFNBwu6k8nOfIJWuHcLu/CLgyl
         uSrLB34wy+jQv/EeMb/By1k27+5W/qccfyZ5IPYKaPpFhuT5JDQi/RXr29mmztXBudCo
         ePOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s2vukPTY6TMIDnDN5oMJx3TVhD6ZcioJVJfMMNPJQ1g=;
        b=XLL/bpL3k4F1IGyjPbvuVOezeduFCOwu1Q63p3X9X47rKqWigTkJGDvePpmIqkGyMN
         9Uhg7iWodMuHSEVWOiLvOgT14Y/l/tYcuRi2dSpKdJD7N4e2Cax7gREFOE3ItTFkKZCO
         TR+W/SiaJizCGBpGAAkEooUHXUf8tayvPTu1zXx+U+KyhPjWBLgIVZltofjHBkaatsLx
         /XPvTsIMaTpvDETO+OSHY/Q0sd1Lkx2TDozleaa8CuOLEg7Vjz+lX0JhUQZleYfVBBf4
         YIY4dokARDT+lKX20pcWY6mUnIY9dLoZzbTAk/o9QhV4mfpY2Gwgq5j1cesSyLuVDwc7
         rxsA==
X-Gm-Message-State: APjAAAU7DBfLXlNPpjB6oOU4JalYESs6ShmuNIl1AZHzMd6qLOxIKoCO
        4BDZsD0lr3m2Z1odwXHT+jxxfA==
X-Google-Smtp-Source: APXvYqwisIuwmRbJpVaj6J4WVHhyVjB3ZoBC8TtfIYr9jR+zDOH8/LORXB6QMRAWv3TZZwRgwUuLEw==
X-Received: by 2002:a05:600c:24ca:: with SMTP id 10mr8728096wmu.4.1576750319558;
        Thu, 19 Dec 2019 02:11:59 -0800 (PST)
Received: from bender.baylibre.local (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
        by smtp.gmail.com with ESMTPSA id o4sm5750059wrx.25.2019.12.19.02.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 02:11:59 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chris Healy <cphealy@gmail.com>, devicetree@vger.kernel.org,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Herring <robh+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v5 0/4] drm: Add support for bus-format negotiation
Date:   Thu, 19 Dec 2019 11:11:47 +0100
Message-Id: <20191219101151.28039-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
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

Already applied patch from v4 were removed.
No Major changes in this v5, I addressed the slight changed requested
by Laurent on the patch 1. Note that this version only contains core changes.
Once those changes are merged I'll send the imx/panel/lvds-codec specific bits.

A more detailed changelog is provided in each patch.

This patch series is also available here [1].

Thanks,

~Boris~ Neil

[1] https://github.com/superna9999/linux/commits/drm-bridge-busfmt-v5

Boris Brezillon (4):
  drm/bridge: Add a drm_bridge_state object
  drm/bridge: Patch atomic hooks to take a drm_bridge_state
  drm/bridge: Add an ->atomic_check() hook
  drm/bridge: Add the necessary bits to support bus format negotiation

 .../drm/bridge/analogix/analogix_dp_core.c    |  41 +-
 drivers/gpu/drm/drm_atomic.c                  |  39 ++
 drivers/gpu/drm/drm_atomic_helper.c           |  32 +-
 drivers/gpu/drm/drm_bridge.c                  | 557 +++++++++++++++++-
 include/drm/drm_atomic.h                      |   3 +
 include/drm/drm_bridge.h                      | 281 ++++++++-
 6 files changed, 907 insertions(+), 46 deletions(-)

-- 
2.22.0

