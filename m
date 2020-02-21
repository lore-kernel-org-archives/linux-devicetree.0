Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15488C35647
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 12:21:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0B3424653
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 12:21:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgBUMVp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 07:21:45 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:46400 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbgBUMVp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Feb 2020 07:21:45 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id 5QMi220035USYZQ01QMiBN; Fri, 21 Feb 2020 13:21:42 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j57JO-0002E3-5F; Fri, 21 Feb 2020 13:21:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j57JO-0008LM-3j; Fri, 21 Feb 2020 13:21:42 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Marcus Wolf <linux@Wolf-Entwicklungen.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] staging: pi433: overlay: Fix Broadcom vendor prefix
Date:   Fri, 21 Feb 2020 13:21:31 +0100
Message-Id: <20200221122133.32024-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221122133.32024-1-geert+renesas@glider.be>
References: <20200221122133.32024-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

checkpatch.pl says:

    WARNING: DT compatible string "bcm,bcm2708" appears un-documented -- check ./Documentation/devicetree/bindings/

The vendor prefix of Broadcom Corporation is "brcm", not "bcm".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Why do you need these 3 compatible values at the root of the overlay,
not referencing the actual root of the machine's DT?
Does the Raspbian overlay manager use this to check if the overlay is
applicable to the machine it is running on?
---
 .../staging/pi433/Documentation/devicetree/pi433-overlay.dts    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/Documentation/devicetree/pi433-overlay.dts b/drivers/staging/pi433/Documentation/devicetree/pi433-overlay.dts
index 61fad96818c28c5d..dfc9f974ac24ecc1 100644
--- a/drivers/staging/pi433/Documentation/devicetree/pi433-overlay.dts
+++ b/drivers/staging/pi433/Documentation/devicetree/pi433-overlay.dts
@@ -3,7 +3,7 @@
 /plugin/;
 
 / {
-	compatible = "bcm,bcm2835", "bcm,bcm2708", "bcm,bcm2709";
+	compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
 
 	fragment@0 {
 		target = <&spi0>;
-- 
2.17.1

