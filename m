Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87F0C2BD09
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 06:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BD4920726
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 06:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575872442;
	bh=xx/kMdZFsXWmIP1cEByJCGhN3/wIkksEuxaZs0yioW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Q5WV9XsshY6giadYVSZLav5fFjLom/l3RYgECIPwFeAxr2hodJMEYRs1ghxgAbmTl
	 kNGWHCDQTbUp/8ikqWGXxVrUCPWyS3fTV7KmlSHeXf1RKMENNIxiieHhBcAIghD+MB
	 Jw2GqpiMMYZhJTL1j7lvuTB8/WBT9ESEL8ImBwVw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbfLIGUl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 01:20:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:59672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbfLIGUk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 9 Dec 2019 01:20:40 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F1D920721;
        Mon,  9 Dec 2019 06:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575872440;
        bh=xx/kMdZFsXWmIP1cEByJCGhN3/wIkksEuxaZs0yioW8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RX8fG32HbIJJZGLMAaFuULZMUeNGr8rsjLwyycgNvutc2gCx6ERCv3AQlDZ1hlUIE
         Sv44Ulyd3DTYT1kOsGqVSfzHzornvHPqYqBUcGbjN7RSlaXGTGmeKOH++tvR8Ykdq+
         xp+YvwqF3y+MHG/cj8CWFwLpQYZzseu887FG9g74=
Date:   Mon, 9 Dec 2019 14:20:15 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH] arm64: dts: imx8mq: increase NOC clock to 800 MHz
Message-ID: <20191209062014.GA3365@dragon>
References: <20191127110509.29905-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127110509.29905-1-l.stach@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 27, 2019 at 12:05:09PM +0100, Lucas Stach wrote:
> From: Philipp Zabel <p.zabel@pengutronix.de>
> 
> The NOC clock defaults to 400 MHz. Increase it to 800 MHz for improved
> memory performance.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied, thanks.
