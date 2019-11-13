Return-Path: <SRS0=HlsD=ZF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E20EC43331
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 03:36:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 40156222BD
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 03:36:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfKMDf7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 22:35:59 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:54288 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfKMDf7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 Nov 2019 22:35:59 -0500
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 543AE154FF68E;
        Tue, 12 Nov 2019 19:35:58 -0800 (PST)
Date:   Tue, 12 Nov 2019 19:35:57 -0800 (PST)
Message-Id: <20191112.193557.2087258530355949302.davem@davemloft.net>
To:     wahrenst@gmx.net
Cc:     matthias.bgg@kernel.org, mbrugger@suse.com, robh+dt@kernel.org,
        f.fainelli@gmail.com, eric@anholt.net, nsaenzjulienne@suse.de,
        opendmb@gmail.com, netdev@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V5 net-next 0/7] ARM: Enable GENET support for RPi 4
From:   David Miller <davem@davemloft.net>
In-Reply-To: <1573501766-21154-1-git-send-email-wahrenst@gmx.net>
References: <1573501766-21154-1-git-send-email-wahrenst@gmx.net>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Tue, 12 Nov 2019 19:35:59 -0800 (PST)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Stefan Wahren <wahrenst@gmx.net>
Date: Mon, 11 Nov 2019 20:49:19 +0100

> Raspberry Pi 4 uses the broadcom genet chip in version five.
> This chip has a dma controller integrated. Up to now the maximal
> burst size was hard-coded to 0x10. But it turns out that Raspberry Pi 4
> does only work with the smaller maximal burst size of 0x8.
> 
> Additionally the patch series has some IRQ retrieval improvements and
> adds support for a missing PHY mode.
> 
> This series based on Matthias Brugger's V1 series [1].
> 
> [1] - https://patchwork.kernel.org/cover/11186193/

What tree should this be applied to?  Patch #7 does not apply to net-next.
