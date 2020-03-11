Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA4AC10F29
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 12:51:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F00CA2146E
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 12:51:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kQkT9Ezw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgCKMvv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 08:51:51 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56160 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729429AbgCKMvu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 08:51:50 -0400
Received: by mail-wm1-f66.google.com with SMTP id 6so1947129wmi.5
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 05:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pSjQ4E8m+1eJQtkq/G98lOplM8W5Ztx8OcIT9w8yzWE=;
        b=kQkT9EzwcJjSKnzy+NKeVejeHTj4PwXiL/sGNgNxD5ZaWR1Gl4dCKxja87SheHDQx8
         8ImI4VYg/nu2S/0ClrmWEnr6KQdwgfGkKdeJTWlsiUdtSndr+6MSPgLEEEkYReUq2I6Z
         ewMbunHmOqMd8boJ6bNii0vJ/3rk22U87HDVcTTNjcPquRyC9zgyzOpedudW+3mXbto3
         tTxmNB0bKRk1v3plqEL1e80H9WeG2y+c87mZ/NQgjm4/5xWWXoG9XwC6FQ7zuG0rjyux
         NHYjgZvKrZmraz7RY5iLoHN2kGtHKJDT1tII7t5pzU+PSHso8d885+MUdvpWMQYVox76
         GiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pSjQ4E8m+1eJQtkq/G98lOplM8W5Ztx8OcIT9w8yzWE=;
        b=De6qwTlK/LkaNEiZw+COt/LFgi0qw1L4jz9sesBITCHXk+uL1GCAMNpNYV2F8lJoXP
         xrxEbGhVIlLXohTwxym753dQ9jGXLL3nbAIVSM3/dqSR+SEGTVWDuP+Vij1Xqu8iv02Y
         AhrX3q7neHAe1edgFrv73g5AK+eJcLksGJ/qe1fBSfhJzqt7QOioPlm+1QneTXLy3yva
         5K1rm+Q9N/refw/KzKMRdKSr+SKeUwtRWh5/g959c+1cQTUowQ9y3Oh6GYO8HwtxizYd
         IuQ8NvsWU47ndPZtA7Oz0+sVLMTEOFCrL3kbiIAaAdUTZR159rg4/eOlgzc6mzbWMEx9
         yFPQ==
X-Gm-Message-State: ANhLgQ28ZTPiSBMdZIIuT3Sl8GHh6uP6Gv1TAG02Pj/GvDfw8qagJ+l/
        07wQKHxjKRN9ppXg2/uaBsbbCA==
X-Google-Smtp-Source: ADFU+vsqrlP7LpT3iV/tyxVYbgWkwmJe3brNDlGyKZHhOh2/BIESgTAtpdl5ra7zbk0yaBxY2Y4sVQ==
X-Received: by 2002:a1c:c906:: with SMTP id f6mr3806905wmb.16.1583931107436;
        Wed, 11 Mar 2020 05:51:47 -0700 (PDT)
Received: from robin.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o3sm8843538wme.36.2020.03.11.05.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 05:51:46 -0700 (PDT)
From:   Phong LE <ple@baylibre.com>
To:     narmstrong@baylibre.com, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, a.hajda@samsung.com
Cc:     Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, sam@ravnborg.org, mripard@kernel.org,
        heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
        stephan@gerhold.net, icenowy@aosc.io, broonie@kernel.org,
        mchehab+samsung@kernel.org, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        andriy.shevchenko@linux.intel.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] MAINTAINERS: add it66121 HDMI bridge driver entry
Date:   Wed, 11 Mar 2020 13:51:35 +0100
Message-Id: <20200311125135.30832-5-ple@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311125135.30832-1-ple@baylibre.com>
References: <20200311125135.30832-1-ple@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add Neil Armstrong and myself as maintainers

Signed-off-by: Phong LE <ple@baylibre.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 37c2963226d4..3d722d723686 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8977,6 +8977,14 @@ T:	git git://linuxtv.org/anttip/media_tree.git
 S:	Maintained
 F:	drivers/media/tuners/it913x*
 
+ITE IT66121 HDMI BRIDGE DRIVER
+M:	Phong LE <ple@baylibre.com>
+M:	Neil Armstrong <narmstrong@baylibre.com>
+S:	Maintained
+F:	drivers/gpu/drm/bridge/ite-it66121.c
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
+
 IVTV VIDEO4LINUX DRIVER
 M:	Andy Walls <awalls@md.metrocast.net>
 L:	linux-media@vger.kernel.org
-- 
2.17.1

