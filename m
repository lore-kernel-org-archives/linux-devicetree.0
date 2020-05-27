Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD2BC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 10:43:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD8A62075F
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 10:43:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BYrPVPO0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729954AbgE0KnC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 06:43:02 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:34648 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729354AbgE0KnB (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 May 2020 06:43:01 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4B5D6C0519;
        Wed, 27 May 2020 10:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1590576181; bh=c8cXuZnPUVhDrm8TnZwka2SdniDodmtUoYnu1RdfkT8=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=BYrPVPO02B5iGjtVTiNucEtRVgT09AbX2i5B5CAiriLpq3U+XuXsI87GxIjK2XUui
         LZ+zpeyFG1abmoTpldPEeCwAqDQEjlFrlmTDhxJ5YcUTlN+wSsww6j/gEB+adHleG3
         CmSavSgSi1kWVcbjvQmrY760lJYS7soiyKPFnOLOjRTdClelVWWiyZ6n9aqx6gaPRZ
         2WYu9L0TTBDtMoM0eIqLb8YunOAxCTDbNOuqsrYnncVrRpTAyd/Gk15Gbsw3V1mqWP
         FE81z+SFEgi4l9onS7Jnj6LE4imRV9ism0+RV5VSKwnrN236+ET1gLJFLryqm3gMoy
         Twu1DPkXoG9JQ==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.146.20.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id D6C91A005C;
        Wed, 27 May 2020 10:42:57 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Wed, 27 May 2020 16:10:55 +0530
Date:   Wed, 27 May 2020 16:10:55 +0530
Message-Id: <d91b768b3827fce611ba052aa1bcca19ac09fd75.1590415123.git.joglekar@synopsys.com>
In-Reply-To: <cover.1590415123.git.joglekar@synopsys.com>
References: <cover.1590415123.git.joglekar@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [PATCH v3 1/4] dt-bindings: usb: Add documentation for SG trb cache size quirk
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This commit adds the documentation for sgl-trb-cache-size-quirk, and
snps,sgl-trb-cache-size-quirk property. These when set enables the
quirk for XHCI driver for consolidation of sg list into a temporary
buffer when small buffer sizes are scattered over the sg list not
making up to MPS or total transfer size within TRB cache size with
Synopsys xHC.

Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt     | 4 ++++
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index d03edf9d3935..0fcbaa51f66e 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -102,6 +102,10 @@ Optional properties:
 			this and tx-thr-num-pkt-prd to a valid, non-zero value
 			1-16 (DWC_usb31 programming guide section 1.2.3) to
 			enable periodic ESS TX threshold.
+ - snps,sgl-trb-cache-size-quirk: enable sg list consolidation - host mode
+			only. Set to use SG buffers of at least MPS size
+			by consolidating smaller SG buffers list into a
+			single buffer.
 
  - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
  - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index dc025f126d71..c53eb19ae67e 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -44,6 +44,9 @@ Optional properties:
   - quirk-broken-port-ped: set if the controller has broken port disable mechanism
   - imod-interval-ns: default interrupt moderation interval is 5000ns
   - phys : see usb-hcd.yaml in the current directory
+  - sgl-trb-cache-size-quirk: set if you need to consolidate sg list into a
+    temporary buffer when small SG buffer sizes does not make upto MPS
+    size or total transfer size across the TRB cache size.
 
 additionally the properties from usb-hcd.yaml (in the current directory) are
 supported.
-- 
2.11.0

