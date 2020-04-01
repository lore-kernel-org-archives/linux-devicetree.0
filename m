Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F07C43331
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 09:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F03B220772
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 09:05:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgDAJFy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Apr 2020 05:05:54 -0400
Received: from foss.arm.com ([217.140.110.172]:46492 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728087AbgDAJFy (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 1 Apr 2020 05:05:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B524131B;
        Wed,  1 Apr 2020 02:05:53 -0700 (PDT)
Received: from bogus (unknown [10.37.12.97])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D6963F52E;
        Wed,  1 Apr 2020 02:05:51 -0700 (PDT)
Date:   Wed, 1 Apr 2020 10:05:45 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 3/4] firmware: arm_scmi: Check shmem property for channel
 availablity
Message-ID: <20200401090545.GA3954@bogus>
References: <20200327163654.13389-1-sudeep.holla@arm.com>
 <20200327163654.13389-4-sudeep.holla@arm.com>
 <AM0PR04MB44819AF3A77BF5362EE95D6388C90@AM0PR04MB4481.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB44819AF3A77BF5362EE95D6388C90@AM0PR04MB4481.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 01, 2020 at 01:15:08AM +0000, Peng Fan wrote:
> > Subject: [PATCH 3/4] firmware: arm_scmi: Check shmem property for channel
> > availablity
> >
> > Instead of declaring the channel availabilty unconditionally, let us check for
> > the presence of "shmem" property and return the channel availablity
> > accordingly.
> >
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >  drivers/firmware/arm_scmi/smc.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/firmware/arm_scmi/smc.c
> > b/drivers/firmware/arm_scmi/smc.c index dd4b54c29679..5929c668dc1d
> > 100644
> > --- a/drivers/firmware/arm_scmi/smc.c
> > +++ b/drivers/firmware/arm_scmi/smc.c
> > @@ -33,6 +33,11 @@ struct scmi_smc {
> >
> >  static bool smc_chan_available(struct device *dev, int idx)  {
> > +	struct device_node *np = of_parse_phandle(dev->of_node, "shmem", 0);
> > +	if (!np)
> > +		return false;
> > +
> > +	of_node_put(np);
> >  	return true;
> >  }
>
> This is global shared mem:)
>

No, the dev pointer is not the parent node here but the child devices
unless I am reading it wrong. But yes global for the base protocol :)

> Reviewed-by: Peng Fan <peng.fan@nxp.com>
>

Thanks for this and other patches too.

--
Regards,
Sudeep
