Return-Path: <SRS0=gY8B=4F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259C4C35242
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Feb 2020 07:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ECE3320718
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Feb 2020 07:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581924568;
	bh=PzJnrAL6dkjz00fAFrEN8q+0YVZh2JFrrbuh0fisg+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Cc5zvbapeS7bm9eF/LR1CTzCeAff0bvrw4iJDCb2ZwheoSwC4ImoAmZayC0rbiaYP
	 WJF6EoZl1Je2jFy+D9nmHK5w1IXVL7C2HqYLqVJefn6c2aIXaJvOtEZm8pACzLPoHF
	 D7Z9lXibfDjNf/bzCqjJs5Z/ym4BPif8oGzgj9pE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgBQH31 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Feb 2020 02:29:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:58706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725855AbgBQH31 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 17 Feb 2020 02:29:27 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A4CC20702;
        Mon, 17 Feb 2020 07:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581924566;
        bh=PzJnrAL6dkjz00fAFrEN8q+0YVZh2JFrrbuh0fisg+Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I4YH1e0UVDh7EPKnEJsRt6NZTF1zNwH/ttGxk7FFyy6yj1PPssxqCAYd1AGi+aRxr
         tNpzWA6JnnaRFr8O3H9RXy/03mGDPfMMqrTcnU4C+Mwbpn+AKQn5gfomYeSnXiNhUW
         aVtMKTCHXRh6SiG2WKuHvZCnpEnunljLSmAchr7U=
Date:   Mon, 17 Feb 2020 15:29:20 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Robert Jones <rjones@gateworks.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: dts: imx6qdl-gw553x.dtsi: add lsm9ds1 iio
 imu/magn support
Message-ID: <20200217072919.GF7973@dragon>
References: <20200214210241.32611-1-rjones@gateworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200214210241.32611-1-rjones@gateworks.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Feb 14, 2020 at 01:02:41PM -0800, Robert Jones wrote:
> Add one node for the accel/gyro i2c device and another for the separate
> magnetometer device in the lsm9ds1.
> 
> Signed-off-by: Robert Jones <rjones@gateworks.com>

Applied, thanks.
