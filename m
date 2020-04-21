Return-Path: <SRS0=UCWN=6F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D0DC2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 09:48:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 300EB2070B
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 09:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="H4n5GW/O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgDUJsP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Apr 2020 05:48:15 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35400 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726741AbgDUJsP (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Apr 2020 05:48:15 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E37104050B;
        Tue, 21 Apr 2020 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1587462495; bh=pEl+BqajQpxKEU6q4ersObSMeKbSkHMMBoPiWf2oh+8=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=H4n5GW/OyNgghmNUf48YLQnLRN56uPNJOoVMdA434Qg5E6LxvLht/lyQ3a98AFuyw
         k+Qf295QQBkeMAIUnZS1a5QGDrQVR0qd5Ol3wyPZMB5Hqhs9CXm+BsKRYSSr2UjJUm
         iK/f40gZe30suQQaLIvWDyhsoxLSwj+jlSRmO2DbvILyqsUyacunLLaGflYQgf5BBG
         NIOO7OJnsm/IyVMSLdpMDNK07apRZGzGX/tznOEHhLGea0OiClLuqlHO4vZtOkiI9o
         LvXosPiER1Ejgap5+nvwqcywqq51Dn6I5VWArX7RZYzi8zE+nodFviA5JnzFeV6fT1
         FCDyU2n8rjz3A==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.146.16.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 4B242A005C;
        Tue, 21 Apr 2020 09:48:11 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Tue, 21 Apr 2020 15:18:09 +0530
Date:   Tue, 21 Apr 2020 15:18:09 +0530
Message-Id: <5f5fdfbd323159133fced5b1340f5eb5fd11a17a.1587461220.git.joglekar@synopsys.com>
In-Reply-To: <cover.1587461220.git.joglekar@synopsys.com>
References: <cover.1587461220.git.joglekar@synopsys.com>
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [RFC PATCH v2 1/4] dt-bindings: usb: Add documentation for SG trb cache size quirk
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
 Changes in v2:
 - Renamed the property

 Documentation/devicetree/bindings/usb/dwc3.txt     | 4 ++++
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 9946ff9ba735..6d0418ee4dbd 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -104,6 +104,10 @@ Optional properties:
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
index 3f378951d624..14d900474894 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -43,6 +43,9 @@ Optional properties:
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

