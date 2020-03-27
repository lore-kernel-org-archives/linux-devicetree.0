Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A46C43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 08:52:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 61B2120714
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 08:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kCTRqxQO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgC0Iwe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 04:52:34 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:33450 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726096AbgC0Iwd (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 27 Mar 2020 04:52:33 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3845142464;
        Fri, 27 Mar 2020 08:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585299153; bh=ku3HQ8MToet7lnTIduYYZtqcjXcYcxHi6Fk+w+wXrwQ=;
        h=Date:From:Subject:To:Cc:From;
        b=kCTRqxQOGmxj1Y90SSOOIbrM/DjBA68+7rvloO9DYelBz6ucx+TxLfyZb4dnXZad0
         YWnXRiaNjznGgo7ciUChRzedmsYl8D78A5WyOZqI7R2Qkz5s3PnDRoMYvVfcb99IbQ
         XHEKfJwiwA8wExsm+LPN/7GAR+qlC0WeABxeaDl2cyQlTlb3HsIY0+q8IwSWL2YZYZ
         3f/c595mFHy8cwiHHLk8r1uawX/bpozXeWHsM1Z0ifxIlu6OINFWBIAc7Y7oiEWnGB
         euBDE7xymmtrQJLslvIqYtFAdtH3KJ82XYD01q2+KwVe3tVfJrpJq3qruv677WEwDk
         pXiy3yyoyT/vQ==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.146.16.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id C013EA005B;
        Fri, 27 Mar 2020 08:52:25 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Fri, 27 Mar 2020 14:22:23 +0530
Date:   Fri, 27 Mar 2020 14:22:23 +0530
Message-Id: <cover.1585297723.git.joglekar@synopsys.com>
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [RESENDING RFC PATCH 0/4] Add logic to consolidate TRBs for Synopsys xHC
To:     Felipe Balbi <balbi@kernel.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Fredrik Noring <noring@nocrew.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Raul E Rangel <rrangel@chromium.org>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Synopsys xHC has an internal TRB cache of size TRB_CACHE_SIZE for
each endpoint. The default value for TRB_CACHE_SIZE is 16 for SS and 8
for HS. The controller loads and updates the TRB cache from the
transfer ring in system memory whenever the driver issues a start
transfer or update transfer command.

For chained TRBs, the Synopsys xHC requires that the total amount of
bytes for all TRBs loaded in the TRB cache be greater than or equal to
1 MPS. Or the chain ends within the TRB cache (with a last TRB).

If this requirement is not met, the controller will not be able to
send or receive a packet and it will hang causing a driver timeout and
error.

This patch set adds logic to the XHCI driver to detect and prevent this
from happening along with the quirk to enable this logic for Synopsys
HAPS platform.

Based on Mathias's feedback on previous implementation where consolidation
was done in TRB cache, with this patch series the implementation is done
during mapping of the URB by consolidating the SG list into a temporary
buffer if the SG list buffer sizes within TRB_CACHE_SIZE is less than MPS.


Tejas Joglekar (4):
  dt-bindings: usb: Add snps,consolidate-sgl & consolidate-sgl
  usb: xhci: Set quirk for XHCI_CONSOLIDATE_SG_LIST
  usb: dwc3: Add device property consolidate-sgl
  usb: xhci: Use temporary buffer to consolidate SG

Resending as 'umlaut' is not accepted by some servers in email.

 Documentation/devicetree/bindings/usb/dwc3.txt     |   3 +
 Documentation/devicetree/bindings/usb/usb-xhci.txt |   3 +
 drivers/usb/core/hcd.c                             |   8 ++
 drivers/usb/dwc3/core.c                            |   2 +
 drivers/usb/dwc3/core.h                            |   2 +
 drivers/usb/dwc3/dwc3-haps.c                       |   1 +
 drivers/usb/dwc3/host.c                            |   5 +-
 drivers/usb/host/xhci-pci.c                        |   3 +
 drivers/usb/host/xhci-plat.c                       |   3 +
 drivers/usb/host/xhci-ring.c                       |   2 +-
 drivers/usb/host/xhci.c                            | 128 +++++++++++++++++++++
 drivers/usb/host/xhci.h                            |   5 +
 12 files changed, 163 insertions(+), 2 deletions(-)

-- 
2.11.0

