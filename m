Return-Path: <SRS0=iyGu=CA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED9CC433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Aug 2020 12:41:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A6A2207CD
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Aug 2020 12:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598100062;
	bh=2MEB/EpkgEjygu93zOH96kHi0tiYvZQ3dX8G3O2h94M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=BqYVh0HZQUfkF8uodZ7tdPlOfF4ScGYaJHGqABCWU5RhJ0TpxPLl7l/YDmgHU+1Lf
	 z5/onjpVoKetJdiCgvYPy+mXNBvb7sJ5CW+u2cWnBVb10rcNiChY9Q6CyM6zKMyt6b
	 OxIZmpVUAGqSLTb6XUuYHOo6mUARIsJKkK+hsHcg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgHVMlB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 22 Aug 2020 08:41:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:32952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727827AbgHVMlB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 22 Aug 2020 08:41:01 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED63A20720;
        Sat, 22 Aug 2020 12:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598100061;
        bh=2MEB/EpkgEjygu93zOH96kHi0tiYvZQ3dX8G3O2h94M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZGJA3J3Ss1to5Va8T3Ni09kYdp6C0dXiQi0/AfVZ/nC/N4VS8LBtGKjb9QhpcI6mX
         eoRqom4qFQdwFVnhIR2HE+ocpvKMJIE/EgNrelmD2stnmnB7Z4I5WeBYGfepbR1om+
         T7zif43hDNrmud4NHImLYhiD1hi285XeaK0b3rYk=
Date:   Sat, 22 Aug 2020 20:40:56 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: dts: imx25-pinfunc: add missing and fix wrong
 SPI related defintions
Message-ID: <20200822124055.GK27575@dragon>
References: <20200805145234.17486-1-u.kleine-koenig@pengutronix.de>
 <20200805151307.18377-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200805151307.18377-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 05, 2020 at 05:13:07PM +0200, Uwe Kleine-König wrote:
> I used the i.MX25 Reference Manual (Rev 2 01/2011) as source for these
> additions and fixes.
> 
> No mainline dts is affected by the fixes (nor obviously by the
> additions).
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied, thanks.
