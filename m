Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEEAC10F27
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 08:03:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AC9420873
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 08:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583913807;
	bh=i+e9hsYmW68wGUCT151eIEEHi/A3kvscJoF3PETWz7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=0gfmrZHJA27ffbNAKYA50ug22dyohQk4XhIxIvhYZSta4m1k8kl7A4NW+x4KRBJ3l
	 GNfjQo07sn3Xor4GqEPhnjipwEDAsqiAII8If3X4HeH1kZ9LiHe1yAdMcUH2aejt5E
	 pvN2phPYp5tt9fRiXwh0n/77fcDDcv6CmYBLst/w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgCKID0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 04:03:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:51678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgCKID0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Mar 2020 04:03:26 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0C1E205C9;
        Wed, 11 Mar 2020 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583913806;
        bh=i+e9hsYmW68wGUCT151eIEEHi/A3kvscJoF3PETWz7g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MtXOd4J6/fhczVwCahGJb7ODhabdsPYvxnGvGPaJjFB2jlRPYZB1RCat3QWKvN5oq
         vlm4GfG76rm4DJvTaus+sgKraZcHTx2R1Pqx8QRyt7Z1uyMRrZRgDtrtCUbTynsBzK
         BMaw6CE+ChpL0bPWbgegluGWA0RqsdQEW0Hhb+Xg=
Date:   Wed, 11 Mar 2020 16:03:17 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: imx6qdl-gw5910: add CC1352 UART
Message-ID: <20200311080316.GW29269@dragon>
References: <1582919167-28690-1-git-send-email-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582919167-28690-1-git-send-email-tharvey@gateworks.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Feb 28, 2020 at 11:46:07AM -0800, Tim Harvey wrote:
> The GW5910-C revision adds a TI CC1352 connected to IMX UART4
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Applied, thanks.
