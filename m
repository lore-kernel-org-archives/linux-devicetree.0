Return-Path: <SRS0=vke8=BF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD99C433E3
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jul 2020 00:20:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D016F2070C
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jul 2020 00:20:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgGZAU7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jul 2020 20:20:59 -0400
Received: from mars.blocktrron.ovh ([51.254.112.43]:33468 "EHLO
        mail.blocktrron.ovh" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbgGZAU7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Jul 2020 20:20:59 -0400
X-Greylist: delayed 574 seconds by postgrey-1.27 at vger.kernel.org; Sat, 25 Jul 2020 20:20:58 EDT
Received: from localhost.localdomain (p200300e53f2b5400ad03b3174e097e80.dip0.t-ipconnect.de [IPv6:2003:e5:3f2b:5400:ad03:b317:4e09:7e80])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.blocktrron.ovh (Postfix) with ESMTPSA id 17E281F0EA;
        Sun, 26 Jul 2020 02:11:22 +0200 (CEST)
From:   David Bauer <mail@david-bauer.net>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: Add doc for FriendlyARM NanoPi R2S
Date:   Sun, 26 Jul 2020 02:11:13 +0200
Message-Id: <20200726001113.153608-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add devicetree binding documentation for the FriendlyARM NanoPi R2S.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index d4a4045092df..b17931ec2d86 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -104,6 +104,11 @@ properties:
               - firefly,roc-rk3399-pc-mezzanine
           - const: rockchip,rk3399
 
+      - description: FriendlyARM NanoPi R2S
+        items:
+          - const: friendlyarm,nanopi-r2s
+          - const: rockchip,rk3328
+
       - description: FriendlyElec NanoPi4 series boards
         items:
           - enum:
-- 
2.27.0

