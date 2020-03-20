Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA59C4332D
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 13:13:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33C7720722
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 13:13:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727221AbgCTNNK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 09:13:10 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54465 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbgCTNNK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Mar 2020 09:13:10 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jFHST-0001XK-5h; Fri, 20 Mar 2020 14:13:05 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Subject: [PATCH v6 4/4] media: MAINTAINERS: add myself to co-maintain Hantro G1/G2 for i.MX8MQ
Date:   Fri, 20 Mar 2020 14:12:56 +0100
Message-Id: <20200320131256.23294-5-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200320131256.23294-1-p.zabel@pengutronix.de>
References: <20200320131256.23294-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add path and co-maintainer entry for i.MX8MQ device tree bindings.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
New in v6.
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46c95dc8ab5f..2b8b3e7f3df3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14314,10 +14314,12 @@ F:	Documentation/devicetree/bindings/media/rockchip-rga.txt
 
 HANTRO VPU CODEC DRIVER
 M:	Ezequiel Garcia <ezequiel@collabora.com>
+M:	Philipp Zabel <p.zabel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 L:	linux-rockchip@lists.infradead.org
 S:	Maintained
 F:	drivers/staging/media/hantro/
+F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
 F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
 
 ROCKER DRIVER
-- 
2.20.1

