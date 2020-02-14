Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BF8C352A3
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 01:02:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD6CF2168B
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 01:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581642159;
	bh=iI4IRoIO+lbDK4fEiGSt+0Lrx8P1uXJjJfDUFTQIXNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=J6BfS+WRRC3+V+bXW+n8GQU1rbpcix+Dqwc9iOknpkJdgm1BsBmhxpNrx5JfQFQFB
	 WlYHHpC2nOrart39EQUtrCUNDslaLEcjPJ7kQxsZVRA8fenZ+mD68B+Bl3stuDQVj8
	 0eYBhd6AS+6Sywj47C6gWvly/MJiH3Y0w1lAnmlI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727609AbgBNBCj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 20:02:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:43244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727595AbgBNBCj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 13 Feb 2020 20:02:39 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF30620848;
        Fri, 14 Feb 2020 01:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581642158;
        bh=iI4IRoIO+lbDK4fEiGSt+0Lrx8P1uXJjJfDUFTQIXNI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=juOXp2pcRlcI3VaelnmtxREPfmHE0tasEaNZ99IdUy48z1pFmQVVPiNNjmkm66dxZ
         hcvArqJMUJ0jk2cIGEQVDEK5o9A1Ndni5Cf+iTt/olbiV46MfoqVmMt8kySpsobjCW
         5zriQNh9cj6nfcSn7XqIwOwfytfqaFv5OQO2/OIo=
Date:   Fri, 14 Feb 2020 09:02:33 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH] ARM: dts: imx7d: fix opp-supported-hw
Message-ID: <20200214010232.GR11096@dragon>
References: <1579428300-9894-1-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579428300-9894-1-git-send-email-peng.fan@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Jan 19, 2020 at 10:09:32AM +0000, Peng Fan wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Per i.MX7D Document Number: IMX7DCEC Rev. 6, 03/2019,
> there are only consumer/industrial parts, and 1.2GHz
> is only support in consumer parts.
> 
> So exclude automotive from 792/996MHz/1.2GHz and exclude
> industrial from 1.2GHz.
> 
> Fixes: d7bfba7296ca ("ARM: dts: imx7d: Update cpufreq OPP table")
> Cc: Leonard Crestez <leonard.crestez@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks.
