Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8275DC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:59:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 57F3A20835
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:59:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbfKZL7t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 06:59:49 -0500
Received: from foss.arm.com ([217.140.110.172]:33468 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727250AbfKZL7s (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Nov 2019 06:59:48 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 588FD1FB;
        Tue, 26 Nov 2019 03:59:48 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70CEF3F52E;
        Tue, 26 Nov 2019 03:59:47 -0800 (PST)
Date:   Tue, 26 Nov 2019 11:59:45 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 8/8] dt: amd-seattle: add a description of the CPUs
 and caches
Message-ID: <20191126115944.GB32965@lakrids.cambridge.arm.com>
References: <20191126114319.2755-1-ardb@kernel.org>
 <20191126114319.2755-9-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191126114319.2755-9-ardb@kernel.org>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Nov 26, 2019 at 12:43:19PM +0100, Ard Biesheuvel wrote:
> Add a DT description of the CPU and cache hierarchy as found on
> the AMD Seattle SOC. Given the tight coupling of the PMU with
> the CPUs, move the PMU node into the cpu .dtsi file as well, and
> add the missing affinity description.

[...]

> +		CPU0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";

This should be "arm,cortex-a57"; likewise for the other CPUs.

> +	pmu {
> +		compatible = "arm,armv8-pmuv3";

And this should be (and should have been) "arm,cortex-a57-pmu".

> +		interrupts = <0x0 0x7 0x4>,
> +			     <0x0 0x8 0x4>,
> +			     <0x0 0x9 0x4>,
> +			     <0x0 0xa 0x4>,
> +			     <0x0 0xb 0x4>,
> +			     <0x0 0xc 0x4>,
> +			     <0x0 0xd 0x4>,
> +			     <0x0 0xe 0x4>;
> +		interrupt-affinity = <&CPU0>,
> +				     <&CPU1>,
> +				     <&CPU2>,
> +				     <&CPU3>,
> +				     <&CPU4>,
> +				     <&CPU5>,
> +				     <&CPU6>,
> +				     <&CPU7>;
> +	};
> +};

Otherwise, this looks good to me.

Thanks,
Mark.
