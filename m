Return-Path: <SRS0=c2W6=4V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD83AC3F2DE
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 06:42:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A68B22146E
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 06:42:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgCDGmU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Mar 2020 01:42:20 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:13923 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726233AbgCDGmU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Mar 2020 01:42:20 -0500
X-IronPort-AV: E=Sophos;i="5.70,513,1574089200"; 
   d="scan'208";a="40717176"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Mar 2020 15:42:18 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6807841CBB7A;
        Wed,  4 Mar 2020 15:42:18 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 2/4] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add power-domains and resets properties
Date:   Wed,  4 Mar 2020 15:42:15 +0900
Message-Id: <1583304137-28482-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583304137-28482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1583304137-28482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds missing required properties of power-domains and resets.
Fortunately, no one has this device node for now, so that we don't
need to think of backward compatibility.

Fixes: 311accb64570 ("clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt    | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
index 5c1903f..353c77e 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
@@ -43,6 +43,12 @@ Required properties:
  - The USB_EXTAL clock pin must be "usb_extal"
  - The USB_XTAL clock pin must be "usb_xtal"
 - #clock-cells: Must be 0
+- power-domains: A phandle and symbolic PM domain specifier.
+                 See power/renesas,rcar-sysc.txt.
+- resets: A list of phandles and specifier pairs.
+- reset-names: Name of the resets.
+ - The reset of USB 2.0 host side must be "ehci_ohci"
+ - The reset of HS-USB side must be "hs-usb-if"
 
 Example (R-Car H3):
 
@@ -54,4 +60,7 @@ Example (R-Car H3):
 			 <&usb_extal>, <&usb_xtal>;
 		clock-names = "ehci_ohci", "hs-usb-if", "usb_extal", "usb_xtal";
 		#clock-cells = <0>;
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		resets = <&cpg 703>, <&cpg 704>;
+		reset-names = "ehci_ohci", "hs-usb-if";
 	};
-- 
2.7.4

