Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698F3C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:17:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49A2620732
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:17:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390734AbgDNQRU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 12:17:20 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:34585 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390547AbgDNQRR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 12:17:17 -0400
X-Greylist: delayed 478 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Apr 2020 12:17:16 EDT
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 03EG8cHm021440;
        Tue, 14 Apr 2020 18:08:38 +0200
Date:   Tue, 14 Apr 2020 18:08:38 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Sergey Matyukevich <geomatsi@gmail.com>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [bug report] armada-8040-mcbin: 5.6-rc5 boot failure
Message-ID: <20200414160838.GA21435@1wt.eu>
References: <20200413220520.GA25917@curiosity>
 <20200413222645.GT25745@shell.armlinux.org.uk>
 <20200414160354.GA463339@curiosity>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414160354.GA463339@curiosity>
User-Agent: Mutt/1.6.1 (2016-04-27)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, Apr 14, 2020 at 07:03:54PM +0300, Sergey Matyukevich wrote:
> I have not changed configuration since 5.3, so all the marvell phy
> drivers are in place. Is there anything in configuration that could
> be missed after moving from 5.3 to 5.6 kernel ?

FWIW mine works perfectly fine with 5.4 at 1G/2.5G/10G. From what I can
quickly check here are the relevant parts in my config for ethernet (not
sure all are needed though):

CONFIG_NET_VENDOR_MARVELL=y
CONFIG_MVMDIO=y
CONFIG_MVPP2=y
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_MDIO_BITBANG=y
CONFIG_MDIO_BUS_MUX=y
CONFIG_MDIO_BUS_MUX_MMIOREG=y
CONFIG_MDIO_BUS_MUX_MULTIPLEXER=y
CONFIG_MDIO_I2C=y
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
CONFIG_SFP=y
CONFIG_FIXED_PHY=y
CONFIG_MARVELL_PHY=y
CONFIG_MARVELL_10G_PHY=y

Not tested 5.6 yet.

Hoping this helps,
Willy
