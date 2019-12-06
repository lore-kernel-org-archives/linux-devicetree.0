Return-Path: <SRS0=B/fR=Z4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204FBC43603
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 15:29:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7B7824659
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 15:29:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="IlR/k7d4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfLFP3a (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Dec 2019 10:29:30 -0500
Received: from first.geanix.com ([116.203.34.67]:39562 "EHLO first.geanix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726250AbfLFP3a (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 6 Dec 2019 10:29:30 -0500
Received: from zen.localdomain (unknown [85.184.140.241])
        by first.geanix.com (Postfix) with ESMTPSA id BB7C238C;
        Fri,  6 Dec 2019 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
        t=1575646161; bh=ejGfGihfUphVPcy6zWEDcOLewkPn1AjQMYxSDLokwxo=;
        h=From:To:Cc:Subject:Date;
        b=IlR/k7d4nifkLbWZd2jcCFrdJgbCMyYI7/OIPqSyxIZ5Fbr6XXRhZQ7byoyV8Wdca
         9mz6Krzu/YXYyIAGI0axQ4bjC1nAiiTQP6taYi86d7wtUuA9XAZo3rxg42ctfJZjws
         3OyPDTk6yOB54IsOrkzAZPgj2CujGODiBAEcBZ3KATz96lCQY/p2DiApvmWGGYHPbo
         txEHLiM79VfUpvEm2KvfSrzaOixCLrOSxLFRU2nEbZatLhCdJlD8KwiPisaxdGuvhh
         CL277PyUTMFiDjZAuKrJ6yZ5JSY9hKOBC/Gx0N4r9D1q1IskB/lXxNsuSUF8D4rSen
         OWCpyh5U0Wt2w==
From:   Sean Nyekjaer <sean@geanix.com>
To:     mkl@pengutronix.de, dmurphy@ti.com, linux-can@vger.kernel.org,
        robh+dt@kernel.org
Cc:     Sean Nyekjaer <sean@geanix.com>, devicetree@vger.kernel.org,
        martin@geanix.com
Subject: [PATCH 1/2] net: m_can: tcan4x5x: add required delay after reset
Date:   Fri,  6 Dec 2019 16:29:22 +0100
Message-Id: <20191206152923.470980-1-sean@geanix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

According to section "8.3.8 RST Pin" in the datasheet we are required to
wait >700us after the device is reset.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 drivers/net/can/m_can/tcan4x5x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/can/m_can/tcan4x5x.c b/drivers/net/can/m_can/tcan4x5x.c
index 6e37c3fd87af..cb5fdb695ec9 100644
--- a/drivers/net/can/m_can/tcan4x5x.c
+++ b/drivers/net/can/m_can/tcan4x5x.c
@@ -367,6 +367,8 @@ static int tcan4x5x_parse_config(struct m_can_classdev *cdev)
 	if (IS_ERR(tcan4x5x->reset_gpio))
 		tcan4x5x->reset_gpio = NULL;
 
+	usleep_range(700, 1000);
+
 	tcan4x5x->device_state_gpio = devm_gpiod_get_optional(cdev->dev,
 							      "device-state",
 							      GPIOD_IN);
-- 
2.24.0

