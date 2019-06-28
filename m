From: Keerthy <j-keerthy@ti.com>
Subject: Re: [RESEND PATCH 07/10] crypto: sa2ul: Add hmac(sha1) HMAC algorithm
 support
Date: Fri, 28 Jun 2019 11:02:54 +0530
Message-ID: <2152c811-1fad-004a-01a7-969a1ded36ad@ti.com>
References: <20190628042745.28455-1-j-keerthy@ti.com>
 <20190628042745.28455-8-j-keerthy@ti.com>
 <20190628051412.GG673@sol.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628051412.GG673@sol.localdomain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Biggers <ebiggers@kernel.org>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, t-kristo@ti.com, linux-crypto@vger.kernel.org, nm@ti.com
List-Id: devicetree@vger.kernel.org



On 28/06/19 10:44 AM, Eric Biggers wrote:
> On Fri, Jun 28, 2019 at 09:57:42AM +0530, Keerthy wrote:
>> +static int sa_sham_update(struct ahash_request *req)
>> +{
>> +	return -ENOTSUPP;
>> +}
>> +
>> +static int sa_sham_final(struct ahash_request *req)
>> +{
>> +	return sa_sham_digest(req);
>> +}
>> +
>> +static int sa_sham_finup(struct ahash_request *req)
>> +{
>> +	return sa_sham_digest(req);
>> +}
> 
> You can't just not support update().  You need to support update().

Okay. I will add that.

> 
> - Eric
> 
