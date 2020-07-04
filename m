Return-Path: <SRS0=KrzM=AP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF0ECC433DF
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 16:14:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9F6D20747
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 16:14:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgGDQOi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jul 2020 12:14:38 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:48408 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726669AbgGDQOi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jul 2020 12:14:38 -0400
X-Halon-ID: 9b44e85e-be10-11ea-933e-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 9b44e85e-be10-11ea-933e-005056917a89;
        Sat, 04 Jul 2020 18:08:34 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] MAINTAINERS: Add ADV7180 bindings documentation
Date:   Sat,  4 Jul 2020 18:06:44 +0200
Message-Id: <20200704160644.3040636-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200704160644.3040636-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200704160644.3040636-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the YAML dt-bindings document for ADV7180.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 496fd4eafb68cccc..9f1902fb961d8ad3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1073,6 +1073,7 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 W:	http://ez.analog.com/community/linux-device-drivers
 F:	drivers/media/i2c/adv7180.c
+F:	Documentation/devicetree/bindings/media/i2c/adv7180.yaml
 
 ANALOG DEVICES INC ADV748X DRIVER
 M:	Kieran Bingham <kieran.bingham@ideasonboard.com>
-- 
2.27.0

