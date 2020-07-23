Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1568CC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 02:12:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E366520825
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 02:12:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="d/2pJ5fZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387732AbgGWCME (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 22:12:04 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:34878 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387467AbgGWCME (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 Jul 2020 22:12:04 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F36E0C0086;
        Thu, 23 Jul 2020 02:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595470323; bh=/+ROx0/T1NSbYbubMd33Z0EHm6qA9f07CNzjW2+LDR0=;
        h=Date:From:Subject:To:Cc:From;
        b=d/2pJ5fZ+Kukaa5m9JGmut2+jUNcIh+KEM16M/q8R1czXj2+8JmV1u7GwPZNbTBRs
         +uTGc0ZYty54YSWS4NSh5GXk/Bvb0b2Ya9jyA8cLeaCa/xw87lmWhLpoVWyeMA8OOz
         8IoU66o/lleLLz1QcvTnyyRrzu+7e45HpclCygaKnb0jAdB0IT0nWjk8CvuZ+Lp0bQ
         tFRpYK8paucQf3/HEwP9JvaAPqzRL4bbcKv8PtanXd+d62EJSZI0EgTzQBCsNhlcVO
         2z498bFum419PR/gr9KK27fvlyBWgmTLPbZ+i/W4aOy5UwWV+nF9GHu/crOj7GnIg2
         rt38t6sj5yGbg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 4D1FAA0096;
        Thu, 23 Jul 2020 02:12:01 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 22 Jul 2020 19:12:01 -0700
Date:   Wed, 22 Jul 2020 19:12:01 -0700
Message-Id: <cover.1595468673.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 00/12] usb: Handle different sublink speeds
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Peter Chen <peter.chen@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

A USB super-speed-plus device may operate at different sublink speed and lane
count (e.g. gen2x2, gen1x2, or gen2x1). The usb gadget stack needs to be able
to handle a couple things:

1) Report the sublink speed attributes the device support
2) Select the sublink speed attribute

This series introduces sublink speed attribute structure to ch9.h to capture
the device capability of the gadget. It also introduces a new gadget ops
udc_set_num_lanes_and_speed to select a specific sublink speed.

DWC3 needs this support for DWC_usb32 IP. Implement the new changes for DWC3.

Changes in v2:
 - Move usb_sublink_speed attribute struct and enum to include/linux/usb/ch9.h
 - Use "num-lanes" and "lane-speed-mantissa-gbps" as common properties instead
 - Add common functions to get num-lanes and lsm properties
 - Fix missing gen1x2 sublink speed attribute check report in dwc3


Thinh Nguyen (12):
  usb: ch9: Add sublink speed struct
  usb: gadget: composite: Avoid using magic numbers
  usb: gadget: Expose sublink speed attributes
  usb: gadget: Set max speed for SSP devices
  usb: composite: Properly report sublink speed
  usb: devicetree: Introduce num-lanes and lsm
  usb: common: Add functions to get lanes and lsm
  usb: dwc3: Initialize lane count and sublink speed
  usb: dwc3: gadget: Report sublink speed capability
  usb: dwc3: gadget: Implement setting of sublink speed
  usb: dwc3: gadget: Track connected lane and sublink speed
  usb: dwc3: gadget: Set speed only up to the max supported

 Documentation/devicetree/bindings/usb/generic.txt |  11 ++
 drivers/usb/common/common.c                       |  26 ++++
 drivers/usb/dwc3/core.c                           |  62 ++++++++++
 drivers/usb/dwc3/core.h                           |  18 +++
 drivers/usb/dwc3/gadget.c                         | 143 +++++++++++++++++++++-
 drivers/usb/gadget/composite.c                    |  81 ++++++++----
 drivers/usb/gadget/udc/core.c                     |  24 +++-
 include/linux/usb/ch9.h                           |  62 ++++++++++
 include/linux/usb/gadget.h                        |  23 ++++
 9 files changed, 414 insertions(+), 36 deletions(-)


base-commit: 5db5ea26a2469d8899f995e82e8b718dc9e9d168
-- 
2.11.0

