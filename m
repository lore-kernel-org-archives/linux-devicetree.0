Return-Path: <SRS0=vtFV=5K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC8CC54FD6
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Mar 2020 06:17:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F1982078E
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Mar 2020 06:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgCYGRJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 25 Mar 2020 02:17:09 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:34160 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725832AbgCYGRJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 25 Mar 2020 02:17:09 -0400
X-IronPort-AV: E=Sophos;i="5.72,303,1580742000"; 
   d="scan'208";a="42571444"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Mar 2020 15:17:07 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0EC304000FAF;
        Wed, 25 Mar 2020 15:17:07 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] dt-bindings: usb: usb-xhci: add r8a77961 support
Date:   Wed, 25 Mar 2020 15:16:44 +0900
Message-Id: <1585117006-8266-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585117006-8266-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1585117006-8266-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds support for r8a77961 (R-Car M3-W+).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index 3f37895..ce4162e 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -17,6 +17,7 @@ Required properties:
     - "renesas,xhci-r8a7793" for r8a7793 SoC
     - "renesas,xhci-r8a7795" for r8a7795 SoC
     - "renesas,xhci-r8a7796" for r8a7796 SoC
+    - "renesas,xhci-r8a77961" for r8a77961 SoC
     - "renesas,xhci-r8a77965" for r8a77965 SoC
     - "renesas,xhci-r8a77990" for r8a77990 SoC
     - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 or RZ/G1 compatible
-- 
2.7.4

