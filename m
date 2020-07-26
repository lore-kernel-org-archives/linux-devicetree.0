Return-Path: <SRS0=vke8=BF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F61CC433EB
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jul 2020 01:36:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21F4F206D7
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jul 2020 01:36:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="e531R2tE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbgGZBgd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jul 2020 21:36:33 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:50686 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726870AbgGZBgd (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sat, 25 Jul 2020 21:36:33 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 34FB240141;
        Sun, 26 Jul 2020 01:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595727393; bh=DVOt8I99N7sLMsKH9eN3nOY5VifOBlHSxAaHgvWrwag=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=e531R2tEacIirRuOeCr+eu8kA3UQ2Q/y3Cm2Rtap2Z0YDXST7p3wl3X5vJnuEJ5cY
         +b4YyTGTI8QXujF9MFAG0vkrMqjmv97TqyK+NLoIUMFwkXQ4Y87ArlyQZ/52NAqRhr
         0dNgwCd9Ye3xJUg/1TXCKC++/XAbwcI0+ZtHT+maPToSzdq2Ge6hgum7+c4+yc/s+k
         glYTIYvQV4Rz080Bm+xJ1j+YGkNAprxHFqhFTJzHZXLHtm5RwXi+FIeSvAyHUl/c5x
         23RvlpTVE/0ha9kno6PNzpg6XGU0fL+wda7wthtZtX/E4y08YyiJCc1omp8lvukhSZ
         VSlynaBd80kuw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 1D493A0096;
        Sun, 26 Jul 2020 01:36:32 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sat, 25 Jul 2020 18:36:32 -0700
Date:   Sat, 25 Jul 2020 18:36:32 -0700
Message-Id: <3cf8c20044d15dfa5e5113b3a532054b4f96c13f.1595727196.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595727196.git.thinhn@synopsys.com>
References: <cover.1595727196.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v4 06/12] usb: devicetree: Include USB SSP Gen X x Y
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

According to the USB 3.2 spec, a super-speed-plus device can operate at
gen2x2, gen2x1, or gen1x2. If the USB controller device supports
multiple lanes at different transfer rates, the user can specify the HW
capability via these new speed strings:

"super-speed-plus-gen2x2"
"super-speed-plus-gen2x1"
"super-speed-plus-gen1x2"

If the argument is simply "super-speed-plus", USB controllers should
default to their maximum transfer rate and number of lanes.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v4:
- None
Changes in v3:
- Use "maximum-speed" to include both the num-lane and transfer rate for SSP
- Remove "num-lanes" and "lane-speed-mantissa-gbps" properties
Changes in v2:
- Make "num-lanes" and "lane-speed-mantissa-gbps" common USB properties

 Documentation/devicetree/bindings/usb/generic.txt | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
index ba472e7aefc9..8541b9571f2f 100644
--- a/Documentation/devicetree/bindings/usb/generic.txt
+++ b/Documentation/devicetree/bindings/usb/generic.txt
@@ -3,10 +3,13 @@ Generic USB Properties
 Optional properties:
  - maximum-speed: tells USB controllers we want to work up to a certain
 			speed. Valid arguments are "super-speed-plus",
-			"super-speed", "high-speed", "full-speed" and
-			"low-speed". In case this isn't passed via DT, USB
-			controllers should default to their maximum HW
-			capability.
+			"super-speed-plus-gen2x2", "super-speed-plus-gen2x1",
+			"super-speed-plus-gen1x2", "super-speed", "high-speed",
+			"full-speed" and "low-speed". In case this isn't passed
+			via DT, USB controllers should default to their maximum
+			HW capability. Similarly, if the argument is
+			"super-speed-plus", USB controllers should default to
+			their maximum transfer rate and number of lanes.
  - dr_mode: tells Dual-Role USB controllers that we want to work on a
 			particular mode. Valid arguments are "host",
 			"peripheral" and "otg". In case this attribute isn't
-- 
2.11.0

