Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885C3C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 14:15:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6ABD02073F
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 14:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfLCOPo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 09:15:44 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56917 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbfLCOPn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 09:15:43 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1ic8xc-0000WJ-QZ; Tue, 03 Dec 2019 15:15:28 +0100
Message-ID: <5ca8ff65b8489195ef5349cd2d074d412c9d0036.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] reset: hisilicon: Extend reset operation type
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Jun Nie <jun.nie@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wei Xu <xuwei5@hisilicon.com>, opensource@jilayne.com,
        swinslow@gmail.com, allison@lohutok.net, yuehaibing@huawei.com,
        tglx@linutronix.de, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        xuejiancheng@hisilicon.com
Date:   Tue, 03 Dec 2019 15:15:28 +0100
In-Reply-To: <CABymUCNDZSH+mB9TyyUBwgRu-qTRbgUv89va2HuBs4VeJWn6uA@mail.gmail.com>
References: <20191202144524.5391-1-jun.nie@linaro.org>
         <20191202144524.5391-3-jun.nie@linaro.org>
         <449968d8f085a1d1fcf4018bb8efe454fa35b3e3.camel@pengutronix.de>
         <CABymUCNDZSH+mB9TyyUBwgRu-qTRbgUv89va2HuBs4VeJWn6uA@mail.gmail.com>
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

Hi Jun,

On Tue, 2019-12-03 at 11:53 +0800, Jun Nie wrote:
[...]
> @@ -48,13 +56,33 @@ static int hisi_reset_assert(struct reset_controller_dev *rcdev,
> > >       u32 offset, reg;
> > >       u8 bit;
> > > 
> > > +     flags = (id & HISI_RESET_FLAG_MASK) >> HISI_RESET_FLAG_SHIFT;
> > > +     if (flags & HISI_ASSERT_NONE)
> > > +             return -ENOTSUPP; /* assert not supported for this reset */
> > 
> > As long as .assert and .deassert are the only implemented operations for
> > this reset controller, this does not make any sense to me. Are there
> > resets that can only be deasserted?
> 
> Some reset is asserted on power on automatically. So only .deassert is needed.

But if the bit was set/cleared again after being deasserted, would it
assert the reset line? Basically, I wonder if those bits are write-once
or not.

[...]
> > > +             if (flags & HISI_ASSERT_SET)
> > > +                     return readl_poll_timeout(rstc->membase + offset,
> > > +                                               reg, reg & BIT(bit), 0, 5000);
> > > +             else
> > > +                     return readl_poll_timeout(rstc->membase + offset,
> > > +                                               reg, !(reg & BIT(bit)),
> > > +                                               0, 5000);
> > 
> > And this is effectively dead code. Do you really have hardware that
> > asserts or asserts a reset line in reaction to a read access?
> > 
> > Should HISI_ASSERT_POLL and HISI_DEASSERT_POLL be mutually exclusive?

This is missing an explanation.

[...]
> > > +     writel(reg, rstc->membase + offset);
> > > 
> > >       spin_unlock_irqrestore(&rstc->lock, flags);
> > > 
> > > @@ -69,13 +97,33 @@ static int hisi_reset_deassert(struct reset_controller_dev *rcdev,
> > >       u32 offset, reg;
> > >       u8 bit;
> > > 
> > > +     flags = (id & HISI_RESET_FLAG_MASK) >> HISI_RESET_FLAG_SHIFT;
> > > +     if (flags & HISI_DEASSERT_NONE)
> > > +             return -ENOTSUPP; /* deassert not supported for this reset */
> > > +
> > 
> > Are there resets that can only ever be asserted?
> 
> I do not know yet. Only extend this driver with all combination in logic.

If this is not used, let's leave it out.

[...]
> > > @@ -103,7 +151,7 @@ struct hisi_reset_controller *hisi_reset_init(struct platform_device *pdev)
> > >       rstc->rcdev.owner = THIS_MODULE;
> > >       rstc->rcdev.ops = &hisi_reset_ops;
> > >       rstc->rcdev.of_node = pdev->dev.of_node;
> > > -     rstc->rcdev.of_reset_n_cells = 2;
> > > +     rstc->rcdev.of_reset_n_cells = 3;
> > 
> > This breaks current device trees (before patch 3). You can make sure
> > device trees with #reset-cells = <2> keep working by parsing the #reset-
> > cells and setting this value to 2 for old DTs.
> 
> All current dts file are modified accordingly. But existing dtb binary support
> is an issue. Do you have any suggestion?

Since this is for a new SoC, you should keep using of_reset_n_cells = 2
for the current SoCs and only set it to 3 for a new compatible, for
example using of_device_get_match_data().

regards
Philipp

