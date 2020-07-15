Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BBC4C433ED
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 12:45:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C12720578
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 12:45:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731145AbgGOMpb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 08:45:31 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:32769 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgGOMpb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 08:45:31 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D58AAC0010;
        Wed, 15 Jul 2020 12:45:27 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, dongchun.zhu@mediatek.com,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com
Subject: [PATCH v3 3/3] media: MAINTAINERS: ov5647: Replace maintainer
Date:   Wed, 15 Jul 2020 14:48:38 +0200
Message-Id: <20200715124838.84552-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715124838.84552-1-jacopo+renesas@jmondi.org>
References: <20200715124838.84552-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Since the current maintainer email address bounces back, replace
the entry and make myself and Dave Stevenson maintainers of the driver.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1742fa1a88cd..c74d25c58e1a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12607,7 +12607,8 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov5640.c
 
 OMNIVISION OV5647 SENSOR DRIVER
-M:	Luis Oliveira <lolivei@synopsys.com>
+M:	Jacopo Mondi <jacopo@jmondi.org>
+M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-- 
2.27.0

