Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D43C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 17:38:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11614206CB
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 17:38:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbfKTRi5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 12:38:57 -0500
Received: from muru.com ([72.249.23.125]:43050 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727656AbfKTRi5 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 20 Nov 2019 12:38:57 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B918E811B;
        Wed, 20 Nov 2019 17:39:33 +0000 (UTC)
Date:   Wed, 20 Nov 2019 09:38:53 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] ARM: dts: omap3-tao3530: Fix incorrect MMC card
 detection GPIO polarity
Message-ID: <20191120173853.GS35479@atomide.com>
References: <20191116151651.7042-1-jarkko.nikula@bitmer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191116151651.7042-1-jarkko.nikula@bitmer.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

* Jarkko Nikula <jarkko.nikula@bitmer.com> [191116 07:59]:
> The MMC card detection GPIO polarity is active low on TAO3530, like in many
> other similar boards. Now the card is not detected and it is unable to
> mount rootfs from an SD card.
> 
> Fix this by using the correct polarity.
> 
> This incorrect polarity was defined already in the commit 30d95c6d7092
> ("ARM: dts: omap3: Add Technexion TAO3530 SOM omap3-tao3530.dtsi") in v3.18
> kernel and later changed to use defined GPIO constants in v4.4 kernel by
> the commit 3a637e008e54 ("ARM: dts: Use defined GPIO constants in flags
> cell for OMAP2+ boards").
> 
> While the latter commit did not introduce the issue I'm marking it with
> Fixes tag due the v4.4 kernels still being maintained.

Thanks applying into omap-for-v5.5/dt.

Tony
