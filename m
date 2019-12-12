Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CF3C3F68F
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 14:59:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50A7321655
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 14:59:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728598AbfLLO7s convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 09:59:48 -0500
Received: from mail.fuzziesquirrel.com ([173.167.31.197]:54096 "EHLO
        bajor.fuzziesquirrel.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728611AbfLLO7s (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Dec 2019 09:59:48 -0500
X-Greylist: delayed 468 seconds by postgrey-1.27 at vger.kernel.org; Thu, 12 Dec 2019 09:59:48 EST
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH v2 2/2] reset: simple: Add AST2600 compatibility string
From:   Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <2498da189d5e21ae70fb6884df6fc16ecfee2087.camel@pengutronix.de>
Date:   Thu, 12 Dec 2019 09:51:58 -0500
Cc:     Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Content-Transfer-Encoding: 8BIT
Message-Id: <EFF7E049-08C0-40A0-946A-18822C7AEEE3@fuzziesquirrel.com>
References: <20191129000827.650566-1-joel@jms.id.au>
 <20191129000827.650566-3-joel@jms.id.au>
 <2498da189d5e21ae70fb6884df6fc16ecfee2087.camel@pengutronix.de>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Philipp.  Thanks for your time.

> On Dec 2, 2019, at 7:53 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> On Fri, 2019-11-29 at 10:38 +1030, Joel Stanley wrote:
>> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>> 
>> The AST2600 SoC contains the same LPC register set as the AST2500.
> 
> If the LPC register set is exactly the same, shouldn't AST2600 reuse the
> AST2500 compatible, i.e.:
> 	compatible = "aspeed,ast2600-lpc-reset", "aspeed,ast2500-lpc-reset";
> ?

I’m not sure.  I let what was already there be my guide - the ast2500 LPC registers are the same as the ast2400 as well and those got their own compatibles.  Is there a guideline written down somewhere that backs your thinking up?

thanks - brad
