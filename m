Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D267C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 17:34:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DCEDC206C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 17:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730155AbfLLRed (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 12:34:33 -0500
Received: from muru.com ([72.249.23.125]:46548 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730116AbfLLRed (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Dec 2019 12:34:33 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0666280C0;
        Thu, 12 Dec 2019 17:35:11 +0000 (UTC)
Date:   Thu, 12 Dec 2019 09:34:30 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
        bcousson@baylibre.com, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, tomi.valkeinen@ti.com,
        laurent.pinchart@ideasonboard.com, bparrot@ti.com
Subject: Re: [PATCH] ARM: dts: am335x-evmsk: Use drm simple-panel instead of
 tilcdc-panel
Message-ID: <20191212173430.GD35479@atomide.com>
References: <20191204105554.14212-1-jsarha@ti.com>
 <1aa8c476-031a-e156-7648-c9740a98e3ee@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1aa8c476-031a-e156-7648-c9740a98e3ee@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

* Peter Ujfalusi <peter.ujfalusi@ti.com> [191204 11:26]:
> 
> 
> On 04/12/2019 12.55, Jyri Sarha wrote:
> > Move to use the new drm panel support in tilcdc together with added
> > "newhaven,nhd-4.3-480272ef-atxl"-panel support in drm panel-simple.
> 
> Tested-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

Thanks applying into omap-for-v5.6/dt.

Tony
