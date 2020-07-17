Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F8EC43466
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 13:26:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21BD420717
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 13:26:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgGQN0D (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 09:26:03 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:44149 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbgGQN0C (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jul 2020 09:26:02 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3E3841C0004;
        Fri, 17 Jul 2020 13:26:00 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 12/13] MAINTAINERS: ov5640: Add bindings file
Date:   Fri, 17 Jul 2020 15:28:58 +0200
Message-Id: <20200717132859.237120-13-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the newly introduced bindings file to the list of files
associated with the ov5640 driver in the MAINTAINERS file.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2730af1265ea..fc2a2129d18e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12604,6 +12604,7 @@ M:	Steve Longerbeam <slongerbeam@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ov5640.yaml
 F:	drivers/media/i2c/ov5640.c
 
 OMNIVISION OV5647 SENSOR DRIVER
-- 
2.27.0

