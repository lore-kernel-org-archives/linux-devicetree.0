Return-Path: <SRS0=EY9Q=OF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46464 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbeK0BUG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 26 Nov 2018 20:20:06 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20181126142548euoutp0193c24153f69a67a242fdc8937f58662f~qsr07jJMT3092430924euoutp01N
        for <devicetree@vger.kernel.org>; Mon, 26 Nov 2018 14:25:48 +0000 (GMT)
Subject: Re: [PATCH 1/4] clk: samsung: exynos5433: fix name typos
From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Message-ID: <e5be6b20-b855-81b1-9b46-1d6e7a9c4eb3@partner.samsung.com>
Date: Mon, 26 Nov 2018 15:25:45 +0100
MIME-Version: 1.0
In-Reply-To: <CAJKOXPc4O7D_bptcM1hhDN6Xdahv9xaVST-9WgqWNyC9U_QOfg@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
References: <CGME20181121120523eucas1p1e69848a515c713315499e6e21f099cc2@eucas1p1.samsung.com>
        <20181121120509.18892-1-k.konieczny@partner.samsung.com>
        <20181121120509.18892-2-k.konieczny@partner.samsung.com>
        <CAJKOXPc4O7D_bptcM1hhDN6Xdahv9xaVST-9WgqWNyC9U_QOfg@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, s.nawrocki@samsung.com, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>



On 21.11.2018 14:13, Krzysztof Kozlowski wrote:
> On Wed, 21 Nov 2018 at 13:05, Kamil Konieczny
> <k.konieczny@partner.samsung.com> wrote:
>>
>> Fix typo in imem sssx name and typo 200 switched with 266.
> 
> These should be two separate patches. Then the one changing parent
> could go to stable. [...]

Thank you, I will split it as you suggested.

>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
>> ---
>>  drivers/clk/samsung/clk-exynos5433.c   | 6 +++---
>>  include/dt-bindings/clock/exynos5433.h | 2 +-
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>> [...]
>> @@ -568,10 +568,10 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
>>         GATE(CLK_ACLK_BUS1_400, "aclk_bus1_400", "div_aclk_bus1_400",
>>                         ENABLE_ACLK_TOP, 25,
>>                         CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
>> -       GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_266",
>> +       GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_200",
>>                         ENABLE_ACLK_TOP, 24,
>>                         CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
>> -       GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_200",
>> +       GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_266",
>>                         ENABLE_ACLK_TOP, 23,
>> [...]

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland
