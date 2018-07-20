Return-Path: <SRS0=HrxS=KF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:25022 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728144AbeGUWVb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 21 Jul 2018 18:21:31 -0400
From: Stephan =?ISO-8859-1?Q?M=FCller?= <smueller@chronox.de>
Subject: Re: [PATCH 2/3] crypto: hisilicon SEC security accelerator driver
Date: Fri, 20 Jul 2018 20:17:22 +0200
Message-ID: <1743404.tCjS6oGqku@positron.chronox.de>
In-Reply-To: <20180716104342.24192-3-Jonathan.Cameron@huawei.com>
References: <20180716104342.24192-1-Jonathan.Cameron@huawei.com> <20180716104342.24192-3-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linuxarm@huawei.com, xuzaibo@huwei.com, fanghao11@huawei.com, liguozhu@hisilicon.com, wangxiongfeng2@huawei.com
List-ID: <devicetree@vger.kernel.org>

Am Montag, 16. Juli 2018, 12:43:41 CEST schrieb Jonathan Cameron:

Hi Jonathan,

> +static int sec_alg_skcipher_setkey_aes_xts(struct crypto_skcipher *tfm,
> +                                          const u8 *key, unsigned int
> keylen) +{
> +       enum sec_cipher_alg alg;
> +
> +       switch (keylen) {
> +       case AES_KEYSIZE_128 * 2:
> +               alg = SEC_C_AES_XTS_128;
> +               break;
> +       case AES_KEYSIZE_256 * 2:
> +               alg = SEC_C_AES_XTS_256;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return sec_alg_skcipher_setkey(tfm, key, keylen, alg);
> +}

Can you please call the function xts_check_key or xts_verify_key before 
setting the key?

Ciao
Stephan


