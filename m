Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB089C43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 17:31:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B90DF207DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 17:31:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbfLDRbv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 12:31:51 -0500
Received: from gloria.sntech.de ([185.11.138.130]:46882 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726934AbfLDRbv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 4 Dec 2019 12:31:51 -0500
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1icYV9-0000uM-6T; Wed, 04 Dec 2019 18:31:47 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-rockchip@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Move xin32k fixed-clock out of PX30 DTSI
Date:   Wed, 04 Dec 2019 18:31:46 +0100
Message-ID: <2665233.YyXs6BPQ7y@diego>
In-Reply-To: <20191204171537.14163-1-miquel.raynal@bootlin.com>
References: <20191204171537.14163-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Miquel,

Am Mittwoch, 4. Dezember 2019, 18:15:37 CET schrieb Miquel Raynal:
> This clock has nothing to do in the PX30 DTSI as it is supposed to be
> an input of the SoC. Moving it to the EVB DTS (only board file using
> this DTSI) makes more sense. Also, when this clock is not a fixed
> clock and comes from eg. a PMIC the situation can be described cleanly
> in the device tree (avoids having to delete the fixed-clock node
> first).
> 
> This clock is not mandatory to boot so it should not break existing
> users.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Sorry foo being the bearer of bad news again, but that issue got already
fixed by:

arm64: dts: rockchip: remove static xin32k from px30
https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v5.5-armsoc/dts64&id=00519137f7d4fc19ff27f3d3f4fc45b5b222ae82

arm64: dts: rockchip: fix the px30-evb power tree
https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v5.5-armsoc/dts64&id=915b6a8b54a6d436885a458867e59fb20fc6356d


On most/all Rockchip the xin32k clock is actually provided by the boards
pmic - the rk809 in this case.


Heiko



