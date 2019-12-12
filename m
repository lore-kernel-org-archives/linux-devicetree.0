Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D3BC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 02:49:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DD6D2054F
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 02:49:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ljtg4gRm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbfLLCtj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 21:49:39 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:41538 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727809AbfLLCtj (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Dec 2019 21:49:39 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 97CFB404D4;
        Thu, 12 Dec 2019 02:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576118978; bh=e5mWKtJto9gXYZSCoYLvNp227MJC2BSruJvmHO/nch4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=ljtg4gRmVQ9evk3mH3xjB9nufmWZ9Gt72bXEBv9YzSAeoyg6BOG2+2O3h9toTrliE
         RnYgaz0mxyfmMY7S7xoPnfRLhAIXY+hpgBYfh8EbJCkcY2R41+bzvjI8DhiIqfKA4p
         PeetNY0FUpSY98BcvSyeFOTKpj+ehczV/2zDd6OIvoVyESu6nTt+g1P9Oe2f2Nuhfx
         7yrZAZoIdNUY1HLAsDZurUcFG7aZ3DVYUyPIBaWuMUOHeEoUArnEUKbYeTzYEEx+tG
         yWHsYyXBJMpHZO5pJ+Ym0UF8SyPkhy/H4jaIpzGevCw+lb+OyiP6K7f/Cuy1/Ypxu/
         EpUpzy2D/IFog==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 3EA60A006F;
        Thu, 12 Dec 2019 02:49:37 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 11 Dec 2019 18:49:37 -0800
Date:   Wed, 11 Dec 2019 18:49:37 -0800
Message-Id: <aa9816c1efcdd492d698b421a94f0771961f414e.1576118671.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 06/14] usb: devicetree: dwc3: Add max lane and lsm
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a new property to set maximum number of lanes and transfer rated
supported for DWC_usb32. By default, the driver will configure the
controller to use dual-lane at 10Gbps.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..7da1c4e7d380 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -85,6 +85,10 @@ Optional properties:
  - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
 	register for post-silicon frame length adjustment when the
 	fladj_30mhz_sdbnd signal is invalid or incorrect.
+ - snps,maximum-lane-count: set to specify the number of lanes to use for
+			DWC_usb32 and later. Default is dual-lanes.
+ - snps,maximum-lsm: set to specify the lane speed mantissa to use in Gbps.
+ 			Default is 10Gbps for SuperSpeed Plus.
  - snps,rx-thr-num-pkt-prd: periodic ESS RX packet threshold count - host mode
 			only. Set this and rx-max-burst-prd to a valid,
 			non-zero value 1-16 (DWC_usb31 programming guide
-- 
2.11.0

