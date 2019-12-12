Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A867C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 02:50:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB8C924653
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 02:50:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HWAoOuWd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbfLLCuV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 21:50:21 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:41590 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727809AbfLLCuV (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Dec 2019 21:50:21 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 092B2404D4;
        Thu, 12 Dec 2019 02:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576119021; bh=30+ZAnrazUzEgXZAZtMIZSjq2c+ounGgW4x73NLnzmM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=HWAoOuWdRgZb+idIowzdRohj6rrZKdgbqrSlIdN5fyA6+Ewlh4l1kID6uClknp4dm
         Gystrh8UZWmVFHnIsqfl0a235gVgBBYeu4IOO4kq1IGYW6LfmEFgveJyonJyYFPVjz
         Ota1kArPyfI+Qgh+mMfQemYH5puH0McdiqQQv+cLqfk7/9R7Y9rYwsuvdJbP6Z4WAi
         JknhlopT4GG79vbiw2UNynHpItucitopgkpiFrS+ZX3xLMFXxHnHSicgtLd9o8NF2X
         y04br6EGj3Vu2BcgMtvu4gNzTrJpTpbn0znOWFJM33Co5ohq3OTpWR8AUFjFla18ge
         mt3s94pOtbi2w==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id E8DECA006D;
        Thu, 12 Dec 2019 02:50:19 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 11 Dec 2019 18:50:19 -0800
Date:   Wed, 11 Dec 2019 18:50:19 -0800
Message-Id: <b791f032edb8e6a739c342dbd0d2d5faa66ddfb8.1576118671.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 13/14] usb: devicetree: dwc3: Add property to disable mult TRB fetch
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

DWC_usb32 has a feature where it can issue multiple TRB fetch requests.
Add a new property to limit and only do only single TRB fetch request.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index ff35fa6de2eb..29d6f9b1fc70 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -108,6 +108,8 @@ Optional properties:
  - snps,num-trb-prefetch: max value to do TRBs cache for DWC_usb32. The value
 			can be from 1 to DWC_USB32_CACHE_TRBS_PER_TRANSFER.
 			Default value is DWC_USB32_CACHE_TRBS_PER_TRANSFER.
+ - snps,dis-mult-trb-fetch: set to issue only single TRB fetch request in
+			DWC_usb32.
 
  - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
  - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
-- 
2.11.0

