From: Keerthy <j-keerthy@ti.com>
Subject: Re: [RESEND PATCH 05/10] crypto: sha256_generic: Export the Transform
 function
Date: Fri, 28 Jun 2019 10:57:39 +0530
Message-ID: <7ddfdddc-38ba-a435-f688-4d0e29c0513c@ti.com>
References: <20190628042745.28455-1-j-keerthy@ti.com>
 <20190628042745.28455-6-j-keerthy@ti.com>
 <20190628050944.GE673@sol.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628050944.GE673@sol.localdomain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Biggers <ebiggers@kernel.org>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, t-kristo@ti.com, linux-crypto@vger.kernel.org, nm@ti.com
List-Id: devicetree@vger.kernel.org



On 28/06/19 10:39 AM, Eric Biggers wrote:
> On Fri, Jun 28, 2019 at 09:57:40AM +0530, Keerthy wrote:
>> The transform function can be used as is by other crypto
>> drivers that need to transform the 256 bit key using cpu.
>> Hence export it.
> 
> What is this supposed to mean?  SHA-256 is an unkeyed hash function.

HMAC-SHA256 my bad.

> 
> Also, you need to actually explain why this is needed.  If your hardware
> supports SHA-256, why do you need to use the C sha256_transform()?

Hardware supports only HMAC from pre-computed inner and outer digests is 
supported, i.e. the host must carry out initial preparation stage to
generate intermediate hash state for both inner pad and outer pad.

Hence the need to export the transform function. I will add it in the 
commit message.

> 
> - Eric
> 
