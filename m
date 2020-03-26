Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6843C2D0E7
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 05:30:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B9CE20838
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 05:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgCZFaR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 01:30:17 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:32667 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725819AbgCZFaR (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 26 Mar 2020 01:30:17 -0400
X-IronPort-AV: E=Sophos;i="5.72,307,1580742000"; 
   d="scan'208";a="42669449"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Mar 2020 14:30:16 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 81E0A4009BE4;
        Thu, 26 Mar 2020 14:30:16 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] dt-bindings: clock: renesas,rcar-usb2-clock-sel: add r8a77961 support
Date:   Thu, 26 Mar 2020 14:30:08 +0900
Message-Id: <1585200608-30103-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds support for r8a77961 (R-Car M3-W+).

To avoid confusion between R-Car M3-W (R8A77960) and R-Car M3-W+
(R8A77961), this patch also updates the comment of
"renesas,r8a7796-rcar-usb2-clock-sel".

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Changes from v1:
 - Update the comment of "renesas,r8a7796-rcar-usb2-clock-sel" for r8a77960.
 - Add Reviewed-by.
 https://patchwork.kernel.org/patch/11457021/


 .../devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
index 4bf6f53..da92f57 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
@@ -27,7 +27,9 @@ Required properties:
 - compatible: "renesas,r8a7795-rcar-usb2-clock-sel" if the device is a part of
 	      an R8A7795 SoC.
 	      "renesas,r8a7796-rcar-usb2-clock-sel" if the device if a part of
-	      an R8A7796 SoC.
+	      an R8A77960 SoC.
+	      "renesas,r8a77961-rcar-usb2-clock-sel" if the device if a part of
+	      an R8A77961 SoC.
 	      "renesas,rcar-gen3-usb2-clock-sel" for a generic R-Car Gen3
 	      compatible device.
 
-- 
2.7.4

