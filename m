Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE942FA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 16:04:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB84021924
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 16:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbfKHQEi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 11:04:38 -0500
Received: from foss.arm.com ([217.140.110.172]:46016 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbfKHQEi (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Nov 2019 11:04:38 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43E1546A;
        Fri,  8 Nov 2019 08:04:37 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90C443F71A;
        Fri,  8 Nov 2019 08:04:36 -0800 (PST)
Date:   Fri, 8 Nov 2019 16:04:34 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Disable secondary CPUs on Tegra194
Message-ID: <20191108160434.GI11465@lakrids.cambridge.arm.com>
References: <20191108153719.3166002-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108153719.3166002-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 08, 2019 at 04:37:19PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> According to ePAPR, CPUs that are quiescent should have the "status"
> property of the corresponding device tree node set to "disabled". Since
> all but the boot CPU are in a quiescent state on boot, mark all
> secondary CPUs as "disabled".

I think it might be best to leave this as-is, as we haven't done this
for other dts, and the OS doesn't actually require or consume this
regardless.

Adding this to all the Dts seems like unnecessary churn, and we can fix
the DT spec instead.

Thanks,
Mark.

> 
> Note that this does not have an impact on SMP. Linux will still be able
> to boot these secondary CPUs like before.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index 59485976db64..ea165b2998f9 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -1661,6 +1661,7 @@
>  			compatible = "nvidia,tegra194-carmel";
>  			device_type = "cpu";
>  			reg = <0x001>;
> +			status = "disabled";
>  			enable-method = "psci";
>  			i-cache-size = <131072>;
>  			i-cache-line-size = <64>;
> @@ -1675,6 +1676,7 @@
>  			compatible = "nvidia,tegra194-carmel";
>  			device_type = "cpu";
>  			reg = <0x100>;
> +			status = "disabled";
>  			enable-method = "psci";
>  			i-cache-size = <131072>;
>  			i-cache-line-size = <64>;
> @@ -1689,6 +1691,7 @@
>  			compatible = "nvidia,tegra194-carmel";
>  			device_type = "cpu";
>  			reg = <0x101>;
> +			status = "disabled";
>  			enable-method = "psci";
>  			i-cache-size = <131072>;
>  			i-cache-line-size = <64>;
> @@ -1703,6 +1706,7 @@
>  			compatible = "nvidia,tegra194-carmel";
>  			device_type = "cpu";
>  			reg = <0x200>;
> +			status = "disabled";
>  			enable-method = "psci";
>  			i-cache-size = <131072>;
>  			i-cache-line-size = <64>;
> @@ -1717,6 +1721,7 @@
>  			compatible = "nvidia,tegra194-carmel";
>  			device_type = "cpu";
>  			reg = <0x201>;
> +			status = "disabled";
>  			enable-method = "psci";
>  			i-cache-size = <131072>;
>  			i-cache-line-size = <64>;
> @@ -1731,6 +1736,7 @@
>  			compatible = "nvidia,tegra194-carmel";
>  			device_type = "cpu";
>  			reg = <0x300>;
> +			status = "disabled";
>  			enable-method = "psci";
>  			i-cache-size = <131072>;
>  			i-cache-line-size = <64>;
> @@ -1745,6 +1751,7 @@
>  			compatible = "nvidia,tegra194-carmel";
>  			device_type = "cpu";
>  			reg = <0x301>;
> +			status = "disabled";
>  			enable-method = "psci";
>  			i-cache-size = <131072>;
>  			i-cache-line-size = <64>;
> -- 
> 2.23.0
> 
