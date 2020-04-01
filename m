Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C29C43331
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 09:28:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8908F20784
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 09:28:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727723AbgDAJ2W (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Apr 2020 05:28:22 -0400
Received: from foss.arm.com ([217.140.110.172]:46990 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbgDAJ2W (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 1 Apr 2020 05:28:22 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 424511FB;
        Wed,  1 Apr 2020 02:28:21 -0700 (PDT)
Received: from bogus (unknown [10.37.12.97])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF5793F52E;
        Wed,  1 Apr 2020 02:28:19 -0700 (PDT)
Date:   Wed, 1 Apr 2020 10:28:16 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: Make mutex channel specific
Message-ID: <20200401092816.GD3954@bogus>
References: <20200327163654.13389-1-sudeep.holla@arm.com>
 <20200327163654.13389-2-sudeep.holla@arm.com>
 <AM0PR04MB4481562E2A31386752F92C4488C90@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <20200401091208.GB3954@bogus>
 <AM0PR04MB4481E4CC4FA7A55488E7663988C90@AM0PR04MB4481.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB4481E4CC4FA7A55488E7663988C90@AM0PR04MB4481.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 01, 2020 at 09:14:36AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH 1/4] firmware: arm_scmi: Make mutex channel specific
> >
> > On Wed, Apr 01, 2020 at 01:12:37AM +0000, Peng Fan wrote:
> > > Hi Sudeep,
> > >
> > > > Subject: [PATCH 1/4] firmware: arm_scmi: Make mutex channel specific
> > > >
> > > > In order to support multiple SMC/HVC transport channels with
> > > > associated shared memory,
> > >
> > > Does this mean each channel will have its own shared memory? Or All
> > > channels share the same shared memory?
> > >
> >
> > It depends on platform firmware and DT. If there is only one shmem at the top
> > level scmi node, all share that single channel. If some/all protocols have their
> > own channel, they there must be shmem entry in the corresponding child
> > node.
> >
> > > it is better to maintain the mutex per channel instead of
> > > > existing global one.
> > >
> > > If all channels shared the same memory, use per channel mutex lock
> > > will not be able to prevent other channels accessing shared memory at
> > > the same time.
> > >
> >
> > No we don't create channel per protocol. If they share, we just share the
> > channel pointer. Look at:
> >
> >        if (!info->desc->ops->chan_available(dev, idx)) {
> >                 cinfo = idr_find(idr, SCMI_PROTOCOL_BASE);
> >                 if (unlikely(!cinfo)) /* Possible only if platform has no Rx */
> >                         return -EINVAL;
> >                 goto idr_alloc;
> >         }
> >
> > If a protocol doesn't have a dedicated channel, we just assign the base
> > protocol channel to it. We don't call chan_setup at all on that channel.
> > Your patch assumed so but the core driver never did that.
> >
> > Hope this clarifies you doubt.
>
> Yes. Thanks for the explainaiton.
>

No worries, I should have seen this during initial review, just missed
few trivial things.

--
Regards,
Sudeep
