Return-Path: <SRS0=sXX/=CB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130A4C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 02:12:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0CA6206C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 02:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598148773;
	bh=N9Jpax6n0a1WdPsxPRHvNwmjN0rK212QQpld4cpigoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rQNCdFzATAw4CJnhFKX0Pwsp5pUcJEuCTyGZ62cya7N+TBqck2xXkN1EVBTKrP1fV
	 h23TiXAngC3MgTQ36xx3SY7G+RPfWH3TaFW7uQF60yNIaDvoRbNJTLb0C+uCglmIy3
	 W+JtHiNz5bBo9jMtJFXLPdJKxxwAaW0ymeMYxQDU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgHWCMs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 22 Aug 2020 22:12:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:50952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbgHWCMr (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 22 Aug 2020 22:12:47 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 797E7206C0;
        Sun, 23 Aug 2020 02:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598148766;
        bh=N9Jpax6n0a1WdPsxPRHvNwmjN0rK212QQpld4cpigoI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eIfx0pVbQUnkrsoyX/Wzw8ii6jqOo7Wnc2GEOzGZrCz63O7OsgDaHc1qcoi07KFkg
         /Y1WjV+1yecVJ3Prf6hZ+z8XnyOauZ3LApQY8LdzP4lHd2o220J+HDj+0cClRK5nzb
         F3tBMf3sefwko7cZXYWUVa/h6QQIX2h69s2zapNI=
Date:   Sun, 23 Aug 2020 10:12:41 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx: Add missing imx8mm-beacon-kit.dtb to
 build
Message-ID: <20200823021241.GM30094@dragon>
References: <20200818202531.3918168-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818202531.3918168-1-robh@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Aug 18, 2020 at 02:25:31PM -0600, Rob Herring wrote:
> The imx8mm-beacon-kit.dtb was never added to dtbs-y and wasn't getting
> built. Fix it.
> 
> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied, thanks.
