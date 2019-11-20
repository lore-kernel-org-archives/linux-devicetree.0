Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3861DC432C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 17:42:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 156402080F
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 17:42:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfKTRl4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 12:41:56 -0500
Received: from muru.com ([72.249.23.125]:43074 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726675AbfKTRl4 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 20 Nov 2019 12:41:56 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8AC54811B;
        Wed, 20 Nov 2019 17:42:32 +0000 (UTC)
Date:   Wed, 20 Nov 2019 09:41:52 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Faiz Abbas <faiz_abbas@ti.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, mark.rutland@arm.com,
        robh+dt@kernel.org, bcousson@baylibre.com, robertcnelson@gmail.com
Subject: Re: [PATCH] ARM: dts: am57xx-beagle-x15: Update pinmux name to
 ddr_3_3v
Message-ID: <20191120174152.GT35479@atomide.com>
References: <20191118111654.9843-1-faiz_abbas@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118111654.9843-1-faiz_abbas@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

* Faiz Abbas <faiz_abbas@ti.com> [191118 03:16]:
> am57xx-beagle-x15 revb1 and revc have 3.3V connected to the eMMC I/O
> lines. Update the pinmux name to reflect this.

Thanks applying into omap-for-v5.5/dt.

Tony
