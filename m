Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B69C433E5
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 21:59:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2848120760
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 21:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZN48ZdOw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbgGPV7L (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 17:59:11 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45422 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726201AbgGPV7K (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jul 2020 17:59:10 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 71F56C0446;
        Thu, 16 Jul 2020 21:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594936749; bh=muaPNu/htkt6sGQWxd+AKBohPBJCmux5yNpHy170w10=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=ZN48ZdOw/aH+6xoSEujD3p3XK5t2fYMvo9Rp1DUs3M40y9fZp0vrd/1OzXD+6O6KJ
         JOLGUejJFdm/ZbkZ5RSRpzc3jLXKL50ARrM8JP2agsASr4UN+4jZHTKo2V1ViOhOfy
         l2KTId0PoBgI8wJ7Lk0lAl3+i8h6Cj3ltkipV1tyx677mK3CSws8EQsGPuvKxXT83N
         cHL5Aq5S7mLUucNyV6qnkWYLqIv3OJFyqI0L1aXM0C07mK/iRX4ZWQFOGWvlFjR6na
         GgNiCknmllIuYbbOyVOLY4bOll87rx45pvbMbBttsKw82P84r/Zr8JZugZzxfqAlX5
         X9Nwh5Qknm/iw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 3F7F6A00A9;
        Thu, 16 Jul 2020 21:59:08 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 16 Jul 2020 14:59:08 -0700
Date:   Thu, 16 Jul 2020 14:59:08 -0700
Message-Id: <9684a2b2adb01b6b1a8c513928ea49b4a6436184.1594935978.git.thinhn@synopsys.com>
In-Reply-To: <cover.1594935978.git.thinhn@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 06/11] usb: devicetree: dwc3: Introduce num-lanes and lsm
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Introduce num-lanes and lane-speed-mantissa-gbps for devices operating
in super-speed-plus. DWC_usb32 IP supports multiple lanes and can
operate in different sublink speeds. Currently the device controller
does not have the information of the phy's number of lanes supported. As
a result, the user can specify them through these properties if they are
different than the default setting.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index d03edf9d3935..4eba0615562f 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -86,6 +86,15 @@ Optional properties:
  - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
 	register for post-silicon frame length adjustment when the
 	fladj_30mhz_sdbnd signal is invalid or incorrect.
+ - snps,num-lanes: set to specify the number of lanes to use. Valid inputs are
+			1 or 2. Apply if the maximum-speed is super-speed-plus
+			only. Default value is 2 for DWC_usb32. For DWC_usb31,
+			it is always 1 at super-speed-plus.
+ - snps,lane-speed-mantissa-gbps: set to specify the symmetric lane speed
+			mantissa in Gbps. Valid inputs are 5 or 10. Apply if
+			the maximum-speed is super-speed-plus only. Default
+			value is 10. For DWC_usb31, it's always 10 at
+			super-speed-plus.
  - snps,rx-thr-num-pkt-prd: periodic ESS RX packet threshold count - host mode
 			only. Set this and rx-max-burst-prd to a valid,
 			non-zero value 1-16 (DWC_usb31 programming guide
-- 
2.11.0

