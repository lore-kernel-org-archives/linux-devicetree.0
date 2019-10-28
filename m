Return-Path: <SRS0=uucL=YV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2257ECA9EC6
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 06:07:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8855222C2
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 06:07:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731786AbfJ1GHc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 28 Oct 2019 02:07:32 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:6876 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731716AbfJ1GHc (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 28 Oct 2019 02:07:32 -0400
X-IronPort-AV: E=Sophos;i="5.68,238,1569250800"; 
   d="scan'208";a="29966529"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Oct 2019 15:07:31 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F31DC41717D7;
        Mon, 28 Oct 2019 15:07:30 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, geert+renesas@glider.be
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/4] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add power-domains and resets properties
Date:   Mon, 28 Oct 2019 15:07:28 +0900
Message-Id: <1572242850-9073-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572242850-9073-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1572242850-9073-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds missing required properties of power-domains and resets.
Fortunately, no one has this device node for now, so that we don't
need to think of backward compatibility.

Fixes: 311accb64570 ("clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
index 5c1903f..bad876f 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
@@ -43,6 +43,9 @@ Required properties:
  - The USB_EXTAL clock pin must be "usb_extal"
  - The USB_XTAL clock pin must be "usb_xtal"
 - #clock-cells: Must be 0
+- power-domains: A phandle and symbolic PM domain specifier.
+                 See power/renesas,rcar-sysc.txt.
+- resets: A list of phandles and specifier pairs.
 
 Example (R-Car H3):
 
@@ -54,4 +57,6 @@ Example (R-Car H3):
 			 <&usb_extal>, <&usb_xtal>;
 		clock-names = "ehci_ohci", "hs-usb-if", "usb_extal", "usb_xtal";
 		#clock-cells = <0>;
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>>;
+		resets = <&cpg 703>, <&cpg 704>;
 	};
-- 
2.7.4

