Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06743C33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 13:58:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE1412075A
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 13:58:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="T7WtDgol"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgAFN6J (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 08:58:09 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:48964 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726300AbgAFN6J (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 6 Jan 2020 08:58:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=97+1a0OUmjC005rZI2tCejdDM4hZZ9AyUJJceGu9StM=; b=T7WtDgolImD6JVRK4kcLdtzCTi
        qq3qabUVAs0su2WIg4hXpmgkBYYI0MocWzqm8iB6hzEgdtObegQ6glPPeh+2fAZH30Mnmn2E4nu8z
        S1bZ7iGGlNahf0hXPF9MZ/lgAM0a6rBDO2ZV788vOsuLZNUdViAzJkMwtYx/6bG2EwT8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1ioStL-00081l-CN; Mon, 06 Jan 2020 14:57:59 +0100
Date:   Mon, 6 Jan 2020 14:57:59 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     "Madalin Bucur (OSS)" <madalin.bucur@oss.nxp.com>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
Subject: Re: [PATCH 1/6] net: phy: add interface modes for XFI, SFI
Message-ID: <20200106135759.GA23820@lunn.ch>
References: <VI1PR04MB5567FA3170CF45F877870E8CEC520@VI1PR04MB5567.eurprd04.prod.outlook.com>
 <20191223120730.GO25745@shell.armlinux.org.uk>
 <DB8PR04MB69858081021729EC70216BE3EC230@DB8PR04MB6985.eurprd04.prod.outlook.com>
 <20200103092718.GB25745@shell.armlinux.org.uk>
 <20200103094204.GA18808@shell.armlinux.org.uk>
 <DB8PR04MB698591AAC029ADE9F7FFF69BEC230@DB8PR04MB6985.eurprd04.prod.outlook.com>
 <20200103125310.GE25745@shell.armlinux.org.uk>
 <DB8PR04MB6985FB286A71FC6CFF04BE50EC230@DB8PR04MB6985.eurprd04.prod.outlook.com>
 <20200103171952.GH25745@shell.armlinux.org.uk>
 <DB8PR04MB698500B73BDA9794D242BEDAEC3C0@DB8PR04MB6985.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB8PR04MB698500B73BDA9794D242BEDAEC3C0@DB8PR04MB6985.eurprd04.prod.outlook.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> You missed my argument about the device tree describing the HW (thus the
> wires, electrical aspects too) and not configuring a certain protocol (the
> device tree does not configure HW, it describes HW).

Hi Madalin

You have lots of different points here. I'm just picking out one.

I would say this is a grey area. You need to ensure both devices on
the XFI bus are using the same protocol. There are a few ways you
could do this:

The MAC and the PHY tells phylink what each is capable of, and phylink
picks a common protocol.

Leave it to the boot loader/firmware and cross your fingers.

Make a design decision, this board will use protocol X, and put that
in device tree. It is describing how we expect the hardware to be
used.

The Marvell SERDES interfaces are pretty generic. They can be used for
SATA, USB3, or networking. But these are all protocols running on top
of SERDES. So would you argue we cannot describe in device tree that
one SERDES is to be used for USB and another for SATA?

    Andrew
