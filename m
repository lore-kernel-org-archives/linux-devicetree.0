Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD71C33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 14:34:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 928E8207FD
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 14:34:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RbkbJELn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgAFOeR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 09:34:17 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43098 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgAFOeR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 09:34:17 -0500
Received: by mail-wr1-f68.google.com with SMTP id d16so49830592wre.10
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 06:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jfzLlWDHZs0nRWa1AeZZK3nWR8mwh2sShfYcCjkmm94=;
        b=RbkbJELnMcEHhnoLZ1B/KyaQGIx2adMgSiaZzTlbkYgLK8n4rp6Wvy6uJPOmk+t91o
         QXzCHGyMRKlQGf5R2wSJYl2S0AMmYrnKdRY3mWTr7XNUwLZk6+kb1U+6vO11PQvP+WTY
         /srb39lL98ZTqXHjGhOc9GqjdKN6z62OkH/fkACVYegLaO2GcS2/xjfPEEVmnMgQoEN+
         ucwFfbvG9PH0p2nJn/RGgQdmxgzaTPuMSiBGzY51cGfbWuq+L81Ca/vxKgpmnz9illel
         q80SnTMw6rkRCwCWJrHxCoCN3KGKwwKhuwVRGnav3rVzJdfyYTJ819QSZ92kPLipRJjc
         y8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jfzLlWDHZs0nRWa1AeZZK3nWR8mwh2sShfYcCjkmm94=;
        b=PyAl+l+zwDYJW9CIytm6TTWL3BS5RfkQYr2CLFKXClX2LUu4+tvtxEkFMwXmJ8XwN4
         /mpq0NxY8jO8pS2OE5mctKbF2D2vBEYQtqqjsm9MFusKOKUoZO+n3OqeC54tFgtZFnO3
         ta1uUFMg+ZvKIL+U798oqLNZZnNvkHQdT5h1AX7b+EgeIgwflDmYTxxM07W0RL16ntZP
         5cBAWRWl/2Sj4yupx7+JcrMDrfgL8+SyQgic9U9IwnZW+OP0ttVtSHOeRwnM7i2NmY6I
         velWI17GVxErXPRW1X14rmlhpQvZxlRF+srHt3j0e4bL+YHMUS8LfuOsklSAw7+DGNtj
         v23Q==
X-Gm-Message-State: APjAAAXH2wPnIjySdScp84SE3IAmYXdBU1Y5F0kjv9Ghi0BSbPTu52/Y
        YUZJkm3Sx/BOv9nU66Fi4EDz3A==
X-Google-Smtp-Source: APXvYqzh2B1Byd10zubAScJR0e/cluorIdCuDhuq66T46jQf9pzK3USjAoRAn1tPU+U+lRAwzUpS9g==
X-Received: by 2002:adf:f990:: with SMTP id f16mr106154548wrr.185.1578321254833;
        Mon, 06 Jan 2020 06:34:14 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id v17sm73297659wrt.91.2020.01.06.06.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 06:34:14 -0800 (PST)
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
Subject: [PATCH v6 0/4] drm: Add support for bus-format negotiation
Date:   Mon,  6 Jan 2020 15:34:05 +0100
Message-Id: <20200106143409.32321-1-narmstrong@baylibre.com>
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

No Major changes in this v6, I addressed the slight changed requested
by Boris from Laurent on the patch 1, and rebased on drm-misc-next. 
Note that this version only contains core changes.
Once those changes are merged I'll send the imx/panel/lvds-codec specific bits.

A more detailed changelog is provided in each patch.

This patch series is also available here [1].

Thanks,

~Boris~ Neil

[1] https://github.com/superna9999/linux/commits/drm-bridge-busfmt-v6

Boris Brezillon (4):
  drm/bridge: Add a drm_bridge_state object
  drm/bridge: Patch atomic hooks to take a drm_bridge_state
  drm/bridge: Add an ->atomic_check() hook
  drm/bridge: Add the necessary bits to support bus format negotiation

 .../drm/bridge/analogix/analogix_dp_core.c    |  41 +-
 drivers/gpu/drm/drm_atomic.c                  |  39 ++
 drivers/gpu/drm/drm_atomic_helper.c           |  32 +-
 drivers/gpu/drm/drm_bridge.c                  | 527 +++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |   5 +-
 include/drm/drm_atomic.h                      |   3 +
 include/drm/drm_bridge.h                      | 275 ++++++++-
 7 files changed, 874 insertions(+), 48 deletions(-)

-- 
2.22.0

