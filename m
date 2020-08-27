Return-Path: <SRS0=DNiR=CF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022E5C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 08:32:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CADC322B47
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 08:32:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="T1Tx8jS4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgH0Icc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Aug 2020 04:32:32 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46868 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgH0Icb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Aug 2020 04:32:31 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07R8WSJD067358;
        Thu, 27 Aug 2020 03:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598517148;
        bh=NGhD2tm2MPFi8+dwIt+U5kcTRLOAAeKHCqLPFPOLhk4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=T1Tx8jS4V3UKdAg7+yLm9JqwwfOX0iJIBQzMkp54uBt8NfeIQwI6nXHDqn/+5vQbH
         LVqMhvIwLWpOl37lk88BaHD/wquryypHanPydYR+Df1UIjmoDGqvyQQ5zUItU+rmpx
         Dsls/o9tBJiit7z0+Gjru54hN3nswQD/x90mYjb0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07R8WSsc012967
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Aug 2020 03:32:28 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 03:32:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 03:32:28 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07R8WQIC076029;
        Thu, 27 Aug 2020 03:32:26 -0500
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am65: mark dss as dma-coherent
To:     Nishanth Menon <nmenon@kernel.org>
CC:     Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20200826131637.421327-1-tomi.valkeinen@ti.com>
 <20200827001352.krnwehbtu42q56yw@ogun.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <4659fa10-3479-ded6-6ca9-226b1b9b5de2@ti.com>
Date:   Thu, 27 Aug 2020 11:32:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827001352.krnwehbtu42q56yw@ogun.localdomain>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Nishanth,

On 27/08/2020 03:13, Nishanth Menon wrote:
> On 16:16-20200826, Tomi Valkeinen wrote:
>> DSS is IO coherent on AM65, so we can mark it as such with
>> 'dma-coherent' property in the DT file.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>> index 9edfae5944f7..efd3f18f4be3 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>> @@ -847,6 +847,8 @@ dss: dss@04a00000 {
>>  
>>  		status = "disabled";
>>  
>> +		dma-coherent;
>> +
>>  		dss_ports: ports {
>>  			#address-cells = <1>;
>>  			#size-cells = <0>;
> Could you look closer at the dss node a bit? dtbs_check results in a
> change in error (on next-20200824):
> -/workdir/arch/arm64/boot/dts/ti/k3-am654-base-board.dt.yaml: dss@04a00000: 'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> +/workdir/arch/arm64/boot/dts/ti/k3-am654-base-board.dt.yaml: dss@04a00000: 'assigned-clock-parents', 'assigned-clocks', 'dma-coherent' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> I am not sure what extent is the dss conversion to yaml done.

I sent a v2, with two new patches to extend the schema to cover those properties.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
