From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: crypto: document Exynos5433 SlimSSS
Date: Thu, 31 Jan 2019 17:45:47 +0100
Message-ID: <ecb05f4f-3873-4029-3428-efb60c3fdabe@partner.samsung.com>
References: <20190124154521.13589-1-k.konieczny@partner.samsung.com>
        <CGME20190124154539eucas1p16fb97dd0cab2c18d82113c511cd8a1ca@eucas1p1.samsung.com>
        <20190124154521.13589-3-k.konieczny@partner.samsung.com>
        <20190130165115.GA8926@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190130165115.GA8926@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 30.01.2019 17:51, Rob Herring wrote:
> On Thu, Jan 24, 2019 at 04:45:20PM +0100, Kamil Konieczny wrote:
>> Document DT bindings for crypto Samsung Exynos5433 SlimSSS (Slim Security
>> SubSystem) IP.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
>> ---
>>  .../devicetree/bindings/crypto/samsung-sss.txt     | 14 +++++++++++---
>>  1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/samsung-sss.txt b/Documentation/devicetree/bindings/crypto/samsung-sss.txt
>> index 7a5ca56683cc..d9af679d38ab 100644
>> --- a/Documentation/devicetree/bindings/crypto/samsung-sss.txt
>> +++ b/Documentation/devicetree/bindings/crypto/samsung-sss.txt
>> @@ -1,4 +1,4 @@
>> -Samsung SoC SSS (Security SubSystem) module
>> +Samsung SoC SSS (Security SubSystem) and SlimSSS module
>>  
>>  The SSS module in S5PV210 SoC supports the following:
>>  -- Feeder (FeedCtrl)
>> @@ -15,6 +15,12 @@ supports the following also:
>>  -- True Random Number Generator (TRNG)
>>  -- Secure Key Manager
>>  
>> +Exynos5433 has both SSS and SlimSSS module.
> 
> That's not really relevant to the binding.
> 
> What do the SSS and SlimSSS share? Only that both have a single reg and 
> interrupt based on the binding? This should probably be just 2 
> documents. If not now, it will have to be when converted to a DT schema.

They share hardware design, slimSSS is stripped-down SSS version,
and can be handled by the same crypto s5p-sss driver. The register
layout is the same for FeedControl (DMA) and AES crypt function.

Do you prefer to put this description in new file samsung-slimsss.txt ?
If yes, I can send v4, so it can be done right from beginning.

>> +SlimSSS in Exynos5433 supports:
>> +-- Feeder (FeedCtrl)
>> +-- Advanced Encryption Standard (AES)
>> +-- SHA-1/SHA-256/HMAC (SHA-1/SHA-256)
>> +
>>  Required properties:
>>  
>>  - compatible : Should contain entries for this and backward compatible
>> @@ -22,11 +28,13 @@ Required properties:
>>    - "samsung,s5pv210-secss" for S5PV210 SoC.
>>    - "samsung,exynos4210-secss" for Exynos4210, Exynos4212, Exynos4412, Exynos5250,
>>  		Exynos5260 and Exynos5420 SoCs.
>> +  - "samsung,exynos5433-slim-sss" for Exynos5433 SoCs.
>>  - reg : Offset and length of the register set for the module
>>  - interrupts : interrupt specifiers of SSS module interrupts (one feed
>>  		control interrupt).
>>  
>>  - clocks : list of clock phandle and specifier pairs for all clocks  listed in
>>  		clock-names property.
>> -- clock-names : list of device clock input names; should contain one entry
>> -		"secss".
>> +- clock-names : list of device clock input names; should contain "pclk" and
>> +		"aclk" for slim-sss in Exynos5433, and one entry "secss" for
>> +		other compatibles.
>> -- 
>> 2.20.0

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland
