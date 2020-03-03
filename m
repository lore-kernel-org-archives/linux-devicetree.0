Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3797BC3F2D7
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 09:45:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C5F12166E
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 09:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbgCCJp3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 04:45:29 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:52706 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727826AbgCCJp3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 04:45:29 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id 9llT2200b5USYZQ01llTh7; Tue, 03 Mar 2020 10:45:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j947D-0006hz-Ro; Tue, 03 Mar 2020 10:45:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j947D-00062j-QM; Tue, 03 Mar 2020 10:45:27 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/2] spi: dt-bindings: spi-controller: Fix spi-[rt]x-bus-width for slave mode
Date:   Tue,  3 Mar 2020 10:45:22 +0100
Message-Id: <20200303094522.23180-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303094522.23180-1-geert+renesas@glider.be>
References: <20200303094522.23180-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The descriptions for the spi-rx-bus-width and spi-tx-bus-width
properties refer to "MISO" and "MOSI", which are not explained in the
document.  While these abbreviations are fairly common when talking
about SPI, and thus may not need an explanation, they are not entirely
correct in this context, as the SPI controller may be used in slave mode
instead of master mode.

Fix this by replacing them by "read transfers" resp. "write transfers",
like is done for the spi-rx-delay-us and spi-tx-delay-us properties.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

This issue was present in the .txt version of the bindings, too, so
technically it needs
Fixes: a8830cb19cfea04e ("spi: Document DT bindings for SPI controllers in slave mode")
but of course it won't apply to that version.
---
 Documentation/devicetree/bindings/spi/spi-controller.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
index 401d41a97562dc8d..a07819f4efeb9dfe 100644
--- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
@@ -126,7 +126,7 @@ patternProperties:
           - enum: [ 1, 2, 4, 8 ]
           - default: 1
         description:
-          Bus width to the SPI bus used for MISO.
+          Bus width to the SPI bus used for read transfers.
 
       spi-rx-delay-us:
         description:
@@ -138,7 +138,7 @@ patternProperties:
           - enum: [ 1, 2, 4, 8 ]
           - default: 1
         description:
-          Bus width to the SPI bus used for MOSI.
+          Bus width to the SPI bus used for write transfers.
 
       spi-tx-delay-us:
         description:
-- 
2.17.1

