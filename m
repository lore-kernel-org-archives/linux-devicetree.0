Return-Path: <SRS0=VXX5=B5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02670C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 09:21:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9F2B20639
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 09:21:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgHSJVL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 05:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbgHSJVI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Aug 2020 05:21:08 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8460C061757
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2020 02:21:07 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id HMLz2300s4C55Sk06MLz5z; Wed, 19 Aug 2020 11:20:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8KHD-0007pe-JS; Wed, 19 Aug 2020 11:20:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8KHD-0000Pm-HT; Wed, 19 Aug 2020 11:20:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: vendor-prefixes: Remove trailing whitespace
Date:   Wed, 19 Aug 2020 11:20:58 +0200
Message-Id: <20200819092058.1526-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Fixes: f516fb704d02fff2 ("dt-bindings: Whitespace clean-ups in schema files")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2baee2c817c1a107..63996ab03521741b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -993,7 +993,7 @@ patternProperties:
   "^sst,.*":
     description: Silicon Storage Technology, Inc.
   "^sstar,.*":
-    description: Xiamen Xingchen(SigmaStar) Technology Co., Ltd. 
+    description: Xiamen Xingchen(SigmaStar) Technology Co., Ltd.
       (formerly part of MStar Semiconductor, Inc.)
   "^st,.*":
     description: STMicroelectronics
-- 
2.17.1

