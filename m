Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4F0C54E4B
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 08:56:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A315D2075E
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 08:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589187408;
	bh=DZOeS/DzUI7zZVlwY0PLJa1dRKEwsfs/eabsOCjHPaA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=yEH4LgK+E3hT1Uf5Cj/Nv94c5AQRvnoiDN4LREHMHEtgX18y8J9d6LO/Bk2Y0AIm1
	 evqTq4SFWljy/VNxCUkmWo6rBDEreIfVkuiaMF/CacQ70b0GwxVAgFIEh3cQAEcTA2
	 vpC1PbJq3AeAhkPuWkJeb9tp7bVVzFNtbV8MDPWY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgEKI4s (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 04:56:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:49602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727093AbgEKI4r (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 May 2020 04:56:47 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36C1820736;
        Mon, 11 May 2020 08:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589187407;
        bh=DZOeS/DzUI7zZVlwY0PLJa1dRKEwsfs/eabsOCjHPaA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KK625+94qcxtiyc6EHXRJgD5/7yfxr56gKJsIpkxBVVaPQHGrPlBtrvxlS8pLG7p/
         5OIg3sESlzkKWtJSzuICUj2OEwYgIQ1aMEEMjUF4SYdaY9t7urNO2+ygZJCFJQTZBP
         Vogbb582SE5kGP6w1B76q+GHSLptywEPrH/+Q6x0=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jY4Ev-00BENF-JR; Mon, 11 May 2020 09:56:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 11 May 2020 09:56:45 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 06/17] arm64: dts: arm: Fix GIC compatible names
In-Reply-To: <20200507112430.183940-7-andre.przywara@arm.com>
References: <20200507112430.183940-1-andre.przywara@arm.com>
 <20200507112430.183940-7-andre.przywara@arm.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <0d905c6bb47cd712c2052286a9ce0004@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: andre.przywara@arm.com, robh@kernel.org, liviu.dudau@arm.com, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-05-07 12:24, Andre Przywara wrote:
> The GIC DT binding only allows a certain combination of DT compatible
> strings, mostly just consisting of one name.
> 
> Drop the somewhat awkward combination of multiple names using different
> "cortex" based strings, in the fastmodel .dts files.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi | 2 +-
>  arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
> b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
> index 15fe81738e94..61a1750fcdd6 100644
> --- a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
> +++ b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
> @@ -6,7 +6,7 @@
> 
>  / {
>  	gic: interrupt-controller@2c001000 {
> -		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
> +		compatible = "arm,cortex-a15-gic";
>  		#interrupt-cells = <3>;
>  		#address-cells = <2>;
>  		interrupt-controller;
> diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
> b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
> index c5d15cbd8cf6..f86f6451411f 100644
> --- a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
> +++ b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
> @@ -95,7 +95,7 @@
>  	};
> 
>  	gic: interrupt-controller@2c001000 {
> -		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
> +		compatible = "arm,cortex-a15-gic";
>  		#interrupt-cells = <3>;
>  		#address-cells = <0>;
>  		interrupt-controller;

Since you've now allowed "arm,gic-400", why don't you use that
in combination with "arm,cortex-a15-gic"? Having GIC-400 makes
a lot more sense, as these two models are ARMv8 models.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
