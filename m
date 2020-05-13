Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76033C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 18:21:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 227B3205ED
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 18:21:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390004AbgEMSVt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 14:21:49 -0400
Received: from foss.arm.com ([217.140.110.172]:51692 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732845AbgEMSVt (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 14:21:49 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 035D830E;
        Wed, 13 May 2020 11:21:49 -0700 (PDT)
Received: from bogus (unknown [10.37.12.13])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45A413F305;
        Wed, 13 May 2020 11:21:47 -0700 (PDT)
Date:   Wed, 13 May 2020 19:21:44 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 08/20] arm64: dts: arm: model: Fix GIC compatible names
Message-ID: <20200513182144.GD27686@bogus>
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-9-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513103016.130417-9-andre.przywara@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 13, 2020 at 11:30:04AM +0100, Andre Przywara wrote:
> The GIC DT binding only allows certain combinations of DT compatible
> strings. The somewhat awkward "arm,cortex-a15-gic", "arm,cortex-a9-gic"
> is not among those.
> 
> Drop that combination of different "cortex" based strings used for the
> models, and replace it with the more useful combination including
> "arm,gic-400".
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi | 2 +-
>  arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
> index 15fe81738e94..f17e744163a5 100644
> --- a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
> +++ b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
> @@ -6,7 +6,7 @@
>  
>  / {
>  	gic: interrupt-controller@2c001000 {
> -		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
> +		compatible = "arm,gic-400", "arm,cortex-a15-gic";

Do we need to still retain "arm,cortex-a15-gic" ? 

-- 
Regards,
Sudeep
