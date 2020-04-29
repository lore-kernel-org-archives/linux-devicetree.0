Return-Path: <SRS0=VloT=6N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61883C83001
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 02:44:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3622C2073E
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 02:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588128262;
	bh=iKaEe0wr+T3cUT/15Dj5pKEtbeFfU3hERoXeJ5Grxw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=pXMATvOw3u9s7qcvIiskkmfOpX59QJlHYX/iOubHF3MIFLb4PcRbUnU+qaIX+wig6
	 rUt3ZGVl14gmmx76kCsDwL3eTaBd2kMbyuQj2O/u6SpdLFSNfmxugHPmyJ1TXaBupS
	 zszjfluxgKZOapdrDKDziFi8MuCRmO3beXEuDTeA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgD2CoV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 22:44:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:33152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgD2CoV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Apr 2020 22:44:21 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2105D20737;
        Wed, 29 Apr 2020 02:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588128261;
        bh=iKaEe0wr+T3cUT/15Dj5pKEtbeFfU3hERoXeJ5Grxw4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s+P5EFUNmDhJCFYcVgXyNzSE/ZgV3ZgcLPDt+g+W3CiMPo8uZRuOqnnOiDCnI7bJY
         GKrImGkc17aBQneRU/gs1ThRNLvAGOJU04Dn9fNFUuocIi9cTiw3nJFZrb67APV1Lh
         HqaI7gjm+eFHAEGIcHKoLn5MqQyXzNZqCuDd/1sk=
Date:   Wed, 29 Apr 2020 10:44:15 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH] arm: dts: imx6-sr-som: add ethernet PHY configuration
Message-ID: <20200429024414.GK32592@dragon>
References: <E1jOkD3-00067R-RZ@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1jOkD3-00067R-RZ@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 15, 2020 at 04:44:17PM +0100, Russell King wrote:
> Add ethernet PHY configuration ahead of removing the quirk that
> configures the clocking mode for the PHY.  The RGMII delay is
> already set correctly.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Changed the subject prefix to 'ARM: ...', and applied the patch.

Shawn
