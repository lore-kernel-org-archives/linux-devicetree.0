Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E48C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 13:40:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C131E222C2
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 13:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="knIFojO5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfLTNkb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Dec 2019 08:40:31 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:44104 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727344AbfLTNkb (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Dec 2019 08:40:31 -0500
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5D7D942336;
        Fri, 20 Dec 2019 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576849230; bh=Ar4tQxExynwUMAHZi/U/mRWmdym3BiGnnWXXk6fzbwA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=knIFojO5ZRj+MvX37D5JrR8KHTinKTJqydIWPaZccS/YAvt7cpPK3DQIYMey4yZ+C
         oqkyFAWlLIWhGUhh95KfnSwd6zHCcrgZ0XLpG8AHmdESxKjggYYw5Uhj45J8ObRCSg
         oqBpf40WZJs+EUbtl93Q/StPpIX3Z62J6bLzqb09U1ekS6C9eFMATXTwYMyhCtjx4x
         cQUDMtxjDirh2kVWKvniokdwlsUeMS5TSaNGCteskwO0FLMIOcyeYBBdrYFc2C/FKM
         mxdyHU9d2bNrzr9Tw1gSZlkCwvu9gGuddeWiBM+O8hlOXKml4Aj3WM+u5zdX3CBAP5
         laO6yg1T6IsYA==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.144.133.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id D80FEA0057;
        Fri, 20 Dec 2019 13:40:26 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Fri, 20 Dec 2019 19:10:24 +0530
Date:   Fri, 20 Dec 2019 19:10:24 +0530
Message-Id: <2450178afa4e09b315402c64224b44b542363fc7.1576848504.git.joglekar@synopsys.com>
In-Reply-To: <cover.1576848504.git.joglekar@synopsys.com>
References: <cover.1576848504.git.joglekar@synopsys.com>
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [RFC PATCH 4/4] dt-bindings: usb: Add snps,consolidate-trbs & consolidate-trbs
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This commit adds the documentation for consolidate-trbs, and
snps,consolidate-trbs property. These when set enables the quirk for
XHCI driver for consolidation of TRB's when small buffer sizes are
scattered over the TRB cache not making up to MPS or total transfer size
with Synopsys xHC.

Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt     | 6 ++++++
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..9851da41a442 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -101,6 +101,12 @@ Optional properties:
 			this and tx-thr-num-pkt-prd to a valid, non-zero value
 			1-16 (DWC_usb31 programming guide section 1.2.3) to
 			enable periodic ESS TX threshold.
+ - snps,consolidate-trbs: enable TRBs consolidation - host mode only. Set this
+			to valid then for Synopsys xHC the TRBs would be
+			consolidated to at least MPS in order to prevent the
+			controller getting hang due to small buffer sizes which
+			does not make up to MPS size or total transfer size
+			across TRB cache.
 
  - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
  - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index 3f378951d624..be8d5e6a6333 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -43,6 +43,7 @@ Optional properties:
   - quirk-broken-port-ped: set if the controller has broken port disable mechanism
   - imod-interval-ns: default interrupt moderation interval is 5000ns
   - phys : see usb-hcd.yaml in the current directory
+  - consolidate-trbs: indicate if you need to consolidate trbs
 
 additionally the properties from usb-hcd.yaml (in the current directory) are
 supported.
-- 
2.11.0

