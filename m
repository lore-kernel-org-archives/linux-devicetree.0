Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC77DC35656
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 12:21:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0D5324656
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 12:21:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgBUMVp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 07:21:45 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:46390 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726989AbgBUMVp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Feb 2020 07:21:45 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id 5QMi220065USYZQ01QMiBQ; Fri, 21 Feb 2020 13:21:42 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j57JO-0002E2-53; Fri, 21 Feb 2020 13:21:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j57JO-0008LK-2Q; Fri, 21 Feb 2020 13:21:42 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Marcus Wolf <linux@Wolf-Entwicklungen.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] staging: pi433: overlay: Convert to sugar syntax
Date:   Fri, 21 Feb 2020 13:21:30 +0100
Message-Id: <20200221122133.32024-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

	Hi all,

This patch series fixes common errors in the overlay DTS for the Pi433
radio module, and converts it to overlay sugar syntax.

This has not been run-tested due to lack of hardware, but I did look at
the resulting changes using scripts/dtc/dtx_diff.

Thanks for your comments!

Geert Uytterhoeven (3):
  staging: pi433: overlay: Fix Broadcom vendor prefix
  staging: pi433: overlay: Fix reg-related warnings
  staging: pi433: overlay: Convert to sugar syntax

 .../devicetree/pi433-overlay.dts              | 73 +++++++++----------
 1 file changed, 34 insertions(+), 39 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
