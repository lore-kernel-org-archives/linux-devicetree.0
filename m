Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4054C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 16:10:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A77B207DA
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 16:10:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgHRQKO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 12:10:14 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:59362 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726711AbgHRQKG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 18 Aug 2020 12:10:06 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1k84BW-009w0Q-Bz; Tue, 18 Aug 2020 18:10:02 +0200
Date:   Tue, 18 Aug 2020 18:10:02 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Landen Chao <landen.chao@mediatek.com>
Cc:     f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com,
        matthias.bgg@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        davem@davemloft.net, sean.wang@mediatek.com, opensource@vdorst.com,
        frank-w@public-files.de, dqfext@gmail.com
Subject: Re: [PATCH net-next v2 6/7] arm64: dts: mt7622: add mt7531 dsa to
 mt7622-rfb1 board
Message-ID: <20200818161002.GG2330298@lunn.ch>
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <fb458715fc82b2222674d857d16841da57920990.1597729692.git.landen.chao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb458715fc82b2222674d857d16841da57920990.1597729692.git.landen.chao@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Aug 18, 2020 at 03:14:11PM +0800, Landen Chao wrote:
> Add mt7531 dsa to mt7622-rfb1 board for 5 giga Ethernet ports support.
> mt7622 only supports 1 sgmii interface, so either gmac0 or gmac1 can be
> configured as sgmii interface. In this patch, change to connet mt7622

connect

	Andrew
