Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AC5CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 20:45:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99F892067B
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 20:45:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730069AbfJUUpH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 16:45:07 -0400
Received: from muru.com ([72.249.23.125]:38754 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729406AbfJUUpG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 21 Oct 2019 16:45:06 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 950C180CC;
        Mon, 21 Oct 2019 20:45:41 +0000 (UTC)
Date:   Mon, 21 Oct 2019 13:45:03 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 10/10] ARM: OMAP2+: Drop legacy platform data for musb on
 omap4
Message-ID: <20191021204503.GH5610@atomide.com>
References: <20191018163220.3504-1-tony@atomide.com>
 <20191018163220.3504-11-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018163220.3504-11-tony@atomide.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [191018 16:33]:
> We can now probe devices with ti-sysc interconnect driver and dts
> data. Let's drop the related platform data and custom ti,hwmods
> dts property.
> 
> As we're just dropping data, and the early platform data init
> is based on the custom ti,hwmods property, we want to drop both
> the platform data and ti,hwmods property in a single patch.

Turns out the ti-sysc driver is still missing swsup
quirk handling, so this patch has a dependency to:

[PATCH] bus: ti-sysc: Handle mstandby quirk and use it for musb

Regards,

Tony
