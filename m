Return-Path: <SRS0=OVGR=BU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F06BC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Aug 2020 05:21:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66C782076C
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Aug 2020 05:21:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgHJFV5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Aug 2020 01:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgHJFV5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Aug 2020 01:21:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E263C061756
        for <devicetree@vger.kernel.org>; Sun,  9 Aug 2020 22:21:56 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1k50Fr-0003Zh-Ul; Mon, 10 Aug 2020 07:21:51 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1k50Fq-0004Wf-Rj; Mon, 10 Aug 2020 07:21:50 +0200
Date:   Mon, 10 Aug 2020 07:21:50 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2] ARM: dts: imx25-pinfunc: add missing and fix wrong
 SPI related defintions
Message-ID: <20200810052150.GT31536@pengutronix.de>
References: <20200805145234.17486-1-u.kleine-koenig@pengutronix.de>
 <20200805151307.18377-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200805151307.18377-1-u.kleine-koenig@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:19:58 up 172 days, 12:50, 119 users,  load average: 0.06, 0.11,
 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
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
> ---
> Hello,
> 
> I had a wip commit in my tree which made v1 non-applicable. Here is a
> proper patch that applies to 5.8 and has an additional note in the
> commit log.
> 
> Best regards
> Uwe
> 
>  arch/arm/boot/dts/imx25-pinfunc.h | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)

I checked a few of the changes. The ones I checked are correct and match
the datasheet.

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
