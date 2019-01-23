From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: crypto: document Exynos5433 SlimSSS
Date: Wed, 23 Jan 2019 16:23:38 +0100
Message-ID: <d2b9b8cd-4b34-743f-dfd7-9bab6a50a5da@partner.samsung.com>
References: <CGME20190122152608eucas1p27cff7b53eb3bb23447ef7ba2b3f69671@eucas1p2.samsung.com>
        <20190122152553.1537-1-k.konieczny@partner.samsung.com>
        <20190122152553.1537-3-k.konieczny@partner.samsung.com>
        <CAJKOXPfGJxzPVcAitU=uDFfrmtwQZD1dcbbhy+BjEUF_6exx2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPfGJxzPVcAitU=uDFfrmtwQZD1dcbbhy+BjEUF_6exx2g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi Krzysztof,

On 23.01.2019 08:59, Krzysztof Kozlowski wrote:
> On Tue, 22 Jan 2019 at 16:26, Kamil Konieczny
> <k.konieczny@partner.samsung.com> wrote:
>>
>> Document DT bindings for crypto Samsung Exynos5433 SlimSSS (Slim Security
>> SubSystem) IP.
>>
>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
>> ---
>>  .../devicetree/bindings/crypto/samsung-sss.txt      | 13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/samsung-sss.txt b/Documentation/devicetree/bindings/crypto/samsung-sss.txt
>> index 7a5ca56683cc..75718f86fe50 100644
>> --- a/Documentation/devicetree/bindings/crypto/samsung-sss.txt
>> +++ b/Documentation/devicetree/bindings/crypto/samsung-sss.txt
>> @@ -1,4 +1,4 @@
>> -Samsung SoC SSS (Security SubSystem) module
>> +Samsung SoC SSS (Security SubSystem) and SlimSSS module
>>
>>  The SSS module in S5PV210 SoC supports the following:
>>  -- Feeder (FeedCtrl)
>> @@ -15,6 +15,11 @@ supports the following also:
>>  -- True Random Number Generator (TRNG)
>>  -- Secure Key Manager
>>
>> +The SlimSSS module in Exynos5 (Exynos5433) supports:
>> +-- Feeder (FeedCtrl)
>> +-- Advanced Encryption Standard (AES)
>> +-- SHA-1/SHA-256/HMAC (SHA-1/SHA-256)
>> +
>>  Required properties:
>>
>>  - compatible : Should contain entries for this and backward compatible
>> @@ -22,11 +27,13 @@ Required properties:
>>    - "samsung,s5pv210-secss" for S5PV210 SoC.
>>    - "samsung,exynos4210-secss" for Exynos4210, Exynos4212, Exynos4412, Exynos5250,
>>                 Exynos5260 and Exynos5420 SoCs.
>> +  - "samsung,exynos5433-slim-sss" for Exynos542x and Exynos5433 SoCs.
> 
> For Exynos5420 there is a driver for regular/full SSS module. It would
> be nice to explain what is the difference between them and/or mention
> potential conflicts of usage.

If Exynos has SlimSSS, it has also SSS. SlimSSS is separated from SSS, it is like SSS
limited to only AES and HASH, and HASH got limited in capabilities. In Exynos5420 SSS
HASH has SHA-1,SHA-256,md5 with/without HMAC, but slimSSS has only SHA-1,SHA-256/HMAC.
SlimSSS AES has all modes present in SSS, these are ECB, CBC, CTR, XTS and CMAC.
The same goes for Exynos5433.

There are no conflicts between SlimSSS and SSS.

> The point is that previously we added drivers/bindings for SSS and now
> you use the other interface. It might be pretty confusing for users...

SlimSSS has same AES registers offsets from base as in SSS, so the s5p-sss driver can
reuse code. It is preferred to use SSS but on Exynos5433 I was unable to read its register
(FEEDCTRL) with all clocks enabled, maybe because firmware loaded secureOS (trustzone).

>[...]
>>[...]

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland
