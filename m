Return-Path: <SRS0=vke8=BF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77EEC433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jul 2020 01:35:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E13E206D7
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jul 2020 01:35:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Hw9N2mCe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgGZBf5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jul 2020 21:35:57 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:44704 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726870AbgGZBf4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sat, 25 Jul 2020 21:35:56 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8FBD8C00A4;
        Sun, 26 Jul 2020 01:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595727356; bh=iTGwTIakwO2wPklsQCqfd8dwj5JlgJ0LzsAMUzYaE94=;
        h=Date:From:Subject:To:Cc:From;
        b=Hw9N2mCeeN1O0nk07w5TlrtqtwQQXg7ksDNidoYsYACgEhiNubO8eEnA3MvbsElkh
         /4FVFChHo/GhtIlXA8sv1H44Y8/xaZFf/JRMRgmyKLy0wLB90S+NKSscmlfIrqRNI+
         EvWbGGka1sM5ccmJRuK3gcB0ZPRnIbVY/WmjSAsCGD0T4ny/ggKTx4cFhk8XCrLrl8
         1RR4bFyTfo7iBvjPtA3ZSZKPUWzho4bACtCapUR0l4kUcsnEbVNgpETFkFul5C69lo
         cpp9DW3vZXrT0HhTd9cIuaKkuIJ4IvnaT7rfGV9GQ6WO1o2zRx2TDfueZjpNx9HiCM
         ParlaBNHpECoA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 2B6EFA0070;
        Sun, 26 Jul 2020 01:35:51 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sat, 25 Jul 2020 18:35:51 -0700
Date:   Sat, 25 Jul 2020 18:35:51 -0700
Message-Id: <cover.1595727196.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v4 00/12] usb: Handle different sublink speeds
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Roger Quadros <rogerq@ti.com>
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

Changes in v4:
 - Instead of using a single function to parse "maximum-speed" property for
   speed, gen X, and number of lanes, split those tasks to separate common
   functions
 - Revise DWC3 driver to use those new common functions
 - Fix checkpatch warnings for using "unsigned" rather than "unsigned int" and
   missing identifier name in udc_set_num_lanes_and_speed gadget ops

Changes in v3:
 - Remove "num-lanes" and "lane-speed-mantissa-gbps" common properties
 - Remove "num-lanes" and "lane-speed-mantissa-gbps" properties validation in dwc3
 - Update "maximum-speed" to support variations of SSP Gen X x Y
 - Update common function to parse new strings for "maximum-speed"
 - Update commit messages for the new changes

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
  usb: devicetree: Include USB SSP Gen X x Y
  usb: common: Add and update common functions for SSP speeds
  usb: dwc3: Initialize lane count and sublink speed
  usb: dwc3: gadget: Report sublink speed capability
  usb: dwc3: gadget: Implement setting of sublink speed
  usb: dwc3: gadget: Track connected lane and sublink speed
  usb: dwc3: gadget: Set speed only up to the max supported

 Documentation/devicetree/bindings/usb/generic.txt |  11 +-
 drivers/usb/common/common.c                       |  46 ++++++-
 drivers/usb/dwc3/core.c                           |  29 +++++
 drivers/usb/dwc3/core.h                           |  14 +++
 drivers/usb/dwc3/gadget.c                         | 143 +++++++++++++++++++++-
 drivers/usb/gadget/composite.c                    |  81 ++++++++----
 drivers/usb/gadget/udc/core.c                     |  24 +++-
 include/linux/usb/ch9.h                           |  73 +++++++++++
 include/linux/usb/gadget.h                        |  23 ++++
 9 files changed, 403 insertions(+), 41 deletions(-)


base-commit: a1ff2f6769e39055e973b068070aeea0b3bcd90f
-- 
2.11.0

