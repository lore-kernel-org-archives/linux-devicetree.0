Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61281C35646
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 17:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F666206E2
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 17:51:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727699AbgBURvJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 12:51:09 -0500
Received: from foss.arm.com ([217.140.110.172]:44840 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbgBURvJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 21 Feb 2020 12:51:09 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E589C30E;
        Fri, 21 Feb 2020 09:51:08 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C39F3F6CF;
        Fri, 21 Feb 2020 09:51:07 -0800 (PST)
Date:   Fri, 21 Feb 2020 17:51:05 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
        catalin.marinas@arm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: perf: Support new DT compatibles
Message-ID: <20200221175105.GC27382@lakrids.cambridge.arm.com>
References: <cover.1582300927.git.robin.murphy@arm.com>
 <6dbd695863346bda1e5d2133643ffade6227bd9a.1582300927.git.robin.murphy@arm.com>
 <20200221173847.2e9789af@donnerap.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221173847.2e9789af@donnerap.cambridge.arm.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Feb 21, 2020 at 05:38:47PM +0000, Andre Przywara wrote:
> On Fri, 21 Feb 2020 16:04:58 +0000
> Robin Murphy <robin.murphy@arm.com> wrote:
> 
> Hi,
> 
> > Add support for matching the new PMUs. For now, this just wires them up
> > as generic PMUv3 such that people writing DTs for new SoCs can do the
> > right thing, and at least have architectural and raw events be usable.
> > We can come back and fill in event maps for sysfs and/or perf tools at
> > a later date.
> 
> as mentioned already in a reply to another patch:
> 
> Is that really the right way? Isn't that calling for the intended usage of a compatible fall-back string?
> So that a machine can just ship DTBs with for instance:
> 	"arm,neoverse-n1-pmu", "arm,armv8-pmuv3";
> and that would magically work with all older and newer kernels already, without any patch?
> 
> As it stands right now (with a single compatible), only newer kernels could use the PMU on those SoCs (ignoring tedious backports not reaching every user).
> 
> All that would be needed for that is to officially allow two compatible strings in the binding.
> 
> Cheers,
> Andre.
> 
> P.S. Still thinking about dropping those compatible strings at all and using the MIDR somehow, because then also ACPI users would benefit from core specific events.

For ACPI we've said that the way forward is the userspace mappings, so
that's already solved (and to a much greater degree than we could do
within the kernel).

The names for DT are an unfortunate legacy thing that we simply have to
carry on with going forward in for the UAPI under sysfs.

I don't want to go mapping MIDRs to names, and open other worm cans.

Thanksm
Mark.

>  
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
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
> 
