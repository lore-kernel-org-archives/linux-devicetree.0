Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E5DC433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 20:12:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7B1C2070B
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 20:12:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbgG1UMy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 16:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728475AbgG1UMy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 16:12:54 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD7FAC061794
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 13:12:53 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4BGSXM1547z1rt3q;
        Tue, 28 Jul 2020 22:12:51 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4BGSXM0fxCz1qrgD;
        Tue, 28 Jul 2020 22:12:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id H4tW1MWQu4GS; Tue, 28 Jul 2020 22:12:50 +0200 (CEST)
X-Auth-Info: tZ2E7ayQc5xagHRixlNC0K9EAJ917YdEV+9ak5rVtf0=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz [86.49.101.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 28 Jul 2020 22:12:50 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     dri-devel@lists.freedesktop.org
Cc:     Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: Add DT bindings for Chefree CH101OLHLWH-002
Date:   Tue, 28 Jul 2020 22:12:41 +0200
Message-Id: <20200728201242.4336-2-marex@denx.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728201242.4336-1-marex@denx.de>
References: <20200728201242.4336-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add DT bindings for Chefree CH101OLHLWH-002 10.1" 1280x800 LCD.
This panel is connected via LVDS.

Signed-off-by: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 5a0af2b80aba..47247ace86ac 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -87,6 +87,8 @@ properties:
       - cdtech,s070swv29hg-dc44
         # CDTech(H.K.) Electronics Limited 7" 800x480 color TFT-LCD panel
       - cdtech,s070wv95-ct16
+        # Chefree CH101OLHLWH-002 10.1" (1280x800) color TFT LCD panel
+      - chefree,ch101olhlwh-002
         # Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel
       - chunghwa,claa070wp03xg
         # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
-- 
2.27.0

