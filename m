Return-Path: <SRS0=cBdN=QI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19919 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729754AbfBAK5S (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Feb 2019 05:57:18 -0500
Subject: Re: [PATCH v5 4/5] dt-bindings: clk: exynos5433: add imem clock
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <ad3926f7-8884-9f2b-85d7-8a50a028d075@samsung.com>
Date: Fri, 01 Feb 2019 11:57:08 +0100
MIME-version: 1.0
In-reply-to: <fd39fd40-f452-f763-c9ab-d717c80967cd@samsung.com>
Content-type: text/plain; charset="utf-8"
Content-language: en-GB
Content-transfer-encoding: 7bit
References: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
        <CGME20190122090251eucas1p122f1c6d47f3cb60febeadda88ada3a76@eucas1p1.samsung.com>
        <20190122090232.29194-5-k.konieczny@partner.samsung.com>
        <fd39fd40-f452-f763-c9ab-d717c80967cd@samsung.com>
Sender: devicetree-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Kamil Konieczny <k.konieczny@partner.samsung.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

On 1/31/19 13:30, Chanwoo Choi wrote:
>> diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
>> index 87bb2b017143..52652aaabc06 100644
>> --- a/include/dt-bindings/clock/exynos5433.h
>> +++ b/include/dt-bindings/clock/exynos5433.h
>> @@ -1406,4 +1406,10 @@
>>  
>>  #define CAM1_NR_CLK					113
>>  
>> +/* CMU_IMEM */
>> +#define CLK_ACLK_SLIMSSS		2
>> +#define CLK_PCLK_SLIMSSS		35
>> +
>> +#define IMEM_NR_CLK			52
>> +
>>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS5433_H */
>>
> If you define that IMEM_NR_CLK is 52, clock driver allocates
> the memory for 52 clocks. It cause the memory waste.
> IMO, you better to change it as following:
> 
> #define CLK_ACLK_SLIMSSS		1
> #define CLK_PCLK_SLIMSSS		2
> 
> #define IMEM_NR_CLK			3

Let's keep the clock ID enumeration as is, so sorting is per clock
type as for all other CMUs in this header file. I.e. first all ACLK
then all PCLK clocks in case remaining clock ID get added in future. 
I'm going to adjust IMEM_NR_CLK to 36, as is not a part of DT ABI 
definition and for now it will allow us to save some memory. Although
I think the memory saving is negligible, we have already similar gaps 
in the clock ID enumeration.

I'm going to apply the patch with IMEM_NR_CLK changed 36, assuming
that Rob's Reviewed-by still stands, if not please let me know.

-- 
Thanks,
Sylwester
