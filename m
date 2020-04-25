Return-Path: <SRS0=EFsK=6J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABB2C2BA1A
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Apr 2020 01:35:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9028D2076C
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Apr 2020 01:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587778555;
	bh=NuUXrLv2uLvTteae+JnaWLYHig2mTbcSLJKImdqctg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=c3WLoG54qwmvkyBOo6pyfuNNK3Onesp3COGSBZKSR/dtgSw/nZgmSEi62yIS020ka
	 nwFf/pYyK2UO/dCvPRPDFl6ecnjFatZxQTHC5w56+5Onb0P3ApnM30L7XrJWUIzGIW
	 2y31iYecm7I261w9ZaKhdU+PPbQ/n8eWfs+hUBM8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgDYBfz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Apr 2020 21:35:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:38866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbgDYBfy (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Apr 2020 21:35:54 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D5F220736;
        Sat, 25 Apr 2020 01:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587778554;
        bh=NuUXrLv2uLvTteae+JnaWLYHig2mTbcSLJKImdqctg4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VVaL+kZvrA4R1fWA5oOSC8VfR3CiEJUMMEDGiV7KVeKbFwchH4aPX12X/QtCm0uRb
         ISSN+zqr/FILTvRCOl5GzNlhRJwxtX1vW19t9GGO6gKAZLRzuGi7ePqRZbcKzt6Z1y
         FrFXGQS2nqV/ym3+Yv44jIBny7i8Z/7wzvcMHHYI=
Date:   Sat, 25 Apr 2020 09:35:46 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     peng.fan@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8m: Fix AIPS reg properties
Message-ID: <20200425013546.GK8571@dragon>
References: <20200331183725.25255-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200331183725.25255-1-festevam@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Mar 31, 2020 at 03:37:25PM -0300, Fabio Estevam wrote:
> Commit dc3efc6ff0d5 ("arm64: dts: imx8m: fix aips dts node") caused several
> dtc warnings like these when building with W=1:
> 
> arch/arm64/boot/dts/freescale/imx8mm.dtsi:265.23-542.5: Warning (simple_bus_reg): /soc@0/bus@30000000: simple-bus unit address format error, expected "301f0000"
> arch/arm64/boot/dts/freescale/imx8mm.dtsi:544.23-602.5: Warning (simple_bus_reg): /soc@0/bus@30400000: simple-bus unit address format error, expected "305f0000"
> arch/arm64/boot/dts/freescale/imx8mm.dtsi:604.23-862.5: Warning (simple_bus_reg): /soc@0/bus@30800000: simple-bus unit address format error, expected "309f0000"
> arch/arm64/boot/dts/freescale/imx8mm.dtsi:864.23-909.5: Warning (simple_bus_reg): /soc@0/bus@32c00000: simple-bus unit address format error, expected "32df0000"
> 
> Fix them by using the correct address base and size in the AIPS reg
> properties.
> 
> Fixes: dc3efc6ff0d5 ("arm64: dts: imx8m: fix aips dts node")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks.
