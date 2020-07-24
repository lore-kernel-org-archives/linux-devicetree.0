Return-Path: <SRS0=+aE9=BD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2134BC433E5
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 23:38:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F352720748
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 23:38:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AFQF4Osf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgGXXia (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jul 2020 19:38:30 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:52766 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726552AbgGXXia (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Jul 2020 19:38:30 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 990B140152;
        Fri, 24 Jul 2020 23:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595633909; bh=VhaQPHDSmZ4GoM+re9t+VKZhlTMi1ZX25Xykmc9c6N8=;
        h=Date:From:Subject:To:Cc:From;
        b=AFQF4Osfy/21dsunja8DnRR+gYc96BsBo65UGuypNSZXkDcJq0q6GcUnFk8nOgj76
         RirBaiLzlRM85Cv30WrRjaWne7mwuufCgmY3lL37Byct5zN3kDKAeIs5A8g1EG91xB
         WnGOsocYLmNVpR1BXVHtqr4fwYAxW2tdA4ZxBsJ4B6cIWAdYoL2562iPTVBJcCODNe
         SDxhfx1J6k4GVwWWKAPwWtyYpWb8UEYNRyNbVPmhiAUUj/o9Zh/EeI1/qJFytT+WUL
         ntDtsWuynnqJvbaeNbjyvtfyK2n1y0UTlK5q0J97LzEl4D/EgghGobrmiQulO3r5OH
         r5MiS3pPC0Lcw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id CDE0BA006F;
        Fri, 24 Jul 2020 23:38:26 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 24 Jul 2020 16:38:26 -0700
Date:   Fri, 24 Jul 2020 16:38:26 -0700
Message-Id: <cover.1595631457.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 00/12] usb: Handle different sublink speeds
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
  usb: common: Add function to get num_lanes and transfer rate
  usb: dwc3: Initialize lane count and sublink speed
  usb: dwc3: gadget: Report sublink speed capability
  usb: dwc3: gadget: Implement setting of sublink speed
  usb: dwc3: gadget: Track connected lane and sublink speed
  usb: dwc3: gadget: Set speed only up to the max supported

 Documentation/devicetree/bindings/usb/generic.txt |  11 +-
 drivers/usb/common/common.c                       |  47 ++++++-
 drivers/usb/dwc3/core.c                           |  31 ++++-
 drivers/usb/dwc3/core.h                           |  14 +++
 drivers/usb/dwc3/gadget.c                         | 143 +++++++++++++++++++++-
 drivers/usb/gadget/composite.c                    |  81 ++++++++----
 drivers/usb/gadget/udc/core.c                     |  24 +++-
 include/linux/usb/ch9.h                           |  68 ++++++++++
 include/linux/usb/gadget.h                        |  23 ++++
 9 files changed, 398 insertions(+), 44 deletions(-)


base-commit: a95fcda246dc3e9f5d00222c9a8f0a76aa0bb950
-- 
2.11.0

