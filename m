Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3B3C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 17:17:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A31BC20678
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 17:17:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407533AbgDNRR5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 13:17:57 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:34592 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407532AbgDNRR4 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 13:17:56 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 03EHHiGB021479;
        Tue, 14 Apr 2020 19:17:44 +0200
Date:   Tue, 14 Apr 2020 19:17:44 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Sergey Matyukevich <geomatsi@gmail.com>,
        devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [bug report] armada-8040-mcbin: 5.6-rc5 boot failure
Message-ID: <20200414171744.GC21441@1wt.eu>
References: <20200413220520.GA25917@curiosity>
 <20200413222645.GT25745@shell.armlinux.org.uk>
 <20200414160354.GA463339@curiosity>
 <20200414160838.GA21435@1wt.eu>
 <20200414165533.GX25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414165533.GX25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.6.1 (2016-04-27)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Russell,

On Tue, Apr 14, 2020 at 05:55:33PM +0100, Russell King - ARM Linux admin wrote:
> > CONFIG_MDIO_BITBANG=y
> 
> Macchiatobin doesn't bitbang the MDIO bus.
> 
> > CONFIG_MDIO_BUS_MUX=y
> 
> There's no MDIO bus muxing on Macchiatobin.
> 
> > CONFIG_FIXED_PHY=y
> 
> CONFIG_FIXED_PHY should no longer be required.
(...)

Thanks for clearing these ones out, I'll drop them on next build!
Willy
