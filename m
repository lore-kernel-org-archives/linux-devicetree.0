Return-Path: <SRS0=UCWN=6F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D89C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 09:47:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D15C42087E
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 09:47:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hY2TCnqb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgDUJrw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Apr 2020 05:47:52 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:51468 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725920AbgDUJrw (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Apr 2020 05:47:52 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7F92EC0353;
        Tue, 21 Apr 2020 09:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1587462471; bh=GCOkLmV4EmDz6ISgGT9wRw9lM5hPPhzwmrhK1ozo9qw=;
        h=Date:From:Subject:To:Cc:From;
        b=hY2TCnqb40zM7X9JUZZKHAa8wWNEnLTjaOSUnRYOetkufC5jsCir/n0eO2TRWHHBK
         orKrYFvItKL+aVcfYp7DnLlhVQliNjvh9KxSIVC7srXSA3iDFMU0Km+45RrK3ttniL
         TVVUIFbq1lmCAarpTyJdZNtivjivtsmyCQKzV15qIhV0lMYxs2HkY2cM8x5LlNhO3+
         wDu2GXtFMVZkRTGcqu7rH6zNdLxVwTaf6SnSpsjHelYPH+2MH9/Rcj+FHCzDX9QOPo
         2WOg2yGg+yysFWS3NJWSIKY3pp6P3C3T28BfZl/2Md7lvDrKrFnjNBheOfl/iE+GWM
         dHaN5dkrui7wg==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.146.16.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 2762BA005C;
        Tue, 21 Apr 2020 09:47:45 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Tue, 21 Apr 2020 15:17:43 +0530
Date:   Tue, 21 Apr 2020 15:17:43 +0530
Message-Id: <cover.1587461220.git.joglekar@synopsys.com>
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [RFC PATCH v2 0/4] Add logic to consolidate TRBs for Synopsys xHC
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
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

Changes since v1:
 - Comments from Greg are addressed on [PATCH 4/4] and [PATCH 1/4]
 - Renamed the property and quirk as in other patches based on [PATCH 1/4]

Tejas Joglekar (4):
  dt-bindings: usb: Add documentation for SG trb cache size quirk
  usb: xhci: Set quirk for XHCI_SG_TRB_CACHE_SIZE_QUIRK
  usb: dwc3: Add device property sgl-trb-cache-size-quirk
  usb: xhci: Use temporary buffer to consolidate SG

 Documentation/devicetree/bindings/usb/dwc3.txt     |   4 +
 Documentation/devicetree/bindings/usb/usb-xhci.txt |   3 +
 drivers/usb/dwc3/core.c                            |   2 +
 drivers/usb/dwc3/core.h                            |   2 +
 drivers/usb/dwc3/dwc3-haps.c                       |   1 +
 drivers/usb/dwc3/host.c                            |   6 +-
 drivers/usb/host/xhci-pci.c                        |   3 +
 drivers/usb/host/xhci-plat.c                       |   4 +
 drivers/usb/host/xhci-ring.c                       |   2 +-
 drivers/usb/host/xhci.c                            | 125 +++++++++++++++++++++
 drivers/usb/host/xhci.h                            |   5 +
 11 files changed, 155 insertions(+), 2 deletions(-)

-- 
2.11.0

