Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA9EC34022
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 14:47:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F3F624691
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 14:47:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="x9fQ2Kcf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732073AbgB0OrL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 09:47:11 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:36834 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730243AbgB0Nol (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 27 Feb 2020 08:44:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Wlqm5yO3sFMsmDV1JmpAYUQTcF3AWWzbFbmwVenuNi4=; b=x9fQ2KcfIa87GKV6IIwOOHugsb
        lgy5Vqs0U5rjSv8eMKkRzEj65tSOW0HIGX5nYL3CazMGaPEzB4eovF5LnkoSG4UW2Ztdu8QyW1iL2
        XE9Fjy6u76JIPPUSksobIbAtZluj+B4rkMJpIY/phou6ep58D2kPj5EWSv0iwW/lu0gw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1j7JSk-0005E6-1H; Thu, 27 Feb 2020 14:44:26 +0100
Date:   Thu, 27 Feb 2020 14:44:26 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: mcbin: support 2W SFP modules
Message-ID: <20200227134426.GB19662@lunn.ch>
References: <E1j7HyM-0004Zc-HY@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1j7HyM-0004Zc-HY@rmk-PC.armlinux.org.uk>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 27, 2020 at 12:08:58PM +0000, Russell King wrote:
> Allow the SFP cages to be used with 2W SFP modules.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
