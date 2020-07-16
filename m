Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52806C433E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 21:58:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 287632082E
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 21:58:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VeAeACVO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgGPV6c (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 17:58:32 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:46054 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726007AbgGPV6c (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jul 2020 17:58:32 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8EDA7401D7;
        Thu, 16 Jul 2020 21:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594936712; bh=sK0ThbhK5CcurT3pB2csZyciDvpT2tyMTxoy+PRzJsQ=;
        h=Date:From:Subject:To:Cc:From;
        b=VeAeACVOA7S/ZMw+TnkTTaRba+0Hvugg4PluiXbBvL6SN2isF2D6uouKmRRJM+pkU
         5gPKJ4R2VjEOhVphxzb0ADvVwh+JMBhEMdwjxWKW3vtdL8uRj58EfDTou3bendTo4i
         CAGoX/QfKnOlFfy2eTc2ATS1K20GYT2OkSMjfcabBMKcrV5ptHKXVI69ak7t6rOgEH
         Y+dNLv9+AOZKaI9kONnemTGULZrS21SQBWKHnZmnUPcdCR1QNkhnnsem4a/RZO1Gu0
         2o2Lj17B9zUyskmZPKoWZDcgkKnfnRLpWmDJDYUF43mStybrKtWD06eYz7UB5IuB3u
         s409IfCm8J0Sg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id C599EA0258;
        Thu, 16 Jul 2020 21:58:29 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 16 Jul 2020 14:58:29 -0700
Date:   Thu, 16 Jul 2020 14:58:29 -0700
Message-Id: <cover.1594935978.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 00/11] usb: Handle different sublink speeds
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Peter Chen <peter.chen@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Roger Quadros <rogerq@ti.com>, Jun Li <jun.li@nxp.com>
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


Thinh Nguyen (11):
  usb: ch9: Add sublink speed struct
  usb: gadget: composite: Avoid using magic numbers
  usb: gadget: Expose sublink speed attributes
  usb: gadget: Set max speed for SSP devices
  usb: composite: Properly report sublink speed
  usb: devicetree: dwc3: Introduce num-lanes and lsm
  usb: dwc3: Initialize lane count and sublink speed
  usb: dwc3: gadget: Report sublink speed capability
  usb: dwc3: gadget: Implement setting of sublink speed
  usb: dwc3: gadget: Track connected lane and sublink speed
  usb: dwc3: gadget: Set speed only up to the max supported

 Documentation/devicetree/bindings/usb/dwc3.txt |   9 ++
 drivers/usb/dwc3/core.c                        |  64 ++++++++++++
 drivers/usb/dwc3/core.h                        |  18 ++++
 drivers/usb/dwc3/gadget.c                      | 135 ++++++++++++++++++++++++-
 drivers/usb/gadget/composite.c                 |  81 ++++++++++-----
 drivers/usb/gadget/udc/core.c                  |  24 ++++-
 include/linux/usb/gadget.h                     |  23 +++++
 include/uapi/linux/usb/ch9.h                   |  42 ++++++++
 8 files changed, 360 insertions(+), 36 deletions(-)

-- 
2.11.0

