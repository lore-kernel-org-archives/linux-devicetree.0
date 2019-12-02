Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264CFC432C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 12:53:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E738920833
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 12:53:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfLBMxs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 07:53:48 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58201 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727362AbfLBMxs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 07:53:48 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iblCv-0005Dy-AR; Mon, 02 Dec 2019 13:53:41 +0100
Message-ID: <2498da189d5e21ae70fb6884df6fc16ecfee2087.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: simple: Add AST2600 compatibility string
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Brad Bishop <bradleyb@fuzziesquirrel.com>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Date:   Mon, 02 Dec 2019 13:53:37 +0100
In-Reply-To: <20191129000827.650566-3-joel@jms.id.au>
References: <20191129000827.650566-1-joel@jms.id.au>
         <20191129000827.650566-3-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 2019-11-29 at 10:38 +1030, Joel Stanley wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> 
> The AST2600 SoC contains the same LPC register set as the AST2500.

If the LPC register set is exactly the same, shouldn't AST2600 reuse the
AST2500 compatible, i.e.:
	compatible = "aspeed,ast2600-lpc-reset", "aspeed,ast2500-lpc-reset";
?

> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/reset/reset-simple.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> index 067e7e7b34f1..795c9063fe7b 100644
> --- a/drivers/reset/reset-simple.c
> +++ b/drivers/reset/reset-simple.c
> @@ -125,6 +125,7 @@ static const struct of_device_id reset_simple_dt_ids[] = {
>  		.data = &reset_simple_active_low },
>  	{ .compatible = "aspeed,ast2400-lpc-reset" },
>  	{ .compatible = "aspeed,ast2500-lpc-reset" },
> +	{ .compatible = "aspeed,ast2600-lpc-reset" },
>  	{ .compatible = "bitmain,bm1880-reset",
>  		.data = &reset_simple_active_low },
>  	{ .compatible = "snps,dw-high-reset" },

regards
Philipp

