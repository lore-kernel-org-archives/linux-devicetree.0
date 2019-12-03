Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2144C432C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 14:13:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE10D2073C
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 14:13:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfLCONW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 09:13:22 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58353 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbfLCONU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 09:13:20 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1ic8vA-0000FI-AU; Tue, 03 Dec 2019 15:12:56 +0100
Message-ID: <0aec80383d4deea2574a016c8a8b370bcc006c8e.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] dt-bindings: clock: Update Hisilicon reset doc
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
Date:   Tue, 03 Dec 2019 15:12:53 +0100
In-Reply-To: <CABymUCOoTZ0MAmtb9O2N+KZj+XF=073C9=BxBgbL9RXwMCuuMA@mail.gmail.com>
References: <20191202144524.5391-1-jun.nie@linaro.org>
         <20191202144524.5391-2-jun.nie@linaro.org>
         <cd0fae1a6b88a37e034876b53b350e79f58c654f.camel@pengutronix.de>
         <CABymUCOoTZ0MAmtb9O2N+KZj+XF=073C9=BxBgbL9RXwMCuuMA@mail.gmail.com>
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

On Tue, 2019-12-03 at 11:11 +0800, Jun Nie wrote:
> Philipp Zabel <p.zabel@pengutronix.de> 于2019年12月3日周二 上午1:04写道：
> > Hi Jun,
> > 
> > I have a few questions and comments about these patches. I notice that
> > the changed device trees only use the default setting. Are these new
> > features something that is required for the present SoCs, or is this in
> > preparation for a new SoC?
> 
> Yes, this patch set is prepared for new SoC.
> 
> > On Mon, 2019-12-02 at 22:45 +0800, Jun Nie wrote:
> > > Document the update of Hisilicon reset operation extension.
> > > 
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  .../devicetree/bindings/clock/hisi-crg.txt    | 12 ++++----
> > >  include/dt-bindings/reset/hisilicon-resets.h  | 28 +++++++++++++++++++
> > >  2 files changed, 35 insertions(+), 5 deletions(-)
> > >  create mode 100644 include/dt-bindings/reset/hisilicon-resets.h
> > > 
> > > diff --git a/Documentation/devicetree/bindings/clock/hisi-crg.txt b/Documentation/devicetree/bindings/clock/hisi-crg.txt
> > > index cc60b3d423f3..fd8b0a964806 100644
> > > --- a/Documentation/devicetree/bindings/clock/hisi-crg.txt
> > > +++ b/Documentation/devicetree/bindings/clock/hisi-crg.txt
> > > @@ -26,19 +26,21 @@ to specify the clock which they consume.
> > > 
> > >  All these identifier could be found in <dt-bindings/clock/hi3519-clock.h>.
> > > 
> > > -- #reset-cells: should be 2.
> > > +- #reset-cells: should be 3.

If this is only needed for a new SoC, you should introduce a new
compatible and leave #reset-cells = <2> for the old compatible. The new
compatible can require #reset-cells = <3>. Wit this, the current device
trees don't have to be changed at all.

regards
Philipp

