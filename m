Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8154C35670
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 01:50:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87CC6206E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 01:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582509019;
	bh=BHbX0dzJ+RDTEj20NMtQygp2i3dFAGU+5IWzqxCVD9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=B8AhvJYg/7svM2b2GID9RDqNJE9WJKA4BTjBF17TnrAHWppqL14V3KhLBDEAz9tIc
	 +gJt7bHFmlYtm6SiS5aZwi3hyz2a7J3J8wkGiKPvPyZD1GakLrgceItmpr57x9GtTO
	 1YBk89duS0SeM33mqtO0ga4qnKIdB4T+eha/Eph4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbgBXBuT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 23 Feb 2020 20:50:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:50798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727151AbgBXBuT (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 23 Feb 2020 20:50:19 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C38720675;
        Mon, 24 Feb 2020 01:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582509018;
        bh=BHbX0dzJ+RDTEj20NMtQygp2i3dFAGU+5IWzqxCVD9o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cqzi/aZ5l9kh1c2/loUGO4XbbWvuJleFGzzedg4i3IJC8msCUnMs8/HqO10Y7AHcA
         qqNg2Sww2oztrMNHtkTOBpEbpq/VjFcMRP9QXAPDOoLO9DdJfx/qw9L0ClCDJ+Sf0f
         iqBgKsFLCLyZgfviC0PpULixHxznPLlVhQCUk+y4=
Date:   Mon, 24 Feb 2020 09:50:13 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH] arm64: dts: imx8mp-evk: Add GPIO LED support
Message-ID: <20200224015012.GC27688@dragon>
References: <1582002899-21391-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582002899-21391-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Feb 18, 2020 at 01:14:59PM +0800, Anson Huang wrote:
> i.MX8MP EVK board has a GPIO LED to indicate status, add support for it.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
