Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EA4C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 15:17:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B6B1F205C9
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 15:17:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729111AbfLLPRw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 10:17:52 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33993 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728929AbfLLPRw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 10:17:52 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1ifQDn-000761-RH; Thu, 12 Dec 2019 16:17:43 +0100
Message-ID: <ccc48df65e340c52218fd45549c26174a10f410c.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: simple: Add AST2600 compatibility string
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc:     Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Date:   Thu, 12 Dec 2019 16:17:42 +0100
In-Reply-To: <EFF7E049-08C0-40A0-946A-18822C7AEEE3@fuzziesquirrel.com>
References: <20191129000827.650566-1-joel@jms.id.au>
         <20191129000827.650566-3-joel@jms.id.au>
         <2498da189d5e21ae70fb6884df6fc16ecfee2087.camel@pengutronix.de>
         <EFF7E049-08C0-40A0-946A-18822C7AEEE3@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Brad,

On Thu, 2019-12-12 at 09:51 -0500, Brad Bishop wrote:
> Hi Philipp.  Thanks for your time.
> 
> > On Dec 2, 2019, at 7:53 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > 
> > On Fri, 2019-11-29 at 10:38 +1030, Joel Stanley wrote:
> > > From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> > > 
> > > The AST2600 SoC contains the same LPC register set as the AST2500.
> > 
> > If the LPC register set is exactly the same, shouldn't AST2600 reuse the
> > AST2500 compatible, i.e.:
> > 	compatible = "aspeed,ast2600-lpc-reset", "aspeed,ast2500-lpc-reset";
> > ?
> 
> I’m not sure.  I let what was already there be my guide - the ast2500
> LPC registers are the same as the ast2400 as well and those got their
> own compatibles.  Is there a guideline written down somewhere that
> backs your thinking up?

I read section 2.3.1 "compatible" of the DeviceTree Specification [1] as
supporting that view. If all three LPC reset controllers are in fact
identical, I would argue that both ast2500 and ast2600 are compatible to
ast2400 and should be specified as:
	compatible = "aspeed,ast2500-lpc-reset", "aspeed,ast2400-lpc-reset";
and:
	compatible = "aspeed,ast2600-lpc-reset", "aspeed,ast2400-lpc-reset";
respectively.

[1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.2/devicetree-specification-v0.2.pdf

regards
Philipp

