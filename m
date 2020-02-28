Return-Path: <SRS0=Dihy=4Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF416C3F2D2
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 12:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF16324680
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 12:17:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbgB1MRS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Feb 2020 07:17:18 -0500
Received: from foss.arm.com ([217.140.110.172]:37364 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgB1MRR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 28 Feb 2020 07:17:17 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF4334B2;
        Fri, 28 Feb 2020 04:17:15 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31D733F7B4;
        Fri, 28 Feb 2020 04:17:15 -0800 (PST)
Date:   Fri, 28 Feb 2020 12:17:13 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Robin Murphy <robin.murphy@arm.com>, will@kernel.org
Cc:     catalin.marinas@arm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/5] arm64: perf: Support new DT compatibles
Message-ID: <20200228121712.GF36089@lakrids.cambridge.arm.com>
References: <cover.1582312530.git.robin.murphy@arm.com>
 <6e5087621bd8112a35733054689d7c785b4bdde5.1582312530.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e5087621bd8112a35733054689d7c785b4bdde5.1582312530.git.robin.murphy@arm.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Feb 21, 2020 at 07:35:32PM +0000, Robin Murphy wrote:
> Add support for matching the new PMUs. For now, this just wires them up
> as generic PMUv3 such that people writing DTs for new SoCs can do the
> right thing, and at least have architectural and raw events be usable.
> We can come back and fill in event maps for sysfs and/or perf tools at
> a later date.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Thanks for putting this together!

Acked-by: Mark Rutland <mark.rutland@arm.com>

Will, are you happy to queue this and the previous patch?

Thanks,
Mark.

> ---
> 
> v2: define separate init functions to preserve the user ABI for naming
>     (and perhaps more crucially, to simply avoid sysfs collisions on
>      the inevitable A7[567] + A55 big.LITTLE systems)
> 
>  arch/arm64/kernel/perf_event.c | 56 ++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
> index 1e0b04da2f3a..726cd8bda025 100644
> --- a/arch/arm64/kernel/perf_event.c
> +++ b/arch/arm64/kernel/perf_event.c
> @@ -991,6 +991,12 @@ static int armv8_pmuv3_init(struct arm_pmu *cpu_pmu)
>  			      armv8_pmuv3_map_event, NULL, NULL);
>  }
>  
> +static int armv8_a34_pmu_init(struct arm_pmu *cpu_pmu)
> +{
> +	return armv8_pmu_init(cpu_pmu, "armv8_cortex_a34",
> +			      armv8_pmuv3_map_event, NULL, NULL);
> +}
> +
>  static int armv8_a35_pmu_init(struct arm_pmu *cpu_pmu)
>  {
>  	return armv8_pmu_init(cpu_pmu, "armv8_cortex_a35",
> @@ -1003,12 +1009,24 @@ static int armv8_a53_pmu_init(struct arm_pmu *cpu_pmu)
>  			      armv8_a53_map_event, NULL, NULL);
>  }
>  
> +static int armv8_a55_pmu_init(struct arm_pmu *cpu_pmu)
> +{
> +	return armv8_pmu_init(cpu_pmu, "armv8_cortex_a55",
> +			      armv8_pmuv3_map_event, NULL, NULL);
> +}
> +
>  static int armv8_a57_pmu_init(struct arm_pmu *cpu_pmu)
>  {
>  	return armv8_pmu_init(cpu_pmu, "armv8_cortex_a57",
>  			      armv8_a57_map_event, NULL, NULL);
>  }
>  
> +static int armv8_a65_pmu_init(struct arm_pmu *cpu_pmu)
> +{
> +	return armv8_pmu_init(cpu_pmu, "armv8_cortex_a65",
> +			      armv8_pmuv3_map_event, NULL, NULL);
> +}
> +
>  static int armv8_a72_pmu_init(struct arm_pmu *cpu_pmu)
>  {
>  	return armv8_pmu_init(cpu_pmu, "armv8_cortex_a72",
> @@ -1021,6 +1039,36 @@ static int armv8_a73_pmu_init(struct arm_pmu *cpu_pmu)
>  			      armv8_a73_map_event, NULL, NULL);
>  }
>  
> +static int armv8_a75_pmu_init(struct arm_pmu *cpu_pmu)
> +{
> +	return armv8_pmu_init(cpu_pmu, "armv8_cortex_a75",
> +			      armv8_pmuv3_map_event, NULL, NULL);
> +}
> +
> +static int armv8_a76_pmu_init(struct arm_pmu *cpu_pmu)
> +{
> +	return armv8_pmu_init(cpu_pmu, "armv8_cortex_a76",
> +			      armv8_pmuv3_map_event, NULL, NULL);
> +}
> +
> +static int armv8_a77_pmu_init(struct arm_pmu *cpu_pmu)
> +{
> +	return armv8_pmu_init(cpu_pmu, "armv8_cortex_a77",
> +			      armv8_pmuv3_map_event, NULL, NULL);
> +}
> +
> +static int armv8_e1_pmu_init(struct arm_pmu *cpu_pmu)
> +{
> +	return armv8_pmu_init(cpu_pmu, "armv8_neoverse_e1",
> +			      armv8_pmuv3_map_event, NULL, NULL);
> +}
> +
> +static int armv8_n1_pmu_init(struct arm_pmu *cpu_pmu)
> +{
> +	return armv8_pmu_init(cpu_pmu, "armv8_neoverse_n1",
> +			      armv8_pmuv3_map_event, NULL, NULL);
> +}
> +
>  static int armv8_thunder_pmu_init(struct arm_pmu *cpu_pmu)
>  {
>  	return armv8_pmu_init(cpu_pmu, "armv8_cavium_thunder",
> @@ -1035,11 +1083,19 @@ static int armv8_vulcan_pmu_init(struct arm_pmu *cpu_pmu)
>  
>  static const struct of_device_id armv8_pmu_of_device_ids[] = {
>  	{.compatible = "arm,armv8-pmuv3",	.data = armv8_pmuv3_init},
> +	{.compatible = "arm,cortex-a34-pmu",	.data = armv8_a34_pmu_init},
>  	{.compatible = "arm,cortex-a35-pmu",	.data = armv8_a35_pmu_init},
>  	{.compatible = "arm,cortex-a53-pmu",	.data = armv8_a53_pmu_init},
> +	{.compatible = "arm,cortex-a55-pmu",	.data = armv8_a55_pmu_init},
>  	{.compatible = "arm,cortex-a57-pmu",	.data = armv8_a57_pmu_init},
> +	{.compatible = "arm,cortex-a65-pmu",	.data = armv8_a65_pmu_init},
>  	{.compatible = "arm,cortex-a72-pmu",	.data = armv8_a72_pmu_init},
>  	{.compatible = "arm,cortex-a73-pmu",	.data = armv8_a73_pmu_init},
> +	{.compatible = "arm,cortex-a75-pmu",	.data = armv8_a75_pmu_init},
> +	{.compatible = "arm,cortex-a76-pmu",	.data = armv8_a76_pmu_init},
> +	{.compatible = "arm,cortex-a77-pmu",	.data = armv8_a77_pmu_init},
> +	{.compatible = "arm,neoverse-e1-pmu",	.data = armv8_e1_pmu_init},
> +	{.compatible = "arm,neoverse-n1-pmu",	.data = armv8_n1_pmu_init},
>  	{.compatible = "cavium,thunder-pmu",	.data = armv8_thunder_pmu_init},
>  	{.compatible = "brcm,vulcan-pmu",	.data = armv8_vulcan_pmu_init},
>  	{},
> -- 
> 2.23.0.dirty
> 
