Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F71C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 02:50:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0902B22B48
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 02:50:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fjNxSJHU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbfLLCuJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 21:50:09 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:41568 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727809AbfLLCuJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Dec 2019 21:50:09 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DC193404DA;
        Thu, 12 Dec 2019 02:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576119008; bh=s1PINkWo6mLBiWpdGq5ME2RUbcGM0Ei8n3e5MwN99MM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=fjNxSJHUxkUdP6Jt63G3ZabC1wlR+NpPPgPwIA8PdDtRfntcPm2LW00TVPZCK1Bt0
         2uB71tCm3+AiInl4XQ9vAD/NYtbOqTbxN3TevNn1lDPWZ0CF6AuEPL5cOIvqqhedID
         uh2qfJ4asGDjIuhcp2d8cDJCPOzEn2y9PuxUFb9N72ZhnES6EIdlOYin8pnRo1Dr9t
         O7hQS651k5nNA41MnCA8isAyqHZhEAsR8jkUNAceaXELyi/6jpkmEeayK6FUsjcUv9
         gFrl/QWZFPEN6pH8lLBcfeaNWj4w3KqPN8iGlKfn7deilUXGZBDKU39wUguHWrBAD4
         AMottnvTzeeoA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id C901CA007C;
        Thu, 12 Dec 2019 02:50:07 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 11 Dec 2019 18:50:07 -0800
Date:   Wed, 11 Dec 2019 18:50:07 -0800
Message-Id: <7098386bb19ebfee02027555d86fc47822b617d4.1576118671.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 11/14] usb: devicetree: dwc3: Add TRB prefetch count
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

DWC_usb32 has an enhancement that allows the controller to cache
multiple TRBs for non-control endpoints. Introduce a new property to
DWC3 to set the maximum number of TRBs to cache in advance. The property
can be set from 1 to DWC_USB32_CACHE_TRBS_PER_TRANSFER (CoreConsultant
value). By default, the number of cache TRB is
DWC_USB32_CACHE_TRBS_PER_TRANSFER.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 7da1c4e7d380..ff35fa6de2eb 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -105,6 +105,9 @@ Optional properties:
 			this and tx-thr-num-pkt-prd to a valid, non-zero value
 			1-16 (DWC_usb31 programming guide section 1.2.3) to
 			enable periodic ESS TX threshold.
+ - snps,num-trb-prefetch: max value to do TRBs cache for DWC_usb32. The value
+			can be from 1 to DWC_USB32_CACHE_TRBS_PER_TRANSFER.
+			Default value is DWC_USB32_CACHE_TRBS_PER_TRANSFER.
 
  - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
  - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
-- 
2.11.0

