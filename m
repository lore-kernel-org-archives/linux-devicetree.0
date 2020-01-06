Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FA6C32767
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 04:01:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7DF02072C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 04:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="M9Ly0bcM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgAFEBw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 5 Jan 2020 23:01:52 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37870 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727432AbgAFEBw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 5 Jan 2020 23:01:52 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00641irn089874;
        Sun, 5 Jan 2020 22:01:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578283304;
        bh=eTr4yhhqW0CfHfnymOfIOUGthh33hsgdifkzOrGmJ7s=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=M9Ly0bcMxv3kWxdTv/LU9QxUFnYw4pMqkgXlFY5KzUks5UGBBeS0/cWE3jze51CHD
         CN/CJcn7kixvvyQoEzTV+OFdLLh1w4bZCSWXqWA9pUmJEXLpC2YUTl7MdUoFUhaC7A
         6DMu5JIsCWD8+vryOoPgg4BPHUKuOEJWsaxn4loY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00641iPr046902
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 5 Jan 2020 22:01:44 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 5 Jan
 2020 22:01:43 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 5 Jan 2020 22:01:43 -0600
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00641eVP092091;
        Sun, 5 Jan 2020 22:01:41 -0600
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-main: Add missing power-domains
 for smmu
To:     Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
CC:     Device Tree Mailing List <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>, Suman Anna <s-anna@ti.com>
References: <20191122100356.20622-1-lokeshvutla@ti.com>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <14a3898b-f91b-861e-0091-7e445c087ec0@ti.com>
Date:   Mon, 6 Jan 2020 09:30:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20191122100356.20622-1-lokeshvutla@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

H Tero,

On 22/11/19 3:33 PM, Lokesh Vutla wrote:
> Add power-domains entry for smmu, so that the it is accessible as long
> as the driver is active. Without this device shutdown is throwing the
> below warning:
> "[   44.736348] arm-smmu-v3 36600000.smmu: failed to clear cr0"
> 
> Reported-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>

Any comments on this patch? If there are no objections, can this be picked?

Thanks and regards,
Lokesh

> ---
>  arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> index 698ef9a1d5b7..96445111e398 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> @@ -43,6 +43,7 @@
>  	smmu0: smmu@36600000 {
>  		compatible = "arm,smmu-v3";
>  		reg = <0x0 0x36600000 0x0 0x100000>;
> +		power-domains = <&k3_pds 229 TI_SCI_PD_EXCLUSIVE>;
>  		interrupt-parent = <&gic500>;
>  		interrupts = <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
>  			     <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>;
> 
