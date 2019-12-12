Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75D9C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 17:33:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AE0724654
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 17:33:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730172AbfLLRdS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 12:33:18 -0500
Received: from muru.com ([72.249.23.125]:46536 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730023AbfLLRdR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Dec 2019 12:33:17 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7FB7C80C0;
        Thu, 12 Dec 2019 17:33:56 +0000 (UTC)
Date:   Thu, 12 Dec 2019 09:33:14 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, bcousson@baylibre.com,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com,
        peter.ujfalusi@ti.com, bparrot@ti.com
Subject: Re: [PATCH v2] ARM: dts: am335x-evm: Use drm simple-panel instead of
 tilcdc-panel
Message-ID: <20191212173314.GC35479@atomide.com>
References: <20191203091119.3352-1-jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203091119.3352-1-jsarha@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

* Jyri Sarha <jsarha@ti.com> [191203 01:12]:
> Move to use the new drm panel support in tilcdc together with added
> "tfc,s9700rtwv43tr-01b"-panel support in drm panel-simple.
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> "tfc,s9700rtwv43tr-01b" in panel-simple has been in for some time now
> so it is about time to get this in too.

Thanks applying into omap-for-v5.6/dt.

Tony
