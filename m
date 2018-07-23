Return-Path: <SRS0=22p1=KH=huawei.com=jonathan.cameron@kernel.org>
Date: Mon, 23 Jul 2018 15:33:52 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH 2/3] crypto: hisilicon SEC security accelerator driver
Message-ID: <20180723153352.000042a0@huawei.com>
In-Reply-To: <1743404.tCjS6oGqku@positron.chronox.de>
References: <20180716104342.24192-1-Jonathan.Cameron@huawei.com>
	<20180716104342.24192-3-Jonathan.Cameron@huawei.com>
	<1743404.tCjS6oGqku@positron.chronox.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Stephan =?ISO-8859-1?Q?M=FCller?= <smueller@chronox.de>
Cc: linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linuxarm@huawei.com, xuzaibo@huwei.com, fanghao11@huawei.com, liguozhu@hisilicon.com, wangxiongfeng2@huawei.com
List-ID: <devicetree@vger.kernel.org>

On Fri, 20 Jul 2018 20:17:22 +0200
Stephan M=FCller <smueller@chronox.de> wrote:

> Am Montag, 16. Juli 2018, 12:43:41 CEST schrieb Jonathan Cameron:
>=20
> Hi Jonathan,
>=20
> > +static int sec_alg_skcipher_setkey_aes_xts(struct crypto_skcipher *tfm,
> > +                                          const u8 *key, unsigned int
> > keylen) +{
> > +       enum sec_cipher_alg alg;
> > +
> > +       switch (keylen) {
> > +       case AES_KEYSIZE_128 * 2:
> > +               alg =3D SEC_C_AES_XTS_128;
> > +               break;
> > +       case AES_KEYSIZE_256 * 2:
> > +               alg =3D SEC_C_AES_XTS_256;
> > +               break;
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +
> > +       return sec_alg_skcipher_setkey(tfm, key, keylen, alg);
> > +} =20
>=20
> Can you please call the function xts_check_key or xts_verify_key before=20
> setting the key?
>=20
Will do.

Thanks,

Jonathan
