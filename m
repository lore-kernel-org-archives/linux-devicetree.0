Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C40C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 02:49:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A59942054F
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 02:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="L5q47asl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbfLLCtE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 21:49:04 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:38118 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727599AbfLLCtD (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Dec 2019 21:49:03 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 77709C0084;
        Thu, 12 Dec 2019 02:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576118942; bh=ta14JiyZFbEKwsXrq3lRZW1hLWDxxcBeGnI5Eswl/WM=;
        h=Date:From:Subject:To:Cc:From;
        b=L5q47asllvi0qp+gHokHfXfQagOmAk2EHA6PA2IHcBt0cC3qdTlFMUeERfBz4gS+5
         +qOZfUuv2kcT1D5YFYHXRnPB7diXW0dpt4kAZuBCi75Q7BcYgTbrLj7cStOC3VlmLV
         JUcDCOV/nPtjGuqJkOUcBUGDJOohigmdkcHRfEjepG4EgB81tKn8Ln1pyriqUh9yL8
         cnwas9n/iZ3FcJbCQU8LRynbGypgT7FVwjaVK9eYl6Xec+Yd2H9LPcxthXp3j7gSvC
         XxpHInvIFcfg+J8NqQdmvx6OMN9rZj9Kojj28vwi8pAKkc3MHuNzmBtxAbzQgmo3lJ
         c25MVl2PkVbTg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id F2FBCA007C;
        Thu, 12 Dec 2019 02:48:58 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 11 Dec 2019 18:48:58 -0800
Date:   Wed, 11 Dec 2019 18:48:58 -0800
Message-Id: <cover.1576118671.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 00/14] usb: dwc3: Introduce DWC_usb32
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mark Rutland <mark.rutland@arm.com>,
        Roger Quadros <rogerq@ti.com>, zhengbin <zhengbin13@huawei.com>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch series adds support to Synopsys DWC_usb32 controller which is
capable of dual-lane and USB speed up to 40 Gbps. In order to support this new
controller, we need to make a few updates the USB stack and dwc3 driver:

1) dwc3 driver needs to update its IP and revision check. The current scheme
does not support more than 2 controllers.

2) Introduce Lane Speed Mantissa and lane count on the gadget side. Devices
operating in SuperSpeed Plus can refer to gen2x1, gen1x2, or gen2x2.

3) Add a new gadget opts to set the sublink speed for drivers that are
constrained to certain lane count or lane speed mantissa.

4) Add miscellaneous initialization checks for DWC_usb32.


Any review comment is highly appreciated.

Thank you,
Thinh




This patch series depends on the following patches

usb: dwc3: Fix GTXFIFOSIZ.TXFDEP macro name
usb: dwc3: gadget: Properly set maxpacket limit

https://patchwork.kernel.org/cover/11283761/


Thinh Nguyen (14):
  usb: gadget: Add lane count and lsm
  usb: gadget: Add callback to set lane and transfer rate
  usb: composite: Properly report lsm
  usb: dwc3: Implement new id check for DWC_usb32
  usb: dwc3: Update IP checks to support DWC_usb32
  usb: devicetree: dwc3: Add max lane and lsm
  usb: dwc3: gadget: Set lane count and lsm
  usb: dwc3: gadget: Track connected lane count and speed
  usb: dwc3: gadget: Limit the setting of speed
  usb: dwc3: Update HWPARAMS0.MDWIDTH for DWC_usb32
  usb: devicetree: dwc3: Add TRB prefetch count
  usb: dwc3: gadget: Set number of TRB prefetch
  usb: devicetree: dwc3: Add property to disable mult TRB fetch
  usb: dwc3: gadget: Implement disabling of mult TRB fetch

 Documentation/devicetree/bindings/usb/dwc3.txt |   9 ++
 drivers/usb/dwc3/core.c                        |  88 ++++++++----
 drivers/usb/dwc3/core.h                        |  65 ++++++---
 drivers/usb/dwc3/debugfs.c                     |  14 +-
 drivers/usb/dwc3/gadget.c                      | 181 +++++++++++++++++++------
 drivers/usb/dwc3/host.c                        |   2 +-
 drivers/usb/gadget/composite.c                 |  16 ++-
 drivers/usb/gadget/legacy/mass_storage.c       |   2 +
 drivers/usb/gadget/udc/core.c                  |  38 +++++-
 include/linux/usb/composite.h                  |   4 +
 include/linux/usb/gadget.h                     |  15 ++
 11 files changed, 344 insertions(+), 90 deletions(-)

-- 
2.11.0

