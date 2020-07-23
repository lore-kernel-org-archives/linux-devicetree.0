Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1671C433EA
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 02:12:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B8F4207E8
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 02:12:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VHJYIk0z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387753AbgGWCMl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 22:12:41 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54258 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387467AbgGWCMl (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 Jul 2020 22:12:41 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6BB4040140;
        Thu, 23 Jul 2020 02:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595470361; bh=xKqvu1r3YaFDoRkLO+kOsIi1/taHZrbVYkcWmL76uY4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=VHJYIk0znAUHqwopYigUGvTqIvn35ELDrFsydujyEPYj2FfpaIv3PT86sMIZ476NJ
         HmKDgF8M01IbBO5t2V6XRI0VciD22kANBuSBem/HWFa7vBc8Eg5L01wL+cmQqfLOQD
         dZjT3aXvPgqszpiNEaEEfv0N+b5MjfZrnWmkV42VQ3XKtt/j23uFxmIf6FHm08rndt
         WbcXWS0/JNEwnFH08jDXn+OvUUcrCnng16VKk6yggfLoqKGP59CUkjH+0dYG8PqlTZ
         RSuaiG8jljCllm/OnkMP/8otcZravcrZaYW+Me7KpQ+Rlnr/qe0/2sR9Q0X2CoCdEm
         Q3nwxZc0AszYg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 1E2E3A006F;
        Thu, 23 Jul 2020 02:12:39 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 22 Jul 2020 19:12:39 -0700
Date:   Wed, 22 Jul 2020 19:12:39 -0700
Message-Id: <d605a437f0a4bc837a05269caaa3875c2e0b29d8.1595468673.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595468673.git.thinhn@synopsys.com>
References: <cover.1595468673.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 06/12] usb: devicetree: Introduce num-lanes and lsm
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

According to USB 3.2 spec, a super-speed-plus device can operate at
gen2x2, gen2x1, or gen1x2. Introduce "num-lanes" and
"lane-speed-mantissa-gbps" properties for devices operating in
super-speed-plus. If the USB controller device supports multiple lanes
at different transfer rate, the user can specify the HW capability via
these properties.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v2:
- Make "num-lanes" and "lane-speed-mantissa-gbps" common USB properties

 Documentation/devicetree/bindings/usb/generic.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
index ba472e7aefc9..a8253da684af 100644
--- a/Documentation/devicetree/bindings/usb/generic.txt
+++ b/Documentation/devicetree/bindings/usb/generic.txt
@@ -7,6 +7,17 @@ Optional properties:
 			"low-speed". In case this isn't passed via DT, USB
 			controllers should default to their maximum HW
 			capability.
+ - num-lanes: tells USB controllers that we want to work up to a certain number
+			of lanes. Valid arguments are 1 or 2. Apply if the
+			maximum-speed is super-speed-plus. In case this isn't
+			passed via DT, the USB controllers should default to
+			their maximum HW capability.
+ - lane-speed-mantissa-gbps: tells USB controllers that we want the symmetric
+			lanes to operate up to a certain rate in Gbps. Valid
+			inputs are 5 or 10 (i.e. Gen 1/Gen 2 transfer rate).
+			Apply if the maximum-speed is super-speed-plus. In case
+			this isn't passed via DT, the USB controllers should
+			default to their maximum HW capability.
  - dr_mode: tells Dual-Role USB controllers that we want to work on a
 			particular mode. Valid arguments are "host",
 			"peripheral" and "otg". In case this attribute isn't
-- 
2.11.0

