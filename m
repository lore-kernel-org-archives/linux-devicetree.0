Return-Path: <SRS0=uucL=YV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06316CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 06:04:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7EBA21726
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 06:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572242668;
	bh=fUhaJejjhGsyaU4tabIkYSCff9Y7Eg48Ic6zL2MqL2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1DHP8OHzvUryJKSBN7/D7FGs+Gzv4BYXiMtI+CGaz20G/AmFZy9Enk60VvKUuzipd
	 npJQEcemp5dkenCVdvFWS2JwPnO7cbIkPa31mFxJQhlE/zDHHsUkRmu0vk5nQcitkn
	 P/NqHFpI9cdngD2rXucf5pw5MJXt5bGCYFuZEijs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731443AbfJ1GE2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 28 Oct 2019 02:04:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:46262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730394AbfJ1GE2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 28 Oct 2019 02:04:28 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9878E20873;
        Mon, 28 Oct 2019 06:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572242667;
        bh=fUhaJejjhGsyaU4tabIkYSCff9Y7Eg48Ic6zL2MqL2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SRAACqR1CDXrg2bu4L31b/LHC6IaB4P5kGU3pzDwgvzrgFyc8Pq90ccfRaMrHTpQV
         +kyBXHZ4+4TYW845p69iqQKyGpAXX9HPAydspS2eRFKAJeCm+vSlLTPkx5u+pZpcWd
         5TxrLXpY9qSc4oMVGLxq+ixoE8/n7H6OxCVNg5No=
Date:   Mon, 28 Oct 2019 14:04:07 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Jun Li <jun.li@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Duan <fugang.duan@nxp.com>
Subject: Re: [PATCH V2 1/2] arm64: dts: imx8mm-evk: add phy-reset-gpios for
 fec1
Message-ID: <20191028060406.GK16985@dragon>
References: <1571652977-4754-1-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571652977-4754-1-git-send-email-peng.fan@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Oct 21, 2019 at 10:19:17AM +0000, Peng Fan wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> We should not rely on bootloader to configure the phy reset.
> So introduce phy-reset-gpios property to let Linux handle phy reset
> itself.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

Applied both, thanks.
