From: Keerthy <j-keerthy@ti.com>
Subject: Re: [RESEND PATCH 02/10] crypto: sa2ul: Add crypto driver
Date: Fri, 28 Jun 2019 10:54:36 +0530
Message-ID: <e86c6c6b-116d-f065-52a4-9b4d2951d100@ti.com>
References: <20190628042745.28455-1-j-keerthy@ti.com>
 <20190628042745.28455-3-j-keerthy@ti.com>
 <20190628050756.GD673@sol.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628050756.GD673@sol.localdomain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Biggers <ebiggers@kernel.org>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, t-kristo@ti.com, linux-crypto@vger.kernel.org, nm@ti.com
List-Id: devicetree@vger.kernel.org



On 28/06/19 10:37 AM, Eric Biggers wrote:
> On Fri, Jun 28, 2019 at 09:57:37AM +0530, Keerthy wrote:
>> The Security Accelerator (SA2_UL) subsystem provides hardware
>> cryptographic acceleration for the following use cases:
>> • Encryption and authentication for secure boot
>> • Encryption and authentication of content in applications
>>    requiring DRM (digital rights management) and
>>    content/asset protection
>> The device includes one instantiation of SA2_UL named SA2_UL0
>>
>> SA2_UL supports the following cryptographic industry standards to enable data authentication, data
>> integrity and data confidentiality.
>>
>> Crypto function library for software acceleration
>> o AES operation
>> o 3DES operation
>> o SHA1 operation
>> o MD5 operation
>> o SHA2 – 224, 256, 384, 512 operation
>>
>> Authentication supported via following hardware cores
>> o SHA1
>> o MD5
>> o SHA2 -224
>> o SHA2-256
>> o SHA2-384
>> o SHA2-512
> 
> What about HMAC?
> 
> Your actual driver only exposes HMAC-SHA*, not SHA* anything.
> 
> What does the hardware actually support?

Hardware supports both SHA and HMAC-SHA

> 
>> diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
>> index 603413f28fa3..b9a3fa026c74 100644
>> --- a/drivers/crypto/Kconfig
>> +++ b/drivers/crypto/Kconfig
>> @@ -785,4 +785,21 @@ config CRYPTO_DEV_CCREE
>>   
>>   source "drivers/crypto/hisilicon/Kconfig"
>>   
>> +config CRYPTO_DEV_SA2UL
>> +	tristate "Support for TI security accelerator"
>> +	depends on ARCH_K3 || COMPILE_TEST
>> +	select ARM64_CRYPTO
>> +	select CRYPTO_AES
>> +	select CRYPTO_AES_ARM64
>> +	select CRYPTO_SHA1
>> +	select CRYPTO_MD5
>> +	select CRYPTO_ALGAPI
>> +	select CRYPTO_AUTHENC
>> +	select HW_RANDOM
>> +	default m if ARCH_K3
>> +	help
>> +	  Keystone devices include a security accelerator engine that may be
>> +	  used for crypto offload.  Select this if you want to use hardware
>> +	  acceleration for cryptographic algorithms on these devices.
> 
> This shouldn't be enabled by default.  Note that arm64 defconfig sets ARCH_K3 as
> well as lots of other ARCH_* options, so clearly just because ARCH_K3 is set
> doesn't mean the kernel is being built specifically for your platform.

okay. I will remove that.

> 
>> +/*
>> + * Mode Control Instructions for various Key lengths 128, 192, 256
>> + * For CBC (Cipher Block Chaining) mode for encryption
>> + */
>> +static u8 mci_cbc_enc_array[3][MODE_CONTROL_BYTES] = {
>> +	{	0x21, 0x00, 0x00, 0x18, 0x88, 0x0a, 0xaa, 0x4b, 0x7e, 0x00,
>> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00	},
>> +	{	0x21, 0x00, 0x00, 0x18, 0x88, 0x4a, 0xaa, 0x4b, 0x7e, 0x00,
>> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00	},
>> +	{	0x21, 0x00, 0x00, 0x18, 0x88, 0x8a, 0xaa, 0x4b, 0x7e, 0x00,
>> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00	},
>> +};
> 
> Use 'const' for static constants.

Okay

> 
>> +static int sa_aes_cbc_setkey(struct crypto_ablkcipher *tfm, const u8 *key,
>> +			     unsigned int keylen)
>> +{
>> +	struct algo_data *ad = kzalloc(sizeof(*ad), GFP_KERNEL);
> 
> Need to check from error for all memory allocations.
> 
>> +static struct sa_alg_tmpl sa_algs[] = {
>> +	{.type = CRYPTO_ALG_TYPE_ABLKCIPHER,
> 
> ablkcipher API is deprecated.  Use skcipher instead.

Okay

> 
> (To be clear, these are just a few things I happened to notice from very quickly
> skimming through this patch.  I don't have time to do a proper review of random
> drivers.)

I will incorporate the comments in v2.

Thanks for your quick review.

> 
> - Eric
> 
