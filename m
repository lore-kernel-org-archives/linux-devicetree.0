Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57D1C35646
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 17:49:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A2E46206E2
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 17:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727699AbgBURtH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 12:49:07 -0500
Received: from foss.arm.com ([217.140.110.172]:44722 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727655AbgBURtH (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 21 Feb 2020 12:49:07 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCDA930E;
        Fri, 21 Feb 2020 09:49:06 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F21073F6CF;
        Fri, 21 Feb 2020 09:49:05 -0800 (PST)
Date:   Fri, 21 Feb 2020 17:49:03 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     will@kernel.org, catalin.marinas@arm.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: perf: Support new DT compatibles
Message-ID: <20200221174903.GB27382@lakrids.cambridge.arm.com>
References: <cover.1582300927.git.robin.murphy@arm.com>
 <6dbd695863346bda1e5d2133643ffade6227bd9a.1582300927.git.robin.murphy@arm.com>
 <20200221171558.GA27382@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221171558.GA27382@lakrids.cambridge.arm.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Feb 21, 2020 at 05:15:59PM +0000, Mark Rutland wrote:
> On Fri, Feb 21, 2020 at 04:04:58PM +0000, Robin Murphy wrote:
> > Add support for matching the new PMUs. For now, this just wires them up
> > as generic PMUv3 such that people writing DTs for new SoCs can do the
> > right thing, and at least have architectural and raw events be usable.
> > We can come back and fill in event maps for sysfs and/or perf tools at
> > a later date.
> > 
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> Thanks for this, it looks fine to me:
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>

Argh, this isn't quite right, sorry. :/

> > ---
> >  arch/arm64/kernel/perf_event.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
> > index e40b65645c86..28ce582e049e 100644
> > --- a/arch/arm64/kernel/perf_event.c
> > +++ b/arch/arm64/kernel/perf_event.c
> > @@ -1105,11 +1105,19 @@ static int armv8_vulcan_pmu_init(struct arm_pmu *cpu_pmu)
> >  
> >  static const struct of_device_id armv8_pmu_of_device_ids[] = {
> >  	{.compatible = "arm,armv8-pmuv3",	.data = armv8_pmuv3_init},
> > +	{.compatible = "arm,cortex-a34-pmu",	.data = armv8_pmuv3_init},

Unfortunately, these need their own .data so that they can be given
appropriate names under sysfs.

We're stuck doing that forever for DT, though at least we learned for
ACPI...

Mark.

> >  	{.compatible = "arm,cortex-a35-pmu",	.data = armv8_a35_pmu_init},
> >  	{.compatible = "arm,cortex-a53-pmu",	.data = armv8_a53_pmu_init},
> > +	{.compatible = "arm,cortex-a55-pmu",	.data = armv8_pmuv3_init},
> >  	{.compatible = "arm,cortex-a57-pmu",	.data = armv8_a57_pmu_init},
> > +	{.compatible = "arm,cortex-a65-pmu",	.data = armv8_pmuv3_init},
> >  	{.compatible = "arm,cortex-a72-pmu",	.data = armv8_a72_pmu_init},
> >  	{.compatible = "arm,cortex-a73-pmu",	.data = armv8_a73_pmu_init},
> > +	{.compatible = "arm,cortex-a75-pmu",	.data = armv8_pmuv3_init},
> > +	{.compatible = "arm,cortex-a76-pmu",	.data = armv8_pmuv3_init},
> > +	{.compatible = "arm,cortex-a77-pmu",	.data = armv8_pmuv3_init},
> > +	{.compatible = "arm,neoverse-e1-pmu",	.data = armv8_pmuv3_init},
> > +	{.compatible = "arm,neoverse-n1-pmu",	.data = armv8_pmuv3_init},
> >  	{.compatible = "cavium,thunder-pmu",	.data = armv8_thunder_pmu_init},
> >  	{.compatible = "brcm,vulcan-pmu",	.data = armv8_vulcan_pmu_init},
> >  	{},
> > -- 
> > 2.23.0.dirty
> > 
