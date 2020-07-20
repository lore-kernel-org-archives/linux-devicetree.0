Return-Path: <SRS0=nYmw=A7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65211C433E4
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 17:29:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BC9722482
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 17:29:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ktxiedt9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729690AbgGTR3E (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 13:29:04 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16682 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728324AbgGTR3E (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jul 2020 13:29:04 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f15d3e80001>; Mon, 20 Jul 2020 10:27:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 20 Jul 2020 10:29:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 20 Jul 2020 10:29:04 -0700
Received: from [10.2.53.86] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Jul
 2020 17:29:03 +0000
Subject: Re: [PATCH v2 2/2] arm64: tegra: Add the GPU on Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Debarshi Dutta <ddutta@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716143341.545804-1-thierry.reding@gmail.com>
 <20200716143341.545804-2-thierry.reding@gmail.com>
X-Nvconfidentiality: public
From:   Terje Bergstrom <tbergstrom@nvidia.com>
Message-ID: <de024331-cc7a-42ac-6b03-4ac8eb3af351@nvidia.com>
Date:   Mon, 20 Jul 2020 10:29:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716143341.545804-2-thierry.reding@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595266024; bh=ac8zO61pbb5tpf5xClufOhOCk2EwcuyOQ6iixGYE1yE=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:
         Content-Transfer-Encoding:Content-Language;
        b=ktxiedt9++tvbzE8plmar2iBg/wSKwH8tDjfvLXANC4Q5FHgP6f5RUsFSKxtcGkXx
         hq3A9gVhAp1miwXjv0rKlhj85j9KF6ihsxZzJucitn7cR/SJljzv8iEyg7zfjiZ7ge
         2GzG3HRfkYUVm7mefv6NBL9wI8f+UuKNNFska5ikgC0TqIfVDgkFN9y/FU4YrLopgw
         lodQyB4A6CLZRzX08mNaL3TbIBnoY3noVILnEnN+mnD8VFY6CaXEP0A4q2c449iCER
         wJebR/fILchznAMK6Ur2LKa5TQ7NLpxB7tztaBq2gc9pZTfGprq8YM4zGNqri6cKM0
         QyEI1sfIB2Pxg==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 7/16/2020 7:33 AM, Thierry Reding wrote:
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index 98c366ab4aab..14da0793be69 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -1395,6 +1395,39 @@ sor3: sor@15bc0000 {
>   				nvidia,interface = <3>;
>   			};
>   		};
> +
> +		gpu@17000000 {
> +			compatible = "nvidia,gv11b";
> +			reg = <0x17000000 0x10000000>,
> +			      <0x18000000 0x10000000>;

Hi,

I noticed a typo here. The sizes of the resources have one zero too 
many. Should be 0x1000000.

Terje

