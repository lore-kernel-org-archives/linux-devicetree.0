Return-Path: <SRS0=VXX5=B5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6249BC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 12:40:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48F4720738
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 12:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgHSMkI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 08:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727926AbgHSMkH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Aug 2020 08:40:07 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6945FC061757
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2020 05:40:07 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id HQg52300i4C55Sk06Qg5Wn; Wed, 19 Aug 2020 14:40:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8NNt-0002M7-Md; Wed, 19 Aug 2020 14:40:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8NNt-00058v-L8; Wed, 19 Aug 2020 14:40:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: mtd: spi-nor: Sort list of support chip names
Date:   Wed, 19 Aug 2020 14:40:04 +0200
Message-Id: <20200819124004.19728-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Sort the list of supported chip names, using "sort -V", to take into
account both names and numbers.

This makes it easier to read and maintain the list.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/mtd/jedec,spi-nor.txt | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index f03be904d3c228d8..654d4a2d2ba26630 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@ -13,12 +13,18 @@ Required properties:
                  at25df321a
                  at25df641
                  at26df081a
-                 mr25h128
-                 mr25h256
+                 m25p16
+                 m25p32
+                 m25p40
+                 m25p64
+                 m25p80
+                 m25p128
                  mr25h10
                  mr25h40
-                 mx25l4005a
+                 mr25h128
+                 mr25h256
                  mx25l1606e
+                 mx25l4005a
                  mx25l6405d
                  mx25l12805d
                  mx25l25635e
@@ -26,38 +32,32 @@ Required properties:
                  n25q128a11
                  n25q128a13
                  n25q512a
+                 s25fl008k
+                 s25fl064k
                  s25fl256s1
                  s25fl512s
                  s25sl12801
-                 s25fl008k
-                 s25fl064k
                  sst25vf040b
-                 m25p40
-                 m25p80
-                 m25p16
-                 m25p32
-                 m25p64
-                 m25p128
-                 w25x80
-                 w25x32
                  w25q32
-                 w25q64
                  w25q32dw
+                 w25q64
                  w25q80bl
                  w25q128
                  w25q256
+                 w25x32
+                 w25x80
 
                The following chip names have been used historically to
                designate quirky versions of flash chips that do not support the
                JEDEC READ ID opcode (0x9F):
                  m25p05-nonjedec
                  m25p10-nonjedec
-                 m25p20-nonjedec
-                 m25p40-nonjedec
-                 m25p80-nonjedec
                  m25p16-nonjedec
+                 m25p20-nonjedec
                  m25p32-nonjedec
+                 m25p40-nonjedec
                  m25p64-nonjedec
+                 m25p80-nonjedec
                  m25p128-nonjedec
 
 - reg : Chip-Select number
-- 
2.17.1

